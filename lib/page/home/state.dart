import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/project_code.dart';

final bool useMobileLayout = Get.size.shortestSide < 600;

int get crossAxisCount => useMobileLayout ? 1 : 2;

class HomeState {
  final RxList<ProjectCode> projectCodes = RxList.empty();

  final RxInt currentIndex = 0.obs;

  PageController? controller = PageController();

  HomeState() {
    ///Initialize variables
  }

  int get crossAxisCount => useMobileLayout ? 1 : 3;

  Map<int, Widget> buildSegmentedWidget() {
    return {
      0: Text('project'.tr),
      1: Text('sample'.tr),
      2: Text('knowledge'.tr),
    };
  }
}
