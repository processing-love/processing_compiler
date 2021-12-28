import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/compiler/processing_js.dart';
import 'package:processing_compiler/db/db_project_file.dart';

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

  initExternalParameter(DbProjectFile projectFile) {
    state.currentProjectFile = projectFile;
  }

  initCodeMirror() {
    final raw = Uri.encodeComponent(state.currentProjectFile.code);
    state.controller?.runJavascript('''
        editor.setSize(${Get.width},${Get.height});
        editor.setOption('mode','${buildCodeMirrorMode()}',);
        editor.setValue(decodeURIComponent("$raw"));
        ''');
  }

  String buildCodeMirrorMode() {
    return ProjectTypeHelper.getMode(state.currentProjectFile.projectType);
  }

  void autoSaveCode(String code) {
    state.currentProjectFile.code = code;
    state.currentProjectFile.save();
  }

  Future<String> buildPreviewCode() async {
    final String? code = await state.controller?.runJavascriptReturningResult('editor.getValue();');
    final projectType =
        ProjectTypeHelper.getValue(state.currentProjectFile.projectType);
    switch (projectType) {
      case ProjectType.processing:
        return gGetProcessingJsPreviewHtml(code ?? "");
      case ProjectType.p5js:
        return gGetP5PreviewHtml(code ?? "");
      case ProjectType.py:
        return gGetProcessingJsPreviewHtml(code ?? "");
      default:
        return gGetProcessingJsPreviewHtml(code ?? "");
    }
  }
}
