import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/setting/logic.dart';
import 'package:processing_compiler/page/setting/view.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'setting'.tr,
      body: ListView(
        children: [
          itemWidget(title: '深色模式', onTap: () {}, haveNext: true),
          itemWidget(title: '多语言', onTap: () {}, haveNext: true),
          itemWidget(title: '导出', onTap: () {}, haveNext: true),
          itemWidget(title: '导入', onTap: () {}, haveNext: true),
        ],
      ),
    );
  }
}
