// Dart imports:
import 'dart:async';
import 'dart:collection';
import 'dart:io';

// Project imports:
import 'package:Medikalam/services/api/page/page_repo.dart';
import 'package:Medikalam/services/api/prescription/prescription_repo.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/utils/constants/constant.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/cache_utils.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/new_prescription/initialize_page_response.dart';
import 'package:Medikalam/src/models/new_prescription/upload_point_request.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/models/pen/afdot.dart';
import 'package:Medikalam/src/models/pen/symbol.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

@injectable
class PrescriptionProvider with ChangeNotifier {
  // ==================== Dependencies ====================
  final PageRepo _repo = getIt<PageRepo>();
  final PrescriptionRepo _prescriptionRepo = getIt<PrescriptionRepo>();

  // ==================== Page Management ====================
  // Current active page number (for backward compatibility)
  int _pageNumber = 0;

  // Page-specific data storage
  final Map<int, List<Afdot>> _pageDots = {};
  final Map<int, Queue<Points>> _pageQueues = {};
  final Map<int, Timer?> _pageTimers = {};
  final Map<int, bool> _pageUploadActive = {};
  final Map<int, InitializeResponse> _pageInitResponses = {};

  // ==================== Global State ====================
  PageDetails _pageDetails = PageDetails.empty();
  bool _isScan = false;
  bool active = true;
  String _mobileNumber = '';
  final List<PenSymbol> _symbols = [];

  // ==================== Patient Data ====================
  PatientResponse? _patientResponse;
  List<PatientResponse> _patientList = [];

  // ==================== Symbol Detection ====================
  String? _lastSymbol;
  DateTime? _lastSymbolTimestamp;
  final Duration _symbolTimeout = const Duration(milliseconds: 500);

  // ==================== Upload Configuration ====================
  static const int _batchSize = 40;
  static const Duration _uploadInterval = Duration(milliseconds: 1500);

  // ==================== Getters ====================
  PageDetails get pageDetails => _pageDetails;
  int get pageNumber => _pageNumber;
  bool get isScan => _isScan;
  List<PenSymbol> get symbols => _symbols;
  PatientResponse? get patientResponse => _patientResponse;
  List<PatientResponse> get patientList => _patientList;

  // Get dots for current page
  List<Afdot> get dots => _pageDots[_pageNumber] ?? [];

  // Get initialization response for current page
  InitializeResponse get initializeResponse =>
      _pageInitResponses[_pageNumber] ?? InitializeResponse.empty();

  // ==================== Setters ====================
  set pageNumber(num value) {
    if (_pageNumber != value) {
      final newPageNumber = value.toInt();
      _pageNumber = newPageNumber;

      _initializePageData(newPageNumber);

      resetPageSpecificData(newPageNumber);

      initialisePageQr();

      _startUploadsForPage(newPageNumber);

      notifyListeners();
    }
  }

  set isScan(bool value) {
    _isScan = value;
    notifyListeners();
  }

  set setPatientResponse(PatientResponse patientResponse) {
    _patientResponse = patientResponse;
    notifyListeners();
  }

  set pageDetails(PageDetails? pageDetails) {
    _pageDetails = pageDetails ?? PageDetails.empty();
    notifyListeners();
  }

  // ==================== Page Data Management ====================
  void _initializePageData(int pageNum) {
    _pageDots.putIfAbsent(pageNum, () => []);
    _pageQueues.putIfAbsent(pageNum, () => Queue<Points>());
    _pageUploadActive.putIfAbsent(pageNum, () => false);
  }

  void resetPageSpecificData(int pageNum) {
    _patientList.clear();
    _mobileNumber = '';
    _lastSymbol = null;
    _lastSymbolTimestamp = null;
    _patientResponse = null;
  }

  // ==================== Upload Management ====================
  void setTimelyUploads() {
    // For backward compatibility - starts uploads for current page
    _startUploadsForPage(_pageNumber);
  }

  void _startUploadsForPage(int pageNum) {
    // Ensure page data is initialized
    _initializePageData(pageNum);

    // Cancel existing timer for this page
    _pageTimers[pageNum]?.cancel();

    // Create new timer for this specific page
    _pageTimers[pageNum] = Timer.periodic(
        _uploadInterval, (_) => _flushPointQueueForPage(pageNum));

    _pageUploadActive[pageNum] = true;
    logger.i("Started upload timer for page $pageNum");
  }

