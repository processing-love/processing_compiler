import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/editor/logic.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
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
          }))
        ],
      ).scrollable(),
    );
  }
}
