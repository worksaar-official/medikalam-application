/// Constants for log upload endpoints
class LogEndpoints {
  LogEndpoints._();

  /// Base URL for Medikalam backend
  static const String baseUrl = 'https://medikalam-backend.onrender.com';
  
  /// Log upload endpoint (using your existing mobile API)
  static const String uploadLogs = '$baseUrl/mobile';
  
  /// Log file upload endpoint (using your existing mobile API)
  static const String uploadLogFile = '$baseUrl/mobile';
  
  /// Batch log upload endpoint (using your existing mobile API)
  static const String uploadBatchLogs = '$baseUrl/mobile';
  
  /// Health check endpoint (GET request to mobile API with day parameter)
  static const String healthCheck = '$baseUrl/mobile?day=2025-09-12';
  
  /// Alternative endpoints for different log types
  static const String alternativeUpload = '$baseUrl/mobile';
  static const String alternativeFileUpload = '$baseUrl/mobile';
}

/// Configuration for log upload settings
class LogConfig {
  LogConfig._();

  /// Upload interval in seconds
  static const int uploadIntervalSeconds = 30;
  
  /// Maximum logs to keep in memory
  static const int maxLogsInMemory = 1000;
  
  /// Maximum log file size in MB
  static const int maxLogFileSizeMB = 10;
  
  /// Enable automatic upload
  static const bool enableAutoUpload = true;
  
  /// Enable log file creation
  static const bool enableLogFile = true;
  
  /// Enable platform-specific log capture
  static const bool enablePlatformLogs = true;
  
  /// Enable Flutter log capture
  static const bool enableFlutterLogs = true;
}
