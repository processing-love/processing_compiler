import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/core.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/editor_setting/view.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'logic.dart';

class EditorPage extends StatelessWidget {
  final logic = Get.find<EditorLogic>();
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
            icon: const Icon(Icons.settings_rounded))
      ],
      body: CodeMirrorWebView(
          rawCode: gCodeMirrorHtmlEditor,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          onWebViewFinishCreated: (controller) {
            logic.state.setWebController(controller);
            logic.initCodeMirror();
          },
          jsCallName: "MessageInvoker",
          webViewJSCallback: (event) {
            logic.autoSaveCode(event.message);
          }),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          _run();
        },
        child: const Icon(
          Icons.play_arrow_rounded,
        ),
      ),
    );
  }

  _run() async {
    final String result = await state.buildPreviewCode();
    if (state.isFullScreen.isTrue) {
      Get.to(CodeMirrorWebView(rawCode: result, isClose: true), fullscreenDialog: true, popGesture: true, transition: Transition.downToUp);
    } else {
      Get.bottomSheet(
        CodeMirrorWebView(
          rawCode: result,
        ),
        enableDrag: false,
      );
    }
  }
}
