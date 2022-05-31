import 'dart:async';
import 'dart:io';

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/collection.dart';
import 'package:string_unescape/string_unescape.dart';
import 'package:web_socket_channel/io.dart';

import 'xc_stomp_protocol_builder.dart';
import 'xc_stomp_utils.dart';
import 'xc_subcribecallback.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-05
 **********************************************************************
 */
//stomp 客户端
class XCStompClient {
  static XCStompClient _ins;
  static XCStompClient get ins {
    if (_ins == null) {
      _ins = XCStompClient._();
    }
    return _ins;
  }

  XCStompClient._();

  final bool isDebug = true;
  static String _tag = 'XCStompClient';
  WebSocket _webSocket;
  int _heartBeatCount = 0;
  bool _running = false;
  num _heartbeatLastRecieveTimeStamp = -1;
  Set<VoidCallback> _onConnected = Set<VoidCallback>();
  Set<VoidCallback> _onDisconnected = Set<VoidCallback>();
  var map =  LinkedLruHashMap(maximumSize: 200);

  onConnected(VoidCallback callback) {
    _onConnected.add(callback);
  }

  clearConnected(VoidCallback callback) {
    _onConnected.remove(callback);
  }

  _fireOnConnected() {
    _onConnected.forEach((f) {
      try {
        f();
      } catch (e) {
        logError(e);
      }
    });
  }

  onDisconnected(VoidCallback callback) {
    _onDisconnected.add(callback);
  }

  clearDisconnected(VoidCallback callback) {
    _onDisconnected.remove(callback);
  }

  _fireDisconnected() {
    _onDisconnected.forEach((f) {
      try {
        f();
      } catch (e) {
        logError(e);
      }
    });
  }

  String get _token {
    return config?.userInfo?.token;
  }

  //是否连接上服务器
  bool get isConnected {
    return wsChannel != null;
    /*
    if (_webSocket == null) return false;
    return true;
    */
  }

  void forceClosed() {
    _closeWebSocket('主动关闭');
  }
  
  static Map<String, XCSubcribeCallback> _subscribeCallbacks = {};
  //订阅消息
  void subscribe(XCStompAction action, String topic,
      ValueChanged<Map<String, dynamic>> callback) {
    _log("订阅 >>$topic");
    XCSubcribeCallback xcCallback;
    if (_subscribeCallbacks.containsKey(topic)) {
      var oldId = _subscribeCallbacks[topic].subcribeId;
      xcCallback = XCSubcribeCallback(
          topic: topic, callback: callback, subcribeId: oldId, action: action);
      _subscribeCallbacks[topic] = xcCallback;
    } else {
      xcCallback = XCSubcribeCallback(
          action: action,
          topic: topic,
          callback: callback,
          subcribeId: XCStompUtils.createUniqueId());
      _subscribeCallbacks[topic] = xcCallback;
    }
    _sendSubscribe(topic: topic, subscribeId: xcCallback.subcribeId);
  }

  //取消订阅
  void unsubscribe(XCStompAction action, String topic) {
    _log("退订 >>$topic");
    var xcCallback = _subscribeCallbacks[topic];
    if (null != xcCallback) {
      _sendUnsubscribe(xcCallback.subcribeId);
      _subscribeCallbacks.remove(topic);
    }
  }

  //发送消息
  void sendMessage(String target, String message) {
    _send(XCStompProtocolBuilder.sendMessage(target, message));
  }

  //断开链接
  Future stop() async {
    _log("停止连接");
    _running = false;
    try {
      _closeWebSocket("停止连接时关闭");
    } catch (e) {}
  }

  void startConnect() async {
    if (_running) return;
    _running = true;
    while (_running) {
      if (isConnected) {
        await Future.delayed(Duration(seconds: 3));
        checkAlive();
        continue;
      }
      if (isNullOrEmpty(_token)) {
        //token丢失，主动关闭连接
        _closeWebSocket("token丢失，主动关闭连接");
        await Future.delayed(Duration(seconds: 5));
        continue;
      }
      try {
        String chatPath = '/chat/websocket';
        if(config.isGbet){
          chatPath = '/gchat/websocket';
        }
        String url = '${Api.baseImUrl}$chatPath/${XCStompUtils.createWebsocketUrlUniqueSuffix()}';
        //String url = 'ws://192.168.20.30:10101/chat/websocket/${XCStompUtils.createWebsocketUrlUniqueSuffix()}';
        await __connectOnce(url);
      } catch (e) {
        _closeWebSocket("连接异常");
        logError(e);
      }
      await Future.delayed(Duration(seconds: 5));
    }
  }

