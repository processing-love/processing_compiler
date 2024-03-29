import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/widgets/dialog.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  void setCurrentIndex(index) {
    state.currentIndex.value = index;
    state.controller.jumpToPage(index);
  }

  @override
  void onClose() {
    super.onClose();
    state.controller.dispose();
    state.textEditingController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    List<DbProjectFile> data = boxProjectFile.values.toList();
    data.sort((p, p1) => p1.modifyTime.compareTo(p.modifyTime));
    state.projectFiles.clear();
    state.projectFiles.addAll(data);
  }

  getOrCreateProjectFile(String name, ProjectType projectType) async {
    return await gAdapterHelper.getOrCreateProjectFile(name, projectType);
  }

  deleteProject(int index) async {
    final name = buildSortResultProjectFiles()[index].name;
    showDeleteProjectDialog('config_delete'.tr.replaceAll('x', name), 'delete'.tr, () {
      state.deleteProject(name, index);
    });
  }

  bool isExist(String name) {
    return -1 != state.projectFiles.indexWhere((element) => element.name == name);
  }

  void addProjectFile(projectFile) {
    if (state.projectFiles.isNotEmpty) {
      state.projectFiles.insert(0, projectFile);
    } else {
      state.projectFiles.add(projectFile);
    }
  }

  List<DbProjectFile> buildSortResultProjectFiles() {
    final List<DbProjectFile> result = List.from(state.projectFiles);
    return result;
  }

  void updateProjectName(String projectName, String nameKey) async {
    state.updateProjectName(projectName, nameKey);
  }
}
