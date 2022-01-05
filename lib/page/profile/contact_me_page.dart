import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/tools/launch_app.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:processing_compiler/widgets/talk_web_view.dart';

/// @author u
/// @date 2020/6/12.
class ContactMePage extends StatelessWidget {
  const ContactMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: 'about_how'.tr,
        isContentList: true,
        contentListWidgets: [
          cardItemWidget(
              child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              itemListTile(
                  title: "email".tr,
                  onTap: () {
                    launchEmail();
                  }),
              itemListTile(
                  title: "Processing中文论坛".tr,
                  onTap: () {
                    Get.to(TalkWebView(
                      title: "Processing中文论坛".tr,
                      url: 'https://www.processing.love/u/peter',
                    ));
                  }),
              itemListTile(
                  title: "QQ群",
                  onTap: () {
                    launchQQ();
                  }),
            ],
          )),
        ]);
  }
}
