import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/editor/view.dart';
import 'package:processing_compiler/page/home/logic.dart';
import 'package:processing_compiler/page/home/state.dart';

/// @author u
/// @date 2020/6/12.

showDeleteProjectDialog(HomeState state, String projectName, int index) {
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('tip'.tr),
          content: Text('config_delete'.tr.replaceAll('x', projectName)),
          actions: [
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('delete'.tr),
              onPressed: () async {
                Get.back();
                state.deleteProject(projectName, index);
              },
            ),
          ],
        );
      });
}

showCreateProjectDialog(
    TextEditingController controller, ProjectType projectType) {
  controller.clear();
  String? error;
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            onSubmit() async {
              if (controller.text.isEmpty) {
                setState(() {
                  error = 'please_input_project_name'.tr;
                });
                return;
              }

              final logic = Get.put(HomeLogic());
              if (logic.isExist(controller.text.trim())) {
                setState(() {
                  error = 'limit_project_name_exist'.tr;
                });
                return;
              }

              final projectFile = await logic.getOrCreateProjectFile(
                  controller.text, projectType);
              var statues = error ?? "";
              if (statues.isEmpty) {
                Get.focusScope?.requestFocus(FocusNode());
                Get.back();
                Get.to(EditorPage(
                  projectFile: projectFile,
                ))?.then((value) => logic.addProjectFile(projectFile));
              }
            }

            return AlertDialog(
              title: Text('new_project'.tr),
              content: TextField(
                controller: controller,
                autocorrect: true,
                autofocus: true,
                decoration: InputDecoration(errorText: error),
                onSubmitted: (String content) {
                  onSubmit();
                },
                onChanged: (String content) {
                  if (content.length > 15) {
                    error = 'limit_project_name_length'.tr;
                  } else {
                    error = null;
                  }
                  setState(() {});
                },
              ),
              actions: [
                TextButton(
                  child: Text('cancel'.tr),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text('create'.tr),
                  onPressed: () async {
                    onSubmit();
                  },
                ),
              ],
            );
          },
        );
      }).then((value) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  });
}
