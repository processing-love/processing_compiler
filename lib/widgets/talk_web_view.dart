import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'code_mirror_web_view.dart';

/// @author u
/// @date 2020/6/12.
class TalkWebView extends StatefulWidget {
  final String? rawCode;
  final WebViewCreatedCallback? onWebViewFinishCreated;
  final String? htmlPath;
  final String? url;
  final String? title;
  final Map<String, String>? replaceMap;

  const TalkWebView({this.rawCode, this.onWebViewFinishCreated, this.htmlPath, this.replaceMap, this.url, this.title, Key? key}) : super(key: key);

  @override
  _TalkWebViewState createState() => _TalkWebViewState();
}

class _TalkWebViewState extends State<TalkWebView> {
  bool isLoading = true;
  String showTip = 'loading'.tr;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (_) {
            isLoading = false;
            if (mounted) {
              setState(() {});
            }
            widget.onWebViewFinishCreated?.call(webViewController);
          },
          onPageStarted: (_) async {},
          onWebResourceError: (error) {
            showTip = error.description;
            isLoading = false;
            if (mounted) {
              setState(() {});
            }
          }));
    final String result = widget.rawCode ?? "";
    final url = widget.url ?? "";
    if (url.isNotEmpty) {
      webViewController.loadRequest(Uri.parse(url));
    }
    if (result.isNotEmpty) {
      webViewController.loadHtmlString(widget.rawCode!);
    }
    final String resultFileHtml = widget.htmlPath ?? "";
    if (resultFileHtml.isNotEmpty) {
      rootBundle.loadString(resultFileHtml).then((result) {
        widget.replaceMap?.forEach((from, replace) {
          result = result.replaceAll(from, replace);
        });
        webViewController.loadHtmlString(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Processing"),
      ),
      body: Stack(
        children: [WebViewWidget(controller: webViewController), Visibility(visible: isLoading, child: const LoadingWidget()).center()],
      ),
    );
  }
}
