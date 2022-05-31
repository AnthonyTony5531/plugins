import 'package:common_component/util/listeners/void_listener.dart';
import 'package:flutter/material.dart';

class NameListener {
  var _listeners = Map<String, VoidListener>();

  addListener(String name, VoidCallback callback) {
    var listener = _listeners[name];
    if (null == listener) {
      listener = VoidListener();
      _listeners[name] = listener;
    }
    listener.addListener(callback);
  }

  removeListener(String name, VoidCallback callback) {
    var listener = _listeners[name];
    listener?.removeListener(callback);
  }

  addListeners(List<String> names, VoidCallback callback) {
    names.forEach((name) => addListener(name, callback));
  }

  removeListeners(List<String> names, VoidCallback callback) {
    names.forEach((name) => removeListener(name, callback));
  }

  fire(String name) {
    var listener = _listeners[name];
    listener?.fire();
  }

  int getListenerCountByName(String name) {
    if (_listeners.containsKey(name)) {
      var listener = _listeners[name];
      return listener.callBackCount;
    }
    return 0;
  }
}
