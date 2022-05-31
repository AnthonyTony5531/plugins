import 'dart:async';

import 'package:fast_ai/performance/bean/data/log_info_data.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/common_storage.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/log_kit_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Created  on 2021/6/28.
/// @author grey

class LogKit extends IKit {
  final CommonStorage _error = CommonStorage(maxCount: 255);
  FlutterExceptionHandler _originOnError;
  Timer _time;

  CommonStorage get error => _error;

  @override
  Widget createDisplayPage() {
    return TagKitPage();
  }

  @override
  IStorage createStorage() => CommonStorage(maxCount: 255);

  @override
  void dispose() {
    _time?.cancel();
    _time = null;
  }

  @override
  String getIcon() => KitIcon.KIT_LOG;

  @override
  String getKitName() => KitName.KIT_LOG;

  @override
  String getRouter() => KitRouter.KIT_LOG;

  @override
  void init() {
    resetOnErrorInstance();
  }

  @override
  bool save(IData data) {
    if ((data as LogInfoData).type == LogInfoData.TYPE_ERROR) {
      _error.save(data);
    }
    return super.save(data);
  }

  void cleanLog(){
    _error.clear();
    storage.clear();
  }

  void resetOnErrorInstance() {
    _time?.cancel();
    _time = null;
    _time = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (FlutterError.onError != _doLogKitOnError) {
        _originOnError = FlutterError.onError;
        FlutterError.onError = _doLogKitOnError;
      }
    });
  }

  void _doLogKitOnError(FlutterErrorDetails details) {
    // 委托给runZone内的onError
    Zone.current.handleUncaughtError(details.exception, details.stack);
    if (_originOnError != null) {
      _originOnError(details);
    }
  }
}
