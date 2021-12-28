import 'package:processing_compiler/compiler/code_mirror/code_raw.dart';
import 'package:processing_compiler/compiler/code_mirror/css_raw.dart';

/// @author u
/// @date 2020/6/12.

String gCodeMirrorHtmlEditor = getCodeMirrorHtmlCore();

String getCodeMirrorHtmlCore() {
  final result = List.from(CssRaw.cssThemes);
  result.add(CssRaw.cssShowHint);
  return CodeRaw.codeMirrorEditorHtml
      .replaceAll('<x-link-x>', result.map((e) => e.raw).join(' '))
      .replaceAll(
          '<x-javascript-x>',
          CodeRaw.jsCodeMirror +
              CodeRaw.jsJavascript +
              CodeRaw.jsLike +
              CodeRaw.jsActiveLine +
              CodeRaw.jsMatchBrackets +
              CodeRaw.jsCloseBrackets +
              CodeRaw.jsCloseTag +
              CodeRaw.jsShowHint +
              CodeRaw.jsJavaScriptHint);
}
