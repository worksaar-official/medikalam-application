// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

/// Helper class to manage pen auto-reconnect functionality
/// Only works when user is logged in (iOS specific requirement)
class PenAutoReconnectHelper {
  static PenProvider? _penProvider;
  static bool _isInitialized = false;

  /// Initialize the helper with pen provider
  static void initialize(PenProvider penProvider) {
    _penProvider = penProvider;
    _isInitialized = true;
    logger.i('PEN_AUTO_RECONNECT_HELPER: Initialized');
  }

  /// Call this when user successfully logs in
  static Future<void> onUserLogin() async {
    if (!_isInitialized || _penProvider == null) {
      logger.w(
          'PEN_AUTO_RECONNECT_HELPER: Not initialized, skipping login setup');
      return;
    }

    try {
      logger.i(
          'PEN_AUTO_RECONNECT_HELPER: User logged in, enabling auto-reconnect');
      await _penProvider!.setUserLoginStatus(true);

      // If we have a previously connected pen and not currently connected, enable auto-reconnect
      if (_penProvider!.savedPenMacAddress != null &&
          !_penProvider!.isConnected) {
        logger.i(
            'PEN_AUTO_RECONNECT_HELPER: Found saved pen, enabling auto-reconnect');
        await _penProvider!.setAutoReconnectEnabled(true);
      }
    } catch (e) {
      logger.e('PEN_AUTO_RECONNECT_HELPER: Error setting up login - $e');
    }
  }

  /// Call this when user logs out
  static Future<void> onUserLogout() async {
    if (!_isInitialized || _penProvider == null) {
      logger.w(
          'PEN_AUTO_RECONNECT_HELPER: Not initialized, skipping logout setup');
      return;
    }

    try {
      logger.i(
          'PEN_AUTO_RECONNECT_HELPER: User logged out, disabling auto-reconnect');
      await _penProvider!.setUserLoginStatus(false);

      // Optionally disconnect current pen
      if (_penProvider!.isConnected) {
        logger.i('PEN_AUTO_RECONNECT_HELPER: Disconnecting pen on logout');
        await _penProvider!.disconnectPen();
      }
    } catch (e) {
      logger.e('PEN_AUTO_RECONNECT_HELPER: Error setting up logout - $e');
    }
  }

  /// Enable/disable auto-reconnect manually
  static Future<void> setAutoReconnectEnabled(bool enabled) async {
    if (!_isInitialized || _penProvider == null) {
      logger.w(
          'PEN_AUTO_RECONNECT_HELPER: Not initialized, skipping auto-reconnect setting');
      return;
    }

    try {
      logger.i('PEN_AUTO_RECONNECT_HELPER: Setting auto-reconnect to $enabled');
      await _penProvider!.setAutoReconnectEnabled(enabled);
    } catch (e) {
      logger.e('PEN_AUTO_RECONNECT_HELPER: Error setting auto-reconnect - $e');
    }
  }

  /// Check if auto-reconnect is available (user logged in + saved pen)
  static bool get isAutoReconnectAvailable {
    if (!_isInitialized || _penProvider == null) return false;
    return _penProvider!.savedPenMacAddress != null;
  }

  /// Get saved pen MAC address
  static String? get savedPenMac {
    if (!_isInitialized || _penProvider == null) return null;
    return _penProvider!.savedPenMacAddress;
  }

  /// Dispose resources
  static void dispose() {
    _penProvider = null;
    _isInitialized = false;
    logger.i('PEN_AUTO_RECONNECT_HELPER: Disposed');
  }
}
