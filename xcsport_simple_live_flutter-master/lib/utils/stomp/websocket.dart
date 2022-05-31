//Copyright (C) 2013 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 07, 2013  6:56:09 PM
// Author: tomyeh
library stomp_websocket;

import "dart:async";

import 'package:web_socket_channel/io.dart';

import "impl/plugin.dart" show StringStompConnector;
import "stomp.dart" show StompClient;

/* Connects a STOMP server, and instantiates a [StompClient]
 * to represent the connection.
 *
 *     import "package:stomp/stomp.dart";
 *     import "package:stomp/websocket.dart" show connect;
 *
 *     void main() {
 *       connect("foo.server.com").then((StompClient stomp) {
 *         stomp.subscribeString("/foo", (String message) {
 *           print("Recieve $message");
 *         });
 *
 *         stomp.sendString("/foo", "Hi, Stomp");
 *       });
 *     }
 *
 * * [url] -- the URL of WebSocket to connect, such as `'ws://127.0.0.1:1337/foo'`.
 * * [onError] -- callback when the ERROR frame is received.
 * * [onFault] -- callback when an exception or a WebSocket error event is received.
 */
Future<StompClient> connect(String url,
    {String host,
      String login,
      String passcode,
      List<int> heartbeat,
      void onConnect(StompClient client, Map<String, String> headers),
      void onDisconnect(StompClient client),
      void onError(StompClient client, String message, String detail,
          Map<String, String> headers),
      void onFault(StompClient client, error, stackTrace)}) =>
    connectWith(IOWebSocketChannel.connect(url, pingInterval: Duration(seconds: 10)),
        host: host,
        login: login,
        passcode: passcode,
        heartbeat: heartbeat,
        onConnect: onConnect,
        onDisconnect: onDisconnect,
        onError: onError,
        onFault: onFault);

/* Connects a STOMP server with the given Web socket.
 *
 * * [onError] -- callback when the ERROR frame is received.
 * * [onFault] -- callback when an exception or a WebSocket error event is received.
 */
Future<StompClient> connectWith(IOWebSocketChannel socket,
    {String host,
      String login,
      String passcode,
      List<int> heartbeat,
      void onConnect(StompClient client, Map<String, String> headers),
      void onDisconnect(StompClient client),
      void onError(StompClient client, String message, String detail,
          Map<String, String> headers),
      void onFault(StompClient client, error, stackTrace)}) =>
    _WSStompConnector.startWith(socket).then((_WSStompConnector connector) =>
        StompClient.connect(connector,
            host: host,
            login: login,
            passcode: passcode,
            heartbeat: heartbeat,
            onConnect: onConnect,
            onDisconnect: onDisconnect,
            onError: onError,
            onFault: onFault));

///The implementation
class _WSStompConnector extends StringStompConnector {
  final IOWebSocketChannel _socket;
  Completer<_WSStompConnector> _starting = new Completer();

  static Future<_WSStompConnector> startWith(IOWebSocketChannel socket) =>
      new _WSStompConnector(socket)._starting.future;

  _WSStompConnector(this._socket) {
    _init();
  }
  void _init() {
    _socket.stream.listen((onData) {
      final data = onData;
      if (data != null) {
        final String sdata = data.toString();
        if(sdata.indexOf('["\\n"]') > -1)  {
          _socket.sink.add('["\\n"]');
          //心跳
        } else {
          if (sdata.isNotEmpty && onString != null) onString(sdata);
        }
      }
    }, onError: (event, StackTrace stackTrace) {
      if (_starting != null) {
        _starting.complete(this);
        _starting = null;
        if (onError != null)
          onError(event, null);
      } else if (onError != null) {
        onError(event, null);
      } else {
        print("Socket error: $event");
      }
    }, onDone: () {
      print('onDone');
      // if(onOpen != null) {
      //   onOpen();
      // }
    });
    if (_starting != null) {
      _starting.complete(this);
    }

    ///Note: when this method is called, onString/onError/onClose are not set yet
    // _socket.onMessage.listen((MessageEvent event) {
    //   final data = event.data;
    //   if (data != null) {
    //     //TODO: handle Blob and TypedData more effectively
    //     final String sdata = data.toString();
    //     if (!sdata.isEmpty) onString(sdata);
    //   }
    // }, onError: (error, stackTrace) {
    //   onError(error, stackTrace);
    // }, onDone: () {
    //   onClose();
    // });
    // _socket.onClose.listen((event) {
    //   onClose();
    // });
  }

  @override
  void writeString_(String string) {
    _socket.sink.add('["$string"]');
    print('send: ["$string"]');
  }

  @override
  Future close() {
    _socket.sink.close();
    return new Future.value();
  }
}
