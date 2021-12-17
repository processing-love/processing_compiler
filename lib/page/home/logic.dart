import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  void setCurrentIndex(index) {
    state.currentIndex.value = index;
    state.controller?.jumpToPage(index);
  }
}
