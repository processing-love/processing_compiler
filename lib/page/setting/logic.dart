import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/main.dart';

import 'state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  void setCurrentLanguageDesc(Language language) {
    state.currentLanguage.value = language;
    Get.updateLocale(Locale(language.code, language.code));
    boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language = language.code;
    boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.save();
  }

  @override
  void onInit() {
    super.onInit();
    Locale locale = getCurrentLocale();
    state.currentLanguage.value = Language(locale.languageCode,locale.languageCode,locale.languageCode);
  }
}
