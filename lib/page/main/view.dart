import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/home/view.dart';

import 'logic.dart';
import 'state.dart';

class MainPage extends StatelessWidget {
  final MainPageLogic logic = Get.put(MainPageLogic());
  final MainPageState state = Get.find<MainPageLogic>().state;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
