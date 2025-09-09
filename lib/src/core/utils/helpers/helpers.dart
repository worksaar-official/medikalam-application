// Dart imports:

// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:get_it/get_it.dart';
import 'package:Medikalam/services/routing/app_router.dart';
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/errors/failures.dart';
import 'package:Medikalam/src/core/utils/constants/constant.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';

enum RequestType { get, post, put, delete }

enum LoggerType { d, e, i, f, t, w }

class Helpers {
  static late SharedPreferences? _prefs;
  static late Dio? _dio;

  static set prefs(SharedPreferences pref) => _prefs = pref;

  static SharedPreferences get prefs => _prefs!;

  static set dio(Dio dio) => _dio = dio;

  static Dio get dio => _dio!;

  static void setToken(String token) {
    dio.options.headers["x-access-token"] = token;
  }

  static Future<List<String>?> pickFile_Android() async {
    final result = await ImagePicker().pickMultiImage();
    return result.map((e) => e.path).toList();
  }

  static Future<Map<String, dynamic>> getApiHeaders() async {
    final headers = <String, dynamic>{
      'Content-Type': 'application/json' 'charset=utf-8',
    };
    return headers;
  }

  static Future<void> makeCall(String number) async {
    final url = Uri.parse('tel:$number');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static String getMonthAbbreviation(int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }
    return Constants.monthAbbreviations[month]!;
  }

  static MapEntry<int, String> getMonthDetailsByIndex(int index) {
    // Get the keys as a list
    List<int> keys = Constants.fullMonthAbbreviations.keys.toList();

    // Check if the index is valid
    if (index >= 0 && index < keys.length) {
      int monthNumber = keys[index];
      String monthName = Constants.fullMonthAbbreviations[monthNumber]!;
      return MapEntry(monthNumber, monthName);
    }
    return const MapEntry(0, "Invalid");
  }

  static List<int> generateYears() {
    List<int> years = [];
    int currentYear = DateTime.now().year;
    for (int i = 0; i < 10; i++) {
      years.add(currentYear - i);
    }
    return years;
  }

  static Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/data.json';
  }

  static Future<void> saveJson(Map<String, dynamic> jsonData) async {
    final filePath = await getFilePath();
    final file = File(filePath);
    String jsonString = jsonEncode(jsonData);
    await file.writeAsString(jsonString);
    logger.i("Json File Saved at : $filePath");
  }

  static Future<Map<String, dynamic>?> readJson() async {
    try {
      final filePath = await getFilePath();
      final file = File(filePath);

      if (await file.exists()) {
        String jsonString = await file.readAsString();
        return jsonDecode(jsonString);
      } else {
        showError("Config Json File Does Not Exist. Contact Admin!");
        return null;
      }
    } catch (e) {
      showError(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> sendRequest(
    RequestType type,
    String path, {
    Map<String, dynamic>? queryParams,
    bool encoded = false,
    dynamic data,
    dynamic listData,
    FormData? formData,
  }) async {
    try {
      Response<dynamic> response;

      switch (type) {
        case RequestType.get:
          response = await _dio!.get(
            path,
            queryParameters: queryParams,
            options: Options(headers: {}),
          );
        case RequestType.post:
          response = await _dio!.post(
            path,
            options: Options(
              contentType:
                  encoded == true ? Headers.formUrlEncodedContentType : null,
              validateStatus: (code) => true,
            ),
            data: data ?? queryParams ?? listData ?? formData,
          );
        case RequestType.put:
          response =
              await _dio!.put(path, data: data, queryParameters: queryParams);
        case RequestType.delete:
          response = await _dio!.delete(path, queryParameters: queryParams);
      }

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return response.data as Map<String, dynamic>;
      } else if (response.statusCode == 400 ||
          response.statusCode == 404 ||
          response.statusCode == 403 ||
          response.statusCode == 402) {
        throw ServerException(
          code: response.statusCode,
          message:
              (response.data as Map<String, dynamic>)['message'].toString(),
        );
      } else if (response.statusCode == 401) {
        showError("Session Expired");
        await Helpers.clearShared();
        final appRouter = GetIt.I<AppRouter>().router;
        while (appRouter.canPop()) {
          appRouter.pop();
        }
        appRouter.replaceNamed(AppScreens.landing.name);
      } else {
        throw ServerException(
          code: response.statusCode,
          message:
              (response.data as Map<String, dynamic>)['message'].toString(),
        );
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message, code: e.code);
    } on DioException catch (e) {
      debugPrint('Dio Exception ${e.response?.data} ${e.type} ${e.message}');
      if (e.error == 'Http status error [401]') {
        debugPrint("I go here 3 ${e.error == "Http status error [401]"}");
      } else {
        logger.e(e.error ?? 'Unknown Dio error occurred');
        throw ServerException(
            code: e.response?.statusCode, message: e.error?.toString() ?? 'An unknown network error occurred. Please check your connection.');
      }
    }
    return null;
  }

  static String convertFailureToMessage(CustomFailure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    return 'Unknown error occured';
  }

  static void setString({required String key, required String value}) {
    prefs.setString(key, value);
  }

  static void deleteString({required String key}) {
    prefs.remove(key);
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static Future<void> clearShared() async {
    await prefs.clear();
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field Required';
    }
    const p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
        r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]'
        r'+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'invalid email';
  }

  static String greetingTitle() {
    DateTime now = DateTime.now();
    if (now.hour < 12) {
      return "Good Morning";
    } else if (now.hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  static String? validateField(String value) {
    if (value.isEmpty || value == 'null') {
      return 'Field Required';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.length < 10 || value.length > 10) {
      return 'Please Enter Valid Mobile Number';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.length < 4) {
      return 'Password should be minimum 4 characters long';
    } else {
      return null;
    }
  }

  static String? validateDate(DateTime? value) {
    if (value == null) {
      return 'Please select date';
    }
    return null;
  }
}

class NumberInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains('.')) {
      return oldValue;
    } else if (newValue.text.contains(RegExp(r'[^\d]'))) {
      return oldValue;
    }
    return newValue;
  }
}
