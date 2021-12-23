import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/main.dart';

import 'state.dart';

class EditorSettingLogic extends GetxController {
  final EditorSettingState state = EditorSettingState();

  void setCurrentLanguageDesc(Language language) async {
    state.currentLanguage.value = language;
    boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.language = language.code;
    await boxCodeMirrorConfig.get(dbNameCodeMirrorConfig)?.save();
    await Get.updateLocale(Locale(language.code, language.code));
  }

  @override
  void onInit() {
    super.onInit();
    Locale locale = getCurrentLocale();
    state.currentLanguage.value = Language(locale.languageCode, locale.scriptCode ?? "", locale.languageCode);
    print(' valeu ' + state.currentLanguage.value.code.toString());
  }
}
