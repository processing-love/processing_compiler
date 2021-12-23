import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/tools/color_utils.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class EditorSettingPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  EditorSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'editor_setting'.tr,
      isContentList: true,
      contentListWidgets: [
        LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
          return CodeMirrorWebView(
            htmlPath: 'assets/code_mirror.html',
            backgroundColor:
                ColorUtils.createMaterialHexColor(CSS().getCSS().hexColor),
            onWebViewFinishCreated: (controller) {
              final raw = Uri.encodeComponent(gP5ExampleCode);
              state.setSettingWebController(controller);
              controller.runJavascript('''
                      editor.setOption('readOnly','nocursor',);
                      editor.setValue(decodeURIComponent("$raw"));
                      ''');
            },
          );
        })
            .constrained(width: Get.width, height: Get.height / 3)
            .marginOnly(bottom: Responsive.responsiveInsets()),
        Obx(() {
          return cardItemWidget(
              child: Column(
            children: [
              SwitchListTile(
                title: Text('show_code_line_number'.tr),
                value: state.showCodeLineNumber.value,
                onChanged: logic.setShowCodeLineNumber,
              ),
              itemListTile(
                  title: 'setting_code_font_size'.tr,
                  haveNext: true,
                  trailingDesc: state.codeFontSize.value.toInt().toString(),
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
                              style: Get.textTheme.bodyText1,
                            ).marginOnly(bottom: Get.height / 3 / 3, top: 14)
                          ],
                        ).height(Get.height / 3).backgroundColor(Colors.white),
                        barrierColor: Colors.black38);
                  }),
              itemListTile(
                title: 'code_theme'.tr,
                trailingDesc: state.codeThemeName.value,
                haveNext: true,
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
              )
            ],
          ));
        }),
      ],
    );
  }
}
