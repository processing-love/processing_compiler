import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/main.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/tools/const/app_color.dart';
import 'package:processing_compiler/widgets/item_widget.dart';

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
    return BasePage(
      title: 'theme_setting'.tr,
      isContentList: true,
      contentListWidgets: [
        cardItemWidget(
            child: FlexThemeModeSwitch(
              themeMode: gThemeController.themeMode,
              labelLight: 'light_mode'.tr,
              labelSystem: 'system_mode'.tr,
              labelDark: 'dark_mode'.tr,
              title: Center(
                child: TextButton(
                  onPressed: () {
                    gThemeController.resetAllToDefaults();
                    setState(() {});
                  },
                  child: Text('reset'.tr),
                ),
              ),
              onThemeModeChanged: (mode) {
                gThemeController.setThemeMode(mode);
                setState(() {});
              },
              flexSchemeData: AppColor.schemes[gThemeController.schemeIndex],
              buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
            ),
            haveNext: true),
        cardItemWidget(
            child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width ~/ 80, //每行三列
            childAspectRatio: 1.0, //显示区域宽高相等
          ),
          itemCount: AppColor.schemes.length,
          itemBuilder: (context, index) {
            return IconButton(
                onPressed: () {
                  gThemeController.setSchemeIndex(index);
                  setState(() {});
                },
                icon: buildIconColorWidget(index));
          },
        ))
      ],
    );
  }

  buildIconColorWidget(int index) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;

    Icon icon = Icon(Icons.lens,
        color: isLight
            ? AppColor.schemes[index].light.primary
            : AppColor.schemes[index].dark.primary,
        size: 40);
    if (icon.color == colorScheme.primary) {
      return const CircleAvatar(
        child: Icon(
          Icons.check,
        ),
      );
    }
    return icon;
  }
}
