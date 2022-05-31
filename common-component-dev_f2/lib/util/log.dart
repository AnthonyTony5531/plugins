// @author king
// @date 2020-11-08

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

enum LogType { DEBUG, ERROR, INFO }

class Logger implements LoggerProxy {
  Pattern _contain = null;
  LogType _logType = null;
  String _biz;
  bool isOpen = true;
  void init(bool isOpen) {
    this.isOpen = isOpen;
  }

  void setFilter({Pattern contain, LogType logType, String biz}) {
    _contain = contain;
    _logType = logType;
    _biz = biz;
  }

  void clearFilter() {
    _contain = null;
    _logType = null;
  }

  LoggerProxy _proxy = DefaultLoggerProxy();

  void setLoggerProxy(LoggerProxy proxy) {
    _proxy = proxy;
  }

  @override
  void debug(String biz, msg) {
    if (!isOpen) return;
    if (_logType != null && LogType.DEBUG != _logType) {
      return;
    }
    if (null != _biz && _biz != biz) {
      return;
    }
    if (null != _contain) {
      if (msg.toString().contains(_contain)) {
        _proxy.debug(biz, msg);
      }
      return;
    }
    _proxy.debug(biz, msg);
  }

  @override
  void error(String biz, msg, [dynamic stack]) {
    if (!isOpen) return;
    if (_logType != null && LogType.ERROR != _logType) {
      return;
    }
    if (null != _biz && _biz != biz) {
      return;
    }
    if (null != _contain) {
      if (msg.toString().contains(_contain)) {
        _proxy.error(biz, msg, stack);
      }
      return;
    }
    _proxy.error(biz, msg, stack);
  }

  @override
  void info(String biz, msg) {
    if (!isOpen) return;
    if (_logType != null && LogType.INFO != _logType) {
      return;
    }
    if (null != _biz && _biz != biz) {
      return;
    }
    if (null != _contain) {
      if (msg.toString().contains(_contain)) {
        _proxy.info(biz, msg);
      }
      return;
    }
    _proxy.info(biz, msg);
  }
}

abstract class LoggerProxy {
  void debug(String biz, dynamic msg);
  void info(String biz, dynamic msg);
  //stack：错误栈信息
  void error(String biz, dynamic msg, [dynamic stack]);
}

class DefaultLoggerProxy implements LoggerProxy {
  @override
  void debug(String biz, dynamic msg) {
    if (kDebugMode) {
      _print('业务名:$biz level:debug \n日志:$msg');
    }
  }

  @override
  void info(String biz, dynamic msg) {
    if (kDebugMode) {
      _print('业务名:$biz level:info \n日志:$msg');
    } else {
      print('业务名:$biz level:info \n日志:$msg');
    }
  }

  @override
  void error(String biz, dynamic msg, [dynamic stack]) {
    if (kDebugMode) {
      _print('业务名:$biz level:error \n错误日志:$msg \n错误栈:${stack.toString()}');
    } else {
      print('业务名:$biz level:error \n错误日志:$msg \n错误栈:${stack.toString()}');
    }
  }

  void _print(String msg) {
    printWrapped(msg);
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => developer.log(match.group(0)));
  }
}

final Logger logger = new Logger();
