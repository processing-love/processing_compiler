import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/home/knowledge_widget.dart';
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
        return !state.projectCodes.isEmpty
            ? buildEmptyWidget()
            : Column(
                children: [
                  CupertinoSlidingSegmentedControl(
                          children: state.buildSegmentedWidget(),
                          groupValue: state.currentIndex.value,
                          onValueChanged: logic.setCurrentIndex)
                      .marginOnly(top: 24),
                  PageView(
                    controller: state.controller,
                    onPageChanged: logic.setCurrentIndex,
                    children: [
                      ProjectWidget(),
                      Text('2'),
                      KnowledgeWidget(),
                    ],
                  ).expanded()
                ],
              );
      }),
    );
  }

  Widget buildEmptyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.create_new_folder_outlined,
        ).marginOnly(bottom: 12),
        Text(
          'emtpy_pro'.tr,
          style: Get.textTheme.headline6,
        ),
      ],
    )
        .center()
        .width(Get.width * 0.65)
        .height(Get.height * 0.25)
        .card()
        .gestures(onTap: () {
      Get.find<MainPageLogic>().state.createProjectList();
    }).center();
  }
}
