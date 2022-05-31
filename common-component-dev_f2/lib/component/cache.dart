import 'dart:convert';
import 'package:common_component/component/conponent.dart';
import 'package:common_component/component/preferences.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/listeners/name_listener.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';

/// @author king
/// @date 2020-11-30
/// 2级缓存工具类。使用的'最近使用原则'实现的存储的类。高效管理读写
///
class Cache extends IComponent {
  static final String _Key = "common_component.Cache.CacheKeys";
  bool isDebug = false;

  static final int _len = 168000; //内存活跃总数
  final caches = <String, CacheNode>{}; //所有的node节点
  CacheNode _first; //头节点
  CacheNode _last; //尾节点
  final Lock _lock = new Lock();
  var ev = NameListener();

  bool containsKey(String key) {
    return caches.containsKey(key) || _preferences.containsKey(key);
  }

  void setValue(String key, dynamic value,
      {bool needNotify = false, bool needSaveKey = false}) {
    if (needSaveKey) {
      _updateKeys(key);
    }
    _put2Memory(key, value);
    // print('本地cache fire ===> $key: $value');
    Future(() {
      if (null != value) {
        var diskValue = _preferences.getValue(key);
        if (diskValue != value) {
          if (needNotify) {
            ev.fire(key);
          }
          _preferences.setValue(key, value);
        }
      }
    });
  }

  //保存key 列表
  void _updateKeys(String key) async {
    _lock.synchronized(() async {
      String json = _preferences.getString(_Key);
      var list = [];
      if (null != json && json.isNotEmpty) {
        list = jsonDecode(json);
        list.add(key);
      }
      String arrayValueStr = jsonEncode(list);
      _preferences.setValue(_Key, arrayValueStr);
    });
  }

  //获取所有已经保存过的key,没有指定needSaveKey，不会存在这里
  Future<List<dynamic>> getKeys() async {
    return await _lock.synchronized(() async {
      try {
        String json = _preferences.getString(_Key);
        if (null != json && json.isNotEmpty) {
          List<dynamic> list = jsonDecode(json);
          return list;
        }
      } catch (e) {
        print(e);
      }
      return [];
    });
  }

  void setString(String key, String value,
      {bool needNotify = false, bool needSaveKey = false}) {
    setValue(key, value, needNotify: needNotify, needSaveKey: needNotify);
  }

  void setStrings(String key, List<String> values,
      {bool needNotify = false, bool needSaveKey = false}) {
    try {
      setString(key, jsonEncode(values),
          needNotify: needNotify, needSaveKey: needSaveKey);
    } catch (e) {}
  }

  List<String> getStrings(
    String key,
    List<String> defaultVal,
  ) {
    List<String> data = [];
    try {
      String value = getString(key, null);
      if (null == value) return defaultVal;
      List<dynamic> list = jsonDecode(value);
      return <String>[]..addAll(list.map<String>((f) => f));
    } catch (e) {
      data = defaultVal;
    }
    return data ?? defaultVal;
  }

  void setInt(String key, num value,
      {bool needNotify = false, bool needSaveKey = false}) {
    setValue(key, value, needSaveKey: needSaveKey, needNotify: needNotify);
  }

  void setIntList(String key, List<int> value,
      {bool needNotify = false, bool needSaveKey = false}) {
    try {
      setString(key, jsonEncode(value),
          needSaveKey: needSaveKey, needNotify: needNotify);
    } catch (e) {}
  }

  List<num> getIntList(String key, List<int> defaultVal) {
    List<num> data = [];
    try {
      String value = getString(key, null);
      if (null == value) return defaultVal;
      List<dynamic> list = jsonDecode(value);
      return <int>[]..addAll(list.map<int>((f) => f));
    } catch (e) {
      data = defaultVal;
    }
    return data ?? defaultVal;
  }

  void setNum(String key, num value,
      {bool needNotify = false, bool needSaveKey = false}) {
    setValue(key, value, needNotify: needNotify, needSaveKey: needSaveKey);
  }

  void setNumList(
    String key,
    List<num> value, {
    bool needNotify = false,
    bool needSaveKey = false,
  }) {
    try {
      setString(key, jsonEncode(value),
          needSaveKey: needSaveKey, needNotify: needNotify);
    } catch (e) {}
  }

  List<num> getNumList(String key, List<num> defaultVal) {
    List<num> data = [];
    try {
      String value = getString(key, null);
      if (null == value) return defaultVal;
      List<dynamic> list = jsonDecode(value);
      return <num>[]..addAll(list.map<num>((f) => f));
    } catch (e) {
      data = defaultVal;
    }
    return data ?? defaultVal;
  }

