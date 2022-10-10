import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/home/projcet_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'app_name'.tr,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          state.createProjectList();
        },
      ),
      body: Obx(() {
        return state.projectFiles.isEmpty
            ? buildEmptyWidget()
            : ProjectWidget();
      }),
    );
  }

  Widget buildEmptyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.create_new_folder_outlined,
        ).marginOnly(bottom: 12),
        Text(
          'empty_pro'.tr,
          style: Get.textTheme.bodyText1,
        ),
      ],
    ).gestures(onTap: () {
      Get.find<HomeLogic>().state.createProjectList();
    }).center();
  }
}
