import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/code_editor.dart';
import 'package:processing_compiler/preview_widget.dart';
import 'package:processing_compiler/setting/view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'logic.dart';

class EditorPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;
  final String? title;

  EditorPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SettingPage());
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: CodeEditor(
        webViewControllerCreatedCallback:
            (WebViewController webViewController) {
          state.setWebController(webViewController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _run();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _run() async {
    final String p5LogicCodeRaw = await state.controller!
        .runJavascriptReturningResult('editor.getValue()');
    Get.bottomSheet(PreViewWidget(
      p5LogicCodeRaw: p5LogicCodeRaw,),
        enableDrag: false);
  }
}
