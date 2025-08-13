// Package imports:
import 'package:logger/logger.dart';

final logger = Logger(printer: PrettyPrinter(), filter: EnableLogging());

class EnableLogging extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
