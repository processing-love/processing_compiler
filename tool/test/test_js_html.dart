import 'dart:io';

import 'package:processing_compiler/compiler/core.dart';

/// @author u
/// @date 2020/6/12.
void main() {
  File file = File('./test/test_code_mirror.html');
  if (file.existsSync()) {
    file.deleteSync();
  }
  file.createSync();
  file.writeAsStringSync(gCodeMirrorHtmlEditor);
}