import 'dart:async';
import 'dart:core';

import 'package:fast_ai/performance/bean/data/log_info_data.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as dart;

typedef LogCallback = void Function(String);
typedef ExceptionCallback = void Function(dynamic, StackTrace);
typedef RedWidgetCallback = Widget Function(FlutterErrorDetails errorDetails);

/// @author grey
/// Function :

class SystemLog {
  //默认release模式不开启该功能
  static bool release = kReleaseMode;

  //记录当前zone
  static Zone _zone;

  // 初始化方法,app或者appCreator必须设置一个
  static Future<void> runApp({
    Widget app,
    LogCallback logCallback,
    ExceptionCallback exceptionCallback,
    RedWidgetCallback redWidgetCallback,
  }) async {
    assert(app != null, 'app and appCreator are both null');
//    if (release) {
//      dart.runApp(app);
//      return;
//    }
    runZoned(
      () async => <void>{
        dart.runApp(app),
        _zone = Zone.current,
      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          if(gReleaseShowLog && release || kDebugMode) {
            _collectLog(line); //手机日志
            parent.print(zone, line);
          }
          if (logCallback != null) {
            _zone?.runUnary(logCallback, line);
          }
        },
      ),
      onError: (Object obj, StackTrace stack) {
        if(gReleaseShowLog && release || kDebugMode) {
          _collectError(obj, stack);
        }
        if (exceptionCallback != null) {
          _zone?.runBinary(exceptionCallback, obj, stack);
        }
      },
    );

    if (release && !gReleaseShowLog) {
      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        if (redWidgetCallback == null) {
          return SizedBox.shrink();
        }
        return redWidgetCallback.call(errorDetails);
      };
    }
  }

  static void _collectLog(String line) {
    if(kReleaseMode && !gReleaseShowLog) return;

    LoggerKitManager.instance.addSystemLog(LogInfoData.TYPE_INFO, line);
  }

  static void _collectError(Object details, Object stack) {
    if(kReleaseMode && !gReleaseShowLog) return;

    LoggerKitManager.instance.addSystemLog(LogInfoData.TYPE_ERROR, '${details?.toString()}\n${stack?.toString()}');
  }
}
