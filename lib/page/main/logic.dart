import 'package:get/get.dart';

import 'state.dart';

class MainPageLogic extends GetxController {
  final state = MainPageState();

  void changeTabIndex(int index) {
    state.currentIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
    state.controller.dispose();
  }
}
