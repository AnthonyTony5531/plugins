import 'dart:convert';

import 'package:common_component/mvvm/model/config/config.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/ai_json.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/utils/string_util.dart';

 const timeZoneJson = [
  {
    'lanCode': AiLangType.vn,
    'name':'th',
    'timeZoneOffset':  7,

  },
  {
    'lanCode': AiLangType.th,
    'name':'vi',
    'timeZoneOffset':  7,
  },
  {
    'lanCode': AiLangType.cn,
    'name':'cn',
    'timeZoneOffset':  8,
  }
];



//时间区
class TimeZoneConfig extends IConfig {
  TimeZoneSettingData _timeZoneSettingData;
  List<TimeZoneSettingData> _supportTimeZones = [];



  List<TimeZoneSettingData> getSupportTimeZones(){
    return List.generate(_supportTimeZones.length, (index) => _supportTimeZones[index]);
  }


  // TimeZoneSettingData get timeZoneSettingData => _timeZoneSettingData;
  TimeZoneSettingData get timeZoneSettingData => TimeZoneSettingData(lanCode: '', name: '', timeZoneOffset: DateTime.now().timeZoneOffset.inHours);
  Duration  get timeZoneOffset => Duration(hours: timeZoneSettingData.timeZoneOffset);
  static const String _TimeZoneOffsetKey = "timeZoneOffset";

  @override
  String get name => 'flutter_common_timezone_config';

  @override
  Future<void> init() async {
    await super.init();
    _init();
  }
  void _init(){
    if(_supportTimeZones.isNotEmpty) return;
    _supportTimeZones = timeZoneJson.map((e) => TimeZoneSettingData.fromJsonStr(jsonEncode(e))).toList();
    _timeZoneSettingData = TimeZoneSettingData.fromJsonStr(ccCache.getString(
        _TimeZoneOffsetKey, TimeZoneSettingData(
      lanCode: '',
      name: '',
      timeZoneOffset: DateTime.now().timeZoneOffset.inHours,
    ).toJsonStr()));
  }


  //如果没设置过市区，name为空。需要设置语言的时候设置
  bool get useDefault {
    if(_timeZoneSettingData == null){
      _init();
    }
    return _timeZoneSettingData?.lanCode?.isEmpty??true;
  }


  void selectTimeZoneWithLang(String lang){
    if(_supportTimeZones.isEmpty){
      _init();
    }
    this.timeZoneSettingData  =   _supportTimeZones.firstWhere((element) => lang == element.lanCode ,orElse: (){
      return _supportTimeZones.firstWhere((element) => element.lanCode == AiLangType.cn);
    });
  }

  set timeZoneSettingData(TimeZoneSettingData data) {
    _timeZoneSettingData = data;
    ccCache.setString(_TimeZoneOffsetKey, data.toJsonStr());
  }
}

class TimeZoneSettingData {
  String lanCode;
  String name;
  num timeZoneOffset;

  TimeZoneSettingData({this.lanCode='', this.name, this.timeZoneOffset});

  TimeZoneSettingData.fromJsonStr(String jsonstr) {
    var map = jsonDecode(jsonstr);
    lanCode = map['lanCode']??'';
    name = map['name']??'';
    timeZoneOffset = map['timeZoneOffset'];
  }

  String get showName => new AiJson(config.baseLang).getString('page.timeZone.$name');

  dynamic toJsonStr() {
    return jsonEncode({
      'lanCode': lanCode,
      'name': name,
      'timeZoneOffset': timeZoneOffset,
    });
  }
}

DateTime convert2LocalTime(DateTime time) {
  final dateTime = time.subtract(Duration(hours: 8));//toUtc
  final localDateTime = dateTime.add(cmPackageConfig.timeZoneConfig.timeZoneOffset); // to local time
  return localDateTime;
}

num convert2ServerTimeStamp(num time, {bool convert2local = false}) {
  if(isEmpty(time) || !convert2local){
    return time;
  }
  return convert2ServerTime(DateTime.fromMillisecondsSinceEpoch(time)).millisecondsSinceEpoch;
}

String convert2ServerTimeStampStr(String time, {bool convert2local = false}) {
  if(isEmpty(time)|| !convert2local){
    return time;
  }
  return convert2ServerTime(DateTime.fromMillisecondsSinceEpoch(parseInt(time))).millisecondsSinceEpoch.toString();
}

DateTime convert2ServerTime(DateTime time) {
  final dateTime = time.subtract(cmPackageConfig.timeZoneConfig.timeZoneOffset);//toUtc
  final localDateTime = dateTime.add(Duration(hours: 8));//to beiJin time
  return localDateTime;
}
