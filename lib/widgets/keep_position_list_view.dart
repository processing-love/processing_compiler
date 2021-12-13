import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// @author u
/// @date 2020/6/12.
class KeepPositionListView extends HookWidget {
  final int? itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double? currentIndex;

  const KeepPositionListView.builder({
    Key? key,
    required this.itemBuilder,
    this.currentIndex,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }
}
