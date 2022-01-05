import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as markdown;
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/data/api/model_api_node_details.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:processing_compiler/widgets/talk_web_view.dart';

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
              ApiColumnWidget(
                title: getTitleName(),
                value: currentNodeDetails.json?.name ?? '',
              ),
              ApiColumnWidget(
                title: 'description'.tr,
                value: currentNodeDetails.json?.description ?? '',
              ),
              ApiColumnWidget(
                title: 'code_examples'.tr,
                child: buildExampleWidget(),
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
    result.add(Column(
      children: codes.map((e) {
        final codeRaw = e.node?.internal?.content ?? '';
        final code = markdown.markdownToHtml("```\n$codeRaw```",
            inlineSyntaxes: [markdown.CodeSyntax()]);
        return Html(
          data: code,
        );
      }).toList(),
    ).marginSymmetric(vertical: 4));
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
    return ApiColumnWidget(
      title: 'constructors'.tr,
      value: handlerEnterString(result),
    );
  }

  Widget buildSyntaxWidget() {
    List<String> result = currentNodeDetails.json?.syntax ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }
    return ApiColumnWidget(
      title: 'syntax'.tr,
      value: handlerEnterString(result),
    );
  }

  String handlerEnterString(List<String> resource) {
    return resource
        .map((e) {
          int currentIndex = resource.indexOf(e);
          if (currentIndex != resource.length - 1) {
            return e + "\n";
          }
          return e;
        })
        .toList()
        .join();
  }

  Widget buildFieldsWidget() {
    List<ClassFields> result = currentNodeDetails.json?.classFields ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }
    return ApiColumnWidget(
      title: 'fields'.tr,
      value: handlerEnterString(result
          .map((e) => e.name.toString() + "\t\t" + e.desc.toString())
          .toList()),
    );
  }

  Widget buildMethodsWidget() {
    List<Methods> result = currentNodeDetails.json?.methods ?? [];
    if (result.isEmpty) {
      return const SizedBox();
    }

    return ApiColumnWidget(
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
    return ApiColumnWidget(
      title: 'parameters'.tr,
      value: handlerEnterString(result
          .map((e) => e.name.toString() + "\t\t" + e.description.toString())
          .toList()),
    );
  }
}

class ApiColumnWidget extends StatelessWidget {
  final String? title;
  final List<Widget>? child;
  final TextStyle? textStyle;
  final String? value;

  const ApiColumnWidget(
      {Key? key, this.title, this.child, this.value, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildChildren())
        .marginAll(8);
  }

  List<Widget> buildChildren() {
    final List<Widget> result = [];
    result.add(Text(
      title ?? '',
      style: Get.textTheme.headline6,
    ));

    if (value != null) {
      result.add(Html(
        data: value ?? '',
        onLinkTap: (String? url, RenderContext context,
            Map<String, String> attributes, _) {
          Get.to(TalkWebView(
            url: url.toString(),
          ));
        },
      ).marginSymmetric(vertical: 4));
    }
    result.addAll(child ?? []);
    return result;
  }
}
