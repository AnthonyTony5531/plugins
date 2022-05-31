import 'package:fast_ai/config/config.dart';
/**********************************************************
 * 创建: south
 * 日期: 2019-10-21
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            编写ErrorCode与ErrorMsg
 **********************************************************/

import 'package:flutter/foundation.dart';


@immutable
class ErrorCode{
  static const int Success = 200;
  static const int Exception = -1;
  static const int NetworkException = -100;
}

var _errorMsgs = {
  ErrorCode.Success: config.langMap['baseLang']['success'],
  ErrorCode.Exception: config.langMap['baseLang']['exception'],
  ErrorCode.NetworkException: config.langMap['baseLang']['networkError']['networkException']
};

@immutable
class ErrorMsg{
  static const ErrorMsg msg = const ErrorMsg();
  const ErrorMsg();
  operator[](int errorCode){
    if(_errorMsgs.containsKey(errorCode))
      return _errorMsgs[errorCode];
    return "errorCode=$errorCode ${config.langMap['baseLang']['noErrorCode']}";
  }
}

