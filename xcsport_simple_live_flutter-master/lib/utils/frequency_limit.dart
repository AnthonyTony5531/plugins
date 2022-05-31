import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:synchronized/synchronized.dart';

///
/// 1.防止多点触控
///
class PreventMultiTap extends FrequencyLimit{
  PreventMultiTap({int gIntervalTime = 1000,bool syncLock = false}) : super(gIntervalTime: gIntervalTime, syncLock: syncLock);
}

///
/// 2.限时处理数量限制-限制重复点击
///
class FrequencyLimit{
  //同步锁
  var _lock;

  bool _canDoTask = true;

  int gIntervalTime;


  FrequencyLimit({this.gIntervalTime = 1000,bool syncLock = false}){
    if(syncLock){
      _lock = Lock();
    }
  }

  ///
  void onTask({@required Function task,List taskPositionalArguments = const[],Map<Symbol, dynamic> taskNamedArguments,VoidCallback taskDoFail,int intervalTime,}){
    if(!_canDoTask){
      if(taskDoFail != null){
        taskDoFail();
      }
      return;
    }
    _canDoTask = false;
    Future.delayed(Duration(milliseconds: intervalTime ?? gIntervalTime),(){
      _canDoTask = true;
    });
    if(task != null){
      if(_lock != null){
        _lock.synchronized(
            ()async{
              await Function.apply(task, taskPositionalArguments, taskNamedArguments);
            }
        );
      } else {
        Function.apply(task, taskPositionalArguments, taskNamedArguments);
      }

    }
  }

}