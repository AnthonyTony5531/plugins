import 'dart:convert';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:flutter/cupertino.dart';

import '../string_util.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-05
 **********************************************************************
 */

enum XCStompAction {
  Chat,
  Gift,
  OverallGift, // 金额大于100，不同聊天室都能收到礼物消息
  IntoChatRoom,
  ChatRoomLike,
  LiveScore,
  GameDynamic, //所有页面关注比赛订阅 红牌/进球/开赛
  GameDataScore, //滚球页面订阅 红牌/进球/开赛
  SystemInfo,
  AnchorLive,    //预约主播直播
  Settlement,    //订单结算
  RedBag,        //红包
  FreeRedBag,    //自由播红包
  BetShare,
  AnchorBetShare,
  AnchorBetShareFollow,
  /// 全局红包
  GlobalRedEnvelope,
  RobGlobalRedEnvelope,
  ScoreDynamic,  //比赛详情页当前比赛比分动态
  DetailHandicap, //详情盘口
  ListHandicap, //列表盘口
  AnchorOffline, //详情主播下线
  FreeAnchorGame, //自由播游戏
  GameNotify,//游戏通知
}

//订阅对象，每个订阅对象的回调都带一个订阅id，用来订阅和取消用
class XCSubcribeCallback {
  final XCStompAction action;
  final String subcribeId;
  final String topic;
  final ValueChanged<Map<String, dynamic>> callback;
  XCSubcribeCallback({@required this.action, @required this.subcribeId, @required this.topic, @required this.callback});

  void dipatchMessage(String message) {
    String messageTopicId = '/topic/1/'; // 消息订阅Id
    String giftTopicId = '/topic/gift/';  // 礼物订阅Id
    var messageListJson = jsonDecode(message);
    var json = AiJson(messageListJson);
    var topicName = json.getString("topic").trim();
    var datas = json.getArray('data');
    var msgId = '';
    var giftMsgId = '';
    var giftKey = '';
   // 礼物重复(礼物订阅有两种:topic/gift/2 topic/gift/房间号 )
    if(topic.contains(giftTopicId)){
      if(datas.isNotEmpty){
        for (var value in datas) {
          giftMsgId = AiJson(value).getString('id');
          giftKey = topicName + giftMsgId;
          if(XCStompClient.ins.map.keys.contains(giftKey)){
            return;
          }
        }
      }
    }else{
      if(datas.isNotEmpty){
        for (var value in datas) {
          msgId = AiJson(value).getString('msgId');
          if(XCStompClient.ins.map.keys.contains(msgId)){
            return;
          }
        }
      }
    }
   // 聊天室重连后，listen监听会收到两天相同消息(但后端查看只连接和订阅一次)
    if(topicName == topic){
      if(isNotEmpty(msgId)){
        XCStompClient.ins.map[msgId] = msgId;
      }
       if(isNotEmpty(giftKey)){
        XCStompClient.ins.map[giftKey] = giftKey;
      }
      callback(messageListJson);
    }


    // var actionCode = AiJson(messageListJson).getNum("action");
    // if (this.action == XCStompAction.Chat && actionCode == 1000) {
    //   callback(messageListJson);
    // } else if (this.action == XCStompAction.GameDynamic && actionCode == 1004) {
    //   callback(messageListJson);
    // } else if (this.action == XCStompAction.GameDataScore && actionCode == 1010) {
    //   callback(messageListJson);
    // } else if (this.action == XCStompAction.SystemInfo && actionCode == 1005) {
    //   callback(messageListJson);
    // }
    // else if (this.action == XCStompAction.LiveScore && actionCode == 1008) {
    //   callback(messageListJson);
    // }
  }


}
