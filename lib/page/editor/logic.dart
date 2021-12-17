import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';

import 'state.dart';

class EditorLogic extends GetxController {
  final EditorState state = EditorState();

  void setShowCodeLineNumber(bool isSelect) {
    state.showCodeLineNumber.value = isSelect;
    state.dbCodeMirrorConfig.showCodeLineNumber = isSelect;
    state.dbCodeMirrorConfig.save();
    final String result = '''
    editor.setOption("lineNumbers",$isSelect);
    ''';
    state.controller?.runJavascript(result);
    state.settingController?.runJavascript(result);
  }

  void setCodeFontSize(double? fontSize) {
    state.codeFontSize.value = fontSize ?? 13;
    state.dbCodeMirrorConfig.codeFontSize = state.codeFontSize.value;
    state.dbCodeMirrorConfig.save();
    final String result = '''
    document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${fontSize}px"
    ''';
    state.controller?.runJavascript(result);
    state.settingController?.runJavascript(result);
  }

  void setCodeTheme(String codeTheme) {
    state.codeThemeName.value = codeTheme;
    state.dbCodeMirrorConfig.codeThemeName = codeTheme;
    state.dbCodeMirrorConfig.save();
    final String result = '''
    editor.setOption('theme','$codeTheme');
    ''';
    state.controller?.runJavascript(result);
    state.settingController?.runJavascript(result);
  }

  loadSource() async {
    final String codeMirrorHtml =
        await rootBundle.loadString('assets/code_mirror.html');
    state.rawCode.value = codeMirrorHtml;
  }

  initCodeMirror() {
    final raw = Uri.encodeComponent(gP5ExampleCode);
    state.controller?.runJavascript('''
        editor.setSize(${Get.width},${Get.height});
        editor.setValue(decodeURIComponent("$raw"));
        ''');
  }

  @override
  void onInit() {
    super.onInit();
    loadSource();
  }
}
