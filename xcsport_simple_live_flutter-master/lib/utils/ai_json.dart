/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-23
 * 说明：从json中直接取数据
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:convert';

import 'package:fast_ai/module/common/config/timezone_config.dart';
import 'package:fast_ai/module/common/util/date_util.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/module/common/util/empty_util.dart' as empty_util;
import 'package:intl/intl.dart';

import '../config/config.dart';

class AiJson {
  dynamic json;
  AiJson(this.json);

  List<dynamic> getArray(String path) {
    var ret = getObject(path);
    if (ret == null) return [];
    if (ret is List) return ret;
    return [];
  }

  Map<String, dynamic> getMap(String path) {
    var ret = getObject(path);
    if (ret == null) return {};
    if (ret is Map) return ret;
    if (ret is String) {
      var m = jsonDecode(ret);
      if (m is Map) {
        return m;
      }
    }
    return {};
  }

  num getTimestamp(String path,
      {bool convert2local = false, num defaultValue = 0}) {

    num milliseconds = getNum(path, defaultValue: defaultValue ?? 0);
    try{
      String dateStr = getString(path,defaultValue: '');
      if(dateStr?.contains('-') ?? false){
        milliseconds = DateTime.parse('$dateStr').millisecondsSinceEpoch;
      }
    } catch(_){}

    if (milliseconds > 0 && convert2local && config.openTimeZoneOffset) {
      final serverDate = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      final localDate = convert2LocalTime(serverDate);
      return localDate.millisecondsSinceEpoch;
    }
    return milliseconds;
  }

  //将yyyy-MM-dd HH:mm转成本地时区时间
  String getDate(String path,
      {bool convert2local = false, String defaultValue = ''}) {
    var data = getString(path, defaultValue: defaultValue);
    if (!convert2local) {
      return data;
    }
    try {
      if (data.contains('-')) {
        DateTime serverDate;
        if (data.contains(':')) {
          if (data.split(':').length == 3) {
            serverDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
            return DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(convert2LocalTime(serverDate));
          } else {
            serverDate = DateFormat('yyyy-MM-dd HH:mm').parse(data);
            return DateFormat('yyyy-MM-dd HH:mm')
                .format(convert2LocalTime(serverDate));
          }
        } else {
          serverDate = DateFormat('yyyy-MM-dd').parse(data);
          return DateFormat('yyyy-MM-dd').format(convert2LocalTime(serverDate));
        }
      } else if (data.contains('/')) {
        DateTime serverDate;
        if (data.contains(':')) {
          if (data.split(':').length == 3) {
            serverDate = DateFormat('yyyy/MM/dd HH:mm:ss').parse(path);
            return DateFormat('yyyy/MM/dd HH:mm:ss')
                .format(convert2LocalTime(serverDate));
          } else {
            return DateFormat('yyyy/MM/dd HH:mm')
                .format(convert2LocalTime(serverDate));
          }
        } else {
          return DateFormat('yyyy/MM/dd').format(convert2LocalTime(serverDate));
        }
      }
    } catch (e, s) {
      print('getDate 解析失败:$s');
    }
    return '';
  }

  String getTimestampStr(String path,
      {bool convert2local = false, String defaultValue = '0'}) {
    //做下兼容，全部替换的情况下可能有bug。不知道是时间戳还是具体日历
    var date = getDate(path);
    if (!isStrNullOrEmpty(date) && date != '0') {
      return date;
    }
    var data = getString(path, defaultValue: defaultValue);
    num milliseconds = parseInt(data);
    if (!convert2local) {
      return milliseconds.toString();
    }
    if (milliseconds > 0 && convert2local) {
      final serverDate = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      final localDate = convert2LocalTime(serverDate);
      return localDate.millisecondsSinceEpoch.toString();
    }
    return '';
  }

  /// 返回相应字符串，如果为null返回''空字符串
  String getString(String path, {String defaultValue = ""}) {
    var ret = getObject(path);
    if (ret == null || empty_util.isEmpty(ret)) return defaultValue;
    return ret.toString();
  }

  num getNum(String path, {num defaultValue = 0}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is num) return ret;
    if (ret is String) return parseInt(ret);
    return defaultValue;
  }

  num getDouble(String path, {double defaultValue = 0.0}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is double) return ret;
    return double.tryParse(ret.toString()) ?? defaultValue;
  }

  bool getBool(String path, {bool defaultValue = false}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is bool) return ret;
    if (ret == 1 || ret == '1' || ret == 'true' || ret == 'yes' || ret == 'YES')
      return true;
    if (ret == 0 || ret == '0' || ret == 'false' || ret == 'no' || ret == 'NO')
      return false;
    return defaultValue;
  }

  String getMessage() {
    return getString("msg");
  }

  num getCode() {
    return getNum("code");
  }

  bool isSuccess() {
    return 200 == getCode();
  }

  //数据为空
  bool isEmpty() {
    return 404 == getCode();
  }

  //服务器异常或网络不通
  bool isError() {
    return 200 != getCode() && 404 != getCode();
  }

  dynamic getObject(String path) {
    if (isNullOrEmpty(path)) return json;

    var curJson = json;
    var names = path.split("."); //分解路径
    for (var name in names) {
      if (isNullOrEmpty(name)) {
        //路径为空
        //throw Exception("path=[$path] 异常，路径中有空");
        return null;
      } else if (curJson == null) {
        //查找不到数据了
        return null;
      } else if (name.startsWith("[") && name.endsWith("]")) {
        //数组索引
        var idxStr = name.substring(1, name.length - 1);
        var idx = int.tryParse(idxStr);
        if (idx == null) throw Exception("路径中有数组索引不是数字,idx=[$idxStr]");
        if (idx < 0) throw Exception("路径中有数组索引不能小于0,idx=[$idx]");
        if (idx > 100000000) throw Exception("路径中有数组索引过大,idx=[$idx]");
        if (!(curJson is List)) //不是数组类型,但要的是数组,返回null
          return null;
        var list = curJson as List<dynamic>;
        if (idx >= list.length) //超出数组，说明找不到了
          return null;
        curJson = list[idx]; //取到当前
      } else {
        //名字索引
        if (!(curJson is Map<String, dynamic>)) //不是map类型,但要的是map,返回null
          return null;
        var map = curJson as Map<String, dynamic>;
        curJson = map[name]; //取到当前
      }
    }
    return curJson;
  }
}
