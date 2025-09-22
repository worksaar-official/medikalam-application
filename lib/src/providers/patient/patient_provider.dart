// Flutter imports:

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/patient/patient_repo.dart';
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/cache_utils.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/models/patient/patient_details.dart';
import 'package:Medikalam/src/models/view_case/view_case_response.dart';
import 'package:Medikalam/src/providers/centralized_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';

@injectable
class PatientProvider extends CentralizedProvider<PatientResponse> {
  final PatientRepo _repo;
  PatientProvider(this._repo) : super(_repo);

  //Variable
  List<PatientCase> cases = [];
  List<Document> documents = [];
  List<Document> normalReports = [];
  List<Document> reports = [];
  List<Document> scanDocuments = [];
  ViewCaseModel caseDetails = ViewCaseModel(data: ViewCaseData.empty());
  Status detailsStatus = Status.initial;
  Status caseStatus = Status.initial;
  List<PageDetails> pageDetailsList = [];
  bool showPrescription = false;

  FormGroup form = FormGroup({
    'mobileNumber': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(10),
        Validators.maxLength(10)
      ],
    ),
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'dateofbirth': FormControl<DateTime>(
      validators: [Validators.required],
    ),
    'gender': FormControl<String>(
      value: "",
      validators: [Validators.required],
    ),
  });

  void updateGender(String gender) {
    form.control('gender').updateValue(gender);
    notifyListeners();
  }

  void updateDate(DateTime value) {
    form.control('dateofbirth').updateValue(value);
    notifyListeners();
  }

  void _categorizeDocuments(List<Document> docs) {
    normalReports.clear();
    reports.clear();
    scanDocuments.clear();

    for (var doc in docs) {
      // Categorize based on document title or type
      if (doc.title.toLowerCase().contains('normal report') ||
          doc.title.toLowerCase().contains('normal')) {
        normalReports.add(doc);
      } else if (doc.title.toLowerCase().contains('report') &&
          !doc.title.toLowerCase().contains('normal')) {
        reports.add(doc);
      } else if (doc.title.toLowerCase().contains('scan') ||
          doc.title.toLowerCase().contains('document')) {
        scanDocuments.add(doc);
      } else {
        // Default to reports if no specific category matches
        reports.add(doc);
      }
    }
  }

  void setCaseStatus(Status status) {
    caseStatus = status;
    notifyListeners();
  }

  Future<void> caseHistory(int pageNumber) async {
    try {
      final data = await _repo.caseHistory(pageNumber: pageNumber);
      data.when(
        success: (success) {
          debugPrint(success.toString());
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

  Future<void> viewPageDetails(int pageNumber) async {
    try {
      final data = await _repo.viewPageDetails(pageNumber: pageNumber);
      data.when(
        success: (success) {
          final existingPageDetails =
              pageDetailsList.firstWhere((e) => e.pageNumber == pageNumber);
          final updatedPageDetails = existingPageDetails.copyWith(
              points: success.data!.points,
              height: success.data!.height,
              width: success.data!.width);

          final index = pageDetailsList.indexOf(existingPageDetails);
          if (index != -1) {
            pageDetailsList[index] = updatedPageDetails;
          }

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

  Future<void> sharePrescription() async {
    try {
      final data = await _repo.sharePrescription(caseId: 1);

      data.when(
        success: (success) {
          debugPrint(success.toString());
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

  Future<void> viewCase(String caseId) async {
    try {
      pageDetailsList.clear();
      setCaseStatus(Status.loading);
      caseDetails = ViewCaseModel(data: ViewCaseData.empty());
      final data = await _repo.viewCase(caseId: caseId);
      data.when(success: (success) async {
        if (success.data != null) {
          caseDetails = success;
          setCaseStatus(Status.success);
          final cacheDetails =
              await CacheUtils.getCached(Keys.pageConfig) as String;
          PageDetails cachedDetails =
              PageDetails.fromJson(jsonDecode(cacheDetails));
          for (final pageNumber in success.data!.pageNumbers) {
            pageDetailsList.add(PageDetails(
                pageNumber: pageNumber,
                pageHeight: cachedDetails.pageHeight,
                pageWidth: cachedDetails.pageWidth,
                pageBackground: cachedDetails.pageBackground,
                configUrl: cachedDetails.configUrl));
            viewPageDetails(pageNumber);
          }

          notifyListeners();
        }
      }, failure: (failure) {
        setCaseStatus(Status.error);
        debugPrint(failure.toString());
      });
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> deletePatient(String id) async {
    try {
      final data = await _repo.delete(id);
      data.when(
        success: (success) {
          debugPrint(success.toString());
          notifyListeners();
          showSuccess('Patient deleted successfully');
        },
        failure: (failure) {
          debugPrint(failure.toString());
          showError(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> viewPatient(String id) async {
    try {
      cases = [];
      documents = [];
      detailsStatus = Status.loading;
      notifyListeners();
      final data = await _repo.viewpatient(patientId: id);
      data.when(
        success: (success) {
          cases = success.data.patientCases;

          // In real implementation, documents would come from API
          // For now, using sample data that simulates API response
          documents = [
            const Document(
              title: "Normal Report - Blood Test",
              type: "pdf",
              url: "https://example.com/normal-report.pdf",
            ),
            const Document(
              title: "Normal Report - X-Ray",
              type: "pdf",
              url: null, // No data available
            ),
            const Document(
              title: "Medical Report - Cardiology",
              type: "pdf",
              url: "https://example.com/cardiology-report.pdf",
            ),
            const Document(
              title: "Lab Report - Biochemistry",
              type: "pdf",
              url: null, // No data available
            ),
            const Document(
              title: "Scan Document - MRI",
              type: "pdf",
              url: "https://example.com/mri-scan.pdf",
            ),
            const Document(
              title: "Scan Document - CT Scan",
              type: "pdf",
              url: null, // No data available
            ),
          ];

          // Categorize documents
          _categorizeDocuments(documents);

          detailsStatus = Status.success;
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

  @override
  void handleNavigation(BuildContext context, PatientResponse entity) async {
    if (context.mounted) {
      if (showPrescription) {
        await context.read<PrescriptionProvider>().addMobileNumber(
              entity.mobileNumber.toString(),
              entity.id,
            );
        await context
            .read<PrescriptionProvider>()
            .linkPage(mobileNumber: entity.mobileNumber.toString());
        // After linking, simply go back to the previous screens
        // Close bottom sheet (if open) and then the selection screen
        if (Navigator.canPop(context)) {
          context.pop();
        }
        if (Navigator.canPop(context)) {
          context.pop();
        }
      } else {
        context.pop();
        context.pushNamed(AppScreens.patientDetail.name, extra: entity);
      }
    }
    showPrescription = false;
  }
}
