import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/setting/logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
    );
  }
}
