import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/setting/view.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';

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
              Get.to(SettingPage());
            },
            icon: const Icon(Icons.settings))
      ],
      body: CodeMirrorWebView(
        htmlPath: projectFile.htmlTemplate,
        onWebViewFinishCreated: (controller) {
          logic.state.setWebController(controller);
          logic.initCodeMirror();
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
    final state = Get.find<EditorLogic>().state;
    final String? p5LogicCodeRaw = await state.controller
        ?.runJavascriptReturningResult('editor.getValue()');
    final result = p5PreviewHTML.replaceAll('<-js->', p5LogicCodeRaw!);
    Get.bottomSheet(
        CodeMirrorWebView(
          rawCode: result,
        ),
        enableDrag: false,
        barrierColor: Colors.black38);
  }
}
