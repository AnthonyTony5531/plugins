import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/widgets/ai_webview.dart';
import 'package:crypto/crypto.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';

const String kDatePatternFull = 'yyyy-MM-dd HH:mm:ss';
const String kDatePatternDate = 'yyyy-MM-dd';
const String kDatePatternTime = 'HH:mm:ss';

Map get baseLang => config.langMap['baseLang'];

Future sleep(time, [FutureOr<dynamic> computation()]) async {
  await Future.delayed(Duration(milliseconds: time), computation);
}

//字符串是否为空
isNullOrEmpty(String str) {
  if (str == null) return true;
  return str.isEmpty;
}

isStrNullOrEmpty(dynamic str) {
  if (str == null || str == '') return true;
  return false;
}

// 金额19,123,120
String getSegmentationMoney(String money){
  if(isStrNullOrEmpty(money) || money.length <= 3){
    return money;
  }
  List<String> moneys = money?.split('')?.reversed?.toList();
  String value = '';
  for(int index = 0; index < money.length; index ++ ){
    value = moneys[index] + value;
    if((index + 1) % 3 == 0 && (index + 1) < money.length){
      value = ',' + value;
    }
  }
  return value;
}

//是否虚拟比赛
bool isMatchVirtual(String match) {
  if (match == null) {
    return false;
  }
  if (match.startsWith('vi') || match.startsWith('VI')) {
    return true;
  }
  return false;
}

String errorCodeMsg({String codeType, String code1, String code2}) {
  String msg = '';
  if (codeType == 'pw-ecode') {
    msg = baseLang[codeType][code1] != null
        ? baseLang[codeType][code1][code2]
        : config.langMap['baseLang']['networkError']['netWorkOverTime'];
  }
  // else if(codeType == 'ecode'){

  // }
  return msg;
}

//用于webview的url
String getWebUrl(String url,{bool isJointLang = true}) {
  String urlStr = '';
  if (url.isNotEmpty) {
    if (url.startsWith('http')) {
      urlStr = url;
    } else {
      urlStr = Api.baseMainUrl + '/' + url;
    }
    if(isJointLang){ // 小游戏不需要拼接lang,否则里面加载失败
      if(!urlStr.contains('lang')){
        if(urlStr.contains('?')){
          urlStr += '&lang=${Translations.langCode}';
        }else{
          urlStr += '?lang=${Translations.langCode}';
        }
      }
    }
  }
  urlStr = urlStr.replaceAll('//', '/').replaceAll(':/', '://');
  return urlStr;
}

//跳转到webview
void goWebView(BuildContext context, {String url, String title, VoidCallback goBack}) {
  if (isNullOrEmpty(url)) return;
  bool isForum = url.toLowerCase().contains('dataview/forum');
  if (isForum) {
    //论坛需要登录
    if (Hooks.ins.isBlocked(HookName.ForumPage, {})) return;
  }
  //BUG:23956 iOS手机从app端进入帖子详情页后，使用左滑直接返回到app首页了
  if(isForum){
    showSystemDefaultMaterialPageRoute(
        context,
        AiWebView(
          url: url,
          title: title,
        ),settings: RouteSettings(name: AiRouter.AiWebViewPage)).then((value){
      goBack?.call();
    });
  }
  else{
    showMaterialPageRoute(
        context,
        AiWebView(
          url: url,
          title: title,
        ),settings: RouteSettings(name: AiRouter.AiWebViewPage)).then((value){
      goBack?.call();
    });
  }

}

// //转成时间格式
// DateTime fromTimestamp(num timestamp){
//   return new DateTime.fromMillisecondsSinceEpoch(timestamp);
// }

// //转成时间搓
// num fromDateTime(DateTime dateTime){
//   return dateTime.millisecondsSinceEpoch;
// }

//早餐 日期格式转换
String dateFormatV2(DateTime dateTime, [bool onlyDate = false]) {
  // 新增,国际版直接返回 月-日 时间
  if(config.isInternational && config.isNotCnTwLang){
    return  DateFormat("MM/dd").format(dateTime);
  }

  var now = DateTime.now();
  var today = DateTime(now.year, now.month, now.day);
  var dest = DateTime(dateTime.year, dateTime.month, dateTime.day);

  var dur = dest.difference(today);
  int days = dur.inDays;
  var dateStr = "";
  if (days == 0) {
    dateStr = config.langMap['baseLang']['utils']['date']['today'];
  } else if (days == 1) {
    dateStr = config.langMap['baseLang']['utils']['date']['tomorrow'];
  } else if (days == 2) {
    dateStr = config.langMap['baseLang']['utils']['date']['dayAfterTomorrow'];
  } else if (days == -1) {
    dateStr = config.langMap['baseLang']['utils']['date']['yesterday'];
  } else if (days == -2) {
    dateStr = config.langMap['baseLang']['utils']['date']['dayBeforeYesterday'];
  } else {
    dateStr = DateFormat("MM/dd").format(dateTime);
  }

  if (onlyDate) {
    return dateStr;
  } else {
    final fmt = DateFormat("HH:mm").format(dateTime);
    return '$dateStr $fmt';
  }
}

