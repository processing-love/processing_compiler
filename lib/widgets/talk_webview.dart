import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class TalkWebView extends StatefulWidget {
  final String? rawCode;
  final WebViewCreatedCallback? onWebViewFinishCreated;
  final String? htmlPath;
  final String? url;
  final String? title;
  final Map<String, String>? replaceMap;

  const TalkWebView(
      {this.rawCode,
      this.onWebViewFinishCreated,
      this.htmlPath,
      this.replaceMap,
      this.url,
      this.title,
      Key? key})
      : super(key: key);

  @override
  _TalkWebViewState createState() => _TalkWebViewState();
}

class _TalkWebViewState extends State<TalkWebView> {
  bool isLoading = true;
  String showTip = 'loading'.tr;
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Processing"),
      ),
      body: Stack(
        children: [
          WebView(
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String url) {
              isLoading = false;
              setState(() {});
              widget.onWebViewFinishCreated?.call(webViewController!);
            },
            onWebViewCreated: (WebViewController controller) async {
              final String result = widget.rawCode ?? "";
              final url = widget.url ?? "";
              if (url.isNotEmpty) {
                controller.loadUrl(url);
              }
              if (result.isNotEmpty) {
                controller.loadHtmlString(widget.rawCode!);
              }
              final String resultFileHtml = widget.htmlPath ?? "";
              if (resultFileHtml.isNotEmpty) {
                var result = await rootBundle.loadString(resultFileHtml);
                widget.replaceMap?.forEach((from, replace) {
                  result = result.replaceAll(from, replace);
                });
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
      ),
    );
  }
}
