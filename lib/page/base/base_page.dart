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
  final bool? isHaveAppBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? drawer;

  const BasePage(
      {Key? key,
      this.title,
      this.drawer,
      this.isContentList,
      this.body,
      this.actions,
      this.contentListWidgets,
      this.isHaveAppBar,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final haveAppBar = isHaveAppBar ?? true;
    if (haveAppBar) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
          centerTitle: true,
          actions: actions,
        ),
        drawer: drawer,
        body: buildContentWidget(),
        floatingActionButton: floatingActionButton,
      );
    }

    return buildListContentWidget();
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
