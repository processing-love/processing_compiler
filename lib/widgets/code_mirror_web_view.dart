import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class CodeMirrorWebView extends StatefulWidget {
  final String rawCode;
  final WebViewCreatedCallback? onWebViewCreated;

  const CodeMirrorWebView(
      {required this.rawCode, this.onWebViewCreated, Key? key})
      : super(key: key);

  @override
  _CodeMirrorWebViewState createState() => _CodeMirrorWebViewState();
}

class _CodeMirrorWebViewState extends State<CodeMirrorWebView> {
  bool isLoading = true;
  String showTip = 'loading'.tr;
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          debuggingEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String url) {
            isLoading = false;
            setState(() {});
            widget.onWebViewCreated?.call(webViewController!);
          },
          onWebViewCreated: (WebViewController controller) {
            print('peter html ' + widget.rawCode);
            controller.loadHtmlString(widget.rawCode);
            webViewController = controller;
          },
          onWebResourceError: (WebResourceError error) {
            showTip = error.description;
            isLoading = false;
            setState(() {});
          },
        ),
        Visibility(visible: isLoading, child: const LoadingWidget()).center()
      ],
    );
  }
}
