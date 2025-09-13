import 'package:dio/dio.dart';
import 'package:Medikalam/src/core/utils/helpers/console_log_capture.dart';

/// Custom Dio interceptor that captures HTTP logs and sends them to console log capture
class HttpLogCaptureInterceptor extends Interceptor {
  final ConsoleLogCapture _logCapture = ConsoleLogCapture();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Capture request logs
    final requestLog = _formatRequestLog(options);
    _logCapture.addLog(requestLog);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Capture response logs
    final responseLog = _formatResponseLog(response);
    _logCapture.addLog(responseLog);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Capture error logs
    final errorLog = _formatErrorLog(err);
    _logCapture.addLog(errorLog);

    super.onError(err, handler);
  }

  String _formatRequestLog(RequestOptions options) {
    final buffer = StringBuffer();

    buffer.writeln('╔╣ Request ║ ${options.method}');
    buffer.writeln('║  ${options.uri}');
    buffer.writeln(
        '╚══════════════════════════════════════════════════════════════════════════════════════════╝');

    if (options.headers.isNotEmpty) {
      buffer.writeln('╔ Headers');
      options.headers.forEach((key, value) {
        buffer.writeln('╟ $key: $value');
      });
      buffer.writeln(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }

    if (options.data != null) {
      buffer.writeln('╔ Body');
      buffer.writeln('╟ ${options.data}');
      buffer.writeln(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }

    return buffer.toString();
  }

  String _formatResponseLog(Response response) {
    final buffer = StringBuffer();

    buffer.writeln('');
    buffer.writeln(
        '╔╣ Response ║ ${response.requestOptions.method} ║ Status: ${response.statusCode} ${_getStatusText(response.statusCode)} ║ Time: ${response.extra['ms'] ?? 'N/A'} ms');
    buffer.writeln('║  ${response.requestOptions.uri}');
    buffer.writeln(
        '╚══════════════════════════════════════════════════════════════════════════════════════════╝');

    if (response.headers.map.isNotEmpty) {
      buffer.writeln('╔ Headers');
      response.headers.forEach((name, values) {
        buffer.writeln('╟ $name: $values');
      });
      buffer.writeln(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }

    if (response.data != null) {
      buffer.writeln('╔ Body');
      buffer.writeln('║');
      buffer.writeln('║    ${response.data}');
      buffer.writeln('║');
      buffer.writeln(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }

    return buffer.toString();
  }

  String _formatErrorLog(DioException err) {
    final buffer = StringBuffer();

    buffer.writeln('');
    buffer.writeln(
        '╔╣ Error ║ ${err.requestOptions.method} ║ Status: ${err.response?.statusCode ?? 'Network Error'}');
    buffer.writeln('║  ${err.requestOptions.uri}');
    buffer.writeln(
        '╚══════════════════════════════════════════════════════════════════════════════════════════╝');

    if (err.response?.data != null) {
      buffer.writeln('╔ Error Body');
      buffer.writeln('║');
      buffer.writeln('║    ${err.response?.data}');
      buffer.writeln('║');
      buffer.writeln(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }

    return buffer.toString();
  }

  String _getStatusText(int? statusCode) {
    switch (statusCode) {
      case 200:
        return 'OK';
      case 201:
        return 'Created';
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Unknown';
    }
  }
}
