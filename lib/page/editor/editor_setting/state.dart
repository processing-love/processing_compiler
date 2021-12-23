import 'package:get/get.dart';
import 'package:processing_compiler/devices/all_language.dart';

class EditorSettingState {
  Rx<Language> currentLanguage = Rx<Language>(
    Language('English', '英语', 'en'),
  );

  EditorSettingState() {
    ///Initialize variables
  }
}
