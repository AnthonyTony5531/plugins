import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/locales/th-th/th-th.dart';
import 'package:fast_ai/locales/vi-vn/vi-vn.dart';
import 'package:fast_ai/locales/zh-cn/zh-cn.dart';
import 'package:fast_ai/locales/en-us/en-us.dart';
import 'package:fast_ai/locales_new/zh-cn/zh-cn.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:fast_ai/locales/zh-tw/zh-tw.dart';

class Translations {
  Translations(this.locale);
  static Translations current;

  final Locale locale;
  static String _langCode; // zh-cn
  static Map _langMap = {};

  static String get defaultLang => AiLangType.cn;
  static String get langCode => _langCode ?? defaultLang;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static load(Locale locale) {
    //188没有国际化
    if(config.isGbet){
      locale = Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
    }    
    Translations localizations = new Translations(locale);
    String language =( locale.countryCode?.isEmpty??true )
        ? locale.languageCode
        : '${locale.languageCode}-${locale.countryCode}';
    setLang(language);
    current = localizations;

    return localizations;
  }

  static setLang(String language) {
    print('setLang ----> $language');
//    language = language.toLowerCase();
    _langCode = _localizedValues.containsKey(language) ? language : defaultLang;
    if(cmPackageConfig.timeZoneConfig.useDefault){
      cmPackageConfig.timeZoneConfig.selectTimeZoneWithLang(_langCode);
    }
    _langMap = _localizedValues[_langCode] ?? _localizedValues[defaultLang];
    // print('_langMap.hashCode=====${_langMap.hashCode}');
  }

  static Map<String, Map<String, dynamic>> get   _localizedValues =>  {
    AiLangType.cn : Api.IS_OPEN_KEYWORD ? zhCnNew : zhCn,
    AiLangType.tw : zhTw,
    AiLangType.en : enUs,
    AiLangType.th : thTh,
    AiLangType.vn : viVn,
  };

//  static Map<String, Map<String, dynamic>> _localizedValues = {
//    'zh-CN': Api.IS_OPEN_KEYWORD ? zhCnNew : zhCn,
//    'zh-TW': zhTw,
//    'en-US': enUs,
//    'th-TH': thTh,
//    'vi-VN': viVn,
//  };

  /// 支持的语言code: 文字，英语选择语言等UI显示
//  static Map<String, String> supportLang = {
//    'zh-CN': '简体中文',
//    'zh-TW': '繁體中文',
//    'en-US': 'English',
//    'th-TH': '泰语',
//    'vi-VN': '越南语',
//  };

  dynamic get langMap {
    return _langMap;
  }

  /// 暂支持新增/修改baseLang第一层，value为基本数据类型或者List Map
  static updateLangMap(String key, dynamic value){
    _langMap['baseLang'][key] = value;
  }

}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      [/*'en',*/ 'zh', 'tw'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<Translations>(Translations.load(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
