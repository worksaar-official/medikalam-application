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
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/models/pen/pen_event.dart';
import 'package:Medikalam/src/models/pen/connected_pen.dart';

@injectable
class PenProvider extends ChangeNotifier {
  final List<PenEvent> _penList = [];
  bool _showSvg = false;
  ConnectedPen? _connectedPen;

  ConnectedPen? get connectedPen => _connectedPen;

  bool get isConnected => _connectedPen != null;

  List<PenEvent> get penList => _penList;

  bool get showSvg => _showSvg;

  final StreamController<String?> _penEventStreamController =
      StreamController<String?>.broadcast();
  Stream<String?> get penEventStream => _penEventStreamController.stream;

  // Callback to reset auto-navigation when pen disconnects
  VoidCallback? _resetAutoNavigationCallback;

  // Add method to get saved pen MAC address
  String? get savedPenMacAddress =>
      Helpers.getString(key: Keys.connectedPenMac);

  // Add method to check if we should auto-reconnect
  bool get shouldAutoReconnect =>
      savedPenMacAddress != null && _connectedPen == null;

  // Connection retry mechanism
  int _connectionRetryCount = 0;
  static const int _maxRetryAttempts = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  @override
  void dispose() {
    _penEventStreamController.close();
    super.dispose();
  }

  void setShowSvg(bool value) {
    _showSvg = value;
    notifyListeners();
  }

  void setConnectedPen(PenEvent penEvent) {
    logger.i(
        'PEN_CONNECTION: Setting connected pen - MAC: ${penEvent.macAddress}, Device: ${penEvent.deviceName}');
    _connectedPen = ConnectedPen(
      macAddress: penEvent.macAddress,
      deviceName: penEvent.deviceName,
      connectedAt: DateTime.now(),
    );
    notifyListeners();
  }

