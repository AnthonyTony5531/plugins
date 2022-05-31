import 'dart:async';

import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/bet_share_message.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:flutter/material.dart';

class AnchorGameService {
  static AnchorGameService ins = AnchorGameService();

  final ValueChangedListener<bool> _popStateListener = ValueChangedListener();

  Timer _timer;

  //显示时长
  final int showTime = 15000;

  //隐藏时长
  final int hideTime = 2000; //原普通用户hideTime = 30000，现在主播hideTime = 2000

  final List<AiGameCellModel> _data = [];
  bool _isInitData = false; // 是否初始化数据
  bool _hasNewShare = false;
  bool _isHasShowing = false;
  AiGameCellModel _curShowData;

  bool get isShowing => _isHasShowing;

  AiGameCellModel get anchorGameMessage => _curShowData ?? null;

  void addShowPopListener(ValueChanged<bool> onStateCallBack) {
    if (_popStateListener != null) {
      _popStateListener.addListener(onStateCallBack);
    }
  }

  void removeShowPopListener(ValueChanged<bool> onStateCallBack) {
    if (_popStateListener != null) {
      _popStateListener.removeListener(onStateCallBack);
    }
  }

  void initData() {
    reset();
    _isInitData = true;
  }

  /// 添加数据
  void addData(AiGameCellModel shareData) {
    if (!_isInitData || _data.length > 10) {
      return;
    }
    if (!_hasNewShare) {
      _hasNewShare = true;
      Event.eventBus.fire(HasNewBetShareEvent());
    }
    _data.add(shareData);
    if (_data.length == 1 && !_isHasShowing && _curShowData == null) {
      _doShow();
    }
  }

  /// 重置
  void reset() {
    _popStateListener.cleanListener();
    clearCache();
  }

  ///
  void dispose() {
    _popStateListener.cleanListener();
    clearCache();
  }

  /// 清除已经缓存的数据
  void clearCache() {
    print("Anchor_share_service 清空了数据");
    _cancelTimer();
    _data.clear();
    _isInitData = false;
    _curShowData = null;
    _isHasShowing = false;
    _hasNewShare = false;
    Event.eventBus.fire(HasNewBetShareEvent());
  }

  void _doShow() {
    if (_data.length >= 1) {
      _isHasShowing = true;
      _curShowData = _data.first;
      _popStateListener.fire(true);
      _startTimer();
    } else {
      _isHasShowing = false;
      _popStateListener.fire(false);
      _curShowData = null;
      _cancelTimer();
    }
  }

  void _doHide() async {
    if (_isHasShowing) {
      _cancelTimer();
      _popStateListener.fire(false);

      if (_data.contains(_curShowData)) _data.remove(_curShowData);
      _curShowData = null;
      // 隐藏时间
      await Future.delayed(Duration(milliseconds: hideTime));
      _isHasShowing = false;
      // 显示下一个
      _doShow();
    }
  }

  void _startTimer() {
    _cancelTimer();

    _timer = Timer.periodic((Duration(milliseconds: showTime)), (timer) {
      _doHide();
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
