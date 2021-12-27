
import 'package:processing_compiler/compiler/code_mirror/code_raw.dart';
import 'package:processing_compiler/compiler/code_mirror/css_raw.dart';

/// @author u
/// @date 2020/6/12.

String gCodeMirrorHtmlEditor = getCodeMirrorHtmlCore();

String getCodeMirrorHtmlCore() {
  CssRaw.cssThemes.add(CssRaw.cssShowHint);
  return CodeRaw.codeMirrorEditorHtml
      .replaceAll(
          '<x-javascript-x>',
          CodeRaw.jsCodeMirror +
              CodeRaw.jsJavascript +
              CodeRaw.jsActiveLine +
              CodeRaw.jsMatchBrackets +
              CodeRaw.jsCloseTag +
              CodeRaw.jsShowHint +
              CodeRaw.jsJavaScriptHint)
      .replaceAll('<x-link-x>', CssRaw.cssThemes.map((e) => e.raw).join(' '));
}
