import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/project_code.dart';
import 'package:processing_compiler/page/setting/view.dart';

/// @author u
/// @date 2020/6/12.

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataTemp.length,
      itemBuilder: (BuildContext context, int index) {
        final project = dataTemp[index];
        return cardWidget(ListTile(
            title: Text(project.projectName),
            trailing: const Icon(Icons.keyboard_arrow_right),
            leading: const Icon(
              Icons.folder_outlined,
            ),
            subtitle: Text(createTimeDesc(project.createTime))));
      },
    );
  }

  String createTimeDesc(int time) {
    return 'createTimeDesc'.tr + DateTime.now().toLocal().toString();
  }
}

var dataTemp = [
  ProjectCode(
      projectName: '粒子项目',
      createTime: DateTime.now().millisecondsSinceEpoch,
      type: 1),
  ProjectCode(
      projectName: '粒子项目',
      createTime: DateTime.now().millisecondsSinceEpoch,
      type: 1),
  ProjectCode(
      projectName: '粒子项目',
      createTime: DateTime.now().millisecondsSinceEpoch,
      type: 1),
  ProjectCode(
      projectName: '粒子项目',
      createTime: DateTime.now().millisecondsSinceEpoch,
      type: 1),
];
