import 'package:get/get.dart';
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
    state.controller?.runJavaScript(result);
    state.settingController?.runJavaScript(result);
  }

  void setFullScreen(bool isFullScreen) {
    state.isFullScreen.value = isFullScreen;
    state.dbCodeMirrorConfig.isFullScreen = isFullScreen;
    state.dbCodeMirrorConfig.save();
  }

  void setCodeFontSize(double? fontSize) {
    state.codeFontSize.value = fontSize ?? 13;
    state.dbCodeMirrorConfig.codeFontSize = state.codeFontSize.value;
    state.dbCodeMirrorConfig.save();
    final String result = '''
    document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${fontSize}px"
    ''';
    state.controller?.runJavaScript(result);
    state.settingController?.runJavaScript(result);
  }

  void setCodeTheme(String codeTheme) {
    state.codeThemeName.value = codeTheme;
    state.dbCodeMirrorConfig.codeThemeName = codeTheme;
    state.dbCodeMirrorConfig.save();
    final String result = '''
    editor.setOption('theme','$codeTheme');
    ''';
    state.controller?.runJavaScript(result);
    state.settingController?.runJavaScript(result);
  }

  initExternalParameter(DbProjectFile projectFile) {
    state.currentProjectFile = projectFile;
  }

  initCodeMirror() {
    final raw = Uri.encodeComponent(state.currentProjectFile.code);
    state.controller?.runJavaScript('''
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
}
