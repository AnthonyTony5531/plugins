import 'dart:convert';

import "package:fast_ai/utils/ai_image.dart";
/*
*********************************************************************
 * author:Sam
 * date:2019-12-12
 **********************************************************************
 */

import 'dart:math';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'ai_measure.dart';

String string(String value, {String defaultVal = ''}) {
  return (value ?? '').isNotEmpty || 'null' == (value ?? '').trim() ? value : defaultVal;
}

String cnString(String value){
  if(config.isTwLang){
    return config.langConfig.transToTwText(cnString: string(value));
  }
  return string(value);
}

String intStr(String value, {String defaultVal = ''}) {
  return string(value, defaultVal: defaultVal)
      .replaceAll(RegExp(r'[\.]+[0-9]+'), '')
      .replaceAll(RegExp(r'[A-Za-z]*'), '');
}

String maxIntStr(List<String> arrays, {String defaultVal = ''}) {
  if (isEmpty(strings(arrays, defaultVal: ''))) return defaultVal;
  num i;
  arrays.forEach((element) {
    if (isNotEmpty(element)) {
      num value = parseInt(intStr(element));
      i = max(value, i ?? 0);
    }
  });
  return '${i ?? defaultVal}';
}

String timeString(String value, {String defaultVal = ''}) {
  return string(value, defaultVal: defaultVal).replaceAll(RegExp(r'[A-Za-z]*'), '').replaceAll('^', '');
}

// String homeTeamX =   map["homeTeamAbbr"]??map["homeTeam"];
// //或
//  String homeTeamXX =      AiJson(map).getString("homeTeamAbbr", defaultValue: AiJson(map).getString("homeTeamAbbr", defaultValue:"homeTeam" ));
// 以上2种写法都存在bug，为了解决这种问题，提供如下的方法
//  String homeTeam =   strings([map["homeTeamAbbr"],map["homeTeam"]]);
//取values中前面的字符串，如果有值就返回.如果没有就取默认值。如strings(["shortName","name", "nickName"])
String strings(List<String> values, {String defaultVal = ''}) {
  final len = values.length;
  for (int i = 0; i < len; i++) {
    final temp = values[i];
    if (isNotEmpty(temp)) {
      return temp;
    }
  }
  return defaultVal;
}

//needPlus 是否添加+ , 如+1这种, fixed 保留多少小数
String numString(num value, {String defaultVal = '', bool needPlus = false, String pre, int fixed = 2}) {
  return null == value
      ? defaultVal
      : '${null != pre ? pre : ''}${needPlus && value > 0 ? '+' : ''}${null == fixed ? '$value' : value.toStringAsFixed(fixed)}';
}

//判断一个值是否为空
bool isNotEmpty(dynamic data) {
  if (null == data) return false;
  if (data is String) return string(data).isNotEmpty;
  try {
    return data.isNotEmpty ?? false;
  } catch (e) {}
  return false;
}

bool isEmpty(dynamic data) {
  if (null == data) return true;
  if (data is String) return string(data).isEmpty;
  try {
    return data.isEmpty ?? false;
  } catch (e) {}
  return false;
}

bool isAllEmpty(List data) {
  return isEmpty(data.where((f) => isNotEmpty(f)));
}

bool isAllNotEmpty(List data) {
  return isNotEmpty(data.where((f) => isNotEmpty(f)));
}

int parseInt(String source, {int defaultVal = 0}) {
  if (null == source) return defaultVal;
  return int.tryParse(string(source, defaultVal: '0')) ?? defaultVal;
}

double parseDouble(String source, {double defaultVal = 0.0}) {
  if (null == source) return defaultVal;
  return double.tryParse(string(source, defaultVal: '0.0')) ?? defaultVal;
}

String centerStringIfNeed(String text, {double fontSize = 14, double width = 300}) {
  bool needNextLine = AiMeasure.measureTextLineIsExceed(text, AiTextStyle(fontSize: fontSize), width, 1);
  if (needNextLine) {
    text = centerString(text);
  }
  return text;
}

String removeEmojiText(String text) {
  StringBuffer stringBuffer = new StringBuffer();
  int i = 0;
  text.runes.forEach((f) {
    //如果是表情长度会大于5
    if (f.toString().length < 6) {
      stringBuffer.write(text.substring(i, i + 1));
    }
    i++;
  });
  return stringBuffer.toString();
}

String centerString(String text) {
  return "${text.substring(0, text.length ~/ 2)}\n${text.substring(text.length ~/ 2, text.length)}";
}

