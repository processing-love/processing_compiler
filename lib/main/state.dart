import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/editor/view.dart';

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

    Get.bottomSheet(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Wrap(children: [
            ListTile(
              title: Text(
                'create_project'.tr,
                style: Get.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            buildProjectItemWidget('create_processing'.tr, () {}),
            buildProjectItemWidget('create_p5'.tr, (String title) {
              Get.to(EditorPage(title: title));
            }),
            buildProjectItemWidget('create_python'.tr, () {}),
          ]),
        ),
        barrierColor: Colors.black38);
  }
}
