import 'package:flutter/material.dart';

/// @author u
/// @date 2020/6/12.
class BasePage extends StatelessWidget {
  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const BasePage(
      {Key? key,
      this.title,
      this.body,
      this.actions,
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
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
