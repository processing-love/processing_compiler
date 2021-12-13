import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:webview_flutter/src/webview.dart';

class EditorState {
  WebViewController? controller;
  RxBool showCodeLineNumber = true.obs;
  RxDouble codeFontSize = 13.0.obs;
  late DbCodeMirrorConfig dbCodeMirrorConfig;
  RxString codeThemeName = 'material'.obs;

  CSS css = CSS();

  EditorState() {
    ///Initialize variables
  }

  void setWebController(WebViewController webViewController) {
    controller = webViewController;
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
    final String optionRawJSCode = '''
      editor.setOption(
        'lineNumbers',${dbCodeMirrorConfig.showCodeLineNumber},
        'theme','${dbCodeMirrorConfig.codeThemeName}',
      );
      document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${dbCodeMirrorConfig.codeFontSize.toInt()}px"
    ''';
    controller?.runJavascript(optionRawJSCode);
  }

  Widget getTrailingWidget() {
    String themeValue =
        boxCodeMirrorTheme.get(codeThemeName.value, defaultValue: '');
    if (themeValue.isNotEmpty) {
      return const Icon(Icons.keyboard_arrow_right);
    }

    return SizedBox.square(
        dimension: Get.theme.iconTheme.size ?? 22 - 6,
        child: const CircularProgressIndicator(strokeWidth: 2,)).marginOnly(left: 8);
  }

  Widget? getTrailingItemWidget(String theme) {
    return codeThemeName.value == theme ? const Icon(Icons.done) : null;
  }
}
