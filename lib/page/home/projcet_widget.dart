import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/editor/view.dart';
import 'package:processing_compiler/page/home/logic.dart';
import 'package:processing_compiler/page/setting/view.dart';

/// @author u
/// @date 2020/6/12.

class ProjectWidget extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: logic.state.projectFiles.length,
        itemBuilder: (BuildContext context, int index) {
          final project = logic.state.projectFiles[index];
          return itemWidgetForSlide((projectFile) {
            Get.to(EditorPage(
              projectFile: projectFile,
            ));
          }, () {
            logic.deleteProject(index);
          }, project);
        },
      );
    });
  }
}