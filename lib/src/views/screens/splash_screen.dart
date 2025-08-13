// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/views/mixins/pen_connection_mixin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with PenConnectionMixin<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(const Duration(milliseconds: 1500), () {
      final token = Helpers.getString(key: 'token');
      // TODO: get user details
      handleNavigation(context, token);
    });
  }

  void handleNavigation(BuildContext context, String? token) {
    if (token != null) {
      
      context.pushReplacementNamed(AppScreens.dashboard.name);
    } else {
      context.pushReplacementNamed(AppScreens.landing.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animation/splash.json',
        fit: BoxFit.cover, repeat: false, filterQuality: FilterQuality.high);
  }
}
