import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/editor/view.dart';
import 'package:processing_compiler/page/home/logic.dart';

/// @author u
/// @date 2020/6/12.

showDeleteProjectDialog(String content, String actionName, Function actionTap) {
  showTalkDialog(content, actionName, actionTap);
}

showTalkDialog(String content, String actionName, Function actionTap) {
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('tip'.tr),
          content: Text(content),
          actions: [
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(actionName),
              onPressed: () async {
                Get.back();
                actionTap.call();
              },
            ),
          ],
        );
      });
}

showTalkErrorDialog(String error) {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
              ).marginOnly(right: 8),
              Text('tip'.tr)
            ],
          ),
          content: Text(
            error,
            style: const TextStyle(color: Colors.red),
          ),
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
                decoration: InputDecoration(errorText: error, fillColor: Colors.transparent),
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
      });
}
