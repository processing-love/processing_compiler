import 'dart:io';

import 'package:flutter/material.dart';
import 'package:processing_compiler/compiler/p5.dart';
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

    return LayoutBuilder(builder: (context, dimens) {
      return StatefulBuilder(builder: (context, setState) {
        return WebView(
          debuggingEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
                name: "MessageInvoker",
                onMessageReceived: (event) {
                  print('peter' + event.message);
                })
          },
          onWebViewCreated: (WebViewController controller) {
            controller.loadFlutterAsset('assets/codemirror.html');
            _webViewController = controller;
          },
          onProgress: (int processing) {
            print('peter processing' + processing.toString());
          },
          onPageFinished: (String url) async {
            widget.webViewControllerCreatedCallback?.call(_webViewController);
            await _webViewController.runJavascript(
                'editor.setSize(${dimens.maxWidth},${dimens.maxHeight})');
            await _webViewController.runJavascript('editor.refresh()');
            final raw = Uri.encodeComponent(javascriptRawCode);
            await _webViewController
                .runJavascript('editor.setValue(decodeURIComponent("$raw"))');
          },
        );
      });
    });
  }
}
