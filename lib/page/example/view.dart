import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_detail_node.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/example/logic.dart';
import 'package:processing_compiler/page/home/state.dart';
import 'package:processing_compiler/page/example/preview_example_page.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class ExamplePage extends StatelessWidget {
  final logic = Get.find<ExampleLogic>();
  final state = Get.find<ExampleLogic>().state;

  ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'example'.tr,
      body: Obx(() {
        return state.exampleNodes.isEmpty
            ? const LoadingWidget().center()
            : MasonryGridView.count(
                padding: EdgeInsets.all(Responsive.responsiveInsets()),
                crossAxisCount: useMobileLayout ? 2 : 4,
                mainAxisSpacing: Responsive.responsiveInsets(),
                crossAxisSpacing: Responsive.responsiveInsets(),
                itemCount: state.exampleNodes.length,
                itemBuilder: (context, index) {
                  Json? currentJson = state.exampleNodes[index].json;
                  return Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentJson?.title ?? '',
                          style: Get.textTheme.titleSmall,
                        ),
                        state.buildFeaturedWidget(currentJson)
                      ],
                    ).paddingAll(Responsive.responsiveInsets() * 1.2),
                  ).gestures(onTap: () {
                    Get.to(PreviewExamplePage(state.exampleNodes[index]));
                  });
                },
              );
      }),
    );
  }
}