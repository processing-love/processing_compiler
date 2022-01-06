import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_node.dart'
    as model_example_node;
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/sample/more_code_widget.dart';
import 'package:processing_compiler/page/search/api_detail_page.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class PreviewSamplePage extends StatefulWidget {
  final model_example_node.ModelExampleNode? example;

  const PreviewSamplePage(this.example, {Key? key}) : super(key: key);

  @override
  _PreviewSamplePageState createState() => _PreviewSamplePageState();
}

class _PreviewSamplePageState extends State<PreviewSamplePage> {
  @override
  Widget build(BuildContext context) {
    var t = widget.example?.json?.buildFeatured() ?? '';
    return BasePage(
      title: widget.example?.json?.title ?? '',
      isContentList: true,
      contentListWidgets: [
        cardItemWidget(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ApiColumnWidget(
              title: 'author'.tr,
              value: widget.example?.json?.author ?? '',
            ),
            ApiColumnWidget(
              title: 'description'.tr,
              value: widget.example?.json?.description ?? '',
            ),
            buildPreviewCodeWidget(),
            ApiColumnWidget(
              title: 'feature'.tr,
              value: widget.example?.json?.buildFeatured() ?? '',
            ),
            buildCodeWidget()
          ],
        )),
      ],
    );
  }

  Widget buildCodeWidget() {
    final codeMap = <String, String>{};
    widget.example?.pdes?.nodes?.forEach((element) {
      codeMap[element.name ?? ''] = element.internal?.content ?? '';
    });
    return MoreCodeWidget(codeMap).marginAll(8);
  }

  Widget buildPreviewCodeWidget() {
    String code = widget.example?.liveSketch?.childRawCode?.content ?? '';
    print('peter c' + code.toString());
    return CodeMirrorWebView(
            rawCode:
                ProjectTypeHelper.getFullHtml(ProjectType.processing.index, code))
        .constrained(height: 300, width: 300);
  }
}
