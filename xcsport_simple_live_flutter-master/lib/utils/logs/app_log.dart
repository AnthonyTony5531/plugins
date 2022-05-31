import 'dart:async';
import 'dart:io';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/file_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/default_views/match_empty.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class Logs {

  static bool _isReleaseMode;
  static bool _testCollectSwitchOn = true;

  static const String _LOG_FILE_PATH = 'xc_log';
  static const String _ERR_LOG_FILE_PATH = 'xc_err_log';

  static IOSink _logIoSink;
  static IOSink _errLogIoSink;


  //调试模式或APP模式均打开日志收集到文件功能，SDK模式不打开日志收集文件功能
  static runAppWidthLogs(Widget app) {
    _isReleaseMode = kReleaseMode;
    //if(!_isReleaseMode)
    //  return runApp(app);

    _init();

    FlutterError.onError = (FlutterErrorDetails details) {
      _reportErrorAndLog(details);
    };
    runZoned(
      () => runApp(app),
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          try{
            if(!config.isApp || config.isFastAiSdk || kDebugMode){
              _closeSdkLog();
              return;
            }
            if(config.isApp){
              if(_isReleaseMode) {
                _collectLog(line);
              } else {
                _collectLog(line);
                parent.print(zone, line);
              }
            }
          } catch (_){}
        },
      ),
      onError: (Object obj, StackTrace stack) {
        var details = _makeDetails(obj, stack);
        _reportErrorAndLog(details);
      },
    );
    if(_isReleaseMode){
      _setErrorBuilder();
    }
  }

  static void _reportErrorAndLog(FlutterErrorDetails details) {
    //TODO release 收集、上传日志
    try{
      if(!config.isApp || config.isFastAiSdk || kDebugMode){
        _closeSdkLog();
        return;
      }
      if(details != null && config.isApp){
        if(_isReleaseMode) {
          _writeErrLog(details);
        } else {
          _writeErrLog(details);
          FlutterError.dumpErrorToConsole(details);
        }
      }
    } catch(_){}
  }

  static void _collectLog(String line){
    _writeLog(line);
  }

  static FlutterErrorDetails _makeDetails(Object obj, StackTrace stack){
    //TODO
    return FlutterErrorDetails(stack: stack);
  }

  static void _setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      _reportErrorAndLog(errorDetails);
      return Scaffold(
        body: Container(),
//        body: MatchEmtpy(
//          name: 'global_error',
//          type: 'detail',
//        ),
      );
    };
  }

  ///
  static Future _init()async{
    return Future.delayed(Duration(seconds: 2),() async {
      try{
        Directory dir = await getExternalStorageDirectory();
        String logDirPath = dir.path + Platform.pathSeparator + _LOG_FILE_PATH;
        String errLogDirPath = dir.path + Platform.pathSeparator + _ERR_LOG_FILE_PATH;

        int now = DateTime.now().millisecondsSinceEpoch;
        String logFilePath = logDirPath + Platform.pathSeparator + yyyy_MM_dd_HH_mm_ss(now)+'.txt';
        String errLogFilePath = errLogDirPath + Platform.pathSeparator + yyyy_MM_dd_HH_mm_ss(now)+'_err.txt';

        //打开文件
        _logIoSink = await FileUtil.openFile(FileMode.writeOnlyAppend, logFilePath);
        _errLogIoSink = await FileUtil.openFile(FileMode.writeOnlyAppend, errLogFilePath);

        //删除过期文件
        FileUtil.delExpiredLogFile(dirPath:logDirPath, days: 1,minutes: 0,second: 0);
        FileUtil.delExpiredLogFile(dirPath:errLogDirPath, days: 1,minutes: 0,second: 0);
      } catch(_){
        print('appLog ====> init fail');
      }
    });
  }

  static void _closeSdkLog(){
    if(_logIoSink != null || _errLogIoSink != null){
      _logIoSink?.close();
      _errLogIoSink?.close();
      _logIoSink = null;
      _errLogIoSink = null;
      _clearSdkLog();
    }
  }

  ///sdk不保存log，删除所有与log相关数据
  static void _clearSdkLog() async {
    try{
      Directory dir = await getExternalStorageDirectory();
      String logDirPath = dir.path + Platform.pathSeparator + _LOG_FILE_PATH;
      String errLogDirPath = dir.path + Platform.pathSeparator + _ERR_LOG_FILE_PATH;
      FileUtil.deleteDir(logDirPath);
      FileUtil.deleteDir(errLogDirPath);
    } catch(_){}
  }

  /// 收集运行日志
  static void _writeLog(dynamic data) async {
    try{
      if(_logIoSink == null){
        return;
      }
      if(data is String){
        print('_writeLog ======> $data');
        _logIoSink.write(_addTimePrefix(data));
      } else if(data is FlutterErrorDetails){
        print('_writeLog ======> $data');
        _logIoSink.write(_addTimePrefix(data.toString()));
      }
      await _logIoSink.flush();
    } catch(_){
      print('_writeLog error ======> $data');
    }
  }

  /// 收集错误日志
  static void _writeErrLog(dynamic data) async {
    try{
      if(_errLogIoSink == null){
        return;
      }
      if(data is String){
        _errLogIoSink.write(_addTimePrefix(data));
      } else if(data is FlutterErrorDetails){
        _errLogIoSink.write(_addTimePrefix(data.toString()));
      }
      await _errLogIoSink.flush();
    } catch(_){}

  }

  //添加时间前缀
  static String _addTimePrefix(String str){
    return '${MHH_mm_ss_SSSS(DateTime.now().millisecondsSinceEpoch)} -> $str\n';
  }

}