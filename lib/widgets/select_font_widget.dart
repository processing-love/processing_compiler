import 'package:flutter/material.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class SelectFontWidget extends StatefulWidget {
  const SelectFontWidget({Key? key}) : super(key: key);

  @override
  State<SelectFontWidget> createState() => _SelectFontWidgetState();
}

class _SelectFontWidgetState extends State<SelectFontWidget> {
  late final WebViewController? _webViewController;
  double fontSize = 13;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CodeMirrorWebView(
          htmlPath: 'assets/code_mirror_config.html',
          fromValue: "xx",
          replaceValue: CSS().getCSS().name,
          onWebViewCreated: (controller) {
            _webViewController = controller;
            controller.runJavascript('''
          editor.setValue(decodeURIComponent("${Uri.encodeComponent(gP5ExampleFontCode)}"));
          editor.setOption('theme','${CSS().getCSS().name}');
          editor.refresh();
          ''');
          },
        ),
        Slider(
          value: fontSize,
          min: 13,
          max: 20,
          onChanged: (double value) {
            fontSize = value;
          },
        )
      ],
    );
  }
}
