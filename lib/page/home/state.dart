import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/tools/widget_utils.dart';
import 'package:processing_compiler/widgets/dialog.dart';

final bool useMobileLayout = Get.size.shortestSide < 600;

int get crossAxisCount => useMobileLayout ? 1 : 2;

class HomeState {
  final RxList<DbProjectFile> projectFiles = RxList.empty();

  final RxInt currentIndex = 0.obs;

  PageController controller = PageController();
  TextEditingController textEditingController = TextEditingController();

  HomeState() {
    ///Initialize variables
  }

  int get crossAxisCount => useMobileLayout ? 1 : 3;

  Map<int, Widget> buildSegmentedWidget() {
    return {
      0: Text('project'.tr),
      1: Text('reference'.tr),
    };
  }

  void deleteProject(String projectName, index) async {
    await boxProjectFile.delete(projectFiles[index].nameKey);
    final findProject =
        projectFiles.firstWhere((element) => element.name == projectName);
    projectFiles.remove(findProject);
    projectFiles.refresh();
  }

  void updateProjectName(String projectName, String nameKey) async {
    final findProject =
        projectFiles.firstWhere((element) => element.nameKey == nameKey);
    findProject.name = projectName;
    findProject.save();
    projectFiles.refresh();
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
    showCreateProjectDialog(textEditingController, projectType);
  }
}
