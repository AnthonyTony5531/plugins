import 'dart:async';

import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/performance_btn_view.dart';
import 'package:fast_ai/performance/widget/view/item_detail_info_view.dart';
import 'package:fast_ai/performance/widget/view/list_info_view.dart';
import 'package:fast_ai/performance/widget/view/toast/toast_info_view.dart';
import 'package:flutter/material.dart';

import 'common_kit_manager.dart';

/// @author grey
/// Function :  性能工具管理器

/// 配置当前项目的package
final String performanceImagePackage = "fast_ai";

class PerformanceManager {
  factory PerformanceManager() => _getInstance();

  static PerformanceManager get instance => _getInstance();

  static PerformanceManager _instance;

  static PerformanceManager _getInstance() {
    if (_instance == null) _instance = new PerformanceManager._internal();
    return _instance;
  }

  PerformanceManager._internal();

  final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

  // 悬浮控件
  OverlayEntry _overlayEntry;

  // 详情控件
  OverlayEntry _detailEntry;

  // 列表控件
  OverlayEntry _listEntry;

  // 仿toast控件
  OverlayEntry _toastEntry;

  bool _isOverlayShow = false;

  bool _isDetailShow = false;

  bool _isListShow = false;

  Timer _toastTime;

  OverlayEntry get owner => _overlayEntry;

  OverlayState get overlayState => overlayKey.currentState;

  bool addToOverlay() {
    try {
      if (_overlayEntry == null) {
        _overlayEntry = OverlayEntry(builder: (cxt) => PerformanceBtnView());
      }

      if (overlayState != null) {
        if (_isOverlayShow) return true;
        _isOverlayShow = true;
        overlayState.insert(_overlayEntry);
        KitManager.instance.initData();
        CommonKitManager.instance.initData();
      }
    } catch (e, stack) {
      print('Performance_manager : ${e.toString()} \nstack : $stack');
    }
    return false;
  }

  void showDetail(Widget widget, {VoidCallback onCloseTap}) {
    if (_isDetailShow) return;
    _isDetailShow = true;

    _detailEntry?.remove();
    _detailEntry = null;
    _detailEntry = OverlayEntry(builder: (cxt) => ItemDetailInfoView(child: widget, onCloseTap: onCloseTap));
    if (_listEntry != null) {
      overlayState.insert(_detailEntry, above: _listEntry);
    } else {
      overlayState.insert(_detailEntry, above: _overlayEntry);
    }
  }

  void hideDetail() {
    if (_isDetailShow) {
      _isDetailShow = false;
      _detailEntry?.remove();
      _detailEntry = null;
    }
  }

  void showListView(Widget widget) {
    if (_isListShow) return;
    _isListShow = true;

    _listEntry?.remove();
    _listEntry = null;
    _listEntry = OverlayEntry(builder: (cxt) => ListInfoView(child: widget));
    overlayState.insert(_listEntry, above: _overlayEntry);
  }

  void hideListView() {
    if (_isListShow) {
      _isListShow = false;
      _listEntry?.remove();
      _listEntry = null;
    }
  }

  void showOverlayToast(String message) {
    try {
      _toastTime?.cancel();
      _toastTime = null;
      _toastEntry?.remove();
      _toastEntry = null;
      _toastEntry = OverlayEntry(builder: (cxt) => ToastInfoView(message));
      overlayState.insert(_toastEntry);

      _toastTime = Timer(Duration(milliseconds: 1500), () {
        _toastEntry?.remove();
        _toastEntry = null;
      });
    } catch (e) {
      _toastEntry = null;
    }
  }

  void removeToOverLay() {
    if (_overlayEntry != null) {
      _isOverlayShow = false;
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}
