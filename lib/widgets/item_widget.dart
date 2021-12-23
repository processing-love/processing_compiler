import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/tools/responsive.dart';

/// @author u
/// @date 2020/6/12.

cardItemListViewWidget(
    {required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    bool? haveNext}) {
  return Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: Responsive.symmetric(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    ),
  );
}

cardItemWidget({required Widget child, bool? haveNext}) {
  final isHaveNext = haveNext ?? false;
  return Column(
    children: [
      Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: Responsive.symmetric(),
          child: child,
        ),
      ),
      SizedBox(height: isHaveNext ? Responsive.responsiveInsets() : 0)
    ],
  );
}

itemListTile(
    {required String title,
    bool? haveNext,
    required Function onTap,
    IconData? leading,
    String? subTitle,
    String? trailingDesc}) {
  return ListTile(
    title: Text(title),
    trailing: haveNext ?? false
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trailingDesc ?? "",
                style: Get.textTheme.caption,
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          )
        : null,
    onTap: () {
      onTap.call();
    },
    leading: leading == null ? null : Icon(leading),
    subtitle: subTitle == null ? null : Text(subTitle),
  );
}
