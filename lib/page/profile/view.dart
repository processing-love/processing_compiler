import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/profile/language_setting_page.dart';
import 'package:processing_compiler/page/profile/theme_setting_page.dart';
import 'package:processing_compiler/page/setting/logic.dart';
import 'package:processing_compiler/page/setting/view.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'setting'.tr,
      body: ListView(
        children: [
          itemWidget(
              title: 'theme'.tr,
              onTap: () {
                Get.to(const ThemeSettingPage());
              },
              haveNext: true),
          Obx(() {
            return itemWidget(
                title: 'language'.tr,
                onTap: () {
                  Get.to(LanguageSettingPage());
                },
                trailingDesc: state.currentLanguage.value.desc.tr,
                haveNext: true);
          }),
        ],
      ),
    );
  }
}
