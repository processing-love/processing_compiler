import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/theme/theme_service.dart';
import 'package:processing_compiler/theme/theme_service_hive.dart';

import '../main.dart';

/// @author u
/// @date 2020/6/12.
class AllService {
  Future<void> initServices() async {
    await Get.putAsync(() => gAdapterHelper.initAllAdapter());
    final ThemeService themeService = ThemeServiceHive(dbNameTheme);
    await Get.putAsync(() => themeService.init());
    await Get.putAsync(() => gThemeController.loadAll());
  }
}
