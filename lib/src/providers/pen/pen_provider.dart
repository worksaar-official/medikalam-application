// Flutter imports:

// Dart imports:
import 'dart:async';

// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/src/core/pendriver/afpen.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/pen/pen_event.dart';
import 'package:Medikalam/src/models/pen/connected_pen.dart';

@injectable
class PenProvider extends ChangeNotifier {
  void _parseCapStatus(String? message) {
    if (message?.contains('cap on') == true) {
      _handleCapStatus(true);
    } else if (message?.contains('cap off') == true) {
      _handleCapStatus(false);
    }
  }

  final List<PenEvent> _penList = [];
  bool _showSvg = false;
  ConnectedPen? _connectedPen;
  Timer? _scanTimer;
  StreamSubscription? _capStatusSubscription;

  ConnectedPen? get connectedPen => _connectedPen;

  bool get isConnected => _connectedPen != null;

  List<PenEvent> get penList => _penList;

  bool get showSvg => _showSvg;

  final StreamController<String?> _penEventStreamController =
      StreamController<String?>.broadcast();
  Stream<String?> get penEventStream => _penEventStreamController.stream;

  @override
  void dispose() {
    _penEventStreamController.close();
    _scanTimer?.cancel();
    _capStatusSubscription?.cancel();
    super.dispose();
  }

  void _startScanning() {
    _scanTimer?.cancel();
    _scanTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      await DPenCtrl.btStartForPeripheralsList();
    });
    DPenCtrl.btStartForPeripheralsList();
  }

  void _handleCapStatus(bool capOn) {
    if (capOn && _connectedPen != null) {
      disconnectPen();
    } else if (!capOn) {
      _startScanning();
    }
  }

  void setShowSvg(bool value) {
    _showSvg = value;
    notifyListeners();
  }

  void setConnectedPen(PenEvent penEvent) {
    _connectedPen = ConnectedPen(
      macAddress: penEvent.macAddress,
      deviceName: penEvent.deviceName,
      connectedAt: DateTime.now(),
    );
    notifyListeners();
  }

  void addPenEvent(PenEvent penEvent) {
    if (!_penList.any((e) => e.macAddress == penEvent.macAddress)) {
      _penList.add(penEvent);
      if (_connectedPen == null &&
          Helpers.getString(key: Keys.connectedPenMac) == penEvent.macAddress) {
        connect(penEvent.macAddress);
      }
      notifyListeners();
    }
  }

  void deletePen(String macAddress) {
    _penList.removeWhere((element) => element.macAddress == macAddress);
    notifyListeners();
    Helpers.deleteString(key: Keys.connectedPenMac);
  }

  void penDisconnected() {
    _penList.removeWhere(
        (element) => element.macAddress == _connectedPen?.macAddress);
    _connectedPen = null;
    setShowSvg(false);
    showSuccess("Pen Disconnected");
    notifyListeners();
  }

  void clearList() {
    _penList.clear();
    notifyListeners();
  }

  Future<void> connect(String macAddress) async {
    _scanTimer?.cancel();
    setConnectedPen(PenEvent(
        macAddress: macAddress, deviceName: '', rssi: 0, penMsgType: 0));
    _penEventStreamController.add(macAddress);
    showSuccess("Connected to Pen $macAddress");

    _capStatusSubscription = DPenCtrl.eventChannel
        .receiveBroadcastStream()
        .listen((event) => this._parseCapStatus(event as String?));

    DPenCtrl.setListener();
    DPenCtrl.setContext();

    await DPenCtrl.connect(macAddress);
    Helpers.setString(key: Keys.connectedPenMac, value: macAddress);
  }

  Future<void> disconnectPen() async {
    await DPenCtrl.disconnect();
    penDisconnected();
    _penEventStreamController.add(null);
    _startScanning();
  }
}