  Future<void> _flushPointQueueForPage(int pageNum) async {
    final queue = _pageQueues[pageNum];
    if (queue == null || queue.isEmpty) return;

    final batch = <Points>[];

    while (batch.length < _batchSize && queue.isNotEmpty) {
      batch.add(queue.removeFirst());
    }

    logger.d("Uploading ${batch.length} points for page $pageNum");

    try {
      await _prescriptionRepo.uploadPoints(
        UploadPointRequest(pageNumber: pageNum, pointsToAdd: batch),
      );
      logger
          .i("Successfully uploaded ${batch.length} points for page $pageNum");
    } catch (e, s) {
      // Re-add to the correct page queue
      queue.addAll(batch);
      logger.e("Failed to upload points for page $pageNum: $e");
      debugPrintStack(stackTrace: s);
    }
  }

  // ==================== Dot Stream Management ====================
  void addDotToStream(Afdot dot) {
    final pageNum = dot.page.toInt();

    // Initialize page data if needed
    _initializePageData(pageNum);

    // Add to page-specific collections
    _pageDots[pageNum]!.add(dot);
    _pageQueues[pageNum]!.add(Points(x: dot.x, y: dot.y, actionType: dot.type));

    logger.d("Dot added to page $pageNum: $dot");

    // Ensure uploads are running for this page
    if (_pageUploadActive[pageNum] != true ||
        _pageTimers[pageNum] == null ||
        !_pageTimers[pageNum]!.isActive) {
      _startUploadsForPage(pageNum);
    }

    // Update current page if different and not in scan mode
    if (!_isScan && pageNum != _pageNumber) {
      pageNumber = pageNum;
    } else {
      notifyListeners();
    }
  }

  void clearDots() {
    // Clear dots for current page
    _pageDots[_pageNumber]?.clear();
    notifyListeners();
  }

  // ==================== Symbol Management ====================
  Future<void> addSymbols({Map<String, dynamic>? json}) async {
    final jsonSymbol = json ?? await Helpers.readJson();
    if (jsonSymbol != null) {
      _symbols.clear(); // Clear existing symbols
      final rawSymbol = jsonSymbol['symbols'] as List;
      for (final data in rawSymbol) {
        final symbol = PenSymbol(
            id: data['id'],
            name: data['name'],
            xmin: double.parse(data['bounds']['xmin'].toString()),
            xmax: double.parse(data['bounds']['xmax'].toString()),
            ymin: double.parse(data['bounds']['ymin'].toString()),
            ymax: double.parse(data['bounds']['ymax'].toString()));
        _symbols.add(symbol);
      }
      notifyListeners();
    }
  }

  void getSymbolName(double x, double y) {
    for (final symbol in _symbols) {
      if (symbol.isApplicableWithScaleFactor(x, y)) {
        final now = DateTime.now();

        // Check if the symbol is the same as the last one and if enough time has passed
        if (_lastSymbol == symbol.name && _lastSymbolTimestamp != null) {
          final timeDifference = now.difference(_lastSymbolTimestamp!);

          if (timeDifference < _symbolTimeout) {
            debugPrint(
                "Symbol ${symbol.name} detected again within timeout, skipping action.");
            return;
          }
        }

        _lastSymbol = symbol.name;
        _lastSymbolTimestamp = now;

        logger.d("Symbol Name : ${symbol.name}");
        performActionBasedOnSymbolName(symbol.name);
        break;
      }
    }
  }

  // ==================== Symbol Actions ====================
  void performActionBasedOnSymbolName(String name) {
    if (name.startsWith("KEYPAD_")) {
      handleKeypadActions(name);
    } else if (name.startsWith("VOICE_")) {
      handleVoiceActions(name);
    } else if (name.startsWith("ATTACHMENT_")) {
      handleAttachmentActions(name);
    } else if (name.startsWith("GENDER_")) {
      handleGenderActions(name);
    } else {
      handleOtherActions(name);
    }
  }

