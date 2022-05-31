// import 'dart:convert';
// import 'dart:io';

// import 'package:fast_ai/api/api.dart';
// import 'package:fast_ai/config/config.dart';
// import 'package:fast_ai/utils/stomp/stomp.dart';
// import 'package:fast_ai/utils/stomp/websocket.dart' as Websocket;
// import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
// import 'package:fast_ai/utils/xcstomp/xc_stomp_utils.dart';

// import 'package:flutter/cupertino.dart';



// /**********************************************************************
//  * author:Sam
//  * date:2019-12-03
//  **********************************************************************
//  */

// //聊天客户端
// class ChatClient {
//   static ChatClient _instance = ChatClient._();
//   factory ChatClient() => _instance;
//   ChatClient._();


//   static  ChatClient  get() {
//     return _instance;
//   }

//   XCStompClient  _stompClient;

//   String _chatId;

//   set chatId(String id) {
//     _chatId = id;
//   }

//   String get chatId => _chatId;


//   //生产url
//   String buildConnectionUrl(){
//     return '${Api.baseImUrl}:${Api.IM_PORT}/chat/websocket/${XCStompUtils.createWebsocketUrlUniqueSuffix()}';
//   }


//   //var socket = new SockJS('/websocket');
//   //stompClient = Stomp.over(socket);
//   //var headers = {
//   //    loginName: '13714362525',//用户名
//   //    password: 'password'//密码
//   //};
//   //stompClient.connect(headers, function (frame) {
//   //    setConnected(true);
//   //})

//   //链接服务器
//   void connect() async {
//    // String url = '${Api.baseImUrl}:${Api.IM_PORT}/chat/websocket/${XCStompUtils.createUniqueId()}/twertsfd/websocket';
//     final String url = buildConnectionUrl();
//     _stompClient?.quite();
//     _stompClient = new XCStompClient(isDebug: true, onConnectedCallback: (){
//       print("ChatClient>>>>>>>>>>>>>>connected success!!");
//     });
//     _stompClient.connect(url);
//     print("ChatClient>>>>>>>>>>>>>>launcher");

//   }






//   //是否断开了链接
//   bool get isDisconnected => !_stompClient?.isConnected ?? true;

//   //退出
//   void quite() {
//     print("ChatClient subcribeJson>>>> quite");
//     _stompClient?.quite();
//     _stompClient = null;
//   }



//   //订阅消息
//   void subscribe(String target, ValueChanged<String> callback) {
//     print("ChatClient subcribeJson>>>> target=$target,$callback");
//     _stompClient?.subscribe(topic:target, callback:callback);
//   }

//   // 取消订阅
//   void unsubcribe( ValueChanged<String> callback){
//     print("ChatClient unsubcribe");
//     _stompClient?.unsubscribe(callback);
//   }

//   //发送消息
//   void sendMessage({String target, String message}) {
//     _stompClient?.sendMessage(target, message );
//   }


//   //如果客户端已经连接或重连成功，则就会执行完毕。
//   Future<void> waitConnectedIfDisconnected() async {
//     print("ChatClient waitConnectedIfDisconnected>>>>>>>>>>>>>>>>>>> enter");
//     while (isDisconnected) {
//       await Future.delayed(Duration(seconds: 1));
//     }
//     print("ChatClient waitConnectedIfDisconnected>>>>>>>>>>>>>>>>>> start");
//   }

// }
