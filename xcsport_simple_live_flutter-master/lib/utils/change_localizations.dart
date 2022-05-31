/// 用来应用内切换
import 'package:flutter/material.dart';
import 'package:fast_ai/utils/translations.dart';

class CurrentLocale with ChangeNotifier {
  Locale _locale = const Locale('zh', 'CN');

  Locale get value => _locale;
  void setLocale(Locale locale) {
    _locale = locale;

    Translations.setLang(locale.languageCode);

//    if (locale.countryCode == 'TW') {
//      Translations.setLang('zh-TW');
//    } else if (locale.countryCode == 'CN') {
//      Translations.setLang('zh-CN');
//    } else if (locale.countryCode == 'US') {
//      Translations.setLang('en-US');
//    } else if (locale.countryCode == 'TH') {
//      Translations.setLang('th-TH');
//    } else if (locale.countryCode == 'VN') {
//      Translations.setLang('vi-VN');
//    } else {
//      Translations.setLang('zh-CN');
//    }
    notifyListeners();
  }
}
