import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/home/view.dart';
import 'package:processing_compiler/page/profile/view.dart';
import 'package:processing_compiler/page/sample/view.dart';
import 'package:processing_compiler/page/search/view.dart';

import 'logic.dart';
import 'state.dart';

class MainPage extends StatelessWidget {
  final MainPageLogic logic = Get.put(MainPageLogic());
  final MainPageState state = Get.find<MainPageLogic>().state;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: state.currentIndex.value,
          children: [HomePage(), SamplePage(), SearchPage(), ProfilePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.currentIndex.value,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedFontSize: 12,
          onTap: logic.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: 'project'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.turned_in_rounded),
              label: 'sample'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search_rounded),
              label: 'search'.tr,
            ),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: 'setting'.tr)
          ],
        ),
      );
    });
  }
}
