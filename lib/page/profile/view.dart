import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/main.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/editor_setting/logic.dart';
import 'package:processing_compiler/page/profile/language_setting_page.dart';
import 'package:processing_compiler/page/profile/theme_setting_page.dart';
import 'package:processing_compiler/tools/launch_app.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:share_plus/share_plus.dart';

import 'contact_me_page.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.find<EditorSettingLogic>();
  final state = Get.find<EditorSettingLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'setting'.tr,
      isContentList: true,
      contentListWidgets: [
        Obx(() {
          return cardItemWidget(
              haveNext: true,
              child: Column(
                children: [
                  itemListTile(
                      title: 'theme'.tr,
                      onTap: () {
                        Get.to(const ThemeSettingPage());
                      },
                      trailingDesc: getThemeName(),
                      haveNext: true),
                  itemListTile(
                      title: 'language'.tr,
                      onTap: () {
                        Get.to(LanguageSettingPage());
                      },
                      trailingDesc: state.currentLanguage.value.desc.tr,
                      haveNext: true),
                ],
              ));
        }),
        cardItemWidget(
            child: Column(
          children: [
            itemListTile(
                title: 'like_me'.tr,
                onTap: () {
                  launchMarket();
                }),
            itemListTile(
                title: 'recommend'.tr,
                onTap: () {
                  Share.share('app_share'.tr);
                }),
            itemListTile(
                title: 'about'.tr,
                onTap: () {
                  Get.to(const ContactMePage());
                },
                haveNext: true)
          ],
        )),
      ],
    );
  }

  String getThemeName() {
    var name = gThemeController.themeMode.name;
    switch (name) {
      case 'light':
        name = 'light_mode'.tr;
        break;
      case 'dark':
        name = 'dark_mode'.tr;
        break;
      default:
        name = 'system_mode'.tr;
        break;
    }
    return name;
  }
}
