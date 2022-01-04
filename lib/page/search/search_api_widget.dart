import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/page/search/logic.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:styled_widget/styled_widget.dart';

/// @author u
/// @date 2020/6/12.
class SearchApiWidget extends StatefulWidget {
  const SearchApiWidget({Key? key}) : super(key: key);

  @override
  _SearchApiWidgetState createState() => _SearchApiWidgetState();
}

class _SearchApiWidgetState extends State<SearchApiWidget> {
  TextEditingController textEditingController = TextEditingController();
  String? error;
  List<ModeApiNode> searchApiNodeResult = [];
  final logic = Get.put(SearchLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'search'.tr,
          style: Get.textTheme.headline5,
        ).marginAll(20),
        TextField(
          controller: textEditingController,
          autocorrect: true,
          autofocus: true,
          onSubmitted: (String content) {},
          decoration:
              InputDecoration(errorText: error, fillColor: Colors.transparent),
          onChanged: (String content) {
            searchApiNodeResult.clear();
            logic.state.getNodes().forEach((element) {
              final result = element.childJson?.name ?? '';
              if (result.contains(content.trim())) {
                searchApiNodeResult.add(element);
              }
            });
            if (searchApiNodeResult.isEmpty || content.isEmpty) {
              error = 'search_result_empty'.tr;
              searchApiNodeResult.clear();
            }
            setState(() {});
          },
        ).marginSymmetric(horizontal: Get.width / 5),
        Scrollbar(
          child: ListView.builder(
            itemCount: searchApiNodeResult.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              final ModeApiNode apiNode = searchApiNodeResult[index];
              final title = apiNode.childJson?.name ?? '';
              return itemListTile(
                  title: title,
                  onTap: () async {
                    Get.back();
                    logic.state.gotoDetail(apiNode);
                  },
                  subTitle: apiNode.childJson?.brief ?? '');
            },
          ),
        ).expanded(),
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
