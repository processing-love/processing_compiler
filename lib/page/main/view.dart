import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/example/view.dart';
import 'package:processing_compiler/page/home/view.dart';
import 'package:processing_compiler/page/profile/view.dart';
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
          children: [HomePage(), ExamplePage(), SearchPage(), ProfilePage()],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: state.currentIndex.value,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              label: 'project'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Icons.turned_in_not_rounded),
              label: 'example'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Icons.search_rounded),
              label: 'search'.tr,
            ),
            NavigationDestination(
                icon: const Icon(
                  Icons.person_outline_rounded,
                ),
                label: 'setting'.tr)
          ],
          onDestinationSelected: logic.changeTabIndex,
        ),
      );
    });
  }
}
