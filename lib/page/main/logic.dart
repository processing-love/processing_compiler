import 'package:get/get.dart';
import 'package:processing_compiler/http/editor_provider.dart';

import 'state.dart';

class MainPageLogic extends GetxController {
  final state = MainPageState();

  void changeTabIndex(int index) {
    state.currentIndex.value = index;
  }
}
