import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/editor/logic.dart';
import 'package:processing_compiler/http/editor_provider.dart';
import 'package:processing_compiler/tools/widget_utils.dart';
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
          })),
          cardWidget(ListTile(
            title: Text('code_theme'.tr),
            trailing: Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.codeTheme.value).fontSize(13),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              );
            }),
            onTap: () {
              wrapGetBottomSheet(ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    String theme = state.codeThemes[index];
                    return ListTile(
                      title: Text(theme),
                      trailing: state.isCurrentCodeTheme(theme) ? const Icon(Icons.done): null,
                      onTap: () {
                        Get.back();
                        EditorProvider().getCodeThemeCSS(theme);
                      },
                    );
                  },
                  itemCount: state.codeThemes.length));
            },
          ))
        ],
      ).scrollable(),
    );
  }
}