  IOWebSocketChannel _wsChannel;
  IOWebSocketChannel get wsChannel => _wsChannel;
  Future __connectOnce(String url) async {
    //  WebSocket的connect方法在2.0已经被移除，继续用需要实现它一系列方法，现在使用IOWebSocketChannel来代替
    _closeWebSocket("连接前主动关闭");
    int heartbeatTime = 10000;
    _log("开始连接:$url");
    if(_wsChannel == null) {
      _wsChannel = IOWebSocketChannel.connect(url);
    }
    _wsChannel?.stream?.handleError((error){
      print('_wsChannel.stream.handleError=${error?.toString()}');
    });
    _wsChannel?.stream?.listen((data) {
      print('=webSocket 数据接收${data?.toString()}');
      _heartBeatCount += 1;
      keeplive();
      bool isHeartbeat = _isHeartbeat(data);
      if (!isHeartbeat) {
        //_log("接收数据:$data");
      } else {
        // _log("接收心跳:$data");
      }

      ///如果是第一次登录
      if (_needLogin(data)) {
        String loginName = XCStompUtils.createUniqueId();
        String password = '';
        _send(XCStompProtocolBuilder.login(loginName, password, heartbeatTime, _token));
        return;
      }
      //登录成功
      if (_isLoginSuccess(data)) {
        _subscribeAlls();
        return;
      }
      if (_isSessionClosed(data)) {
        _closeWebSocket("收到服务器关闭会话");
        return;
      }
      //是否是第一次发送的心跳，需要回复心跳
//        if (_needReplyHeartBeat(data)) {
//          _replyHeartbeat();
//        }
      if(_heartBeatCount >= 2){
        _heartBeatCount = 0;
        _replyHeartbeat();
      }
      if (!isHeartbeat) {
        //接收数据转发到接收端
        _onSubscribe(data);
      } else {
        _onHeartBeat();
      }
    }, onDone: () {
      logInfo("会话结束 onDone");
      _closeWebSocket("会话结束 onDone");
    }, onError: (error){
      _closeWebSocket("会话出错, error=${error?.toString()}");
    }, cancelOnError: true);
    if(_wsChannel != null) _fireOnConnected();
    _subscribeAlls();
    /*
    _closeWebSocket("连接前主动关闭");

    int heartbeatTime = 10000;

    _log("开始连接:$url");
    await WebSocket.connect(url).then((websocket) {
      if (websocket == null) return;
      _webSocket = websocket;
      _webSocket.handleError(() {
        _closeWebSocket("会话出错 handleError");
      });
      _webSocket?.listen((data) {
        if (websocket != _webSocket) return;

        _heartBeatCount += 1;
        keeplive();
        bool isHeartbeat = _isHeartbeat(data);
        if (!isHeartbeat) {
          //_log("接收数据:$data");
        } else {
          // _log("接收心跳:$data");
        }

        ///如果是第一次登录
        if (_needLogin(data)) {
          String loginName = XCStompUtils.createUniqueId();
          String password = '';
          _send(XCStompProtocolBuilder.login(
              loginName, password, heartbeatTime, _token));
          return;
        }
        //登录成功
        if (_isLoginSuccess(data)) {
          _subscribeAlls();
          return;
        }
        if (_isSessionClosed(data)) {
          _closeWebSocket("收到服务器关闭会话");
          return;
        }
        //是否是第一次发送的心跳，需要回复心跳
//        if (_needReplyHeartBeat(data)) {
//          _replyHeartbeat();
//        }
        if(_heartBeatCount >= 2){
          _heartBeatCount = 0;
          _replyHeartbeat();
        }
        if (!isHeartbeat) {
          //接收数据转发到接收端
          _onSubscribe(data);
        } else {
          _onHeartBeat();
        }
      }, onError: (err) {
        _closeWebSocket("会话出错");
      }, onDone: () async {
        logInfo("会话结束 onDone");
        _closeWebSocket("会话结束 onDone");
      }, cancelOnError: true);
      _fireOnConnected();
    });
    _subscribeAlls();
    */
  }

  void _closeWebSocket(String reason) {
    if(wsChannel == null) return;
    _log("连接断开 $reason .... ");
    try {
      wsChannel.sink.close();
    } catch (e) {}
    _fireDisconnected();
    /*
    if (_webSocket == null) return;

    _log("连接断开 $reason .... ");
    try {
      if (_webSocket != null) {
        _webSocket?.close();
        _webSocket = null;
      }
    } catch (e) {}
    _fireDisconnected();
    */
  }

