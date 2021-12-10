import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:webview_flutter/src/webview.dart';

class EditorState {
  WebViewController? controller;
  RxBool showCodeLineNumber = true.obs;
  RxDouble codeFontSize = 13.0.obs;
  late DbCodeMirrorConfig dbCodeMirrorConfig;
  RxString codeTheme = 'material'.obs;
  RxString codeThemeCSS = ''.obs;
  RxList<String> c = RxList();
  RxList<String> codeThemes = [
    "material",
    "material-darker",
    "material-palenight",
    "material-ocean",
    "3024-day",
    "3024-night",
    "abbott",
    "abcdef",
    "ambiance",
    "ayu-dark",
    "ayu-mirage",
    "base16-dark",
    "base16-light",
    "bespin",
    "blackboard",
    "cobalt",
    "colorforth",
    "darcula",
    "dracula",
    "duotone-dark",
    "duotone-light",
    "eclipse",
    "elegant",
    "erlang-dark",
    "gruvbox-dark",
    "hopscotch",
    "icecoder",
    "idea",
    "isotope",
    "juejin",
    "lesser-dark",
    "liquibyte",
    "lucario",
    "mbo",
    "mdn-like",
    "midnight",
    "monokai",
    "moxer",
    "neat",
    "neo",
    "night",
    "nord",
    "oceanic-next",
    "panda-syntax",
    "paraiso-dark",
    "paraiso-light",
    "pastel-on-dark",
    "railscasts",
    "rubyblue",
    "seti",
    "shadowfox",
    "solarized dark",
    "solarized light",
    "the-matrix",
    "tomorrow-night-bright",
    "tomorrow-night-eighties",
    "ttcn",
    "twilight",
    "vibrant-ink",
    "xq-dark",
    "xq-light",
    "yeti",
    "yonce",
    "zenburn",
  ].obs;

  EditorState() {
    ///Initialize variables
  }

  void setWebController(WebViewController webViewController) {
    controller = webViewController;
    initEditorConfig();
  }

  initEditorConfig() async {
    if (boxCodeMirrorConfig.isEmpty) {
      await boxCodeMirrorConfig.put(dbNameCodeMirrorConfig,
          DbCodeMirrorConfig(showCodeLineNumber: false, codeFontSize: 13));
    }
    dbCodeMirrorConfig = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)!;

    showCodeLineNumber.value = dbCodeMirrorConfig.showCodeLineNumber!;
    codeFontSize.value = dbCodeMirrorConfig.codeFontSize!;
    final String optionRawJSCode = '''
      editor.setOption(
        'lineNumbers',${dbCodeMirrorConfig.showCodeLineNumber},
        'theme','${dbCodeMirrorConfig.codeThemeName}',
      );
      document.getElementsByClassName("CodeMirror")[0].style.fontSize = "${dbCodeMirrorConfig.codeFontSize!.toInt()}px"
    ''';
    controller?.runJavascript(optionRawJSCode);
  }

  bool isCurrentCodeTheme(String theme) {
    return theme == codeTheme.value;
  }
}
