import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_example_detail_node.dart'
    as model_example_node;
import 'package:processing_compiler/data/api/model_example_node.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:styled_widget/styled_widget.dart';

class ExampleState {
  ExampleState() {
    ///Initialize variables
  }

  RxList<model_example_node.ModelExampleDetailNode> exampleNodes =
      RxList.empty();
  Map<String, ImageDescNodes?> imagesMap = {};

  buildFeaturedWidget(model_example_node.Json? currentJson) {
    var featured = currentJson?.buildFeatured() ?? '';
    var title = currentJson?.title ?? '';
    String imageUrl200w = imagesMap[title]
            ?.childImageSharp
            ?.gatsbyImageData
            ?.images
            ?.fallback
            ?.src ??
        '';
    imageUrl200w = 'https://processing.org' + imageUrl200w;
    if (featured.isEmpty) {
      return const SizedBox();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.symmetric(vertical: Responsive.responsiveInsets() / 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: imageUrl200w,
              fit: BoxFit.cover,
              placeholder: (_, url) {
                return const CupertinoActivityIndicator().center();
              },
            ),
          ),
        ),
        Text(
          'feature'.tr,
          style: Get.textTheme.bodyText2,
        ),
        Text(
          featured,
          style: Get.textTheme.caption,
        ).marginSymmetric(vertical: Responsive.responsiveInsets() / 2),
      ],
    );
  }
}
