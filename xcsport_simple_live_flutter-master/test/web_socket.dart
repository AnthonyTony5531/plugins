

import 'package:fast_ai/utils/stomp/stomp.dart';
import 'package:fast_ai/utils/stomp/websocket.dart';

class WebSocketObj {
  String _url;
  StompClient stompClient;
  int _tryTime = 0;
  String _playerId;
  WebSocketObj(playerId) {
    this._url = 'ws://dev.m.xc.com:80/';
    // this._url = 'ws://192.168.20.57:10101/';
    this._playerId = playerId;
  }

  void openSocket() async {
    await connect('${this._url}chat/websocket/343/twertsfd/websocket', 
      onConnect: this.subscribe, 
      onDisconnect: this.reconnect,
      onError: this.error,
      onFault: this.fault,
      heartbeat: [10000, 10000]
      ).then((StompClient client) {
      print('client');
      this.stompClient = client;
    });
    print('openSocket');
  }

  subscribe(StompClient client, Map<String, String> headers) {
    if(this.stompClient == null) {
      this.stompClient = client;
    }
    if(this.stompClient != null) {
      print('socket connected！');
      this._tryTime = 0;
      this.stompClient.subscribeJson('sub-1','/topic/1/2852366', (headers, message) {
        print("阿斯顿发送到发送到》》》》"+message);
      });
    }
  }

  reconnect(StompClient client) {
    print('socket disconnect!');
    if(this._tryTime > 10) {
      print('reconnect over times: ${this._tryTime}');
      return;
    }
    this._tryTime++;
    if(!client.isDisconnected)
      client.disconnect();
    Future.delayed(Duration(seconds: 2)).then((v){
      this.openSocket();
    });  
  }

  void error(StompClient client, String message, String detail, Map<String, String> headers) {
    print('error');
  }

  void fault(StompClient client, error, stackTrace) {
    print('fault');
  }

}

