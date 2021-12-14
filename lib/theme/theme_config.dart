import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:processing_compiler/tools/color_utils.dart';

/// @author u
/// @date 2020/6/12.

class ThemeConfig {
  ThemeData getSettingThemeData() {
    CSSTheme cssTheme = CSS().getCSS();
    return ThemeData(
        primarySwatch: ColorUtils.createMaterialHexColor(cssTheme.hexColor));
  }

  void setTheme() {
    Get.changeTheme(getSettingThemeData());
  }
}
