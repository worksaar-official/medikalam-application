// Package imports:
import 'package:logger/logger.dart';

final logger = Logger(
  printer: SimplePrinter(),
  filter: EnableLogging(),
);

class EnableLogging extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
