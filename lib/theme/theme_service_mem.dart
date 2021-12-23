import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'theme_service.dart';
// ignore_for_file: comment_references

/// A service that stores and retrieves theme settings from memory only.
///
/// This class does not persist user settings, it only returns start default
/// values. The runtime in memory storage is actually handled by the theme
/// controller.
///
/// To actually persist the settings locally, use the [ThemeServicePrefs]
/// implementation that uses the shared_preferences package to persists the
/// values, or the [ThemeServiceHive] that uses the hive package to accomplish
/// the same thing. You could also make an implementation that stores settings
/// on a web server, e.g. with the http package.
///
/// The ThemeController that this is service is used with, keeps all latest
/// editor_setting values in memory itself, so this memory implementation
/// does not really do anything when calling save for each property,
/// they are all just no-op.
///
/// Loading values from it just returns the default value for each settings
/// property.
class ThemeServiceMem implements ThemeService {
  /// ThemeServiceMem implementations needs no init, it is just a no op.
  @override
  Future<void> init() async {}

  /// Loads the ThemeMode from local or remote storage.
  @override
  Future<ThemeMode> themeMode() async => ThemeService.defaultThemeMode;

  /// Persists the ThemeMode to mem in examples 2, 3, 4 and 5.
  @override
  Future<void> saveThemeMode(ThemeMode value) async {}

  /// Loads the useTextTheme editor_setting in example 5.
  @override
  Future<bool> useTextTheme() async => ThemeService.defaultUseTextTheme;

  /// Persists the useTextTheme editor_setting in example 5.
  @override
  Future<void> saveUseTextTheme(bool value) async {}

  /// Loads the used scheme editor_setting from mem in example 3.
  @override
  Future<FlexScheme> usedScheme() async => ThemeService.defaultUsedScheme;

  /// Persists the used scheme editor_setting to mem in example 3.
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {}

  /// Loads used scheme index editor_setting from mem in examples 4 and 5.
  @override
  Future<int> schemeIndex() async => ThemeService.defaultSchemeIndex;

  /// Persists the used scheme editor_setting to mem in examples 4 and 5.
  @override
  Future<void> saveSchemeIndex(int value) async {}

  /// Loads used themed effects editor_setting in example 5.
  @override
  Future<bool> interactionEffects() async =>
      ThemeService.defaultInteractionEffects;

  /// Persists used themed effects editor_setting in example 5.
  @override
  Future<void> saveInteractionEffects(bool value) async {}

  /// Loads used useDefaultRadius editor_setting in example 5.
  @override
  Future<bool> useDefaultRadius() async => ThemeService.defaultUseDefaultRadius;

  /// Persists the useDefaultRadius editor_setting in example 5.
  @override
  Future<void> saveUseDefaultRadius(bool value) async {}

  /// Loads used corner radius editor_setting in example 5.
  @override
  Future<double> cornerRadius() async => ThemeService.defaultCornerRadius;

  /// Persists the used corner radius editor_setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {}

  /// Loads used inputDecoratorIsFilled editor_setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async =>
      ThemeService.defaultInputDecoratorIsFilled;

  /// Persists used inputDecoratorIsFilled editor_setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {}

  /// Loads used inputDecoratorBorderType editor_setting in example 5.
  @override
  Future<FlexInputBorderType> inputDecoratorBorderType() async =>
      ThemeService.defaultInputDecoratorBorderType;

