import 'package:flutter/material.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class PreViewWidget extends StatefulWidget {
  final String? p5LogicCodeRaw;

  const PreViewWidget({Key? key, this.p5LogicCodeRaw}) : super(key: key);

  @override
  State<PreViewWidget> createState() => _PreViewWidgetState();
}

class _PreViewWidgetState extends State<PreViewWidget> {
  late WebViewController? _webViewController;
  bool isLoading = true;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          WebView(
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _webViewController = controller;
              _webViewController?.loadHtmlString(
                  p5PreviewHTML + "<script>${widget.p5LogicCodeRaw!}</script>");
            },
            onWebResourceError: (WebResourceError error) {
              errorMessage = error.description;
            },
            onPageFinished: (String url) {
              isLoading = false;
            },
            javascriptChannels: {
              JavascriptChannel(
                  name: "ErrorMessageInvoker",
                  onMessageReceived: (event) {
                    setState(() {
                      errorMessage = event.message;
                    });
                  })
            },
          ),
          Visibility(
              visible: errorMessage.isNotEmpty,
              child: Text(errorMessage).textColor(Colors.red))
        ],
      ),
    );
  }
}
