# Console Log Capture and Upload System

This system automatically captures all console output (debug prints, logs, errors) from your Flutter app and uploads it to your website, regardless of whether it's running on Android or iOS.

## Features

✅ **Automatic Log Capture**
- Captures all `debugPrint()`, `print()`, `stdout`, `stderr` output
- Captures platform-specific logs (Android logcat, iOS system logs)
- Captures Flutter framework logs
- Captures custom logger output

✅ **Cross-Platform Support**
- Works on both Android and iOS
- Platform-specific native implementations
- Unified Flutter interface

✅ **Automatic Upload**
- Uploads logs every 30 seconds (configurable)
- Uploads to your website via HTTP API
- Fallback mechanisms for failed uploads
- File-based log storage as backup

✅ **Multiple Upload Methods**
- Direct JSON upload
- File attachment upload
- Batch upload for multiple log entries
- Health check endpoint testing

## Setup Instructions

### 1. Configure Your Website Endpoint

Edit `lib/src/core/utils/constants/log_endpoints.dart`:

```dart
class LogEndpoints {
  // Replace with your actual website URL
  static const String baseUrl = 'https://your-website.com';
  
  // Your API endpoints
  static const String uploadLogs = '$baseUrl/api/logs';
  static const String uploadLogFile = '$baseUrl/api/logs/file';
  static const String uploadBatchLogs = '$baseUrl/api/logs/batch';
  static const String healthCheck = '$baseUrl/api/health';
}
```

### 2. Your Website API Endpoints

Your website should have these endpoints to receive logs:

#### POST `/api/logs`
```json
{
  "timestamp": "2024-01-15T10:30:00.000Z",
  "platform": "android",
  "logs": "Log content here...",
  "device_info": {
    "platform": "android",
    "version": "API 33"
  }
}
```

#### POST `/api/logs/file`
Multipart form data with:
- `logFile`: The log file
- `metadata`: JSON metadata
- `platform`: Platform name
- `timestamp`: Upload timestamp

#### GET `/api/health`
Simple health check endpoint that returns 200 OK.

### 3. Test the System

Use the test widget to verify everything works:

```dart
// Navigate to the test widget
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const LogTestWidget(),
  ),
);
```

## How It Works

### Flutter Side
1. **Initialization**: `ConsoleLogCapture().initialize()` is called in `main.dart`
2. **Log Capture**: Overrides `debugPrint`, captures stdout/stderr, sets up platform channels
3. **Storage**: Logs are stored in memory and written to a file
4. **Upload**: Automatic upload every 30 seconds using `LogUploadService`

### Android Side
- `ConsoleLogCapturePlugin.java` captures logcat output
- Filters logs for your app (`com.medikalam`)
- Sends logs to Flutter via method channels

### iOS Side
- `ConsoleLogCapturePlugin.swift` captures system logs
- Overrides NSLog and captures os_log
- Sends logs to Flutter via method channels

## Configuration

### Upload Settings
Edit `lib/src/core/utils/constants/log_endpoints.dart`:

```dart
class LogConfig {
  static const int uploadIntervalSeconds = 30;  // Upload every 30 seconds
  static const int maxLogsInMemory = 1000;      // Keep 1000 logs in memory
  static const int maxLogFileSizeMB = 10;       // Max file size
  static const bool enableAutoUpload = true;    // Enable automatic upload
}
```

### Log Levels
The system captures all log levels:
- `logger.i()` - Info logs
- `logger.d()` - Debug logs  
- `logger.w()` - Warning logs
- `logger.e()` - Error logs
- `debugPrint()` - Debug prints
- `print()` - Standard prints

## Usage Examples

### Manual Log Upload
```dart
final logCapture = ConsoleLogCapture();
await logCapture.forceUpload();
```

### Test Connection
```dart
final uploadService = LogUploadService();
final result = await uploadService.testConnection();
result.when(
  success: (success) => print('Connection OK'),
  failure: (failure) => print('Connection failed: $failure'),
);
```

### Upload Specific Log Data
```dart
final uploadService = LogUploadService();
final result = await uploadService.uploadLogs(
  logData: {
    'timestamp': DateTime.now().toIso8601String(),
    'platform': Platform.operatingSystem,
    'logs': 'Custom log data here',
  },
);
```

## Troubleshooting

### Logs Not Being Captured
1. Check if `ConsoleLogCapture().initialize()` is called in `main.dart`
2. Verify platform plugins are registered in `MainActivity.java` and `AppDelegate.swift`
3. Check if logs are being generated (use the test widget)

### Upload Failures
1. Verify your website endpoint URLs in `log_endpoints.dart`
2. Check network connectivity
3. Test connection using the test widget
4. Check website API endpoints are working

### Platform-Specific Issues

#### Android
- Ensure `ConsoleLogCapturePlugin.registerWith(this)` is called in `MainActivity.java`
- Check logcat permissions in `AndroidManifest.xml`

#### iOS
- Ensure `ConsoleLogCapturePlugin.register(with: self)` is called in `AppDelegate.swift`
- Check console access permissions

## Security Considerations

- Logs may contain sensitive information - filter as needed
- Use HTTPS for log uploads
- Consider log retention policies on your website
- Implement rate limiting on your API endpoints

## Performance Impact

- Minimal memory usage (max 1000 logs in memory)
- Automatic cleanup after upload
- Background processing for uploads
- Configurable upload intervals

## File Locations

- **Flutter**: `lib/src/core/utils/helpers/console_log_capture.dart`
- **Android**: `android/app/src/main/java/com/medikalam/app/medikalam/ConsoleLogCapturePlugin.java`
- **iOS**: `ios/Runner/ConsoleLogCapturePlugin.swift`
- **Test Widget**: `lib/src/views/widgets/log_test_widget.dart`
- **Upload Service**: `lib/src/core/utils/helpers/log_upload_service.dart`
- **Configuration**: `lib/src/core/utils/constants/log_endpoints.dart`

## Support

If you encounter issues:
1. Check the test widget for diagnostic information
2. Verify all setup steps are completed
3. Test with the provided example endpoints
4. Check console output for error messages

The system is designed to be robust with multiple fallback mechanisms, so it should work reliably once properly configured.
