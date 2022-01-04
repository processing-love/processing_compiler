import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:processing_compiler/widgets/loading_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'logic.dart';

class SearchPage extends StatelessWidget {
  final logic = Get.put(SearchLogic());
  final state = Get.find<SearchLogic>().state;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: '搜索',
      body: Obx(() {
        return state.apiNodes.isEmpty
            ? const LoadingWidget().center()
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration:
                            state.buildCategoryContainerDecorationWidgetColor(),
                        margin: EdgeInsets.all(Responsive.responsiveInsets()),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: state.getCategoryList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: state
                                  .buildCategoryDecorationWidgetColor(index),
                              padding: EdgeInsets.all(
                                  Responsive.responsiveInsets() - 4),
                              margin:
                                  EdgeInsets.all(Responsive.responsiveInsets()),
                              child: Text(
                                state.getCategoryList()[index],
                              ),
                            ).gestures(onTap: () {
                              logic.changeIndex(index);
                            });
                          },
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.all(Responsive.responsiveInsets()),
                        padding: EdgeInsets.all(Responsive.responsiveInsets()),
                        decoration:
                            state.buildCategoryContainerDecorationWidgetColor(),
                        child: ListView(
                          children: [getApiNodeWidget()],
                        ),
                        alignment: Alignment.topLeft,
                      )),
                ],
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
          state.getNodes().length,
          (index) => ActionChip(
              padding: const EdgeInsets.all(10),
              label: Text(
                state.getNodes()[index].childJson?.name ?? "",
              ),
              onPressed: () {
                logic.gotoDetail(state.getNodes()[index]);
              })),
    );
  }
}
