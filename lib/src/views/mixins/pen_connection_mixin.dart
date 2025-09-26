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
import 'package:Medikalam/src/core/services/navigation_service.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';

mixin PenConnectionMixin<T extends StatefulWidget> on State<T> {
  late PenProvider _penProvider;
  PrescriptionProvider get _prescriptionProvider =>
      context.read<PrescriptionProvider>();

  // Deprecated flag (kept for backwards compatibility, no longer used)
  // bool _hasAutoNavigated = false;

  @override
  void initState() {
    super.initState();
    _penProvider = context.read<PenProvider>();
    // Set navigation context for auto-navigation
    NavigationService.instance.setContext(context);
    // Register callback to reset auto-navigation when pen disconnects
    _penProvider.setResetAutoNavigationCallback(resetAutoNavigation);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Keep navigation context fresh when the widget's dependencies change
    NavigationService.instance.setContext(context);
  }

  @override
  void dispose() {
    super.dispose();
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

  void restartBleForAutoReconnect() {
    logger.i("PEN_BLE_RESTART: Restarting BLE scanning for auto-reconnect");

    // Clear previous pen list
    _penProvider.clearList();

    // Restart BLE scanning
    DPenCtrl.btStartForPeripheralsList().then((result) {
      logger.i("PEN_BLE_RESTART_RESULT: Scan restart result: $result");
    }).catchError((error) {
      logger.e("PEN_BLE_RESTART_ERROR: Failed to restart scan: $error");
    });

    // Ensure event listeners are active
    DPenCtrl.eventChannel.receiveBroadcastStream().listen((event) {
      final obj = json.decode(event);
      logger.d("PEN_BLE_RESTART_EVENT: Received event: $obj");
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

    // Handle connection success events (both Android and iOS)
    if (object.containsKey("success") && object["success"] == 1) {
      logger.i("PEN_CONNECTION_SUCCESS: Pen connected successfully");
      // Get the connected pen info from penMsgType if available
      final penMsgType = object["penMsgType"];
      if (penMsgType == 2) {
        // iOS connected status
        logger.i("PEN_iOS_CONNECTION_SUCCESS: iOS pen connection confirmed");
      }
      return;
    }

    // Handle pen discovery events
    if (object.containsKey("STRING_PEN_MAC_ADDRESS")) {
      final penEvent = PenEvent.fromJson(object);
      logger.i(
          "PEN_EVENT_PROCESSED: MAC: ${penEvent.macAddress}, Type: ${penEvent.penMsgType}, RSSI: ${penEvent.rssi}");

      // NOTE: penMsgType values are based on native SDK constants
      // Android: 0=FIND_DEVICE, 1=PEN_CONNECTION_SUCCESS, 2=PEN_DISCONNECTED
      // iOS: 2=connected, 3=disConnected, 4=connectionFailure, 5=findDevice
      if (penEvent.penMsgType == 3 ||
          penEvent.penMsgType == 4 ||
          penEvent.penMsgType == 2) {
        // Handle disconnection events (Android type 2, iOS type 3 & 4)
        if (penEvent.penMsgType == 2 && object.containsKey("disconnected")) {
          // This is Android disconnect event
          logger.w("PEN_ANDROID_DISCONNECT: Android pen disconnected");
          _penProvider.penDisconnected();
        } else if (penEvent.penMsgType == 3 || penEvent.penMsgType == 4) {
          // This is iOS disconnect/failure event
          logger.w(
              "PEN_iOS_DISCONNECT: iOS pen disconnected or failed - Type: ${penEvent.penMsgType}");
          _penProvider.penDisconnected();
        }
      } else if (penEvent.penMsgType == 5 || penEvent.penMsgType == 0) {
        // Handle device discovery (iOS type 5, Android type 0)
        logger
            .i("PEN_DEVICE_FOUND: Device discovered - ${penEvent.deviceName}");
        _penProvider.addPenEvent(penEvent);
      } else {
        // Handle other pen events (movement, etc.)
        _penProvider.addPenEvent(penEvent);
      }
    } else if (object.containsKey("disconnected")) {
      logger.w("PEN_DISCONNECTED_EVENT: Generic disconnect event received");
      _penProvider.penDisconnected();
    } else if (object.containsKey("autoReconnectAttempt")) {
      logger.i("PEN_AUTO_RECONNECT_ATTEMPT: Auto-reconnect attempt detected");
      final penMac = object["penMac"] as String?;
      final penName = object["penName"] as String?;
      logger.i(
          "PEN_AUTO_RECONNECT_INFO: Attempting to reconnect to $penName ($penMac)");
    } else if (object.containsKey("autoReconnectScan")) {
      logger.i("PEN_AUTO_RECONNECT_SCAN: Auto-reconnect scan detected");
      final targetMac = object["targetMac"] as String?;
      final targetName = object["targetName"] as String?;
      logger.i(
          "PEN_AUTO_RECONNECT_SCAN_INFO: Looking for $targetName ($targetMac)");

      // Use dedicated restart method for auto-reconnect
      restartBleForAutoReconnect();
    } else if (object.containsKey("page")) {
      logger.d(
          "PEN_DOT_EVENT: Pen dot event - X: ${object['x']}, Y: ${object['y']}, Page: ${object['page']}");

      // Auto-navigate to prescription page from ANY screen when the pen writes
      // _handleAutoNavigateToPrescriptionPaper();
      // 🔧 ONLY auto-navigate if we're NOT on prescription page
      final currentRoute = NavigationService.instance.currentRoute;
      if (currentRoute != AppScreens.prescriptionPaper.path) {
        // Auto-navigate to prescription page from ANY screen when the pen writes
        _handleAutoNavigateToPrescriptionPaper();
      } else {
        logger
            .d("PEN_AUTO_NAV: On prescription page, skipping auto-navigation");
      }

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

  /// Debounced auto navigation guard
  bool _penAutoNavLock = false;
  DateTime? _lastPenNavAt;

  /// Handle automatic navigation to prescription page when user starts writing
  /// from ANY screen. Requires: user logged in and pen connected.
  void _handleAutoNavigateToPrescriptionPaper() {
    // Check if auto-navigation should be enabled
    if (!isAutoNavigationEnabled) {
      logger.i("PEN_AUTO_NAV: Auto-navigation disabled, skipping");
      return;
    }

    // 🔧 ADDITIONAL SAFETY CHECK: Double-check if we're already on prescription page
    final currentRoute = NavigationService.instance.currentRoute;
    logger.d("PEN_AUTO_NAV: Current route: $currentRoute");

    if (currentRoute == AppScreens.prescriptionPaper.path) {
      logger
          .i("PEN_AUTO_NAV: Already on prescription page, skipping navigation");
      return;
    }
    // Debounce to prevent multiple navigations from frequent dot events
    final now = DateTime.now();
    if (_penAutoNavLock &&
        _lastPenNavAt != null &&
        now.difference(_lastPenNavAt!).inMilliseconds < 1500) {
      logger.i("PEN_AUTO_NAV: Navigation throttled, skipping");
      return;
    }

    _penAutoNavLock = true;
    _lastPenNavAt = now;

    logger.i(
        "PEN_AUTO_NAV: Dot detected, navigating to prescription paper from any screen");

    // Ensure scanning mode is disabled before entering drawing screen
    _prescriptionProvider.isScan = false;

    // Global navigation
    NavigationService.instance.navigateToPrescriptionPaper();

    // Release lock after a short delay
    Future.delayed(const Duration(milliseconds: 800), () {
      _penAutoNavLock = false;
      logger.i("PEN_AUTO_NAV: Navigation lock released");
    });
  }

  /// Reset auto-navigation flag (can be called when pen disconnects)
  void resetAutoNavigation() {
    _penAutoNavLock = false;
    _lastPenNavAt = null;
    logger.i("PEN_AUTO_NAV: Auto-navigation lock reset");
  }

  /// Check if auto-navigation should be enabled
  bool get isAutoNavigationEnabled {
    // Check if pen is connected
    // if (!_penProvider.isConnected) return false;
    if (!_penProvider.isConnected) {
      logger.d("PEN_AUTO_NAV: Pen not connected");
      return false;
    }

    // Check if user is logged in
    final isLoggedIn = Helpers.getString(key: Keys.token) != null;
    if (!isLoggedIn) return false;

    // Check if we're not already on prescription page
    final currentRoute = NavigationService.instance.currentRoute;
    // if (currentRoute == AppScreens.prescriptionPaper.path) return false;
    // Check if we're already on prescription page or any prescription-related page
    if (currentRoute == AppScreens.prescriptionPaper.path ||
        currentRoute?.contains('prescription') == true) {
      logger.d("PEN_AUTO_NAV: Already on prescription page, auto-nav disabled");
      return false;
    }

    // Check if auto-navigation is not locked
    if (_penAutoNavLock) return false;

    return true;
  }
}
