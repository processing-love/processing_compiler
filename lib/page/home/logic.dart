import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/messages.dart';
import 'package:processing_compiler/widgets/dialog.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  void setCurrentIndex(index) {
    state.currentIndex.value = index;
    state.controller?.jumpToPage(index);
  }

  @override
  void onClose() {
    super.onClose();
    state.controller?.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    state.projectFiles.addAll(boxProjectFile.values);
    DateMessage().buildCurrentDateMessage();
  }

  getOrCreateProjectFile(String name, ProjectType projectType) async {
    final DbProjectFile projectFile = await gAdapterHelper.getOrCreateProjectFile(name, projectType);
    return projectFile;
  }

  deleteProject(int index) async {
    final name = state.projectFiles[index].name;
    showDeleteProjectDialog(state,name, index);
  }

  bool isExist(String name) {
    return -1 != state.projectFiles.indexWhere((element) => element.name == name);
  }

  void addProjectFile(projectFile) {
    state.projectFiles.add(projectFile);
  }
  void deleteProjectFile() {

  }
}
