import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timeago/timeago.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'editor_setting'.tr,
      body: ListView(
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
                return itemListTile(
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
                                style: Get.textTheme.caption,
                              ).marginOnly(bottom: Get.height / 3 / 3, top: 14)
                            ],
                          )
                              .height(Get.height / 3)
                              .backgroundColor(Colors.white),
                          barrierColor: Colors.black38);
                    });
              }),
              Obx(() {
                return itemListTile(
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
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}

cardWidget(Widget child) {
  return child.card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)));
}

itemWidget(
    {required String title,
    bool? haveNext,
    required Function onTap,
    IconData? leading,
    String? subTitle,
    String? trailingDesc}) {
  return cardWidget(itemListTile(
      onTap: onTap,
      title: title,
      haveNext: haveNext,
      subTitle: subTitle,
      leading: leading,
      trailingDesc: trailingDesc));
}

itemListTile(
    {required String title,
    bool? haveNext,
    required Function onTap,
    IconData? leading,
    String? subTitle,
    String? trailingDesc}) {
  return ListTile(
    title: Text(title),
    trailing: haveNext ?? false
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trailingDesc ?? "",
                style: Get.textTheme.caption,
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          )
        : null,
    onTap: () {
      onTap.call();
    },
    leading: leading == null ? null : Icon(leading),
    subtitle: subTitle == null ? null : Text(subTitle),
  );
}

itemWidgetForSlide(Function onPressed, Function slideTapFunction, DbProjectFile project) {
  DateMessage().buildCurrentDateMessage();
  return cardWidget(Slidable(
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (_) {
            slideTapFunction.call();
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'delete'.tr,
        ),
      ],
    ),
    child: itemListTile(
        title: project.name,
        onTap: () {
          onPressed.call(project);
        },
        haveNext: true,
        leading: Icons.folder_outlined,
        subTitle: format(DateTime.fromMillisecondsSinceEpoch(project.time))),
  ));
}
