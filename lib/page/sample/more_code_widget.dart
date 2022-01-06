import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/main.dart';
import 'package:processing_compiler/tools/const/app_color.dart';

/// @author u
/// @date 2020/6/12.
class MoreCodeWidget extends StatefulWidget {
  final Map<String, String> codeMap;

  const MoreCodeWidget(this.codeMap, {Key? key}) : super(key: key);

  @override
  State<MoreCodeWidget> createState() => _MoreCodeWidgetState();
}

class _MoreCodeWidgetState extends State<MoreCodeWidget> {
  String? currentTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'code'.tr,
          style: Get.textTheme.headline6,
        ),
        buildCodeTitleWidget(),
        buildCodeContentWidget().marginSymmetric(vertical: 4)
      ],
    );
  }

  Widget buildCodeTitleWidget() {
    return Wrap(
      spacing: 12,
      children: widget.codeMap.keys.map((title) {
        return ActionChip(
          backgroundColor: currentTitle == title
              ? AppColor.schemes[gThemeController.schemeIndex].light.primary
              : null,
          label: Text(
            title,
            style: currentTitle == title
                ? const TextStyle(color: Colors.white)
                : null,
          ),
          onPressed: () {
            currentTitle = title;
            setState(() {});
          },
        );
      }).toList(),
    );
  }

  Widget buildCodeContentWidget() {
    String code =
        widget.codeMap[currentTitle ?? widget.codeMap.keys.first] ?? '';
    return Text(code);
  }
}
