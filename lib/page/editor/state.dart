import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/compiler/processing_js.dart';
import 'package:processing_compiler/compiler/processing_py.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_code_mirror_config.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EditorState {
  WebViewController? controller;
  WebViewController? settingController;
  RxBool showCodeLineNumber = true.obs;
  RxDouble codeFontSize = 13.0.obs;
  late DbCodeMirrorConfig dbCodeMirrorConfig;
  RxString codeThemeName = 'material'.obs;
  final rawCode = ''.obs;
  String nameKey = '';
  ProjectType projectType = ProjectType.p5js;
  late DbProjectFile currentProjectFile;

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
    return codeThemeName.value == theme ? const Icon(Icons.done_rounded) : null;
  }

  Future<String> buildPreviewCode() async {
    final String? code = await controller?.runJavascriptReturningResult('editor.getValue();');
    return ProjectTypeHelper.getFullHtml(currentProjectFile.projectType, code ?? '');
  }

  String buildCodeMirrorConfigCode() {
    final projectType =
        ProjectTypeHelper.getValue(currentProjectFile.projectType);
    switch (projectType) {
      case ProjectType.processing:
        return gCodeMirrorConfigProcessingCode;
      case ProjectType.p5js:
        return gCodeMirrorConfigP5Code;
      case ProjectType.py:
        return gCodeMirrorConfigPythonCode;
      default:
        return gCodeMirrorConfigProcessingCode;
    }
  }
}
