import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_project_file.dart';

final bool useMobileLayout = Get.size.shortestSide < 600;

int get crossAxisCount => useMobileLayout ? 1 : 2;

class HomeState {
  final RxList<DbProjectFile> projectFiles = RxList.empty();

  final RxInt currentIndex = 0.obs;

  PageController? controller = PageController();

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
    final findProject = projectFiles.firstWhere((element) => element.name == projectName);
    projectFiles.remove(findProject);
    projectFiles.refresh();
  }

  void updateProjectName(String projectName, String nameKey) async {
    final findProject = projectFiles.firstWhere((element) => element.nameKey == nameKey);
    findProject.name = projectName;
    findProject.save();
    projectFiles.refresh();
  }
}