import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/log_upload_service.dart';

/// Console log capture service that captures all console output
/// and automatically uploads it to a website
class ConsoleLogCapture {
  static final ConsoleLogCapture _instance = ConsoleLogCapture._internal();
  factory ConsoleLogCapture() => _instance;
  ConsoleLogCapture._internal();

  static const MethodChannel _channel = MethodChannel('console_log_capture');
  StreamSubscription<dynamic>? _logSubscription;
  List<String> _logs = [];
  Timer? _uploadTimer;
  String? _logFilePath;
  bool _isInitialized = false;

  /// Initialize the console log capture
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Create log file
      final directory = await getApplicationDocumentsDirectory();
      _logFilePath = '${directory.path}/console_logs.txt';

      // Capture Flutter debug prints
      _captureFlutterLogs();

      // Capture platform-specific logs (Android/iOS)
      await _capturePlatformLogs();

      // Start periodic upload
      _startPeriodicUpload();

      _isInitialized = true;
      logger.i('Console log capture initialized');
    } catch (e) {
      logger.e('Failed to initialize console log capture: $e');
    }
  }

  /// Capture Flutter debug prints and console output
  void _captureFlutterLogs() {
    // Override debugPrint to capture logs
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) {
        // Check if this is a pen-related log and add special prefix
        if (_isPenRelatedLog(message)) {
          _addLog('PEN_FLUTTER: $message');
        } else {
          _addLog(message);
        }
      }
      // Call original debugPrint
      debugPrintSynchronously(message, wrapWidth: wrapWidth);
    };

    // Capture stdout and stderr
    _captureStreamOutput();
  }

  /// Capture stdout and stderr streams
  void _captureStreamOutput() {
    // Note: Direct stdout/stderr capture is complex in Flutter
    // The main logging will be captured through debugPrint override
    // and platform-specific implementations

    // For now, we'll rely on the debugPrint override and platform channels
    // for comprehensive log capture
    _addLog('FLUTTER: Stream output capture initialized');
  }

  /// Capture platform-specific logs (Android/iOS)
  Future<void> _capturePlatformLogs() async {
    try {
      // Initialize platform-specific log capture
      await _initializePlatformChannel();

      _addLog('SYSTEM: Platform log capture initialized');
      logger.i('Platform log capture initialized (Enhanced mode)');
    } catch (e) {
      logger.e('Failed to initialize platform log capture: $e');
    }
  }

  /// Initialize platform channel for iOS/Android log capture
  Future<void> _initializePlatformChannel() async {
    try {
      const platform = MethodChannel('console_log_capture');

      // Start platform log capture for both iOS and Android
      await platform.invokeMethod('startLogCapture');

      // Set up listener for platform logs
      platform.setMethodCallHandler((call) async {
        if (call.method == 'onLogReceived') {
          final log = call.arguments as String?;
          if (log != null) {
            _addLog('NATIVE: $log');
          }
        }
      });

      // Get initial logs from platform
      final platformLogs = await platform.invokeMethod<String>('getAllLogs');
      if (platformLogs != null && platformLogs.isNotEmpty) {
        final lines = platformLogs.split('\n');
        for (final line in lines) {
          if (line.isNotEmpty && line.trim().isNotEmpty) {
            _addLog('NATIVE: $line');
          }
        }
      }

      logger.i('Platform channel initialized successfully');
    } catch (e) {
      logger.e('Failed to initialize platform channel: $e');
      // Continue without platform channel - Flutter logs will still be captured
    }
  }

  /// Add a log entry to the buffer
  void _addLog(String log) {
    // Clean up the log message to remove excessive formatting
    String cleanLog = _cleanLogMessage(log);

    // Add timestamp for better readability
    final timestamp = DateTime.now().toIso8601String();
    final formattedLog = '[$timestamp] $cleanLog';

    _logs.add(formattedLog);

    // Write to file immediately
    _writeToFile(formattedLog);

    // Keep only last 1000 logs in memory
    if (_logs.length > 1000) {
      _logs.removeAt(0);
    }
  }

  /// Clean up log messages to remove excessive formatting
  String _cleanLogMessage(String log) {
    // Remove the decorative lines and excessive formatting
    String cleaned = log
        .replaceAll(RegExp(r'┌[─┄]*┐'), '') // Remove top decorative lines
        .replaceAll(RegExp(r'└[─┄]*┘'), '') // Remove bottom decorative lines
        .replaceAll(RegExp(r'├[┄]*┤'), '') // Remove middle decorative lines
        .replaceAll(RegExp(r'│\s*#\d+'), '') // Remove stack trace numbers
        .replaceAll(RegExp(r'│\s*'), '') // Remove left padding
        .replaceAll(RegExp(r'^\s*'), '') // Remove leading whitespace
        .replaceAll(
            RegExp(r'\n+'), ' ') // Replace multiple newlines with single space
        .trim();

    // If the log is just decorative characters, return a simple message
    if (cleaned.isEmpty || RegExp(r'^[┌└├┤│┄─\s]*$').hasMatch(cleaned)) {
      return 'Log entry processed';
    }

    return cleaned;
  }

  /// Check if a log message is pen-related
  bool _isPenRelatedLog(String message) {
    final penKeywords = [
      'pen',
      'afpensdk',
      'dpenctrl',
      'bluetooth',
      'ble',
      'pen_',
      'penmsg',
      'penup',
      'pendown',
      'penmove',
      'pendisconnect',
      'penconnection',
      'penpower',
      'pen event',
      'pen status',
      'pen connected',
      'pen disconnected',
      'pen failed',
      'pen error',
    ];

    final lowerMessage = message.toLowerCase();
    return penKeywords.any((keyword) => lowerMessage.contains(keyword));
  }

  /// Public method to add logs from external sources (like HTTP interceptor)
  void addLog(String log) {
    _addLog(log);
  }

  /// Write log entry to file
  Future<void> _writeToFile(String logEntry) async {
    try {
      if (_logFilePath != null) {
        final file = File(_logFilePath!);
        await file.writeAsString('$logEntry\n', mode: FileMode.append);
      }
    } catch (e) {
      logger.e('Failed to write log to file: $e');
    }
  }

  /// Start periodic upload of logs
  void _startPeriodicUpload() {
    // Upload every 30 seconds
    _uploadTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      uploadLogsToWebsite();
    });
  }

  /// Upload logs to website
  Future<void> uploadLogsToWebsite() async {
    try {
      if (_logs.isEmpty) {
        logger.d('No logs to upload');
        return;
      }

      logger.i('Starting log upload - ${_logs.length} logs to upload');

      // Format logs as single concatenated string for backend
      final logData = {
        'logs': _logs.join('\n'), // Join all logs into single string
      };

      logger.d('Uploading logs to server: ${_logs.length} log entries');

      // Upload via your existing API infrastructure
      await _uploadToServer(logData);

      // Clear logs after successful upload
      _logs.clear();

      logger.i(
          'Logs uploaded to website successfully - ${_logs.length} logs remaining');
    } catch (e) {
      logger.e('Failed to upload logs: $e');
    }
  }

  /// Upload logs to your server
  Future<void> _uploadToServer(Map<String, dynamic> logData) async {
    try {
      // Use the dedicated log upload service
      final uploadService = LogUploadService();
      final result = await uploadService.uploadLogs(logData: logData);

      result.when(
        success: (success) {
          logger.d('Log upload successful: $success');
        },
        failure: (failure) {
          logger.e('Log upload failed: ${failure.toString()}');
          // Fallback: try platform method if HTTP fails
          _uploadViaPlatform(logData);
        },
      );
    } catch (e) {
      logger.e('Server upload failed: $e');
      // Fallback: try platform method if service fails
      await _uploadViaPlatform(logData);
    }
  }

  /// Fallback platform upload method
  Future<void> _uploadViaPlatform(Map<String, dynamic> logData) async {
    try {
      // Platform upload not available in this simplified version
      logger.d('Platform upload not available, using HTTP upload only');
    } catch (e) {
      logger.e('Platform upload failed: $e');
    }
  }

  /// Get all captured logs
  List<String> getAllLogs() {
    return List.from(_logs);
  }

  /// Get log file path
  String? getLogFilePath() {
    return _logFilePath;
  }

  /// Force upload logs immediately
  Future<void> forceUpload() async {
    logger.i('Force upload requested - ${_logs.length} logs available');
    await uploadLogsToWebsite();
  }

  /// Test upload with sample data
  Future<void> testUpload() async {
    logger.i('Testing upload with sample data');

    // Simple test message
    final simpleTestLog =
        'TEST: Hello from Medikalam app at ${DateTime.now().toIso8601String()}';

    final testLogData = {
      'logs': simpleTestLog,
    };

    logger.d('Test upload data: $testLogData');
    logger.d('Test log content: $simpleTestLog');
    await _uploadToServer(testLogData);
  }

  /// Test upload with different format
  Future<void> testUploadAlternative() async {
    logger.i('Testing alternative upload format');

    // Try sending as array format
    final testLogData = {
      'logs': [
        'TEST_ARRAY: Hello from Medikalam app at ${DateTime.now().toIso8601String()}'
      ],
    };

    logger.d('Alternative test upload data: $testLogData');
    await _uploadToServer(testLogData);
  }

  /// Stop log capture
  void dispose() {
    _uploadTimer?.cancel();
    _logSubscription?.cancel();
    _isInitialized = false;
  }
}
