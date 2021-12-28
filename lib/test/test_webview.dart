import 'package:flutter/material.dart';
import 'package:processing_compiler/compiler/code_mirror/code_raw.dart';
import 'package:processing_compiler/compiler/code_mirror/css_raw.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class TestWebView extends StatefulWidget {
  const TestWebView({Key? key}) : super(key: key);

  @override
  _TestWebViewState createState() => _TestWebViewState();
}

class _TestWebViewState extends State<TestWebView> {
  String html = '';
  late WebViewController _controller;

  @override
  initState() {
    super.initState();
    load();
  }

  load() {
    CssRaw.cssThemes.add(CssRaw.cssShowHint);
    html = CodeRaw.codeMirrorEditorHtml
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('web view'),
      ),
      body: Container(
        child: html.isEmpty
            ? const Text('loading')
            : WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (String url) {
                  final raw = Uri.encodeComponent(gP5ExampleCode);
                  _controller.runJavascript('''
                      editor.setValue(decodeURIComponent("$raw"));
                      ''');
                },
                onWebResourceError: (WebResourceError error) {},
                onWebViewCreated: (controller) async {
                  controller.loadHtmlString(html);
                  _controller = controller;
                },
              ),
      ),
    );
  }
}
