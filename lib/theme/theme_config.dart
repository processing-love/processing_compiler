import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/lib/css.dart';
import 'package:processing_compiler/tools/color_utils.dart';

/// @author u
/// @date 2020/6/12.

class ThemeConfig {
  ThemeData getSettingThemeData() {
    var dbCodeMirrorConfig = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig);
    final String theme = dbCodeMirrorConfig?.codeThemeName ?? "material";
    CSSTheme cssTheme = CSS().getCSS(theme);
    print('peter css ' + cssTheme.hexColor);
    return ThemeData(
        primarySwatch: ColorUtils.createMaterialHexColor(cssTheme.hexColor));
  }

  void setTheme() {
    Get.changeTheme(getSettingThemeData());
  }
}
