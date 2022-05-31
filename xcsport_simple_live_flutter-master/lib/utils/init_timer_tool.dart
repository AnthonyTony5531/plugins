import 'dart:async';

import 'package:flutter/material.dart';

class InitTimerTool {
  List<Timer> _list = [];

  void delayer(Duration duration, VoidCallback callback) {
    if (callback == null || duration == null) {
      throw ArgumentError.value(null, "callback", "The type parameter is not nullable");
    }

    final timer = Timer(duration, callback);
    _list.add(timer);
  }


  void cancel(){
    if(_list.length != 0){
      _list.forEach((element) {
        element?.cancel();
      });
    }
  }

}
