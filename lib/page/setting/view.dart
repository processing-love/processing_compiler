import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
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
      body: Column(
        children: [
          LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
            return CodeMirrorWebView(
              htmlPath: 'assets/code_mirror.html',
              onWebViewFinishCreated: (controller) {
                final raw = Uri.encodeComponent(gP5ExampleCode);
                state.setSettingWebController(controller);
                controller.runJavascript('''
                      editor.setOption('readOnly','nocursor',);
                      editor.setValue(decodeURIComponent("$raw"));
                      editor.setSize(${constraints.maxWidth},${constraints.maxHeight});
                      ''');
              },
            );
          })
              .constrained(width: Get.width, height: Get.height / 3)
              .marginAll(12),
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
                    Get.bottomSheet(
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Obx(() {
                              return Slider(
                                value: state.codeFontSize.value,
                                min: 13,
                                max: 20,
                                onChanged: logic.setCodeFontSize,
                              );
                            }),
                            Text(
                              'slide_setting_font_size'.tr,
                              style: Get.textTheme.caption,
                            ).marginOnly(bottom: Get.height / 3 / 3, top: 14)
                          ],
                        ).height(Get.height / 3).backgroundColor(Colors.white),
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
                    Get.bottomSheet(Scrollbar(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          String theme = state.css.cssTheme[index].name;
                          return ListTile(
                            title: Text(theme),
                            trailing: state.codeThemeName.value == theme
                                ? const Icon(Icons.done)
                                : null,
                            onTap: () {
                              Get.back();
                              logic.setCodeTheme(theme);
                            },
                          );
                        },
                        itemCount: state.css.cssTheme.length,
                      ),
                    ).decorated(
                        color: Get.theme.scaffoldBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))));
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
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
}

itemWidget({required String title, bool? haveNext, required Function onTap}) {
  return cardWidget(ListTile(
    title: Text(title),
    trailing: haveNext ?? false ? const Icon(Icons.keyboard_arrow_right) : null,
    onTap: () {
      onTap.call();
    },
  ));
}
