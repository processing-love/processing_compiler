import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';

import 'logic.dart';

class ExamplePage extends StatelessWidget {
  final logic = Get.put(ExampleLogic());
  final state = Get.find<ExampleLogic>().state;

  ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: '示例',
    );
  }
}