  void handleKeypadActions(String name) {
    if (_mobileNumber.length == 10) {
      if (_patientResponse == PatientResponse.empty()) {
        linkPage(mobileNumber: _mobileNumber);
      }
      return;
    }
    switch (name) {
      case "KEYPAD_0":
        _mobileNumber += "0";
        debugPrint("Keypad 0 Pressed");
        break;
      case "KEYPAD_1":
        _mobileNumber += "1";
        debugPrint("Keypad 1 Pressed");
        break;
      case "KEYPAD_2":
        _mobileNumber += "2";
        debugPrint("Keypad 2 Pressed");
        break;
      case "KEYPAD_3":
        _mobileNumber += "3";
        debugPrint("Keypad 3 Pressed");
        break;
      case "KEYPAD_4":
        _mobileNumber += "4";
        debugPrint("Keypad 4 Pressed");
        break;
      case "KEYPAD_5":
        _mobileNumber += "5";
        debugPrint("Keypad 5 Pressed");
        break;
      case "KEYPAD_6":
        _mobileNumber += "6";
        debugPrint("Keypad 6 Pressed");
        break;
      case "KEYPAD_7":
        _mobileNumber += "7";
        debugPrint("Keypad 7 Pressed");
        break;
      case "KEYPAD_8":
        _mobileNumber += "8";
        debugPrint("Keypad 8 Pressed");
        break;
      case "KEYPAD_9":
        _mobileNumber += "9";
        debugPrint("Keypad 9 Pressed");
        break;
      case "KEYPAD_DELETE":
        if (_mobileNumber.isNotEmpty) {
          _mobileNumber = _mobileNumber.substring(0, _mobileNumber.length - 1);
        }
        debugPrint("Keypad Delete Pressed");
        break;
      default:
        debugPrint("Unknown keypad action");
    }

    notifyListeners();
  }

  void handleVoiceActions(String name) {
    switch (name) {
      case "VOICE_START":
        debugPrint("Voice Start");
        break;
      case "VOICE_STOP":
        debugPrint("Voice Stop");
        break;
      case "VOICE_SUBMIT":
        debugPrint("Voice Submit");
        break;
      default:
        debugPrint("Unknown voice action");
    }
  }

  void handleAttachmentActions(String name) {
    switch (name) {
      case "ATTACHMENT_PLAY_1":
        debugPrint("Play Attachment 1");
        break;
      case "ATTACHMENT_SHARE_2":
        debugPrint("Share Attachment 2");
        break;
      default:
        debugPrint("Unknown attachment action");
    }
  }

  void handleGenderActions(String name) {
    switch (name) {
      case "GENDER_MALE":
        debugPrint("Gender Male Selected");
        break;
      case "GENDER_FEMALE":
        debugPrint("Gender Female Selected");
        break;
      default:
        debugPrint("Unknown gender action");
    }
  }

  void handleOtherActions(String name) {
    switch (name) {
      case "SUBMIT_CASE":
        debugPrint("Submit Case Pressed");
        break;
      case "LINK_FROM":
        debugPrint("Link From Pressed");
        break;
      case "LINK_PAGE":
        debugPrint("Link Page Pressed");
        break;
      default:
        debugPrint("Unknown action");
    }
  }

  // ==================== Reset Methods ====================
  void resetValue({bool force = false}) {
    // Reset only current page data
    resetPageSpecificData(_pageNumber);
    _symbols.clear();
    if (force) notifyListeners();
  }

  void completeReset() {
    // Reset all page data
    for (final pageNum in _pageDots.keys) {
      _pageDots[pageNum]?.clear();
      _pageQueues[pageNum]?.clear();
      _pageTimers[pageNum]?.cancel();
    }

    _pageDots.clear();
    _pageQueues.clear();
    _pageTimers.clear();
    _pageUploadActive.clear();
    _pageInitResponses.clear();

    resetValue(force: true);
  }

