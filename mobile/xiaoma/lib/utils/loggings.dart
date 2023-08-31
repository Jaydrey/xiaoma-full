import 'package:flutter/foundation.dart';

class XiamaLogger {
  static debugPrint(String value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
