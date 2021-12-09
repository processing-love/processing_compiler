import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:webview_flutter/src/webview.dart';

class EditorState {
  WebViewController? controller;
  RxBool showCodeLineNumber = true.obs;
  RxDouble codeFontSize = 13.0.obs;
  late DbCodeMirrorConfig dbCodeMirrorConfig;

  EditorState() {
    ///Initialize variables
  }

  void setWebController(WebViewController webViewController) {
    controller = webViewController;
    initEditorConfig();
  }

  initEditorConfig() async {
    if (boxCodeMirrorConfig.isEmpty) {
      await boxCodeMirrorConfig.put(dbNameCodeMirrorConfig,
          DbCodeMirrorConfig(showCodeLineNumber: false, codeFontSize: 13));
    }
    dbCodeMirrorConfig = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)!;

    showCodeLineNumber.value = dbCodeMirrorConfig.showCodeLineNumber!;
    codeFontSize.value = dbCodeMirrorConfig.codeFontSize!;
    final String optionRawJSCode = '''
      editor.setOption("lineNumbers",${dbCodeMirrorConfig.showCodeLineNumber});
      document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${dbCodeMirrorConfig.codeFontSize!.toInt()}px"
    ''';
    controller?.runJavascript(optionRawJSCode);
  }
}
