/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-23
 * 说明：从json中直接取数据
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:convert';



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
    if(ret is String){
      var m = jsonDecode(ret);
      if(m is Map){
        return m;
      }
    }
    return {};
  }

   dynamic operator [](String path) {
    return getObject(path);
  } 


  /// 返回相应字符串，如果为null返回''空字符串
  String getString(String path, {String defaultValue = ""}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    return _value(ret.toString(), defaultVal: defaultValue);
  }

  num getNum(String path, {num defaultValue = 0}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is num) return ret;
    if(ret is String)return parseNum(ret);
    return defaultValue;
  }

  num getDouble(String path, {double defaultValue = 0.0}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is double) return ret;
    return double.tryParse(ret.toString())??defaultValue;
  }

  bool getBool(String path, {bool defaultValue = false}) {
    var ret = getObject(path);
    if (ret == null) return defaultValue;
    if (ret is bool) return ret;
    return defaultValue;
  }


  dynamic getObject(String path) {
    if ((path??'').isEmpty) return json;

    var curJson = json;
    var names = path.split("."); //分解路径
    for (var name in names) {
      if ((name??'').isEmpty) {
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


  static String _value(String value, {String defaultVal = ''}) {
    return (value ?? '').isNotEmpty || 'null' == (value ?? '').trim() ? value : defaultVal;
  }

    static num parseNum(String source, {int defaultVal = 0}) {
    if (null == source) return defaultVal;
    return num.tryParse(_value(source, defaultVal: '0')) ?? defaultVal;
  }
}
