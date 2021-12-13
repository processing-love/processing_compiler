import 'package:get/get.dart';
import 'package:processing_compiler/theme/theme_config.dart';
import 'state.dart';

class EditorLogic extends GetxController {
  final EditorState state = EditorState();


  void setShowCodeLineNumber(bool isSelect) {
    state.showCodeLineNumber.value = isSelect;
    state.dbCodeMirrorConfig.showCodeLineNumber = isSelect;
    state.dbCodeMirrorConfig.save();
    state.controller?.runJavascript('''
    editor.setOption("lineNumbers",$isSelect);
    ''');
  }

  void setCodeLineNumber(double? fontSize) {
    state.codeFontSize.value = fontSize ?? 13;
    state.dbCodeMirrorConfig.codeFontSize = state.codeFontSize.value;
    state.dbCodeMirrorConfig.save();
    state.controller?.runJavascript('''
    document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${fontSize}px"
    ''');
  }

  void setCodeTheme(String codeTheme) {
    state.codeThemeName.value = codeTheme;
    state.dbCodeMirrorConfig.codeThemeName = codeTheme;
    state.dbCodeMirrorConfig.save();
    state.controller?.runJavascript('''
    editor.setOption('theme','$codeTheme');
    ''');
    ThemeConfig().setTheme();
  }
}
