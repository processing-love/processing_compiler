import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/setting/logic.dart';
import 'package:processing_compiler/widgets/dialog.dart';

/// @author u
/// @date 2020/6/12.
class LanguageSettingPage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  LanguageSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: 'language_setting'.tr,
        actions: [
          IconButton(
              onPressed: () {
                showTranslateQuestion();
              },
              icon: const Icon(Icons.help_outline))
        ],
        body: Scrollbar(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Language language = gSupportLanguages[index];
            return Obx(() {
              return ListTile(
                title: Text(language.language),
                subtitle: Text(language.desc.tr),
                trailing: state.currentLanguage.value.code == language.code
                    ? const Icon(Icons.done)
                    : null,
                onTap: () {
                  logic.setCurrentLanguageDesc(language);
                },
              );
            });
          },
          itemCount: gSupportLanguages.length,
        )));
  }

  void showTranslateQuestion() {
    showTalkDialog('language_desc'.tr, 'send'.tr, () {});
  }
}
