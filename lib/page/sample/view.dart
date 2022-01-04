import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/sample/preview_sample_page.dart';
import 'package:processing_compiler/page/sample/state.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:styled_widget/styled_widget.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'sample'.tr,
      body: GridView.builder(
        itemCount: SampleCode.getSampleCodes().length,
        padding: Responsive.symmetric(),
        itemBuilder: (BuildContext context, int index) {
          SampleCode sampleCode = SampleCode.getSampleCodes()[index];
          return Card(
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sampleCode.name,
                  style: Get.textTheme.headline6,
                ).marginOnly(bottom: Responsive.responsiveInsets()),
                Text(
                  sampleCode.desc,
                  style: Get.textTheme.bodyText2,
                ).expanded(flex: 1),
                Text(
                  sampleCode.author,
                  style: Get.textTheme.caption,
                )
                    .marginOnly(top: Responsive.responsiveInsets())
                    .expanded(flex: 1),
              ],
            ).paddingOnly(
                left: Responsive.responsiveInsets(),
                top: Responsive.responsiveInsets()),
          ).gestures(onTap: () {
            Get.to(PreviewSamplePage(index));
          });
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: Responsive.responsiveInsets(),
            mainAxisSpacing: Responsive.responsiveInsets(),
            maxCrossAxisExtent: 250),
      ),
    );
  }
}
