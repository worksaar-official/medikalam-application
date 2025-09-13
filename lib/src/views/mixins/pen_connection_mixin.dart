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
      logger.i("PEN_INIT: Initializing pen SDK context and listener");
      DPenCtrl.setContext();
      DPenCtrl.setListener();
      logger
          .i("PEN_INIT_SUCCESS: Pen SDK initialization completed successfully");
    } catch (err) {
      logger.e("PEN_INIT_ERROR: Error In Initialization : $err");
    }
  }

  void startBle({bool clear = false}) {
    logger.i("PEN_BLE_START: Starting BLE scan for peripherals, clear: $clear");
    if (clear) {
      _penProvider.clearList();
    }

    DPenCtrl.btStartForPeripheralsList();

    // This listener must be active to update pen list
    DPenCtrl.eventChannel.receiveBroadcastStream().listen((event) {
      final obj = json.decode(event);
      logger.d("PEN_BLE_EVENT: Received BLE event: $obj");
      _handleEvent(obj);
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
    logger.d("PEN_EVENT_HANDLER: Processing event: $object");

    if (object.containsKey("STRING_PEN_MAC_ADDRESS")) {
      final penEvent = PenEvent.fromJson(object);
      logger.i(
          "PEN_EVENT_PROCESSED: MAC: ${penEvent.macAddress}, Type: ${penEvent.penMsgType}, RSSI: ${penEvent.rssi}");

      // NOTE: penMsgType values are based on native SDK constants
      // 0: PEN_UP, 1: PEN_DOWN, 2: PEN_MOVE, 3: PEN_DISCONNECTED, 4: PEN_CONNECTION_FAILURE, 5: PEN_POWER_OFF
      if (penEvent.penMsgType == 3 || penEvent.penMsgType == 4) {
        logger.w(
            "PEN_DISCONNECTION_EVENT: Pen disconnected or connection failed - Type: ${penEvent.penMsgType}");
        _penProvider.penDisconnected();
      } else {
        _penProvider.addPenEvent(penEvent);
      }
    } else if (object.containsKey("disconnected")) {
      logger.w("PEN_DISCONNECTED_EVENT: Generic disconnect event received");
      _penProvider.penDisconnected();
    } else if (object.containsKey("page")) {
      logger.d(
          "PEN_DOT_EVENT: Pen dot event - X: ${object['x']}, Y: ${object['y']}, Page: ${object['page']}");
      _prescriptionProvider.getSymbolName(double.parse(object['x'].toString()),
          double.parse(object['y'].toString()));
      _prescriptionProvider.addDotToStream(Afdot.fromJson(object));
    } else {
      logger.d("PEN_UNKNOWN_EVENT: Unknown event type received: $object");
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
