import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/page/home/state.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';

/// @author u
/// @date 2020/6/12.
class ThemePage extends StatelessWidget {
  final logic = Get.put(EditorLogic());
  final state = Get.find<EditorLogic>().state;

  ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'code_theme'.tr,
      body: Scrollbar(
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            String theme = state.css.cssTheme[index].name;
            return CodeMirrorWebView(
              htmlPath: 'assets/code_mirror_config.html',
              fromValue: "xx",
              replaceValue: theme,
              onWebViewCreated: (controller) {
                controller.runJavascript('''
                editor.setSize(${Get.width - 10},${Get.height / 3})',
                editor.setValue(decodeURIComponent("${Uri.encodeComponent(gP5ExampleFontCode)}"));
                editor.setOption('lineNumbers',false);
                editor.setOption('theme','$theme');
                editor.refresh();
          ''');
              },
            );
          },
          itemCount: state.css.cssTheme.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
        ),
      ),
    );
  }
}
