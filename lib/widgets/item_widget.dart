import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:styled_widget/styled_widget.dart';

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

cardItemRow({required Widget child}) {
  return Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: Responsive.symmetric(),
      child: child,
    ),
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
                style: Get.textTheme.bodySmall,
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          )
        : null,
    onTap: () {
      onTap.call();
    },
    minLeadingWidth: 0,
    leading: leading == null
        ? null
        : SizedBox(height: double.infinity, child: Icon(leading)),
    subtitle: subTitle == null ? null : Text(subTitle),
  );
}

showCardBottomSheet({required List<Widget> widgets, double? height}) {
  Get.bottomSheet(ListView(
    shrinkWrap: height == null ? true : false,
    itemExtent: height,
    children: widgets,
  ).decorated(
      color: Get.theme.scaffoldBackgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(8))));
}
