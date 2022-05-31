import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:common_component/util/log.dart';
import 'package:flutter/cupertino.dart';
import './lux_creater.dart';

class Lux {
  static Lux ins = new Lux();

  Map<String, LuxCreater> _creaters = new Map<String, LuxCreater>();
  Map<String, dynamic> _enums = new Map<String, dynamic>();
  Map<String, ValueListener> _listeners = new Map<String, ValueListener>();
  Map<String, IViewModel> _models = Map<String, IViewModel>();

  Future init() async {
    _creaters = new Map<String, LuxCreater>();
    _enums = new Map<String, dynamic>();
    _listeners = new Map<String, ValueListener>();
    _models = Map<String, IViewModel>();
  }

  Map<String, LuxCreater> get allCreaters {
    return _creaters;
  }

  void register(List<LuxCreater> creaters) {
    creaters.forEach((f) {
      _creaters.addAll({f.lux: f});
    });
  }

  void registerEnums(Map enums) {
    _enums.addAll(enums);
  }

  dynamic getEnum(String name) {
    if (name == null) return null;
    return _enums[name];
  }

  IViewModel getModel(String name) {
    if (name == null) return null;
    return _models[name];
  }

  void setModel(String name, IViewModel model) {
    _models[name] = model;
  }

  ValueListener createListener(String listenerName) {
    var ret = new ValueListener();
    if (_listeners.containsKey(listenerName))
      ret = _listeners[listenerName];
    else
      _listeners.addAll({listenerName: ret});
    return ret;
  }

  ValueListener getListener(String listenerName) {
    return _listeners[listenerName];
  }

  void removeListener(String listenerName) {
    if (_listeners.containsKey(listenerName)) _listeners.remove(listenerName);
  }

  fire(String value, [dynamic args]) {
    var listener = _listeners[value];
    if (listener == null) return;
    listener.fire(args);
  }

  List<String> _paths = new List<String>();

  dynamic createIns(BuildContext context, Map script) {
    if (script == null) return null;
    var lux = script.containsKey("lux") ? script["lux"] : "";
    _paths.add(lux);
    var ret;
    try {
      var cc = _creaters[lux];
      ret = cc?.create(context, script);
    } finally {
      _paths.removeLast();
    }
    return ret;
  }

  void pushPath(String attr) {
    _paths.add(attr);
  }

  void popPath() {
    _paths.removeLast();
  }

  String get currentPath {
    var ret = "/";
    _paths.forEach((f) => ret = ret + "/" + f);
    return ret;
  }

  List<T> createInsList<T>(BuildContext context, dynamic list) {
    if (!(list is List)) return [];
    var ret = <T>[];
    for (var item in list as List) {
      var ins = createIns(context, item) as T;
      ret.add(ins);
    }
    return ret;
  }
}
