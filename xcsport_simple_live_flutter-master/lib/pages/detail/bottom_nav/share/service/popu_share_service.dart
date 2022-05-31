
import 'dart:async';

import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/bet_share_message.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/shared_follow_bet_popu_view.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/enum/popup_status.dart';
import 'package:fast_ai/utils/frequency_limit.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';


typedef DoShowFunction = void Function({String page});

class PopupShareService{

  static PopupShareService ins = PopupShareService();

  var data = <BetShareMessage>[];
  Timer _timer;
  Timer _resumeDelayTimer;

  //同步锁
  var _lock = Lock();
  var _resumeLock = Lock();

  PopupStatus _status = PopupStatus.none;
  //显示时长
  final int showTime = 30000;
  //隐藏时长
  final int hideTime = 2000;//原普通用户hideTime = 30000，现在主播hideTime = 2000
  //暂停点
  var pausesPoints = <String,PopupStatus>{};

  Timer debugCurStatus;

  bool debug = false;

  bool hasNewShare = false;

  FrequencyLimit frequencyLimit;

  /// 初始化
  void init(BuildContext context){
//    SharedFollowBetPopupWindow.hide();
    reset();
//    SharedFollowBetPopupWindow.init(context);
    if(debugCurStatus == null && debug){
      debugCurStatus = Timer.periodic(Duration(seconds: 1), (_){
        _print("## PopupShareService current _status:$_status");
      });
    }
    frequencyLimit = FrequencyLimit(gIntervalTime: showTime+hideTime, syncLock: true);
  }

  /// 添加数据
  void addData(BetShareMessage shareData){
    if(_status == PopupStatus.closed){
      return;
    }
    if(data.length > 10){
      return;
    }

    if(!hasNewShare){
      hasNewShare = true;
      Event.eventBus.fire(HasNewBetShareEvent());
    }
    _print("## PopupShareService addData() current status:$_status");
    data.add(shareData);
    if(data.length == 1 && _status != PopupStatus.pause){
      start(delay: 10);
    }
  }

  /// 显示注单分享弹窗
  void _show({String page}) {
    _canShowNext(__show,page: page);
  }

  /// 是否能显示下一个
  void _canShowNext(DoShowFunction doShow,{String page}){
    _lock.synchronized((){
      if(_status == PopupStatus.pause){
        return ;
      }
      if(data != null && data.length > 0){
        if(_status == PopupStatus.pause)
          return ;

        if(_status == PopupStatus.playing)
          return ;

        if(_timer != null){
          return ;
        }

        _hide();
        if(doShow != null){
          frequencyLimit.onTask(task: (){
            doShow(page: page);
          });
        }
        return ;
      } else {
        return ;
      }
    });
  }

  /// 控制注单显示
  void __show({String page}) {
    if(_status == PopupStatus.pause){
      return;
    }
    if(data != null && data.length > 0){
      var d = data[0];
      if(_status == PopupStatus.pause)
        return;
      if(_status == PopupStatus.playing)
        return;
      _print("## PopupShareService call __show from:$page");
      _hide();
      data.remove(d);
      _setStatus(status: PopupStatus.playing,from:"__show");
//      SharedFollowBetPopupWindow.show(d);
      _timer = Timer(Duration(milliseconds: showTime), () async {
        _hide();
        _timer?.cancel();
        _timer = null;
        if(_status == PopupStatus.hide){
          await sleep(hideTime);
          if(_status == PopupStatus.hide){
            _show(page: "timer");
          }
        }
      });
    } else {
      _timer?.cancel();
      _timer = null;
      if(_status != PopupStatus.pause){
        _setStatus(status: PopupStatus.hide,from:"__show");
      }
    }
  }

  /// 隐藏弹窗
  void _hide(){
    _timer?.cancel();
    _timer = null;
    if(_status != PopupStatus.pause){
      _setStatus(status: PopupStatus.hide,from:"_hide");
    }
//    SharedFollowBetPopupWindow.hide();
  }

  ///
  void start({int delay = 2000}){
    sleep(delay,(){
      _show(page:"start");
    });
  }

  /// 暂停弹窗显示
  void pause(String pointKey){
    _print('## PopupShareService call pause() key:$pointKey');
    pausesPoints[pointKey] = PopupStatus.pause;
    _setStatus(status: PopupStatus.pause,from:"pause");
    _timer?.cancel();
    _timer = null;
    _resumeDelayTimer?.cancel();
    _resumeDelayTimer = null;
    _hide();
  }

  /// 重启弹窗显示
  void resume(String pointKey)async{
    _print('## PopupShareService call resume() key:$pointKey');
    pausesPoints?.remove(pointKey);
    _resumeLock.synchronized(()async{
      if(_resumeDelayTimer != null){
        return;
      }
      _resumeDelayTimer = Timer(Duration(milliseconds: 1500),() async {
        _resumeDelayTimer?.cancel();
        _resumeDelayTimer = null;
        if(pausesPoints.length == 0){
          if(_timer != null){
            return;
          }
          _setStatus(status: PopupStatus.hide,from:"resume");
          start(delay: 500);
        }
      });
    });
  }

  bool hasPausesPoint(){
    return pausesPoints?.isNotEmpty ?? false;
  }



  /// 重置
  void reset(){
    _hide();
    clearCache();
    _setStatus(status: PopupStatus.hide,from:"reset");
  }

  ///
  void close(){
    _status = PopupStatus.closed;
    reset();
  }

  /// 清除已经缓存的数据
  void clearCache(){
    data?.clear();
    _timer?.cancel();
    _timer = null;
    _resumeDelayTimer?.cancel();
    _resumeDelayTimer = null;
    hasNewShare = false;
    Event.eventBus.fire(HasNewBetShareEvent());
  }

  /// 设置状态
  void _setStatus({PopupStatus status, String from}){
    _print("## PopupShareService call _setStatus() from:$from    old status:$_status     new status=$status");
    _status = status;
  }

  ///
  void _print(String log){
    if(debug){
      print(log);
    }
  }

}