import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/profile/language_setting_page.dart';
import 'package:processing_compiler/page/profile/theme_setting_page.dart';
import 'package:processing_compiler/page/setting/logic.dart';
import 'package:processing_compiler/page/setting/view.dart';
import 'package:processing_compiler/widgets/setting_item_widget.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'setting'.tr,
      isContentList: true,
      contentListWidgets: [
        Obx(() {
          return cardItemWidget(
              child: Column(
            children: [
              itemListTile(
                  title: 'theme'.tr,
                  onTap: () {
                    Get.to(const ThemeSettingPage());
                  },
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
      ],
    );
  }
}
