import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/page/main/view.dart';
import 'package:processing_compiler/theme/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gAdapterHelper.initAllAdapter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Processing Compiler',
      debugShowCheckedModeBanner: false,
      locale: getCurrentLocale(),
      fallbackLocale: const Locale('en', 'US'),
      translations: Messages(),
      home: MainPage(),
      defaultTransition: Transition.rightToLeft,
      theme: ThemeConfig().getSettingThemeData(),
    );
  }
}

Locale getCurrentLocale() {
  String localeCode = boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language ?? "";
  if (localeCode.isEmpty) {
    return Get.locale ?? const Locale('en');
  }
  return Locale(localeCode);
}
