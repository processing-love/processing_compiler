import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/core.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/editor_setting/view.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:webview_flutter/platform_interface.dart';

import 'logic.dart';

class EditorPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;
  final DbProjectFile projectFile;

  EditorPage({Key? key, required this.projectFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logic.initExternalParameter(projectFile);
    return BasePage(
      title: projectFile.name,
      actions: [
        IconButton(
            onPressed: () {
              Get.to(EditorSettingPage());
            },
            icon: const Icon(Icons.settings))
      ],
      body: CodeMirrorWebView(
        rawCode: gCodeMirrorHtmlEditor,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        onWebViewFinishCreated: (controller) {
          logic.state.setWebController(controller);
          logic.initCodeMirror();
        },
        javascriptChannel: {
          JavascriptChannel(
              name: "MessageInvoker",
              onMessageReceived: (event) {
                logic.autoSaveCode(event.message);
              })
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _run();
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }

  _run() async {
    final String result = await state.buildPreviewCode();
    Get.bottomSheet(
      CodeMirrorWebView(
        rawCode: result,
      ),
      enableDrag: false,
    );
  }
}
