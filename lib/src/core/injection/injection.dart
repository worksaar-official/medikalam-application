// Package imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:Medikalam/services/routing/app_router.dart';
import 'package:Medikalam/src/core/injection/image_service.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/helpers/cache_utils.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/http_log_capture_interceptor.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

Future<void> preloadAppImage(String imageUrl) async {
  await getIt<ImageService>().preloadImage(imageUrl);
}

Future<void> localInjection() async {
  await SharedPreferences.getInstance().then((pref) {
    Helpers.prefs = pref;
    CacheUtils.setPrefs(pref);
  });
  final dio = Dio(BaseOptions(
      baseUrl: EndPoints.apiBaseUrl,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)));
  // Add PrettyDioLogger for console display
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true, requestBody: true, responseHeader: true));

  // Add our custom HTTP log capture interceptor to send logs to website
  dio.interceptors.add(HttpLogCaptureInterceptor());

  final token = Helpers.getString(key: "token");
  if (token != null) {
    dio.options.headers["x-access-token"] = Helpers.getString(key: "token");
  }
  Helpers.dio = dio;

  EasyLoading.instance
    ..indicatorColor = const Color(0xFF146399)
    ..indicatorWidget = const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        Color(0xFF146399),
      ),
      backgroundColor: Color(0xFF18a0fb),
    )
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..textColor = AppColors.textPrimary
    ..boxShadow = <BoxShadow>[]
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..toastPosition = EasyLoadingToastPosition.bottom;
}

void injectRouter() =>
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
