import 'package:flutter/material.dart';
import 'package:processing_compiler/compiler/code_mirror/code_raw.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'html.dart';

/// @author u
/// @date 2020/6/12.
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: TestWebView(),
    ),
  ));
}

class TestWebView extends StatefulWidget {
  const TestWebView({Key? key}) : super(key: key);

  @override
  _TestWebViewState createState() => _TestWebViewState();
}

class _TestWebViewState extends State<TestWebView> {
  String html = '';

  @override
  initState() {
    super.initState();
    load();
  }

  load() {
    html = gP5HtmlWeb.replaceAll('<-script->', CodeRaw.jsJavaScriptP5Hint);
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
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onWebViewCreated: (controller) async {
                  controller.loadHtmlString(html);
                },
              ),
      ),
    );
  }
}
