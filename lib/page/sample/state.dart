import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_node.dart'
    as model_example_node;
import 'package:processing_compiler/tools/responsive.dart';

class SampleState {
  SampleState() {
    ///Initialize variables
  }

  RxList<model_example_node.ModelExampleNode> exampleNodes = RxList.empty();

  buildFeaturedWidget(model_example_node.Json? currentJson) {
    var featured = currentJson?.buildFeatured() ?? '';

    if (featured.isEmpty) {
      return const SizedBox();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'feature'.tr,
          style: Get.textTheme.bodyText2,
        ).marginSymmetric(vertical: Responsive.responsiveInsets() / 2),
        Text(
          featured,
          style: Get.textTheme.caption,
        ),
      ],
    );
  }
}
