import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/page/all_controller_binding.dart';
import 'package:processing_compiler/page/main/view.dart';
import 'package:processing_compiler/theme/theme_controller.dart';
import 'package:processing_compiler/theme/theme_service.dart';
import 'package:processing_compiler/theme/theme_service_hive.dart';
import 'package:processing_compiler/tools/const/app_color.dart';
import 'package:processing_compiler/tools/const/app_data.dart';

late ThemeController gThemeController;

var start = 0;

void main() async {
  start = DateTime.now().millisecondsSinceEpoch;
  WidgetsFlutterBinding.ensureInitialized();
  await gAdapterHelper.initAllAdapter();
  final ThemeService themeService = ThemeServiceHive(dbNameTheme);
  await themeService.init();
  gThemeController = ThemeController(themeService);
  await gThemeController.loadAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: gThemeController,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Processing Compiler',
          debugShowCheckedModeBanner: false,
          locale: getCurrentLocale(),
          fallbackLocale: const Locale('en', 'US'),
          translations: Messages(),
          home: MainPage(),
          defaultTransition: Transition.rightToLeft,
          initialBinding: AllControllerBinding(),
          theme: FlexThemeData.light(
            useMaterial3: true,
            colors: AppColor.customSchemes[gThemeController.schemeIndex].light,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 5,
            appBarElevation: 0.5,
            subThemesData: gThemeController.useSubThemes
                ? FlexSubThemesData(
                    defaultRadius: gThemeController.defaultRadius,
                  )
                : null,
            keyColors: FlexKeyColors(
              useKeyColors: gThemeController.useKeyColors,
              useSecondary: gThemeController.useSecondary,
              useTertiary: gThemeController.useTertiary,
              keepPrimary: gThemeController.keepPrimary,
              keepSecondary: gThemeController.keepSecondary,
              keepTertiary: gThemeController.keepTertiary,
            ),
            visualDensity: AppData.visualDensity,
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
          ),
          darkTheme: FlexThemeData.dark(
            useMaterial3: true,
            colors: AppColor.customSchemes[gThemeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 7,
            appBarElevation: 0.5,
            keyColors: FlexKeyColors(
              useKeyColors: gThemeController.useKeyColors,
              useSecondary: gThemeController.useSecondary,
              useTertiary: gThemeController.useTertiary,
              keepPrimary: gThemeController.keepDarkPrimary,
              keepSecondary: gThemeController.keepDarkSecondary,
              keepTertiary: gThemeController.keepDarkTertiary,
            ),
            subThemesData: gThemeController.useSubThemes
                ? FlexSubThemesData(
                    defaultRadius: gThemeController.defaultRadius,
                  )
                : null,
            visualDensity: AppData.visualDensity,
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
          ),
          themeMode: gThemeController.themeMode,
        );
      },
    );
  }
}

Locale getCurrentLocale() {
  String localeCode = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language ?? "";
  if (localeCode.isEmpty) {
    return Get.deviceLocale ?? Locale.fromSubtags(languageCode: gSupportLanguages[0].code, scriptCode: gSupportLanguages[0].desc, countryCode: gSupportLanguages[0].code);
  }
  Language language = gSupportLanguages.firstWhere((element) => element.code == localeCode);
  return Locale.fromSubtags(languageCode: language.code, scriptCode: language.desc, countryCode: language.code);
}
