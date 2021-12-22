import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/page/main/view.dart';
import 'package:processing_compiler/theme/theme_controller.dart';
import 'package:processing_compiler/theme/theme_service.dart';
import 'package:processing_compiler/theme/theme_service_hive.dart';
import 'package:processing_compiler/tools/const/app_color.dart';
import 'package:processing_compiler/tools/const/app_data.dart';

late ThemeController gThemeController;

void main() async {
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
          theme: FlexThemeData.light(
            colors: AppColor.schemes[gThemeController.schemeIndex].light,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 5,
            appBarElevation: 0.5,
            useSubThemes: gThemeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          darkTheme: FlexThemeData.dark(
            colors: AppColor.schemes[gThemeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 7,
            appBarElevation: 0.5,
            useSubThemes: gThemeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          // Use the dark or light theme based on controller setting.
          themeMode: gThemeController.themeMode,
        );
      },
    );
  }
}

Locale getCurrentLocale() {
  String localeCode =
      boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language ?? "";
  if (localeCode.isEmpty) {
    return Get.locale ?? const Locale('en');
  }
  return Locale(localeCode);
}
