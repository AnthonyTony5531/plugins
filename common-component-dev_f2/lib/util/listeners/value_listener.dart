import 'package:common_component/util/listeners/void_listener.dart';
import 'package:flutter/cupertino.dart';



class ValueListener {
  var _callbacks = List<ValueChanged>();

  fire(dynamic value) {
     ([]..addAll(_callbacks)).forEach((f) {
      try {
        f(value);
      } catch (e,s) {
        print('e:$e');
        print('s:$s');
      }
    });
    if (_parentListener != null) {
      _parentListener.fire();
    }
  }

  addListener(ValueChanged callback) {
    if (!_callbacks.contains(callback)) {
      _callbacks.add(callback);
    }
  }

  removeListener(ValueChanged callback) {
    _callbacks.removeWhere((element) => callback == element);
  }

  VoidListener _parentListener;

  setParent(VoidListener parent) {
    _parentListener = parent;
  }

  clean() {
    _callbacks?.clear();
  }
}
