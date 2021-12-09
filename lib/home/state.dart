import 'package:get/get.dart';
import 'package:processing_compiler/data/project_code.dart';

final bool useMobileLayout = Get.size.shortestSide < 600;

class HomeState {
  final RxList<ProjectCode> projectCodes = RxList.empty();

  HomeState() {
    ///Initialize variables
  }

  int get crossAxisCount => useMobileLayout ? 1 : 3;
}
