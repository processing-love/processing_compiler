import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class ReferenceWidget extends StatelessWidget {
  const ReferenceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isContentList: true,
      isHaveAppBar: false,
      contentListWidgets: [
        cardItemWidget(
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return const WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://processing.org/reference/FloatDict.html',
            );
          },
        ).constrained(width: Get.width, height: Get.height)),
      ],
    );
  }
}
