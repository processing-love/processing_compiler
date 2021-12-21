import 'package:get/get.dart';
import 'package:processing_compiler/devices/all_language.dart';

class SettingState {
  final Rx<Language> currentLanguage = Rx<Language>(
    Language('English', '英语', 'en'),
  );

  SettingState() {
    ///Initialize variables
  }
}
