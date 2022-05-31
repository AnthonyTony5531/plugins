
import 'dart:async';

import 'package:fast_ai/event/event.dart';
import 'package:flutter/material.dart';

///
class LogDataCenter{


  LogDataCenter();

  static OverlayEntry logOverlayEntry;
  static bool logCollecting = false;
  static StreamSubscription _logSub;
  static List<String> logTexts = [];
  static List<LogSubscription> _subs = [];

  static void start(){
    logCollecting = true;
    if(_logSub != null){
      return;
    }
    _logSub = Event.eventBus.on<LogEvent>().listen((event){
      if(logTexts == null){
        logTexts = [];
      }
      logTexts.add(event.log);
      _subs?.forEach((fun){
        if(fun != null){
          fun(event.log);
        }
      });
    });
  }

  static void stop(){
    logCollecting = false;
    _logSub?.cancel();
    _logSub = null;
  }

  static void clear(){
    logTexts?.clear();
  }

  static void subscription(LogSubscription logsub,[bool total = false]){
    if(_subs != null && !_subs.contains(logsub)){
      _subs.add(logsub);
      if(total){
        logTexts?.forEach((logText){
          if(logsub != null){
            logsub(logText);
          }
        });
      }
    }
  }

  static void unSubscription(LogSubscription logsub){
    if(_subs != null && _subs.contains(logsub)){
      _subs.remove(logsub);
    }
  }

}

///
class LogCollectUtil{
  static collect(String log){
    print(log);
//    if(LogDataCenter.logCollecting){
//      Event.eventBus.fire(LogEvent(log: log));
//    }
  }
}

///
class LogEvent {

  LogEvent({this.log});

  final String log;
}

typedef LogSubscription = void Function(String log);