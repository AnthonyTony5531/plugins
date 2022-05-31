import 'package:flutter/material.dart';

class VoidListener {
  var _callbacks = List<VoidCallback>();

  fire() {
    ([]..addAll(_callbacks)).forEach((f){
      try{
        f();
      }catch(e,s){
        print('e:$e');
        print('s:$s');
      }
    });
    if (_parentListener != null) {
      _parentListener.fire();
    }
  }

  addListener(VoidCallback callback) {
    _callbacks.add(callback);
  }

  removeListener(VoidCallback callback) {
    _callbacks.remove(callback);
  }

  VoidListener _parentListener;

  setParent(VoidListener parent) {
    _parentListener = parent;
  }

  int get callBackCount{
    return _callbacks?.length ?? 0;
  }
}
