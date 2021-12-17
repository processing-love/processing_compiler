import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/page/setting/theme_page.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:processing_compiler/widgets/select_font_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'editor_setting'.tr,
      body: Column(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return CodeMirrorWebView(
              htmlPath: 'assets/code_mirror.html',
              onWebViewCreated: (controller) {
                final raw = Uri.encodeComponent(gP5ExampleCode);
                controller.runJavascript('''
                      editor.setOption('readOnly',true,);
                      editor.setValue(decodeURIComponent("$raw"));
                      editor.setSize(${constraints.maxWidth},${constraints.maxHeight});
                      ''');
              },
            );
          }).constrained(width: Get.width, height: 280).marginAll(12),
          cardWidget(Column(
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
                    Get.bottomSheet(const SelectFontWidget(),
                        barrierColor: Colors.black38);
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
          ))
        ],
      ).scrollable(),
    );
  }
}

cardWidget(Widget child) {
  return child.card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}
