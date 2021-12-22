import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/main.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/profile/theme_popup_menu.dart';
import 'package:processing_compiler/tools/const/app_color.dart';
import 'package:processing_compiler/tools/responsive.dart';

/// @author u
/// @date 2020/6/12.
class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({Key? key}) : super(key: key);

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  @override
  Widget build(BuildContext context) {
    final double margins = Responsive.responsiveInsets(Get.width);

    return BasePage(
      title: 'theme_setting'.tr,
      body: ListView(
        padding: EdgeInsets.all(margins),
        children: <Widget>[
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: margins,
                horizontal: margins + 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // A 3-way theme toggle switch that shows the scheme.
                  FlexThemeModeSwitch(
                    themeMode: gThemeController.themeMode,
                    onThemeModeChanged: gThemeController.setThemeMode,
                    flexSchemeData:
                        AppColor.schemes[gThemeController.schemeIndex],
                    optionButtonBorderRadius: 4,
                    buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
                  ),
                  const SizedBox(height: 8),
                  ThemePopupMenu(
                    contentPadding: EdgeInsets.zero,
                    schemeIndex: gThemeController.schemeIndex,
                    onChanged: (int index) {
                      gThemeController.setSchemeIndex(index);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