  void addPenEvent(PenEvent penEvent) {
    logger.i(
        'PEN_EVENT: Received pen event - MAC: ${penEvent.macAddress}, Type: ${penEvent.penMsgType}, RSSI: ${penEvent.rssi}');
    if (!_penList.any((e) => e.macAddress == penEvent.macAddress)) {
      _penList.add(penEvent);

      // Auto-connect if this is the previously connected pen
      final savedMacAddress = Helpers.getString(key: Keys.connectedPenMac);
      if (_connectedPen == null && savedMacAddress == penEvent.macAddress) {
        logger.i(
            'PEN_AUTO_CONNECT: Auto-connecting to previously connected pen - MAC: ${penEvent.macAddress}');
        _connectWithRetry(penEvent.macAddress);
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
    logger.w(
        'PEN_DISCONNECTED: Pen disconnected - MAC: ${_connectedPen?.macAddress}');
    _penList.removeWhere(
        (element) => element.macAddress == _connectedPen?.macAddress);
    _connectedPen = null;
    setShowSvg(false);
    showSuccess("Pen Disconnected");

    // Reset connection retry count on disconnect
    _connectionRetryCount = 0;

    // Reset auto-navigation flag when pen disconnects
    _resetAutoNavigationCallback?.call();

    // ⭐ Add delay before triggering BLE restart to prevent immediate reconnection attempts
    logger.i(
        'PEN_DISCONNECT_DELAY: Adding delay before BLE restart to prevent rapid reconnection');
    Future.delayed(Duration(seconds: 2), () {
      logger.i(
          'PEN_DISCONNECT_RESTART: Triggering BLE restart for auto-reconnect');
      _penEventStreamController.add("restart_scanning");
    });

    notifyListeners();
  }

  /// Set callback to reset auto-navigation when pen disconnects
  void setResetAutoNavigationCallback(VoidCallback? callback) {
    _resetAutoNavigationCallback = callback;
  }

  Future<void> resetConnectionState({bool preserveMacAddress = true}) async {
    logger.i(
        'PEN_RESET: Resetting connection state, preserveMacAddress: $preserveMacAddress');

    // Store MAC address before reset if we want to preserve it
    String? savedMacAddress;
    if (preserveMacAddress) {
      savedMacAddress = Helpers.getString(key: Keys.connectedPenMac);
    }

    // Force hardware disconnect
    await DPenCtrl.disconnect().catchError((_) {});

    // Clear all connection state
    _connectedPen = null;
    _penList.clear();

    // Only delete MAC address if not preserving it
    if (!preserveMacAddress) {
      Helpers.deleteString(key: Keys.connectedPenMac);
    } else if (savedMacAddress != null) {
      // Restore the MAC address
      Helpers.setString(key: Keys.connectedPenMac, value: savedMacAddress);
      logger.i('PEN_RESET: Preserved MAC address: $savedMacAddress');
    }

    // Notify listeners
    _penEventStreamController.add(null);
    notifyListeners();
  }

  void clearList() {
    _penList.clear();
    notifyListeners();
  }

  /// Connect with retry mechanism for auto-reconnection
  Future<void> _connectWithRetry(String macAddress) async {
    if (_connectionRetryCount >= _maxRetryAttempts) {
      logger.w(
          'PEN_CONNECT_RETRY_EXHAUSTED: Max retry attempts reached for MAC: $macAddress');
      _connectionRetryCount = 0;
      return;
    }

    _connectionRetryCount++;
    logger.i(
        'PEN_CONNECT_RETRY: Attempt $_connectionRetryCount/$_maxRetryAttempts for MAC: $macAddress');

    try {
      // Add delay before connection attempt to prevent BLE stack overload
      if (_connectionRetryCount > 1) {
        logger.i(
            'PEN_CONNECT_DELAY: Adding delay before retry to prevent BLE stack overload');
        await Future.delayed(Duration(
            seconds: 2 + (_connectionRetryCount * 2))); // Progressive delay
      }

      // Ensure clean disconnect before new connection attempt
      await _ensureCleanDisconnect();

      await connect(macAddress);
      _connectionRetryCount = 0; // Reset on success
    } catch (e) {
      logger.e(
          'PEN_CONNECT_RETRY_FAILED: Attempt $_connectionRetryCount failed - Error: $e');

      if (_connectionRetryCount < _maxRetryAttempts) {
        logger.i(
            'PEN_CONNECT_RETRY_DELAY: Waiting ${_retryDelay.inSeconds}s before retry...');
        await Future.delayed(_retryDelay);
        _connectWithRetry(macAddress);
      } else {
        logger.e(
            'PEN_CONNECT_RETRY_EXHAUSTED: All retry attempts failed for MAC: $macAddress');
        _connectionRetryCount = 0;
      }
    }
  }

  /// Ensure clean disconnect before new connection attempts
  Future<void> _ensureCleanDisconnect() async {
    try {
      logger.i('PEN_CLEAN_DISCONNECT: Ensuring clean disconnect before retry');
      await DPenCtrl.disconnect();
      // Add small delay to allow BLE stack to clean up
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      logger
          .w('PEN_CLEAN_DISCONNECT_WARNING: Error during clean disconnect: $e');
    }
  }

  Future<void> connect(String macAddress) async {
    logger.i('PEN_CONNECT: Attempting to connect to pen - MAC: $macAddress');
    try {
      // Add small delay before connection to prevent BLE stack conflicts
      await Future.delayed(Duration(milliseconds: 300));

      // Don't set connected state until hardware connection is confirmed
      await DPenCtrl.connect(macAddress);

      // Only set connected state after successful hardware connection
      setConnectedPen(PenEvent(
          macAddress: macAddress, deviceName: '', rssi: 0, penMsgType: 0));
      _penEventStreamController.add(macAddress);
      Helpers.setString(key: Keys.connectedPenMac, value: macAddress);
      showSuccess("Connected to Pen $macAddress");
      logger.i(
          'PEN_CONNECT_SUCCESS: Successfully connected to pen - MAC: $macAddress');
    } catch (e) {
      logger.e(
          'PEN_CONNECT_FAILED: Failed to connect to pen - MAC: $macAddress, Error: $e');

      // Check if this is a status 133 error (BLE GATT error)
      if (e.toString().contains('133') || e.toString().contains('GATT_ERROR')) {
        logger.w(
            'PEN_CONNECT_GATT_ERROR: Detected BLE GATT error 133 - connection resource conflict');
        // Add extra delay for GATT errors to allow BLE stack to recover
        await Future.delayed(Duration(seconds: 3));
      }
      // Reset connection state on failure
      _connectedPen = null;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> disconnectPen() async {
    logger.i(
        'PEN_DISCONNECT: Manually disconnecting pen - MAC: ${_connectedPen?.macAddress}');
    try {
      await DPenCtrl.disconnect();
      penDisconnected();
      _penEventStreamController.add(null);
      logger.i('PEN_DISCONNECT_SUCCESS: Successfully disconnected pen');
    } catch (e) {
      logger.e('PEN_DISCONNECT_FAILED: Failed to disconnect pen - Error: $e');
    }
  }

  Future<bool> checkHardwareConnectionStatus() async {
    try {
      final bool isConnected = await DPenCtrl.isConnected();
      final int connectionStatus = await DPenCtrl.getConnectionStatus();

      logger.i(
          'PEN_HARDWARE_STATUS: isConnected=$isConnected, status=$connectionStatus');

      // Sync our state with hardware state
      if (!isConnected && _connectedPen != null) {
        logger.w(
            'PEN_STATE_SYNC: Hardware says disconnected but we think connected, syncing...');
        penDisconnected();
      } else if (isConnected && _connectedPen == null) {
        // Hardware says connected but our state says disconnected
        // This can happen after hot reload - try to restore connection state
        final savedMac = savedPenMacAddress;
        if (savedMac != null) {
          logger.i(
              'PEN_STATE_SYNC: Hardware connected but app state disconnected, restoring state for MAC: $savedMac');
          setConnectedPen(PenEvent(
            macAddress: savedMac,
            deviceName: 'Restored Connection',
            rssi: -100,
            penMsgType: 0,
          ));
        }
      }

      return isConnected;
    } catch (e) {
      logger.e(
          'PEN_HARDWARE_STATUS_CHECK_FAILED: Error checking hardware status - $e');
      return false;
    }
  }

  Future<void> setUserLoginStatus(bool isLoggedIn) async {
    try {
      logger.i('PEN_USER_LOGIN_STATUS: Setting login status to $isLoggedIn');
      await DPenCtrl.setUserLoginStatus(isLoggedIn);

      if (isLoggedIn) {
        logger.i(
            'PEN_AUTO_RECONNECT: User logged in, auto-reconnect enabled for iOS');
        // Enable auto-reconnect if we have a saved pen and not currently connected
        if (savedPenMacAddress != null && !isConnected) {
          await DPenCtrl.setAutoReconnectEnabled(true);
          logger.i('PEN_AUTO_RECONNECT: Auto-reconnect enabled for saved pen');
        }
      } else {
        logger
            .i('PEN_AUTO_RECONNECT: User logged out, disabling auto-reconnect');
        await DPenCtrl.setAutoReconnectEnabled(false);
      }
    } catch (e) {
      logger.e('PEN_LOGIN_STATUS_ERROR: Failed to set login status - $e');
    }
  }

  Future<void> setAutoReconnectEnabled(bool enabled) async {
    try {
      logger
          .i('PEN_AUTO_RECONNECT_SETTING: Setting auto-reconnect to $enabled');
      await DPenCtrl.setAutoReconnectEnabled(enabled);
    } catch (e) {
      logger.e('PEN_AUTO_RECONNECT_ERROR: Failed to set auto-reconnect - $e');
    }
  }
}
