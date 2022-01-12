import 'package:get/get.dart';
import 'package:processing_compiler/page/editor/editor_setting/logic.dart';
import 'package:processing_compiler/page/editor/logic.dart';
import 'package:processing_compiler/page/home/logic.dart';
import 'package:processing_compiler/page/main/logic.dart';
import 'package:processing_compiler/page/profile/logic.dart';
import 'package:processing_compiler/page/sample/logic.dart';
import 'package:processing_compiler/page/search/logic.dart';

/// @author u
/// @date 2020/6/12.
class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageLogic());
    Get.lazyPut(() => SearchLogic());
    Get.lazyPut(() => ProfileLogic());
    Get.lazyPut(() => EditorSettingLogic());
    Get.lazyPut(() => EditorLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => SampleLogic());
  }
}
