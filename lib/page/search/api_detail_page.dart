import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/data/api/model_api_node_details.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';

/// @author u
/// @date 2020/6/12.
class ApiDetailPage extends StatelessWidget {
  final ModelApiNodeDetails currentNodeDetails;
  final ModeApiNode apiNode;

  const ApiDetailPage(this.currentNodeDetails, this.apiNode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: currentNodeDetails.json?.name ?? '',
      isContentList: true,
      contentListWidgets: [
        cardItemWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApiRowWidget(
                title: getTitleName(),
                value: currentNodeDetails.json?.name ?? '',
                textStyle: Get.textTheme.headline3,
              ),
              ApiRowWidget(
                title: 'description'.tr,
                value: currentNodeDetails.json?.description ?? '',
                textStyle: Get.textTheme.headline4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildExampleWidget(),
              ),
              buildInitWidget(),
              buildFieldsWidget(),
              buildParametersWidget(),
              buildMethodsWidget()
            ],
          ),
        ),
      ],
    );
  }

  String getTitleName() {
    final result = apiNode.childJson?.type ?? '';
    if (result == 'function') {
      return 'name_function'.tr;
    }

    if (result == 'class') {
      return 'name_class'.tr;
    }
    return 'name'.tr;
  }

  List<Widget> buildExampleWidget() {
    final result = <Widget>[];
    final List<Edges> codes = currentNodeDetails.pdes?.edges ?? [];
    if (codes.isEmpty) {
      result.add(const SizedBox());
      return result;
    }

    result.add(
      Text(
        'code_examples'.tr,
        style: Get.textTheme.headline5,
      ),
    );
    result.add(Column(
      children:
          codes.map((e) => Text(e.node?.internal?.content ?? '')).toList(),
    ).marginOnly(bottom: 16, top: 8));
    return result;
  }

  Widget buildInitWidget() {
    final result = apiNode.childJson?.type ?? '';
    if (result == 'function') {
      return buildSyntaxWidget();
    }

    if (result == 'class') {
      return buildConstructorsWidget();
    }
    return buildSyntaxWidget();
  }

  Widget buildConstructorsWidget() {
    List<String> result = currentNodeDetails.json?.constructors ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }
    return ApiRowWidget(
      title: 'constructors'.tr,
      value: result.map((e) => e + "\n").toList().join(),
    );
  }

  Widget buildSyntaxWidget() {
    List<String> result = currentNodeDetails.json?.syntax ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }

    return ApiRowWidget(
      title: 'syntax'.tr,
      value: result.map((e) => e + "\n").toList().join(),
    );
  }

  Widget buildFieldsWidget() {
    List<ClassFields> result = currentNodeDetails.json?.classFields ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }

    return ApiRowWidget(
      title: 'fields'.tr,
      value: result
          .map((e) => e.name.toString() + '\t\t' + e.desc.toString() + "\n")
          .toList()
          .join(),
    );
  }

  Widget buildMethodsWidget() {
    List<Methods> result = currentNodeDetails.json?.methods ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }

    return ApiRowWidget(
      title: 'methods'.tr,
      value: result
          .map((e) => e.name.toString() + '\t\t' + e.desc.toString() + "\n\n")
          .toList()
          .join(),
    );
  }

  Widget buildParametersWidget() {
    List<Parameters> result = currentNodeDetails.json?.parameters ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }

    return ApiRowWidget(
      title: 'parameters'.tr,
      value: result
          .map((e) =>
              e.name.toString() + '\t\t' + e.description.toString() + "\n")
          .toList()
          .join(),
    );
  }
}

class ApiRowWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? textStyle;

  const ApiRowWidget({Key? key, this.title, this.value, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: Get.textTheme.headline5,
        ).expanded(flex: 4),
        Text(
          value ?? '',
          style: Get.textTheme.bodyText2,
        ).expanded(flex: 8),
      ],
    ).marginOnly(bottom: 26);
  }
}
