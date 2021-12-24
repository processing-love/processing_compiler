import 'package:flutter/material.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/widgets/item_widget.dart';

/// @author u
/// @date 2020/6/12.
class SampleWidget extends StatelessWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isContentList: true,
      isHaveAppBar: false,
      contentListWidgets: [
        cardItemWidget(child: const Text('data')),
      ],
    );
  }
}
