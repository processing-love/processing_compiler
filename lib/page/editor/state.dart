import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:webview_flutter/src/webview.dart';

class EditorState {
  WebViewController? controller;
  WebViewController? settingController;
  RxBool showCodeLineNumber = true.obs;
  RxDouble codeFontSize = 13.0.obs;
  late DbCodeMirrorConfig dbCodeMirrorConfig;
  RxString codeThemeName = 'material'.obs;
  final theme = CSSTheme.material().obs;
  final rawCode = ''.obs;

  CSS css = CSS();

  EditorState() {
    ///Initialize variables
  }

  setWebController(WebViewController webViewController) {
    controller = webViewController;
    initEditorConfig();
  }

  setSettingWebController(WebViewController webViewController) {
    settingController = webViewController;
    initEditorConfig();
  }

  initEditorConfig() async {
    if (boxCodeMirrorConfig.isEmpty) {
      await boxCodeMirrorConfig.put(
          dbNameCodeMirrorConfig,
          DbCodeMirrorConfig(
            showCodeLineNumber: false,
            codeFontSize: 13,
          ));
    }
    dbCodeMirrorConfig = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)!;

    showCodeLineNumber.value = dbCodeMirrorConfig.showCodeLineNumber;
    codeFontSize.value = dbCodeMirrorConfig.codeFontSize;
    codeThemeName.value = dbCodeMirrorConfig.codeThemeName;
    final String result = '''
      editor.setOption('lineNumbers',${dbCodeMirrorConfig.showCodeLineNumber});
      editor.setOption('theme','${dbCodeMirrorConfig.codeThemeName}');
      document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${dbCodeMirrorConfig.codeFontSize.toInt()}px"
    ''';
    controller?.runJavascript(result);
    settingController?.runJavascript(result);
  }

  Widget? getTrailingItemWidget(String theme) {
    return codeThemeName.value == theme ? const Icon(Icons.done) : null;
  }
}
