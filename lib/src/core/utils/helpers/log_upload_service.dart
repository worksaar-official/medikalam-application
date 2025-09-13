import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/constants/log_endpoints.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/services/api/api_result.dart';

/// Service for uploading logs to your website
class LogUploadService {
  static final LogUploadService _instance = LogUploadService._internal();
  factory LogUploadService() => _instance;
  LogUploadService._internal();

  final Dio _dio = Dio();

  /// Upload logs to Medikalam backend
  Future<ApiResult<bool>> uploadLogs({
    required Map<String, dynamic> logData,
    String? customEndpoint,
  }) async {
    try {
      logger.i('Starting log upload to Medikalam backend');

      final endpoint = customEndpoint ?? LogEndpoints.uploadLogs;

      // Format data for your backend API - try different formats
      final logsString = logData['logs']?.toString() ?? '';

      // Send as JSON data (not FormData)
      final jsonData = {
        'logs': logsString,
        'timestamp': DateTime.now().toIso8601String(),
        'platform': Platform.operatingSystem,
        'type': 'console_logs',
      };

      logger.d('Sending logs to backend as JSON: ${logsString.length} chars');
      logger.d('Full logs content: $logsString');
      if (logsString.isNotEmpty) {
        logger.d(
            'First 100 chars: ${logsString.substring(0, logsString.length > 100 ? 100 : logsString.length)}');
      }

      final response = await _dio.post(
        endpoint,
        data: jsonData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) {
            // Accept 200, 201, and 400 for debugging
            return status != null &&
                (status == 200 || status == 201 || status == 400);
          },
        ),
      );

      logger.d('Response status: ${response.statusCode}');
      logger.d('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Logs uploaded successfully to Medikalam backend');
        return const ApiResult.success(data: true);
      } else if (response.statusCode == 400) {
        logger.e('Bad Request (400) - Response: ${response.data}');
        return ApiResult.failure(
          error: ServerException(message: 'Bad Request: ${response.data}'),
        );
      } else {
        logger.e('Log upload failed with status: ${response.statusCode}');
        return ApiResult.failure(
          error: ServerException(
              message: 'Upload failed with status: ${response.statusCode}'),
        );
      }
    } on DioException catch (e) {
      logger.e('Dio error during log upload: ${e.message}');
      logger.e('Dio error response: ${e.response?.data}');
      return ApiResult.failure(
        error: ServerException(message: 'Network error: ${e.message}'),
      );
    } catch (e) {
      logger.e('Unexpected error during log upload: $e');
      return ApiResult.failure(
        error: ServerException(message: 'Upload error: $e'),
      );
    }
  }

  /// Upload logs as a file attachment
  Future<ApiResult<bool>> uploadLogFile({
    required String filePath,
    Map<String, dynamic>? metadata,
    String? customEndpoint,
  }) async {
    try {
      logger.i('Starting log file upload to Medikalam backend');

      final endpoint = customEndpoint ?? LogEndpoints.uploadLogFile;
      final file = File(filePath);

      if (!await file.exists()) {
        logger.e('Log file does not exist: $filePath');
        return ApiResult.failure(
          error: ServerException(message: 'Log file does not exist'),
        );
      }

      final formData = FormData.fromMap({
        'logFile': await MultipartFile.fromFile(
          filePath,
          filename: 'console_logs_${DateTime.now().millisecondsSinceEpoch}.txt',
        ),
        'metadata': jsonEncode({
          ...?metadata,
          'platform': Platform.operatingSystem,
          'timestamp': DateTime.now().toIso8601String(),
          'type': 'console_logs_file',
          'app_version': '1.0.11',
        }),
        'platform': Platform.operatingSystem,
        'timestamp': DateTime.now().toIso8601String(),
        'type': 'console_logs_file',
        'app_version': '1.0.11',
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
          sendTimeout: const Duration(minutes: 2),
          receiveTimeout: const Duration(minutes: 2),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Log file uploaded successfully to Medikalam backend');
        return const ApiResult.success(data: true);
      } else {
        logger.e('Log file upload failed with status: ${response.statusCode}');
        return ApiResult.failure(
          error: ServerException(
              message: 'Upload failed with status: ${response.statusCode}'),
        );
      }
    } on DioException catch (e) {
      logger.e('Dio error during log file upload: ${e.message}');
      return ApiResult.failure(
        error: ServerException(message: 'Network error: ${e.message}'),
      );
    } catch (e) {
      logger.e('Unexpected error during log file upload: $e');
      return ApiResult.failure(
        error: ServerException(message: 'Upload error: $e'),
      );
    }
  }

  /// Batch upload multiple log entries
  Future<ApiResult<bool>> uploadBatchLogs({
    required List<Map<String, dynamic>> logEntries,
    String? customEndpoint,
  }) async {
    try {
      logger.i('Starting batch log upload to Medikalam backend');

      final endpoint = customEndpoint ?? LogEndpoints.uploadBatchLogs;

      final batchData = {
        'logs': logEntries,
        'batchId': DateTime.now().millisecondsSinceEpoch.toString(),
        'platform': Platform.operatingSystem,
        'timestamp': DateTime.now().toIso8601String(),
        'type': 'console_logs_batch',
        'app_version': '1.0.11',
        'count': logEntries.length,
      };

      final response = await _dio.post(
        endpoint,
        data: batchData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          sendTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Batch logs uploaded successfully to Medikalam backend');
        return const ApiResult.success(data: true);
      } else {
        logger.e('Batch log upload failed with status: ${response.statusCode}');
        return ApiResult.failure(
          error: ServerException(
              message: 'Upload failed with status: ${response.statusCode}'),
        );
      }
    } on DioException catch (e) {
      logger.e('Dio error during batch log upload: ${e.message}');
      return ApiResult.failure(
        error: ServerException(message: 'Network error: ${e.message}'),
      );
    } catch (e) {
      logger.e('Unexpected error during batch log upload: $e');
      return ApiResult.failure(
        error: ServerException(message: 'Upload error: $e'),
      );
    }
  }

  /// Test connection to Medikalam backend
  Future<ApiResult<bool>> testConnection({String? customEndpoint}) async {
    try {
      final endpoint = customEndpoint ?? LogEndpoints.healthCheck;

      final response = await _dio.get(
        endpoint,
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      if (response.statusCode == 200) {
        logger.i('Medikalam backend connection test successful');
        return const ApiResult.success(data: true);
      } else {
        logger.e(
            'Medikalam backend connection test failed with status: ${response.statusCode}');
        return ApiResult.failure(
          error: ServerException(
              message:
                  'Connection test failed with status: ${response.statusCode}'),
        );
      }
    } on DioException catch (e) {
      logger.e('Dio error during connection test: ${e.message}');
      return ApiResult.failure(
        error: ServerException(message: 'Connection test failed: ${e.message}'),
      );
    } catch (e) {
      logger.e('Unexpected error during connection test: $e');
      return ApiResult.failure(
        error: ServerException(message: 'Connection test error: $e'),
      );
    }
  }
}
