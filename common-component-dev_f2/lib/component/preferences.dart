import 'dart:convert';
import 'package:common_component/component/conponent.dart';
import 'package:common_component/mvvm/model/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @ClassName: SCPreferencesService
/// @Description: 轻量数据持久化（String,int,double,bool,Map,List）
/// @Author: mustang
/// @CreateDate: 2020-11-13 18:41

class Preferences extends IComponent {
  SharedPreferences _spf;
  SharedPreferences get spf => _spf;
  _init() async {
    if (_spf == null) {
      _spf = await SharedPreferences.getInstance();
    }
  }

  double getDouble(String key) {
    return getValue(key);
  }

  int getInt(String key) {
    return getValue(key);
  }

  String getString(String key) {
    return getValue(key);
  }

  bool getBool(String key) {
    return getValue(key);
  }

  Map getMap(String key) {
    return getValue(key);
  }

  /// set 存储
  void setValue(String key, dynamic value) {
    String type = value.runtimeType.toString();

    switch (type) {
      case 'String':
        _spf.setString(key, value);
        break;
      case 'int':
        _spf.setInt(key, value);
        break;
      case 'double':
        _spf.setDouble(key, value);
        break;
      case 'bool':
        _spf.setBool(key, value);
        break;
      default:
        print("类型错误：type = $type");
        // logger.info('类型错误：type = $type');
        break;
    }
  }

  /// get 获取缓存
  dynamic getValue(String key) {
    if (!containsKey(key)) {
      return null;
    }
    dynamic value = _spf.get(key);

    return value;
  }

  /// remove 删除
  Future<bool> removeValue(String key) async {
    if (!containsKey(key)) {
      return false;
    } else {
      return _spf.remove(key);
    }
  }

  /// clear 清除所有
  Future<bool> clearAllValue() async {
    await _init();
    return _spf.clear();
  }

  bool containsKey(String key) {
    if (key == null || key.length <= 0) return false;

    return _spf.containsKey(key);
  }

  /// hasKey 是否存在key

  @override
  Future<void> init() async {
    await _init();
    return null;
  }
}
