// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

// Project imports:
import '../../core/utils/helpers/logger.dart';

@injectable
class PermissionListenerProvider with ChangeNotifier {
  late StreamSubscription<BluetoothAdapterState> _bluetoothSubscription;
  final Location _location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  PermissionListenerProvider() {
    logger.i('🔁 Initializing PermissionListenerProvider...');
    _startBluetoothListener();
    _startLocationListener();
  }

  void _startBluetoothListener() async {
    if (await FlutterBluePlus.isSupported == false) {
      logger.i("Bluetooth not supported by this device");
      return;
    }

    logger.i('📡 Starting Bluetooth adapter state listener...');
    _bluetoothSubscription = FlutterBluePlus.adapterState
        .listen((BluetoothAdapterState state) async {
      logger.i('🔌 Bluetooth Adapter State: $state');
      if (state != BluetoothAdapterState.on) {
        logger.e('Bluetooth is OFF');
        if (Platform.isAndroid) {
          await FlutterBluePlus.turnOn();
        }
      }
    });
  }

  void _startLocationListener() async {
    logger.i('📡 Starting permission check stream...');
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  void dispose() {
    logger.i('Disposing PermissionListenerProvider...');
    _bluetoothSubscription.cancel();
    // _permissionStream.cancel();
    super.dispose();
  }
}
