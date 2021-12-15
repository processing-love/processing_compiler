import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/tools/color_utils.dart';

/// @author u
/// @date 2020/6/12.

class ThemeConfig {
  ThemeData getSettingThemeData() {
    return ThemeData(
        primarySwatch: ColorUtils.createMaterialHexColor('#000000'));
  }

  void setTheme() {
    Get.changeTheme(getSettingThemeData());
  }
}
