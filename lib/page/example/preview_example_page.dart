import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_detail_node.dart' as model_example_node;
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/example/more_code_widget.dart';
import 'package:processing_compiler/page/profile/contact_me_page.dart';
import 'package:processing_compiler/page/search/api_detail_page.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:processing_compiler/widgets/dialog.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';

class PreviewExamplePage extends StatefulWidget {
  final model_example_node.ModelExampleDetailNode? example;

  const PreviewExamplePage(this.example, {Key? key}) : super(key: key);

  @override
  _PreviewExamplePageState createState() => _PreviewExamplePageState();
}

class _PreviewExamplePageState extends State<PreviewExamplePage> {
  @override
  Widget build(BuildContext context) {
    print('peter ' + Get.window.devicePixelRatio.toString());

    return BasePage(
      title: widget.example?.json?.title ?? '',
      actions: [
        IconButton(
            onPressed: () {
              showTalkDialog('error_desc'.tr, 'about'.tr, () {
                Get.to(const ContactMePage());
              });
            },
            icon: const Icon(Icons.help_outline))
      ],
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
    String fullCode = widget.example?.pdes?.nodes
            ?.map((e) => e.internal!.content)
            .toList()
            .join() ??
        '';
    int projectType = fullCode.contains("function setup()")
        ? ProjectType.p5js.index
        : ProjectType.processing.index;
    if (fullCode.contains(" loadImage(")) {
      String liveCode = widget.example?.liveSketch?.childRawCode?.content ?? '';
      fullCode = handlerProcessingLoadImage(fullCode, liveCode);
    }

    if (fullCode.contains(" loadShape(")) {
      String liveCode = widget.example?.liveSketch?.childRawCode?.content ?? '';
      fullCode = handlerProcessingLoadShape(fullCode, liveCode);
    }

    return CodeMirrorWebView(
            backgroundColor: Colors.transparent,
            rawCode: ProjectTypeHelper.getFullHtml(projectType, fullCode))
        .constrained(height: Get.width > 640 ? 360 : 225, width: 640);
  }
}

String handlerProcessingLoadImage(String fullUrl, String liveCode) {
  int imageStartIndex = liveCode.indexOf('loadImage(');
  int imageEndIndex = liveCode.indexOf('.jpg\')');
  print('peter fll ' + liveCode.toString());
  String loadImageString =
      liveCode.substring(imageStartIndex, imageEndIndex) + ".jpg')";
  List<String> url = [];
  for (int index = 0; index < loadImageString.split("/").length; index++) {
    if (index == 0) {
      url.add(loadImageString.split("/")[index] + 'https://processing.org');
    } else {
      url.add(loadImageString.split("/")[index]);
    }
  }
  final String loadImage = url.join("/");
  int start = fullUrl.indexOf("loadImage(");
  int end = fullUrl.indexOf('.jpg');
  print('peter end ' + end.toString());
  String image = fullUrl.substring(start, end) + ".jpg\")";
  return fullUrl.replaceAll(image, loadImage);
}

String handlerProcessingLoadShape(String fullUrl, String liveCode) {
  int imageStartIndex = liveCode.indexOf('loadShape(');
  int imageEndIndex = liveCode.indexOf('.svg\')');
  print('peter ' + liveCode.toString());
  String loadImageString =
      liveCode.substring(imageStartIndex, imageEndIndex) + ".svg')";
  List<String> url = [];
  for (int index = 0; index < loadImageString.split("/").length; index++) {
    if (index == 0) {
      url.add(loadImageString.split("/")[index] + 'https://processing.org');
    } else {
      url.add(loadImageString.split("/")[index]);
    }
  }
  final String loadImage = url.join("/");
  int start = fullUrl.indexOf("loadShape(");
  int end = fullUrl.indexOf('.svg');
  String image = fullUrl.substring(start, end) + ".svg\")";
  return fullUrl.replaceAll(image, loadImage);
}
