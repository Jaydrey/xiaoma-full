import 'package:flutter/foundation.dart';

class AppLogger {
  static debugPrint(String value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