  /// Persists used inputDecoratorBorderType editor_setting in example 5.
  @override
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value) async {}

  /// Loads used inputDecoratorUnfocusedHasBorder editor_setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async =>
      ThemeService.defaultInputDecoratorUnfocusedHasBorder;

  /// Persists used inputDecoratorUnfocusedHasBorder editor_setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {}

  /// Loads used surface mode editor_setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async =>
      ThemeService.defaultSurfaceMode;

  /// Persists the used surface mode editor_setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {}

  /// Loads used surface blend level editor_setting in example 5.

  @override
  Future<int> blendLevel() async => ThemeService.defaultBlendLevel;

  /// Persists the used surface blend level editor_setting in example 5.
  @override
  Future<void> saveBlendLevel(int value) async {}

  /// Loads used app bar style for light theme editor_setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async =>
      ThemeService.defaultLightAppBarStyle;

  /// Persists the used app bar style for light theme editor_setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar style for dark theme editor_setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async =>
      ThemeService.defaultDarkAppBarStyle;

  /// Persists the used app bar style for dark theme editor_setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar opacity editor_setting in example 5.
  @override
  Future<double> appBarOpacity() async => ThemeService.defaultAppBarOpacity;

  /// Persists the used app bar opacity editor_setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {}

  /// Loads used app bar elevation editor_setting in example 5.
  @override
  Future<double> appBarElevation() async => ThemeService.defaultAppBarElevation;

  /// Persists the used app bar elevation editor_setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {}

  /// Loads used status bar transparency editor_setting in example 5.
  @override
  Future<bool> transparentStatusBar() async =>
      ThemeService.defaultTransparentStatusBar;

  /// Persists used status bar transparency editor_setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {}

  /// Loads used tab bar style editor_setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async =>
      ThemeService.defaultTabBarStyle;

  /// Persists used tab bar style editor_setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {}

  /// Loads used bottom navigation bar opacity editor_setting in example 5.
  @override
  Future<double> bottomNavigationBarOpacity() async =>
      ThemeService.defaultBottomNavigationBarOpacity;

  /// Persists the used app bar opacity editor_setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {}

  /// Loads used bottom navigation bar elevation editor_setting in example 5.
  @override
  Future<double> bottomNavigationBarElevation() async =>
      ThemeService.defaultBottomNavigationBarElevation;

  /// Persists the used app bar elevation editor_setting in example 5.
  @override
  Future<void> saveBottomNavigationBarElevation(double value) async {}

  /// Loads used navBarStyle editor_setting in example 5.
  @override
  Future<FlexSystemNavBarStyle> navBarStyle() async =>
      ThemeService.defaultNavBarStyle;

  /// Persists used navBarStyle editor_setting in example 5.
  @override
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value) async {}

  /// Loads used useNavDivider editor_setting in example 5.
  @override
  Future<bool> useNavDivider() async => ThemeService.defaultUseNavDivider;

  /// Persists useNavDivider editor_setting in example 5.
  @override
  Future<void> saveUseNavDivider(bool value) async {}

  /// Loads used tooltip style editor_setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async =>
      ThemeService.defaultTooltipsMatchBackground;

  /// Persists used tooltip style editor_setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {}

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async => ThemeService.defaultSwapLightColors;

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {}

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async => ThemeService.defaultSwapDarkColors;

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {}

  /// Loads lightIsWhite editor_setting, in example 5.
  @override
  Future<bool> lightIsWhite() async => ThemeService.defaultLightIsWhite;

  /// Persists lightIsWhite editor_setting, in example 5.
  @override
  Future<void> saveLightIsWhite(bool value) async {}

  /// Loads dark uses true black editor_setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async => ThemeService.defaultDarkIsTrueBlack;

  /// Persists dark uses true black editor_setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {}

  /// Loads use computed dark mode editor_setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async => ThemeService.defaultUseToDarkMethod;

  /// Persists use computed dark mode editor_setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {}

  /// Loads use computed dark mode level editor_setting, in example 5.
  @override
  Future<int> darkMethodLevel() async => ThemeService.defaultDarkMethodLevel;

  /// Persists use computed dark mode level editor_setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {}

  /// Loads editor_setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async =>
      ThemeService.defaultUseFlexColorScheme;

  /// Persists editor_setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {}

  /// Loads editor_setting that blends light colors, in example 5.
  @override
  Future<bool> blendLightOnColors() async =>
      ThemeService.defaultBlendLightOnColors;

  /// Persists editor_setting that blends light colors, in example 5.
  @override
  Future<void> saveBlendLightOnColors(bool value) async {}

  /// Loads editor_setting that blends dark colors, in example 5.
  @override
  Future<bool> blendDarkOnColors() async =>
      ThemeService.defaultBlendDarkOnColors;

  /// Persists editor_setting that blends dark colors, in example 5.
  @override
  Future<void> saveBlendDarkOnColors(bool value) async {}

  /// Loads editor_setting that blends light text theme, in example 5.
  @override
  Future<bool> blendLightTextTheme() async =>
      ThemeService.defaultBlendLightTextTheme;

  /// Persists editor_setting that blends light text theme, in example 5.
  @override
  Future<void> saveBlendLightTextTheme(bool value) async {}

  /// Loads editor_setting that blends dark text theme, in example 5.
  @override
  Future<bool> blendDarkTextTheme() async =>
      ThemeService.defaultBlendDarkTextTheme;

  /// Persists editor_setting that blends dark text theme, in example 5.
  @override
  Future<void> saveBlendDarkTextTheme(bool value) async {}

  /// Loads editor_setting for fabUseShape, in example 5.
  @override
  Future<bool> fabUseShape() async => ThemeService.defaultFabUseShape;

  /// Persists editor_setting for fabUseShape, in example 5.
  @override
  Future<void> saveFabUseShape(bool value) async {}

  /// Loads editor_setting for primaryLight color, in example 5.
  @override
  Future<Color> primaryLight() async => ThemeService.defaultPrimaryLight;

  /// Persists editor_setting for primaryLight color, in example 5.
  @override
  Future<void> savePrimaryLight(Color value) async {}

  /// Loads editor_setting for primaryVariantLight color, in example 5.
  @override
  Future<Color> primaryVariantLight() async =>
      ThemeService.defaultPrimaryVariantLight;

  /// Persists editor_setting for primaryVariantLight color, in example 5.
  @override
  Future<void> savePrimaryVariantLight(Color value) async {}

  /// Loads editor_setting for secondaryLight color, in example 5.
  @override
  Future<Color> secondaryLight() async => ThemeService.defaultSecondaryLight;

  /// Persists editor_setting for secondaryLight color, in example 5.
  @override
  Future<void> saveSecondaryLight(Color value) async {}

  /// Loads editor_setting for secondaryVariantLight color, in example 5.
  @override
  Future<Color> secondaryVariantLight() async =>
      ThemeService.defaultSecondaryVariantLight;

  /// Persists editor_setting for secondaryVariantLight color, in example 5.
  @override
  Future<void> saveSecondaryVariantLight(Color value) async {}

  /// Loads editor_setting for primaryDark color, in example 5.
  @override
  Future<Color> primaryDark() async => ThemeService.defaultPrimaryDark;

  /// Persists editor_setting for primaryDark color, in example 5.
  @override
  Future<void> savePrimaryDark(Color value) async {}

  /// Loads editor_setting for primaryVariantDark color, in example 5.
  @override
  Future<Color> primaryVariantDark() async =>
      ThemeService.defaultPrimaryVariantDark;

  /// Persists editor_setting for primaryVariantDark color, in example 5.
  @override
  Future<void> savePrimaryVariantDark(Color value) async {}

  /// Loads editor_setting for secondaryDark color, in example 5.
  @override
  Future<Color> secondaryDark() async => ThemeService.defaultSecondaryDark;

  /// Persists editor_setting for secondaryDark color, in example 5.
  @override
  Future<void> saveSecondaryDark(Color value) async {}

  /// Loads editor_setting for secondaryVariantDark color, in example 5.
  @override
  Future<Color> secondaryVariantDark() async =>
      ThemeService.defaultSecondaryVariantDark;

  /// Persists editor_setting for secondaryVariantDark color, in example 5.
  @override
  Future<void> saveSecondaryVariantDark(Color value) async {}
}
