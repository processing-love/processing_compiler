import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'app_name'.tr,
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.crossAxisCount,
          ),
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amber,
              child: Center(child: Text('$index')),
            );
          }),
    );
  }
}
