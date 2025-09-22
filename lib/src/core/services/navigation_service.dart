// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

/// Service to handle global navigation and context management
class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance => _instance ??= NavigationService._();

  NavigationService._();

  BuildContext? _currentContext;
  DateTime? _lastNavigationAt;
  bool _isNavigating = false;

  /// Set the current context for navigation
  void setContext(BuildContext context) {
    _currentContext = context;
  }

  /// Clear the current context when widget is disposed
  void clearContext() {
    _currentContext = null;
  }

  /// Get the current route name
  String? get currentRoute {
    if (_currentContext == null) return null;
    final routerState = GoRouterState.of(_currentContext!);
    return routerState.uri.path;
  }

  /// Check if user is currently on dashboard
  bool get isOnDashboard {
    return currentRoute == AppScreens.dashboard.path;
  }

  /// Navigate to prescription paper automatically from ANYWHERE
  /// Ensures we don't attempt navigation without a context and avoids
  /// stacking the same route repeatedly.
  Future<void> navigateToPrescriptionPaper() async {
    if (_currentContext == null) {
      logger.w('NAVIGATION_SERVICE: No context available for navigation');
      return;
    }

    try {
      final current = currentRoute;
      // Avoid pushing again if we are already on the page
      if (current != AppScreens.prescriptionPaper.path) {
        // Throttle to avoid stacking navigation on rapid pen events
        final now = DateTime.now();
        if (_isNavigating ||
            (_lastNavigationAt != null &&
                now.difference(_lastNavigationAt!).inMilliseconds < 1200)) {
          logger.i('NAVIGATION_SERVICE: Throttling navigation');
          return;
        }
        _isNavigating = true;
        logger.i('NAVIGATION_SERVICE: Auto-navigating to prescription paper');
        try {
          _currentContext!.push(AppScreens.prescriptionPaper.path);
        } catch (_) {
          // Fallback to GoRouter context access if direct push fails
          try {
            GoRouter.of(_currentContext!)
                .push(AppScreens.prescriptionPaper.path);
          } catch (e) {
            logger.e('NAVIGATION_SERVICE: Both navigation attempts failed: $e');
          }
        }
        _lastNavigationAt = DateTime.now();
        Future.delayed(const Duration(milliseconds: 600), () {
          _isNavigating = false;
        });
      } else {
        logger.i(
            'NAVIGATION_SERVICE: Already on prescription paper, no navigation');
      }
    } catch (e) {
      logger.e(
          'NAVIGATION_SERVICE: Failed to navigate to prescription paper: $e');
    }
  }
}
