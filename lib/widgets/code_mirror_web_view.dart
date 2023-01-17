import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.

typedef WebViewPageFinishedCallback = void Function(WebViewController controller);
typedef WebViewCreatedCallback = void Function(WebViewController controller);
typedef WebViewJSCallback = void Function(JavaScriptMessage message);

class CodeMirrorWebView extends StatefulWidget {
  final String? rawCode;
  final bool? isClose;
  final WebViewPageFinishedCallback? onWebViewFinishCreated;
  final WebViewJSCallback? webViewJSCallback;
  final WebViewCreatedCallback? onWebViewCreated;
  final String? htmlPath;
  final String? url;
  final String? jsCallName;
  final Map<String, String>? replaceMap;
  final Color? backgroundColor;

  const CodeMirrorWebView(
      {this.rawCode,
      this.isClose,
      this.onWebViewFinishCreated,
      this.jsCallName,
      this.webViewJSCallback,
      this.onWebViewCreated,
      this.htmlPath,
      this.replaceMap,
      this.url,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  _CodeMirrorWebViewState createState() => _CodeMirrorWebViewState();
}

class _CodeMirrorWebViewState extends State<CodeMirrorWebView> {
  bool isLoading = true;
  String showTip = 'loading'.tr;
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setBackgroundColor(widget.backgroundColor ?? Colors.white)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (_) {
        isLoading = false;
        widget.onWebViewFinishCreated?.call(webViewController);
        if (mounted) {
          setState(() {});
        }
      }, onPageStarted: (_) async {
        widget.onWebViewCreated?.call(webViewController);
      }, onWebResourceError: (error) {
        showTip = error.description;
        isLoading = false;
        if (mounted) {
          setState(() {});
        }
      }));

    if (widget.webViewJSCallback != null) {
      webViewController.addJavaScriptChannel(widget.jsCallName ?? "", onMessageReceived: widget.webViewJSCallback!);
    }
    final url = widget.url ?? "";
    if (url.isNotEmpty) {
      webViewController.loadRequest(Uri.parse(url));
    }
    final stringContentHtml = widget.rawCode ?? "";
    if (stringContentHtml.isNotEmpty) {
      webViewController.loadHtmlString(stringContentHtml);
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
    return Material(
      child: Stack(
        children: [
          WebViewWidget(controller: webViewController),
          Visibility(visible: isLoading, child: const LoadingWidget()).center(),
          Positioned(
              child: Visibility(
                  visible: widget.isClose ?? false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: IconButton.styleFrom(backgroundColor: Get.theme.colorScheme.surfaceVariant),
                      icon: const Icon(Icons.close),
                    ),
                  )))
        ],
      ),
    );
  }
}
