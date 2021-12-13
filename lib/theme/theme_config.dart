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
    Color backgroundColor = ColorUtils.createMaterialHexColor(cssTheme.hexColor);
    return ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: backgroundColor,
        cardColor: Colors.black87,
        brightness: theme.contains('dark') ? Brightness.dark : Brightness.light,
        backgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
        textTheme: Get.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white,),
        bottomAppBarColor: backgroundColor);
  }
}