//早餐 日期格式转换
String dateFormatNoDays(DateTime dateTime, [bool onlyDate = false]) {
  // 新增,国际版直接返回 月-日 时间
  if(config.isInternational && config.isNotCnTwLang){
    return DateFormat("MM-dd HH:mm").format(dateTime);
  }

  var dateStr = DateFormat("MM-dd").format(dateTime);

  if (onlyDate) {
    return dateStr;
  } else {
    final fmt = DateFormat("HH:mm").format(dateTime);
    return '$dateStr $fmt';
  }
}

//早餐 日期格式转换
String dateFormat(DateTime dateTime, [bool onlyDate = false]) {
  // 新增,国际版直接返回 月-日 时间
  if(config.isInternational && config.isNotCnTwLang){
    return  DateFormat("MM-dd HH:mm").format(dateTime);
  }

  var now = DateTime.now();
  var today = DateTime(now.year, now.month, now.day);
  var dest = DateTime(dateTime.year, dateTime.month, dateTime.day);

  var dur = dest.difference(today);
  int days = dur.inDays;
  var dateStr = "";
  if (days == 0) {
    dateStr = config.langMap['baseLang']['utils']['date']['today'];
  } else if (days == 1) {
    dateStr = config.langMap['baseLang']['utils']['date']['tomorrow'];
  } else if (days == 2) {
    dateStr = config.langMap['baseLang']['utils']['date']['dayAfterTomorrow'];
  } else if (days == -1) {
    dateStr = config.langMap['baseLang']['utils']['date']['yesterday'];
  } else if (days == -2) {
    dateStr = config.langMap['baseLang']['utils']['date']['dayBeforeYesterday'];
  } else {
    dateStr = DateFormat("MM-dd").format(dateTime);
  }
  // print('时间----:$dateStr');

  if (onlyDate) {
    return dateStr;
  } else {
    final fmt = DateFormat("HH:mm").format(dateTime);
    return '$dateStr $fmt';
  }
}

//今日 时间格式转换
String timeFormat(DateTime dateTime) {
  var fmt = DateFormat("HH:mm");
  return fmt.format(dateTime);
}

