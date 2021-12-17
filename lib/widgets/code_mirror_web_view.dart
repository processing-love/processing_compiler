import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class CodeMirrorWebView extends StatefulWidget {
  final String? rawCode;
  final WebViewCreatedCallback? onWebViewCreated;
  final String? htmlPath;
  final String? replaceValue;
  final String? fromValue;

  const CodeMirrorWebView(
      {this.rawCode,
      this.onWebViewCreated,
      this.htmlPath,
      this.replaceValue,
      this.fromValue,
      Key? key})
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
          onWebViewCreated: (WebViewController controller) async {
            final String result = widget.rawCode ?? "";
            if (result.isNotEmpty) {
              controller.loadHtmlString(widget.rawCode!);
            }
            final String resultFileHtml = widget.htmlPath ?? "";
            if (resultFileHtml.isNotEmpty) {
              var result = await rootBundle.loadString(resultFileHtml);
              result = result.replaceAll(
                  widget.fromValue ?? "", widget.replaceValue ?? "");
              controller.loadHtmlString(result);
            }
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