  // ==================== API Methods ====================
  Future<void> getPageConfig() async {
    try {
      final data = await _repo.getPageConfig();
      data.when(
        success: (success) async {
          debugPrint(success.toString());
          await preloadAppImage(Constants.qrPrescription);
          CacheUtils.cache(Keys.pageConfig,
              success.data.pageDetails.toJson().encode, 30 * 24 * 90);
          fetchJson(success.data.pageDetails.configUrl);
          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> fetchJson(String url, {bool force = false}) async {
    final filePath = await Helpers.getFilePath();
    final file = File(filePath);

    if (await file.exists()) {
      if (!force) {
        logger.i("File already exists at: $filePath.");
        return;
      }
    }

    final data = await _repo.getJson(url);
    data.when(
      success: (success) async {
        debugPrint(success.toString());
        await Helpers.saveJson(success);
        addSymbols();
      },
      failure: (failure) {
        debugPrint(failure.toString());
      },
    );
  }

  Future<void> initialisePageQr() async {
    EasyLoading.show(status: "Initializing Page $_pageNumber. Please Wait");

    try {
      _patientResponse = null;
      final currentDots = _pageDots[_pageNumber] ?? [];

      final data = await _prescriptionRepo.scanQr(_pageNumber);

      data.when(
        success: (success) {
          _pageInitResponses[_pageNumber] = success.data;
          if (success.data.patient != null) {
            _patientResponse = success.data.patient;
          } else {
            _patientResponse = null;
            showError("No patient found for this page");
          }

          final existingPoints =
              currentDots.map((dot) => '${dot.x},${dot.y},${dot.type}').toSet();

          final serverDots = success.data.page.points
              .map((dot) => Afdot(
                    type: dot['actionType'] as num,
                    x: double.tryParse(dot['x'].toString()) ?? 0.0,
                    y: double.tryParse(dot['y'].toString()) ?? 0.0,
                    page: success.data.page.pageNumber,
                    bookNo: 1,
                    bookWidth: 4962,
                    bookHeight: 7014,
                    reserved1: 0,
                  ))
              .where((serverDot) => !existingPoints
                  .contains('${serverDot.x},${serverDot.y},${serverDot.type}'));

          currentDots.addAll(serverDots);

          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
          _patientResponse = null;
          notifyListeners();
        },
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> saveAudioFile(String filePath) async {
    EasyLoading.show(status: "Saving Audio File. Please Wait");
    final currentPageInit = _pageInitResponses[_pageNumber];
    if (currentPageInit == null) {
      showError("Page not initialized");
      EasyLoading.dismiss();
      return;
    }

    final data = await _prescriptionRepo.uploadMedia(
        currentPageInit.page.id, File(filePath));
    data.when(
      success: (success) {
        debugPrint(success.toString());
        showSuccess("Audio File Saved Successfully");
      },
      failure: (failure) {
        debugPrint(failure.toString());
        showError("Failed to save audio file");
      },
    );
    EasyLoading.dismiss();
  }

  Future<void> addMobileNumber(String mobileNumber, [String? patientId]) async {
    if (mobileNumber.length != 10) {
      showError("Please enter a valid mobile number.");
      return;
    }
    final data = await _prescriptionRepo.addMobileNumberToPage(
        mobileNumber, _pageNumber);
    data.when(
      success: (success) {
        debugPrint(success.toString());
        _patientList = success;
        if (patientId != null) {
          for (final patient in _patientList) {
            if (patient.id == patientId) {
              _patientResponse = patient;
              _mobileNumber = patient.mobileNumber.toString();
              break;
            }
          }
        }
        showSuccess("Mobile Number linked Successfully");
        notifyListeners();
      },
      failure: (failure) {
        debugPrint(failure.toString());
        showError("Failed to link mobile number");
      },
    );
  }

  Future<void> linkPage({String? mobileNumber}) async {
    final currentPageInit = _pageInitResponses[_pageNumber];
    if (currentPageInit == null) {
      showError("Page not initialized");
      return;
    }

    final data = await _prescriptionRepo.linkPage({
      "mobileNumber": mobileNumber ?? _mobileNumber,
      "pageNumber": _pageNumber,
      "caseId": currentPageInit.page.caseId
    });

    data.when(
      success: (success) {
        _patientResponse = success;
        debugPrint(success.toString());
      },
      failure: (failure) {
        debugPrint(failure.toString());
      },
    );
    notifyListeners();
  }

  // ==================== Utility Methods ====================
  Map<int, int> getUploadStatus() {
    final status = <int, int>{};
    _pageQueues.forEach((pageNum, queue) {
      status[pageNum] = queue.length;
    });
    return status;
  }

  List<int> getActivePagesNumbers() {
    return _pageDots.keys
        .where((pageNum) =>
            (_pageDots[pageNum]?.isNotEmpty ?? false) ||
            (_pageQueues[pageNum]?.isNotEmpty ?? false))
        .toList();
  }

  // ==================== Disposal ====================
  Future<void> disposeAndFlush() async {
    // Flush all page queues
    for (final entry in _pageQueues.entries) {
      final pageNum = entry.key;

      // Cancel timer
      _pageTimers[pageNum]?.cancel();

      // Flush remaining points
      while (_pageQueues[pageNum]?.isNotEmpty ?? false) {
        await _flushPointQueueForPage(pageNum);
      }
    }

    // Clear all timers and data
    _pageTimers.clear();
    _pageUploadActive.clear();
  }

  @override
  void dispose() {
    disposeAndFlush();
    super.dispose();
  }
}
