
import 'package:flutter/foundation.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;

  // ignore: use_setters_to_change_properties
  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      if (kDebugMode) {
        print('$data');
      }
    }
  }
}

enum LogMode { debug, live }
