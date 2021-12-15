import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/editor/view.dart';
import 'package:processing_compiler/tools/widget_utils.dart';

class MainPageState {
  final RxInt currentIndex = 0.obs;

  MainPageState() {
    ///Initialize variables
  }

  void createProjectList() {
    buildProjectItemWidget(String title, Function callback) {
      return ListTile(
        title: Text(
          title,
          style: Get.textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          Get.back();
          callback.call(title);
        },
      );
    }

    wrapGetBottomSheet(Wrap(children: [
      ListTile(
        title: Text(
          'create_project'.tr,
          style: Get.textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
      buildProjectItemWidget('create_processing'.tr, () {}),
      buildProjectItemWidget('create_p5'.tr, (String title) async {
        Get.back();
        final result = await rootBundle.loadString('assets/code_mirror.html');
        Get.to(EditorPage(title: title, code: result));
      }),
      buildProjectItemWidget('create_python'.tr, () {}).marginOnly(bottom: 12),
    ]));
  }
}
