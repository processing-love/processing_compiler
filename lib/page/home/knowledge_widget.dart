import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/setting/view.dart';
import 'package:processing_compiler/widgets/talk_webview.dart';

/// @author u
/// @date 2020/6/12.
class KnowledgeWidget extends StatelessWidget {
  const KnowledgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        cardWidget(ListTile(
          title: Text('china_bbs'.tr),
          onTap: () {
            Get.to(TalkWebView(
              url: 'https://www.processing.love/',
              title: 'china_bbs'.tr,
            ));
          },
        )),
        cardWidget(ListTile(
          title: Text('official_bbs'.tr),
          onTap: () {
            Get.to(TalkWebView(
              url: 'https://discourse.processing.org/',
              title: 'official_bbs'.tr,
            ));
          },
        ))
      ],
    );
  }
}