  DateTime _lastKeeplive = DateTime.now();
  void keeplive() {
    _lastKeeplive = DateTime.now();
    // _log("keeplive");
  }

  void checkAlive() {
    var now = DateTime.now();
    var diff = now.difference(_lastKeeplive);
    // _log("check alive : ${diff.inSeconds}");
    if (diff.inSeconds > 30) {
      _closeWebSocket("30秒未接收到数据");
    }
  }

  static const _codeLogin = 'o';
  //链接成功初始化回调
  void _subscribeAlls() {
    //重连后，恢复订阅,针对放着不动的页面。
    if (null != _subscribeCallbacks && _subscribeCallbacks.length > 0) {
      for(var topic in  _subscribeCallbacks.keys){
        var xcCallback = _subscribeCallbacks[topic];
        //换最新的订阅
        _log("重新订阅数据 $topic");
        _sendUnsubscribe(xcCallback.subcribeId);
      }

      for(var topic in  _subscribeCallbacks.keys){
        var xcCallback = _subscribeCallbacks[topic];
        //换最新的订阅
        _log("重新订阅数据 $topic");
        _send(XCStompProtocolBuilder.subscribe(
            subscribeId: xcCallback.subcribeId, topic: topic));
      }
    }
  }

  //每一针心跳
  void _onHeartBeat() {
    var now = DateTime.now().millisecondsSinceEpoch;
    // _log("收到心跳 ${_heartbeatLastRecieveTimeStamp<0?"":now-_heartbeatLastRecieveTimeStamp}");
    //利用心跳，来flush之前没有发送成功的消息。
    _heartbeatLastRecieveTimeStamp = now;
  }

  //发送
  bool _send(String data, [bool isHeartbeat = false]) {
    try {
      if (isConnected) {
        if (!isHeartbeat) {
          _log("发送数据:$data");
        } else {
          // _log("发送心跳:$data");
        }
        wsChannel.sink?.add(data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logError(e);
      _closeWebSocket("发送时异常");
      return false;
    }
    /*
    try {
      if (isConnected) {
        if (!isHeartbeat) {
          _log("发送数据:$data");
        } else {
          // _log("发送心跳:$data");
        }
        _webSocket?.add(data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logError(e);
      _closeWebSocket("发送时异常");
      return false;
    }
    */
  }

  //回复心跳
  void _replyHeartbeat() {
//    _heartBeatCount = 0;
    _send(XCStompProtocolBuilder.heartbeat, true);
  }

  //是否需要开始建立链接
  bool _needLogin(String data) {
    return _codeLogin == data;
  }

  //是否需要回复心跳
  bool _needReplyHeartBeat(String data) {
    //每2个心跳回复一个心跳
    return 'a["\\n"]' == data;
  }

  //是否登录成功
  bool _isLoginSuccess(String data) {
    return data.startsWith('a["CONNECTED');
  }

  //是否登录成功
  bool _isSessionClosed(String data) {
    return data.startsWith('a["ERROR\nmessage:Session closed');
  }

  //是否是心跳包
  bool _isHeartbeat(String data) {
    return data.contains('["\\n"]');
  }

  //订阅
  void _sendSubscribe({String subscribeId, String topic}) {
    //["SUBSCRIBE\nid:sub-5\ndestination:/topic/1/2859186\n\n\u0000"]
    _sendUnsubscribe(subscribeId);
    _send(XCStompProtocolBuilder.subscribe(
        subscribeId: subscribeId, topic: topic));
  }

  //转发数据到订阅的主题回调函数
  void _onSubscribe(String data) {
    if (XCStompUtils.isJsonMessage(data)) {
      _dispatchJsonMessage(XCStompUtils.gainJsonData(data));
    }
  }

  //派发json消息
  void _dispatchJsonMessage(String data) {
    //为了解决在收到消息时候通讯取消订阅bug
    // var cc =  data.replaceAll("\\\"", "\"");
    var c1 = unescape(data);
    _subscribeCallbacks.forEach((callback, xcCallback) {
      try {
        xcCallback.dipatchMessage(c1);
        _log("dispatch:topic:" + xcCallback.topic);
      } catch (e) {
        logError(e);
      }
    });
  }

  //取消订阅
  void _sendUnsubscribe(String subscribeId) {
    String message = XCStompProtocolBuilder.unsubscribe(subscribeId);
    _send(message);
  }

  void _log(String value) {
    if (isDebug) {
      print('${DateTime.now()} $_tag $value');
    }
  }
}
