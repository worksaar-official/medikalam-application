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

  /// Navigate to prescription paper automatically
  Future<void> navigateToPrescriptionPaper() async {
    if (_currentContext == null) {
      logger.w('NAVIGATION_SERVICE: No context available for navigation');
      return;
    }

    if (!isOnDashboard) {
      logger.i(
          'NAVIGATION_SERVICE: User not on dashboard, skipping auto-navigation');
      return;
    }

    try {
      logger.i('NAVIGATION_SERVICE: Auto-navigating to prescription paper');
      _currentContext!.push(AppScreens.prescriptionPaper.path);
    } catch (e) {
      logger.e(
          'NAVIGATION_SERVICE: Failed to navigate to prescription paper: $e');
    }
  }
}
