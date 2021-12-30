import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';

import 'logic.dart';

class SearchPage extends StatelessWidget {
  final logic = Get.put(SearchLogic());
  final state = Get.find<SearchLogic>().state;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: '搜索',
    );
  }
}
