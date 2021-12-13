import 'package:flutter/foundation.dart';

/// @author u
/// @date 2020/6/12.
class LogUtils {

  static log(String message,[LogType type = LogType.net]) {

    if (type == LogType.normal) {
      if (kDebugMode) {
        print('peter normal -> ' + message);
      }
    } else if (type == LogType.net) {
      if (kDebugMode) {
        print('peter net -> ' + message);
      }
    }
  }
}


enum LogType {
  net, normal
}

