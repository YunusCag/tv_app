import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languages/languages.dart';

class LocalizationService extends Translations {
  static LocalizationService instance = LocalizationService._();

  LocalizationService._();

  static Locale? get locale => Get.deviceLocale;
  static final Locale fallbackLocale = Locale('en', "US");
  List<Locale> languages = [
    Locale("en", "US"),
    Locale("tr", "TR"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'tr_TR': tr_TR,
      };

  void changeLanguage(String lang, String countryCode) {
    var isSupported = _checkLocaleSupported(lang, countryCode);
    if (isSupported) {
      var locale = Locale(lang, countryCode);
      Get.updateLocale(locale);
    }
  }

  bool _checkLocaleSupported(String lang, String countryCode) {
    for (Locale locale in languages) {
      if (lang == locale.languageCode && countryCode == locale.countryCode) {
        return true;
      }
    }
    return false;
  }
}
