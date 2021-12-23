import 'package:flutter/material.dart';
import 'package:processing_compiler/tools/responsive.dart';
import 'package:styled_widget/styled_widget.dart';

/// @author u
/// @date 2020/6/12.
class SettingItemWidget extends StatelessWidget {
  final String title;
  final List<SettingItemModel> item;

  const SettingItemWidget({required this.title, required this.item, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(title),
        ),
        cardItemWidget(
            child: Column(
          children: item.map((model) {
            if (model.radio ?? false) {
              return SwitchListTile.adaptive(
                title: Text(model.title),
                value: model.radioValue ?? false,
                onChanged: model.onTap.call(),
              );
            }
            return ListTile(
              title: Text(model.title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(model.content ?? '').fontSize(13),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            );
          }).toList(),
        ))
      ],
    );
  }
}

class SettingItemModel {
  final String title;
  final bool? radio;
  final String? content;
  final Function onTap;
  final bool? isNext;
  final bool? radioValue;

  SettingItemModel(
      {required this.title,
      this.radio = false,
      this.content,
      required this.onTap,
      this.radioValue = false,
      this.isNext = false});
}

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
