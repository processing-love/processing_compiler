import 'package:flutter/material.dart';
import 'package:processing_compiler/tools/responsive.dart';

/// @author u
/// @date 2020/6/12.
class BasePage extends StatelessWidget {
  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final List<Widget>? contentListWidgets;
  final bool? isContentList;
  final FloatingActionButton? floatingActionButton;

  const BasePage(
      {Key? key,
      this.title,
      this.isContentList,
      this.body,
      this.actions,
      this.contentListWidgets,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        centerTitle: true,
        actions: actions,
      ),
      body: buildContentWidget(),
      floatingActionButton: floatingActionButton,
    );
  }

  buildContentWidget() {
    final result = isContentList ?? false;
    if (result) {
      return buildListContentWidget();
    }
    return body;
  }

  Widget buildListContentWidget() {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(Responsive.responsiveInsets()),
        children: contentListWidgets ?? [],
      ),
    );
  }
}

Widget buildListViewContentWidget(
    {required IndexedWidgetBuilder itemBuilder, required int itemCount}) {
  return Card(
    margin: EdgeInsets.all(Responsive.responsiveInsets()),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    ),
  );
}
