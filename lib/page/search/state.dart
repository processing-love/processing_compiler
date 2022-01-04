import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/main.dart';
import 'package:processing_compiler/tools/const/app_color.dart';

class SearchState {
  RxMap<String, List<ModeApiNode>> apiNodes = <String, List<ModeApiNode>>{}.obs;

  RxInt currentIndex = 0.obs;

  SearchState() {
    ///Initialize variables
  }

  List getCategoryList() {
    return apiNodes.keys.map((e) {
      return e.toLowerCase().replaceAll('_', ' ');
    }).toList();
  }

  List<ModeApiNode> getNodes() {
    final String key = apiNodes.keys.toList()[currentIndex.value];
    return apiNodes[key] ?? [];
  }

  BoxDecoration buildCategoryDecorationWidgetColor(int index) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      color: currentIndex.value != index
          ? Colors.transparent
          : AppColor.schemes[gThemeController.schemeIndex].light.primaryVariant,
    );
  }

  BoxDecoration buildCategoryContainerDecorationWidgetColor() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      color: Colors.transparent,
    );
  }

  Color nodeWidgetColor() {
    return AppColor.schemes[gThemeController.schemeIndex].light.primary
        .withOpacity(0.2);
  }
}
