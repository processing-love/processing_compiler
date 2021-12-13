import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/logic.dart';
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
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            String theme = state.css.cssTheme[index].name;
            return ListTile(
              title: Text(theme),
              trailing: state.getTrailingItemWidget(theme),
              onTap: () {
                Get.back();
                logic.setCodeTheme(theme);
              },
            );
          },
          itemCount: state.css.cssTheme.length,
        ),
      ),
    );
  }
}
