import 'package:dio/dio.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

/// Test class for Medikalam backend connectivity
class MedikalamBackendTest {
  static final Dio _dio = Dio();

  /// Test GET request to your backend
  static Future<void> testGetRequest() async {
    try {
      logger.i('Testing GET request to Medikalam backend...');

      final response = await _dio.get(
        'https://medikalam-backend.onrender.com/mobile?day=2025-09-12',
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      logger.i('GET request successful!');
      logger.i('Status Code: ${response.statusCode}');
      logger.i('Response Data: ${response.data}');
    } catch (e) {
      logger.e('GET request failed: $e');
    }
  }

  /// Test POST request to your backend
  static Future<void> testPostRequest() async {
    try {
      logger.i('Testing POST request to Medikalam backend...');

      final testData = {
        'timestamp': DateTime.now().toIso8601String(),
        'platform': 'test',
        'logs': 'Test log data from Medikalam app',
        'device_info': {
          'platform': 'test',
          'version': 'test',
        },
        'type': 'console_logs',
        'app_version': '1.0.11',
      };

      final response = await _dio.post(
        'https://medikalam-backend.onrender.com/mobile',
        data: testData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      logger.i('POST request successful!');
      logger.i('Status Code: ${response.statusCode}');
      logger.i('Response Data: ${response.data}');
    } catch (e) {
      logger.e('POST request failed: $e');
    }
  }

  /// Run both tests
  static Future<void> runAllTests() async {
    logger.i('Starting Medikalam backend tests...');

    await testGetRequest();
    await Future.delayed(const Duration(seconds: 2));
    await testPostRequest();

    logger.i('Medikalam backend tests completed!');
  }
}
