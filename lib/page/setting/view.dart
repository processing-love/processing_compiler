import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/page/setting/theme_page.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cardWidget(Widget child) {
      return child.card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
    }

    return BasePage(
      title: 'setting'.tr,
      body: Column(
        children: [
          cardWidget(Obx(() {
            return SwitchListTile(
              title: Text('show_code_line_number'.tr),
              value: state.showCodeLineNumber.value,
              onChanged: logic.setShowCodeLineNumber,
            );
          })),
          cardWidget(Obx(() {
            return Column(
              children: [
                ListTile(
                  title: Text('setting_code_font_size'.tr),
                ),
                ListTile(
                  title: const Text('Hello Processing')
                      .fontSize(state.codeFontSize.value)
                      .center(),
                ),
                Slider(
                  value: state.codeFontSize.value,
                  onChanged: logic.setCodeLineNumber,
                  min: 13,
                  max: 20,
                )
              ],
            );
          })),
          cardWidget(Obx(() {
            return ListTile(
              title: Text('code_theme'.tr),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.codeThemeName.value).fontSize(13),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
              onTap: () {
                Get.to(ThemePage());
              },
            );
          }))
        ],
      ),
    );
  }
}
