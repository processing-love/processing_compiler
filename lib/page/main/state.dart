import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/tools/widget_utils.dart';
import 'package:processing_compiler/widgets/dialog.dart';

class MainPageState {
  final RxInt currentIndex = 0.obs;
  TextEditingController controller = TextEditingController();

  MainPageState() {
    ///Initialize variables
  }

  void createProjectList() {
    buildProjectItemWidget(String title, Function callback) {
      return ListTile(
        title: Text(
          title,
          style: Get.textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          Get.back();
          callback.call();
        },
      );
    }

    wrapGetBottomSheet(Wrap(children: [
      ListTile(
        title: Text(
          'create_project'.tr,
          style: Get.textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
      buildProjectItemWidget('create_processing'.tr, () {
        createProjectFile(ProjectType.processing);
      }),
      buildProjectItemWidget('create_p5'.tr, () {
        createProjectFile(ProjectType.p5js);
      }).marginOnly(bottom: 12),
      // buildProjectItemWidget('create_python'.tr, () {
      //   createProjectFile(ProjectType.py);
      // }).marginOnly(bottom: 12),
    ]));
  }

  createProjectFile(ProjectType projectType) {
    Get.back();
    showCreateProjectDialog(controller, projectType);
  }
}
