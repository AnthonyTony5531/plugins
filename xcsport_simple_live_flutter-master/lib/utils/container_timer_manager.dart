import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class ContainerTimerManager {
  factory ContainerTimerManager() => _getInstance();

  static ContainerTimerManager get instance => _getInstance();

  static ContainerTimerManager _instance;

  static ContainerTimerManager _getInstance() {
    if (_instance == null) _instance = ContainerTimerManager._internal();
    return _instance;
  }

  ContainerTimerManager._internal();

  bool _isInit = false;

  // 当前定时器
  Timer _curTime;

//  // 当前选中菜单key
//  AppMenuKey _curTabKey = AppMenuKey.None;
//
//  AppMenuKey get containerCurrentTabKey => _curTabKey;
//
  // 定时器变化时间周期，30S以内，不发送事件更新
//  final Map<AppMenuKey, DateTime> _changeDateMap = {};
//
//  // 事件
//  final Map<AppMenuKey, VoidCallback> _tabMenuCallBackMap = {};
//
//  void addTimerCallBack(AppMenuKey key, VoidCallback callback) {
//    if (_tabMenuCallBackMap.containsKey(key)) {
//      _tabMenuCallBackMap.remove(key);
//    }
//    _tabMenuCallBackMap[key] = callback;
//  }
//
//  void removeTimerCallBack(AppMenuKey key) {
//    if (_tabMenuCallBackMap.containsKey(key)) {
//      _tabMenuCallBackMap[key] = null;
//      _tabMenuCallBackMap.remove(key);
//    }
//  }
//
//  /// 初始化
//  void initTabView(AppMenuKey menuKey) {
//    if (_isInit) return;
//    _isInit = true;
//    _curTabKey = menuKey;
//    _starTimerByKey();
//  }
//
//  /// 启动定时器
//  void changeMenuTimer(AppMenuKey menuKey) {
//    if (_curTabKey == menuKey) return;
//    _curTabKey = menuKey;
//
//    // 判断是否需要通知界面刷新
////    bool needCall = _checkChangeTimeOut(_curTabKey);
//
//    _starTimerByKey();
//  }
//
  /// 停止定时器
  void stopTimer() {
    debugPrint('timerManeger ========> stopTimer');
//    if (_changeDateMap.containsKey(_curTabKey)) {
//      _changeDateMap[_curTabKey] = DateTime.now();
//    }

    _curTime?.cancel();
    _curTime = null;
  }

  /// 重新启动定时器
  void reset() {
    // 判断是否需要通知界面刷新
//    bool needCall = _checkChangeTimeOut(_curTabKey);
//    _starTimerByKey(isNeedCall: needCall);
  }
//
//  bool _checkChangeTimeOut(AppMenuKey menuKey) {
//    bool needCall = false;
//    if (_changeDateMap.containsKey(menuKey)) {
//      final sDate = _changeDateMap[menuKey];
//      final date = DateTime.now();
//      if (sDate != null) {
//        final timeDif = date.millisecondsSinceEpoch - sDate.millisecondsSinceEpoch;
//        debugPrint('timerManeger ========> timeDif = $timeDif');
//        // 超过30S，更新界面
//        if (timeDif > 30 * 1000) {
//          needCall = true;
//          _changeDateMap[menuKey] = date;
//        }
//      }
//    }
//    return needCall;
//  }
//
//  void _starTimerByKey({bool isNeedCall = false}) {
//    debugPrint('timerManeger ========> _starTimerByKey  _curTabKey ==> $_curTabKey');
//
//    if (isNeedCall) {
//      _sendCallBack(_curTabKey);
//    }
//
//    switch (_curTabKey) {
//      case AppMenuKey.Hot:
//        _startHotTime();
//        break;
//      case AppMenuKey.Inplay:
//        _startRunningMatchTime();
//        break;
//      case AppMenuKey.Live:
//        _startAnchorMatchTime();
//        break;
//      case AppMenuKey.Today:
//        _startTodayMatchTime();
//        break;
//      case AppMenuKey.Early:
//        _startEarlyMatchTime();
//        break;
//      case AppMenuKey.Skipmatch:
//        _startSkipMatchTime();
//        break;
//      case AppMenuKey.Guessing:
//        _startGuessMatchTime();
//        break;
//      default:
//        _curTime?.cancel();
//        _curTime = null;
//        break;
//    }
//  }
//
//  // 热门定时器
//  void _startHotTime() {
//    debugPrint('timerManeger ========> _startHotTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Hot)) {
//      _changeDateMap[AppMenuKey.Hot] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.hotMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startHotTime send call');
//      _sendCallBack(AppMenuKey.Hot);
//    });
//  }
//
//  // 滚球定时器
//  void _startRunningMatchTime() {
//    debugPrint('timerManeger ========> _startRunningMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Inplay)) {
//      _changeDateMap[AppMenuKey.Inplay] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.runningMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startRunningMatchTime send call');
//      _sendCallBack(AppMenuKey.Inplay);
//    });
//  }
//
//  // 主播定时器
//  void _startAnchorMatchTime() {
//    debugPrint('timerManeger ========> _startAnchorMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Live)) {
//      _changeDateMap[AppMenuKey.Live] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : 30;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startAnchorMatchTime send call');
//      _sendCallBack(AppMenuKey.Live);
//    });
//  }
//
//  // 今日定时器
//  void _startTodayMatchTime() {
//    debugPrint('timerManeger ========> _startTodayMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Today)) {
//      _changeDateMap[AppMenuKey.Today] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.todayMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startTodayMatchTime send call');
//      _sendCallBack(AppMenuKey.Today);
//    });
//  }
//
//  // 早盘定时器
//  void _startEarlyMatchTime() {
//    debugPrint('timerManeger ========> _startEarlyMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Early)) {
//      _changeDateMap[AppMenuKey.Early] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.earlyMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startEarlyMatchTime send call');
//      _sendCallBack(AppMenuKey.Early);
//    });
//  }
//
//  // 串关定时器
//  void _startSkipMatchTime() {
//    debugPrint('timerManeger ========> _startSkipMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Skipmatch)) {
//      _changeDateMap[AppMenuKey.Skipmatch] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.skipmatchMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startSkipMatchTime send call');
//      _sendCallBack(AppMenuKey.Skipmatch);
//    });
//  }
//
//  // 竞猜定时器
//  void _startGuessMatchTime() {
//    debugPrint('timerManeger ========> _startGuessMatchTime');
//    if (!_changeDateMap.containsKey(AppMenuKey.Guessing)) {
//      _changeDateMap[AppMenuKey.Guessing] = DateTime.now();
//    }
//    _curTime?.cancel();
//    final millisecondsTime = config.merchantAppConfig.isOpenAutoOdds ? config.fiexd.autoOpenOddsUpdateTime : config.fiexd.todayMatchUpdateTime;
//    _curTime = Timer.periodic(Duration(milliseconds: millisecondsTime * 1000), (timer) {
//      debugPrint('timerManeger ========> _startGuessMatchTime send call');
//      _sendCallBack(AppMenuKey.Guessing);
//    });
//  }
//
//  void _sendCallBack(AppMenuKey menuKey) {
//    debugPrint('timerManeger ========> _sendCallBack send $menuKey');
//    if (_tabMenuCallBackMap.containsKey(menuKey)) {
//      _tabMenuCallBackMap[menuKey]?.call();
//    }
//  }
}
