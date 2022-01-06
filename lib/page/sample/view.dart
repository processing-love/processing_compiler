import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_node.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/home/state.dart';
import 'package:processing_compiler/page/sample/logic.dart';
import 'package:processing_compiler/page/sample/preview_sample_page.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class SamplePage extends StatelessWidget {
  final logic = Get.put(SampleLogic());
  final state = Get.find<SampleLogic>().state;

  SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'sample'.tr,
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
                          style: Get.textTheme.subtitle2,
                        ),
                        state.buildFeaturedWidget(currentJson)
                      ],
                    ).paddingAll(Responsive.responsiveInsets()),
                  ).gestures(onTap: () {
                    Get.to(PreviewSamplePage(state.exampleNodes[index]));
                  });
                },
              );
      }),
    );
  }

  Widget getApiNodeWidget() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: List<Widget>.generate(
          state.exampleNodes.length,
          (index) => ActionChip(
              padding: const EdgeInsets.all(10),
              label: Text(
                state.exampleNodes()[index].json?.name ?? "",
              ),
              onPressed: () {})),
    );
  }
}
