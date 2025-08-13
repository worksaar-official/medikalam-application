// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      log('Running on Production');
      return '.env.development';
    }
    log('Running on Development');
    return '.env.development';
  }

  static String get apiBaseUrl {
    return dotenv.env['API_BASE_URL'] ?? 'API_BASE_URL not found!';
  }
}
