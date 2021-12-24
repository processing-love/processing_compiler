import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/home/projcet_widget.dart';
import 'package:processing_compiler/page/main/logic.dart';
import 'package:styled_widget/styled_widget.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'app_name'.tr,
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
          'emtpy_pro'.tr,
          style: Get.textTheme.bodyText1,
        ),
      ],
    ).gestures(onTap: () {
      Get.find<MainPageLogic>().state.createProjectList();
    }).center();
  }
}

// Column(
// children: [
// CupertinoSlidingSegmentedControl(
// children: state.buildSegmentedWidget(),
// groupValue: state.currentIndex.value,
// onValueChanged: logic.setCurrentIndex)
// .marginOnly(top: 24),
// PageView(
// controller: state.controller,
// onPageChanged: logic.setCurrentIndex,
// children: [ProjectWidget(), const SampleWidget()],
// ).expanded()
// ],
// )
