import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/main.dart';
import 'package:timeago/timeago.dart';

/// @author u
/// @date 2020/6/12.
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => gAllSupportLanguage;
}

class DateMessage {
  final Map<String, LookupMessages> lookupMessagesMap = {
    'en': EnMessages(),
    'zh': ZhCnMessages(),
    'cht': ZhMessages(),
    'jp': JaMessages(),
    'spa': EsMessages(),
    'fra': FrMessages(),
    'de': DeMessages(),
    'it': ItMessages(),
    'kor': KoMessages(),
  };

  void buildCurrentDateMessage() {
    Locale locale = getCurrentLocale();
    setLocaleMessages(locale.languageCode,
        lookupMessagesMap[locale.languageCode] ?? EnMessages());
    setDefaultLocale(locale.languageCode);
  }
}
