
/* --------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * -------------------------------------------------------
 *   版本          修改人                 说明
 *  1.0.0.0       south        调用MainActivity里对应的Log
 *                             方法输出
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:flutter/services.dart';

const perform = const MethodChannel("native_log");

void logInfo(dynamic message) {
  _printException("info",message);
  // debugPrint("info:$message");
}

void logDebug(dynamic message) {
  _printException("debug",message);
  // debugPrint("debug:$message");
}
  
void logWarning(dynamic message) {
  _printException("warning",message);
  // debugPrint("warning:$message");
}

void logError(dynamic message) {
  _printException("error",message);
  // debugPrint("error:$message");
}

void logFail(dynamic message) {
  _printException("fail",message);
  // debugPrint("fail:$message");
}

String getMessage(ex){
  try {
    return ex.message;
  } catch (e) {
    return '$ex';
  }
}

String getErrorMessage(){
  // return '刷新失败，请稍后再试';
  return '${config.langMap['baseLang']['networkError']['netWorkOverTimeRetry']}';
}

void _printException(String tag, dynamic exp){
  if(exp is String){
    print('$tag ${DateTime.now()} $exp');
  }else{
    print('$tag ${DateTime.now()}');
    print(exp);
  }
}

