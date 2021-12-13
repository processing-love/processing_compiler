import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/main/view.dart';
import 'package:processing_compiler/messages.dart';
import 'package:processing_compiler/theme/theme_config.dart';

void main() async {
  await DbAdapterHelper().initAllAdapter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Processing Compiler',
      debugShowCheckedModeBanner: false,
      locale: const Locale('zh', 'CN'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Messages(),
      home: MainPage(),
      theme: ThemeConfig().getSettingThemeData(),
    );
  }
}