///单行文本在给定最大宽度内检查overflow
String checkTextOverflow(BuildContext context, String str, TextStyle textStyle, double maxWidth) {
  if (str == null) {
    return '';
  }
  double totalLen = AiMeasure.measureText(str, textStyle).width * MediaQuery.of(context).textScaleFactor;
  if (totalLen <= maxWidth) {
    return str;
  }
  int len = str.length;
  String rst = '';
  for (int i = 0; i < len; i++) {
    double l = AiMeasure.measureText('${str.substring(0, i + 1)}...', textStyle).width *
        MediaQuery.of(context).textScaleFactor;
    if (l > maxWidth) {
      break;
    }
    rst = '${str.substring(0, i + 1)}...';
  }
  return rst;
}

String maxLengthString(String text, int length) {
  if (text == null) return '';
  else if (text.length <= length) return text;
  else return '${text.substring(0, length)}...';
}

String formatNum(Object value) {
  if (value is num)
    return value?.toStringAsFixed(2) ?? '';
  else if (value is String) {
    var v = num.tryParse(value);
    return v?.toStringAsFixed(2) ?? '';
  }
  return value;
}

enum GameType {
  ALL,
  FT,
  BK,
  TN, //网球
  OP_DJ, //电竞
  BS, //棒球
  BK_AFT, //美式足球
  OP_RL, //橄榄球联盟
  OP_RU, //橄榄球
  OP_IH, //冰球
  OP_HB, //手球
  OP_SN, //斯诺克
  OP_BO, //拳击
  OP_MMA, //综合格斗
  OP_DR, //飞镖
  OP_TN, //乒乓球
  OP_VB, //排球
  OP_BM, //羽毛球
  OP_MS, //赛车
  OP_FH, //曲棍球
  OP_FB, //地板球
  OP_BV, //沙滩排球
  OP_CK, //板球
  OP_CY, //自行车赛
  OP_GF, //高尔夫
  OP_GH, //赛狗
  OP_HR, //赛马
  OP_LO, //'彩票',
  OP_JR, //'金融投注',
  OP_SB, //':'垒球',
  OP_OF, //':'水球',
  OP_FU, //':'室内足球',
  OP_GY, //':'体操',
  OP_TAF, //':'田径',
  OP_SS, //':'帆船',
  OP_SW, //':'游泳',

}

GameType parse2GameType(String gameType) {
  GameType value = GameType.FT;
  try {
    value = GameType.values.firstWhere((e) => e.toString() == "GameType.$gameType");
  } catch (e, s) {}
  return value;
}

String gameType2String(GameType gameType) {
  return gameType.toString().split('.')[1];
}

//bool containGameTypesSelected(List<GameType> gameTypes) {
//  return gameTypes.contains(getCurrentSelectedGameType());
//}

//bool uncontainGameTypesSelected(List<GameType> gameTypes) {
//  return !gameTypes.contains(getCurrentSelectedGameType());
//}

//GameType getCurrentSelectedGameType() => parse2GameType(config.userInfo.sportType);

void setCurrentSelectedGameType(String gameType) {
//  config.userInfo.sportType = gameType;
}

// 不需要四舍五入 number 保留几位小数
String configNumString(String contributeValue,{int number = 2}) {
  if (isStrNullOrEmpty(contributeValue)) return double.tryParse('0.0').toStringAsFixed(number);
  if (contributeValue.contains('.')) {
    List<String> list = contributeValue.split('.');
    String last = list.last;
    if (last.length > number) {
      contributeValue = '${list.first}.${last.substring(0,number)}';
    } else if (last.length < number){
      contributeValue = double.tryParse(contributeValue).toStringAsFixed(number);
    } else {

    }
  } else {
    contributeValue = double.tryParse(contributeValue).toStringAsFixed(number);
  }
  return contributeValue;
}

/// 获取当前语言文案
String getCurrentLanText(dynamic strOrMap, [String defaultText]) {
  if(strOrMap == null || (!(strOrMap is String) && !(strOrMap is Map))) return defaultText;

  Map map;
  if(strOrMap is String) {
    try{
      map = jsonDecode(strOrMap);
    }
    catch(e) {
      map = {};
      print('00-getCurrentLanText-${strOrMap?.toString()}, JSON格式化失败，error=${e?.toString()}');
    }
  } else {
    map = strOrMap as Map;
  }
  return map[Translations.langCode] ?? defaultText;
}
