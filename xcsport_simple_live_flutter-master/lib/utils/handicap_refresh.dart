import 'dart:async';
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class HandicapRefresh{

  static startHandicapRefresh(VoidCallback refreshCallBack){
    stopHandicapRefresh();
    config?.userInfo?.handicapTimer = Timer.periodic(Duration(seconds:10), (Timer timer){
      if(refreshCallBack != null){
        refreshCallBack();
      }
    });
  }
  
  static stopHandicapRefresh(){
    print('盘口刷新----关闭');
    config?.userInfo?.handicapTimer?.cancel();
    config?.userInfo?.handicapTimer = null;
  }
}