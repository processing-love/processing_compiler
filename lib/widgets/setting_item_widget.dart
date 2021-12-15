import 'package:flutter/material.dart';
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
        cardWidget(Column(
          children: item.map((model) {
            if (model.radio ?? false) {
              return SwitchListTile(
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

cardWidget(Widget child) {
  return child.card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}
