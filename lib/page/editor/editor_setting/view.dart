import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/code_mirror/css_raw.dart';
import 'package:processing_compiler/compiler/core.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            rawCode: gCodeMirrorHtmlEditor,
            javascriptChannel: {
              JavascriptChannel(
                  name: "MessageInvoker",
                  onMessageReceived: (event) {
                    logic.autoSaveCode(event.message);
                  })
            },
            onWebViewFinishCreated: (controller) {
              final raw = Uri.encodeComponent(gP5ExampleCode);
              state.setSettingWebController(controller);
              controller.runJavascript('''
                      editor.setOption('readOnly','nocursor',);
                      editor.setOption('mode','${logic.buildCodeMirrorMode()}',);
                      editor.setValue(decodeURIComponent("$raw"));
                      editor.setSize("auto",(document.documentElement.clientHeight) + "px");
                      ''');
            },
          );
        })
            .constrained(
                width: Get.width,
                height: Responsive.buildCodeMirrorPreviewHeight())
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
                    Get.bottomSheet(ListView(
                      shrinkWrap: true,
                      itemExtent: Get.height / 3,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            ).marginOnly(top: 14)
                          ],
                        ),
                      ],
                    ).decorated(
                        color: Get.theme.scaffoldBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))));
                  }),
              itemListTile(
                title: 'code_theme'.tr,
                trailingDesc: state.codeThemeName.value,
                haveNext: true,
                onTap: () {
                  Get.bottomSheet(Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        String theme = CssRaw.cssThemes[index].name;
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
                      itemCount: CssRaw.cssThemes.length,
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
