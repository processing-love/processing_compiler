import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/devices/third_platform.dart';
import 'package:processing_compiler/page/all_controller_binding.dart';
import 'package:processing_compiler/page/main/view.dart';
import 'package:processing_compiler/theme/theme_controller.dart';
import 'package:processing_compiler/theme/theme_service.dart';
import 'package:processing_compiler/theme/theme_service_hive.dart';
import 'package:processing_compiler/tools/const/app_color.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
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
  UmengCommonSdk.initCommon(ThirdPlatform.umengAndroidKey, ThirdPlatform.umengIosKey, ThirdPlatform.umengChannel);
  UmengCommonSdk.setPageCollectionModeAuto();
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
            colors: AppColor.schemes[gThemeController.schemeIndex].light,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 5,
            appBarElevation: 0.5,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            colors: AppColor.schemes[gThemeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 7,
            appBarElevation: 0.5,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          // Use the dark or light theme based on controller editor_setting.
          themeMode: gThemeController.themeMode,
        );
      },
    );
  }
}

Locale getCurrentLocale() {
  String localeCode = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language ?? "";
  if (localeCode.isEmpty) {
    return Get.deviceLocale ??
        Locale.fromSubtags(
            languageCode: gSupportLanguages[0].code,
            scriptCode: gSupportLanguages[0].desc,
            countryCode: gSupportLanguages[0].code);
  }
  Language language = gSupportLanguages.firstWhere((element) => element.code == localeCode);
  return Locale.fromSubtags(languageCode: language.code,scriptCode: language.desc,countryCode: language.code);
}
