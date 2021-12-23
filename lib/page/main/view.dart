import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/home/view.dart';
import 'package:processing_compiler/page/profile/view.dart';

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
          children: [HomePage(), ProfilePage()],
        ),
        bottomNavigationBar: HomeBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            state.createProjectList();
          },
        ),
      );
    });
  }
}

class HomeBottomAppBar extends StatelessWidget {
  final MainPageState state = Get.find<MainPageLogic>().state;
  final MainPageLogic logic = Get.put(MainPageLogic());

  HomeBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.home),
            color: selectColor(0),
            onPressed: () {
              logic.changeTabIndex(0);
            },
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.settings),
            color: selectColor(1),
            onPressed: () {
              logic.changeTabIndex(1);
            },
          ),
        ],
      ),
    );
  }

  Color selectColor(int index) {
    bool isSelect = index == state.currentIndex.value;
    return isSelect ? Colors.black : Colors.black54;
  }
}