  void setBool(String key, bool value,
      {bool needNotify = false, bool needSaveKey = false}) {
    setValue(key, value, needNotify: needNotify, needSaveKey: needSaveKey);
  }

  void setBoolList(String key, List<bool> value,
      {bool needNotify = false, bool needSaveKey = false}) {
    try {
      setString(key, jsonEncode(value),
          needSaveKey: needSaveKey, needNotify: needNotify);
    } catch (e) {}
  }

  List<bool> getBoolList(String key, List<bool> defaultVal) {
    List<bool> data = [];
    try {
      String value = getString(key, null);
      if (null == value) return defaultVal;
      List<dynamic> list = jsonDecode(value);
      return <bool>[]..addAll(list.map<bool>((f) => f));
    } catch (e) {
      data = defaultVal;
    }
    return data ?? defaultVal;
  }

  void setDouble(String key, double value,
      {bool needNotify = false, bool needSaveKey = false}) {
    setValue(key, value, needSaveKey: needSaveKey, needNotify: needNotify);
  }

  void setDoubleList(String key, List<num> value,
      {bool needNotify = false, bool needSaveKey = false}) {
    try {
      setString(key, jsonEncode(value),
          needSaveKey: needSaveKey, needNotify: needNotify);
    } catch (e) {}
  }

  List<double> getDoubleList(String key, List<double> defaultVal) {
    List<double> data = [];
    try {
      String value = getString(key, null);
      if (null == value) return defaultVal;
      List<dynamic> list = jsonDecode(value);
      return <double>[]..addAll(list.map<double>((f) => f));
    } catch (e) {
      data = defaultVal;
    }
    return data ?? defaultVal;
  }

  String getString(String key, String defaultVal) {
    return get<String>(key) ?? defaultVal;
  }

  bool getBool(String key, bool defaultVal) {
    return get<bool>(key) ?? defaultVal;
  }

  double getDouble(String key, double defaultVal) {
    return get<double>(key) ?? defaultVal;
  }

  num getNum(String key, num defaultVal) {
    return get<num>(key) ?? defaultVal;
  }

  dynamic getValue(String key) {
    return get(key);
  }

  void _put2Memory(String key, dynamic value) {
    CacheNode node = caches[key];
    //如果新元素
    if (node == null) {
      //如果超过元素容纳量
      if (caches.length >= _len) {
        //移除最后一个节点
        caches.remove(_last.key);
        _remove_last();
      }
      //创建新节点
      node = new CacheNode(key, value);
      caches[key] = node;
    } else {
      //已经存在的元素覆盖旧值
      node.value = value;
    }
    //把元素移动到首部
    _move2first(node);
  }

  void clear() {
    _first = null;
    _last = null;
    caches.clear();
    _preferences.clearAllValue();
  }

  void _remove_last() {
    if (_last != null) {
      _last = _last.pre;
      if (_last == null) {
        _first = null;
      } else {
        _last.next = null;
      }
    }
  }

  void _move2first(CacheNode node) {
    if (_first == node) {
      return;
    }
    if (node.next != null) {
      node.next.pre = node.pre;
    }
    if (node.pre != null) {
      node.pre.next = node.next;
    }
    if (node == _last) {
      _last = _last.pre;
    }
    if (_first == null || _last == null) {
      _first = _last = node;
      return;
    }
    node.next = _first;
    _first.pre = node;
    _first = node;
    _first.pre = null;
  }

  T get<T>(String key) {
    CacheNode node = caches[key];
    if (node == null) {
      try {
        dynamic value = _preferences.getValue(key);
        if (value is T) {
          return value;
        }
        if (null != value) {
          _put2Memory(key, value);
          return value;
        } else {
          return null;
        }
      } catch (e) {
        print(e);
      }
      return null;
    } else {
      //把访问的节点移动到首部
      _move2first(node);
    }
    return node.value;
  }

  void remove(String key) {
    CacheNode node = caches[key];
    if (node != null) {
      if (node.pre != null) {
        node.pre.next = node.next;
      }
      if (node.next != null) {
        node.next.pre = node.pre;
      }
      if (node == _first) {
        _first = node.next;
      }
      if (node == _last) {
        _last = node.pre;
      }
    }
    caches.remove(key);
    _preferences.removeValue(key);
  }

  Preferences _preferences = new Preferences();

  Future<void> init() async {
    isDebug = !kReleaseMode;
    await _preferences.init();
    return null;
  }
}

class CacheNode<T> {
  //键
  String key;

  //值
  T value;

  //上一个节点
  CacheNode pre;

  //下一个节点
  CacheNode next;

  CacheNode(String key, Object value) {
    this.key = key;
    this.value = value;
  }
}