String datetimeFormat(int time, String format) {
  if (null == time || format == '') return '';
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat(format);
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM月dd日");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd2(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM-dd");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd3(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM/dd");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd_hh_mm4(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM/dd HH:mm");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String HH_mm(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("HH:mm");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String yyyy_MM_dd(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("yyyy-MM-dd");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_ddAsChina(int time, {bool userInternational = false}) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat(userInternational ? "MM-dd" : "MM月dd日");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String yyyy_MM_dd2(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("yyyy/MM/dd");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String yyyyMMdd(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("yyyyMMdd");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String yyyy_MM_dd_HH_mm_ss(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("yyyy-MM-dd HH:mm:ss");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String yyyy_MM_dd_HH_mm(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("yyyy-MM-dd HH:mm");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String convert2Md5(String value) {
  var data = md5.convert(new Utf8Encoder().convert(value));
  return data.toString();
}

String mm_ss(int time) {
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("mm:ss");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd_HH_mm(int time) {
  if (null == time || 0 == time) return '';
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM/dd HH:mm");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MM_dd_HH_mm2(int time) {
  if (null == time || 0 == time) return '';
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("MM-dd HH:mm");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String MHH_mm_ss_SSSS(int time) {
  if (null == time || 0 == time) return '';
  try {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    var fmt = DateFormat("HH:mm:ss.SSS");
    return fmt.format(dateTime);
  } catch (e) {}
  return '';
}

String weekFormat(DateTime dateTime) {
  var weeks = [
    '${config.langMap['baseLang']['week']['mon']}',
    '${config.langMap['baseLang']['week']['tue']}',
    '${config.langMap['baseLang']['week']['wed']}',
    '${config.langMap['baseLang']['week']['thu']}',
    '${config.langMap['baseLang']['week']['fri']}',
    '${config.langMap['baseLang']['week']['sat']}',
    '${config.langMap['baseLang']['week']['sun']}'
  ];
  return weeks[dateTime.weekday - 1];
}

String weekFormat2(DateTime dateTime) {
  var weeks = [
    '${config.langMap['baseLang']['utils']['week']['cycle']['mon']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['tue']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['wed']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['thu']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['fri']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['sat']}',
    '${config.langMap['baseLang']['utils']['week']['cycle']['sun']}'
  ];
  return weeks[dateTime.weekday - 1];
}

Future vibrateImpact(
    {String type = 'feedback',
    FeedbackType feedbackType = FeedbackType.impact}) async {
  try {
    if (io.Platform.isAndroid) {
      var canVibrate = await Vibrate.canVibrate;
      if (canVibrate) {
        Vibrate.vibrate();
      }
    } else {
      var canVibrate = await Vibrate.canVibrate;
      if (canVibrate) {
        if (type == 'feedback') {
          Vibrate.feedback(feedbackType);
        } else if (type == 'vibrate') {
          Vibrate.vibrate();
        } else {
          Vibrate.feedback(FeedbackType.impact);
        }
      } else if (io.Platform.isAndroid) {
        if (type == 'vibrate') {
          HapticFeedback.vibrate();
        }
      }
    }
  } catch (e) {
    logError(e);
  }
}

String errorMsgFormat(int code, {String msg = '网络异常,请稍后再试~'}) {
  switch (code) {
    case 205:
      msg =
          config.langMap['baseLang']['utils']['errorMsgFormat']['loginFailed'];
      break;
    case 204:
      msg =
          config.langMap['baseLang']['utils']['errorMsgFormat']['loginFailed'];
      break;
    case 701016:
    case 701017:
    case 701019:
      {
        msg =
            config.langMap['baseLang']['utils']['errorMsgFormat']['repairing'];
        break;
      }
    case 901008:
      {
        msg =
            config.langMap['baseLang']['utils']['errorMsgFormat']['loginDeny'];
        break;
      }
    default:
      msg = config.langMap['baseLang']['utils']['errorMsgFormat']['default'];
      break;
  }
  return msg;
}

String balanceFormat(String balance) {
  // return balance;
  if (balance == '-') {
    return balance;
  }

  String fmt =
      balance == null || balance == '' || balance == ' ' || balance == 'null'
          ? '0'
          : balance;
  double b = double.parse(fmt);
  //print('balance is int ${balance is int}, balance is string ${balance is String} balance=$balance b=$b');

  if (b > 1000000 && b < 100000000) {
    //100W-1亿
    fmt = sprintf(
        '%.4f${config.langMap['baseLang']['utils']['balanceUnit']['tenThousand']}',
        [b / 10000]);
  } else if (b > 100000000) {
    fmt = sprintf(
        '%.4f${config.langMap['baseLang']['utils']['balanceUnit']['billion']}',
        [b / 100000000]);
  } else {
    fmt = sprintf('%.2f', [b]);
  }
  return fmt;
}

String hotNumFormat(String strNum) {
  String fmt = isStrNullOrEmpty(strNum) ? '0' : strNum;
  double b = double.parse(fmt);

  if (b >= 10000) {
    fmt = sprintf(
        '%.1f${config.langMap['baseLang']['utils']['balanceUnit']['tenThousand']}',
        [b / 10000]);
  }
  return fmt;
}

String supportRate(int rate) {
  double dRate = rate / 100.0;
  if (dRate == 100.0) {
    return sprintf('%.0f', [dRate]);
  }
  return sprintf('%.0f', [dRate]);
}

double toDouble(dynamic num) {
  try {
    if (num != null && num is String) {
      return double.parse(num);
    } else if (num != null && num is int) {
      return num.toDouble();
    } else if (num != null && num is double) {
      return num;
    } else {
      return null;
    }
  } catch (_) {
    return null;
  }
}

bool hasChineseChars(String content) {
  return RegExp("[\u4e00-\u9fa5]").firstMatch(content) != null;
}

Color hexToColor(String hexString, {Color defaultColor}) {
  /// hexString #99aabb
  if((hexString?.length ?? 0) != 7) {
    print('色值配置不正确：$hexString');
    return defaultColor;
  }
  print('00-配置色值：$hexString');
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}

Function debounce(Function fn, [int t = 30]) {
    Timer _debounce;
    return () {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(Duration(milliseconds: t), () {
        fn();
      });
    };
  }