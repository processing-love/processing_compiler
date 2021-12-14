import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:processing_compiler/lib/link_css_js.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef WebViewControllerCreatedCallback = Function(
    WebViewController webViewController);

/// @author u
/// @date 2020/6/12.
class CodeEditor extends StatefulWidget {
  final WebViewControllerCreatedCallback? webViewControllerCreatedCallback;

  const CodeEditor({Key? key, required this.webViewControllerCreatedCallback})
      : super(key: key);

  @override
  State<CodeEditor> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditor> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    return FutureBuilder<String>(
      future: rootBundle.loadString('assets/code_mirror.html'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return WebView(
          debuggingEnabled: true,
          initialUrl: getHtml(snapshot.data ?? ""),
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
                name: "MessageInvoker",
                onMessageReceived: (event) {
                  print('peter' + event.message);
                })
          },
          onWebViewCreated: (WebViewController controller) {
            _webViewController = controller;
          },
          onProgress: (int processing) {
            print('peter processing' + processing.toString());
          },
          onPageFinished: (String url) async {
            widget.webViewControllerCreatedCallback?.call(_webViewController);
            await _webViewController
                .runJavascript('editor.setSize(${Get.width},${Get.height})');
            final raw = Uri.encodeComponent(javascriptRawCode);
            await _webViewController
                .runJavascript('editor.setValue(decodeURIComponent("$raw"))');
            await _webViewController.runJavascript('editor.refresh()');
          },
        );
      },
    );
  }

  String getHtml(String raw) {
    String _html = raw.replaceAll("<x_css_x>", CSS().getCSS().rawCode);
    _html = _html.replaceAll("<x_js_x>", LinkCSSJS.codeMirrorJSConfig);
    return Uri.dataFromString(_html, mimeType: 'text/html').toString();
  }
}
