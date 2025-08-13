// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:Medikalam/src/core/pendriver/afpen.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/models/pen/afdot.dart';
import 'package:Medikalam/src/models/pen/pen_event.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';

mixin PenConnectionMixin<T extends StatefulWidget> on State<T> {
  late PenProvider _penProvider;
  PrescriptionProvider get _prescriptionProvider =>
      context.read<PrescriptionProvider>();

  @override
  void initState() {
    super.initState();
    _penProvider = context.read<PenProvider>();
  }

  void init() {
    try {
      DPenCtrl.setContext();
      DPenCtrl.setListener();
    } catch (err) {
      logger.e("Error In Initialization : $err");
    }
  }

  void startBle({bool clear = false}) {
    if (clear) {
      _penProvider.clearList();
    }

    DPenCtrl.btStartForPeripheralsList();

    // This listener must be active to update pen list
    DPenCtrl.eventChannel.receiveBroadcastStream().listen((event) {
      final obj = json.decode(event);
      if (obj.containsKey("STRING_PEN_MAC_ADDRESS")) {
        _penProvider.addPenEvent(PenEvent.fromJson(obj));
      }
    });
  }

  void startListener() {
    startPenStateListener();
    startDotListener();
  }

  void startPenStateListener() {
    try {
      DPenCtrl.eventChannel.receiveBroadcastStream().listen((event) async {
        final obj = json.decode(event);
        _handleEvent(obj);
      });
    } catch (err) {
      logger.e("Error In Listener : $err");
    }
  }

  void startDotListener() {
    try {
      DPenCtrl.eventChannelDot.receiveBroadcastStream().listen((event) async {
        final obj = json.decode(event);
        _handleEvent(obj);
      });
    } catch (err) {
      logger.e("Error In Listener : $err");
    }
  }

  void _handleEvent(Map<String, dynamic> object) {
    if (object.containsKey("STRING_PEN_MAC_ADDRESS")) {
      _penProvider.addPenEvent(PenEvent.fromJson(object));
    } else if (object.containsKey("disconnected")) {
      _penProvider.penDisconnected();
    } else if (object.containsKey("page")) {
      _prescriptionProvider.getSymbolName(double.parse(object['x'].toString()),
          double.parse(object['y'].toString()));
      _prescriptionProvider.addDotToStream(Afdot.fromJson(object));
    }
  }

  Future<void> connect(String macAddress) async {
    try {
      await DPenCtrl.connect(macAddress);
      _penProvider.setConnectedPen(PenEvent(
        macAddress: macAddress,
        rssi: -100,
        advData: null,
        penMsgType: 0,
        deviceName: '',
      ));
    } catch (e) {
      logger.e("Pen connection failed: $e");
      rethrow;
    }
  }
}
