import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/page/setting/theme_page.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'editor_setting'.tr,
      body: cardWidget(Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return SwitchListTile(
              title: Text('show_code_line_number'.tr),
              value: state.showCodeLineNumber.value,
              onChanged: logic.setShowCodeLineNumber,
            );
          }),
          Obx(() {
            return Column(
              children: [
                ListTile(
                  title: Text('setting_code_font_size'.tr),
                  trailing: Text(state.codeFontSize.value.toInt().toString()),
                ),
                Slider(
                  value: state.codeFontSize.value,
                  onChanged: logic.setCodeLineNumber,
                  min: 13,
                  max: 20,
                )
              ],
            );
          }),
          Obx(() {
            return ListTile(
              title: Text('setting_code_font_size'.tr),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.codeFontSize.value.toInt().toString())
                      .fontSize(13),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
              onTap: () async {
                final String url = await rootBundle
                    .loadString('assets/code_mirror_config.html');
                Get.bottomSheet(CodeMirrorWebView(
                  rawCode: url,
                ));
              },
            );
          }),
          Obx(() {
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
          }),
        ],
      )),
    );
  }
}

cardWidget(Widget child) {
  return child.card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}
