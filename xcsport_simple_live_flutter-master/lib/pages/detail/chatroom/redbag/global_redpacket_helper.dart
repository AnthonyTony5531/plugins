import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/global_redpacket_view.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';
import 'package:flutter/cupertino.dart';

final String kGlobalRedPacketTopic = '/topic/world/redpack/';
final num kGlobalRedPacketAction = 1020;

//Toast 显示位置控制
enum PushType {
  None,
  MatchStart,       // 比赛开赛
  Goal,             // 进球
  RedCard,          // 红牌
  Discount,         // 优惠活动
  Notice,           // 平台公告
  Settlement,       // 订单结算
  SubscribeAnchor,  // 预约主播
  AnchorStart,      // 主播开播
  RedPacket,        // 全局红包

}

class GlobalRedPacketHelper {
  static BuildContext _context;
  static List<GlobalRedPacketModel> _redPackets = [];
  static bool _show = false;
  static DateTime _lastHitTime;
  static StreamSubscription<RedBagDisposeEvent> _redBagDisposeEvent;

  static void initHelper(BuildContext cxt) {
    if(_redBagDisposeEvent == null) {
      _redBagDisposeEvent = Event.eventBus.on<RedBagDisposeEvent>().listen((event){
        print('----_redBagDisposeEvent');
        showNextGlobalRedPacket();
      });
    }

    _context = cxt;
    XCStompClient.ins.onConnected((){
      print('GlobalRedPacketHelper 链接上了------');

      _redPacketSubscribe();
    });
    XCStompClient.ins.onDisconnected((){
      print('GlobalRedPacketHelper push 断开链接了 ------');
      _redPacketUnregister();
    });
  }

  static _redPacketSubscribe() {
    XCStompClient.ins.subscribe(XCStompAction.GlobalRedEnvelope, kGlobalRedPacketTopic, _globalRedEnvelopePushMsgCallback);
//    XCStompClient.ins.subscribe(XCStompAction.GlobalRedEnvelope, '$kGlobalRedPacketTopic${config.userInfo?.account?.data?.merchantId}/', _globalRedEnvelopePushMsgCallback);
  }

  static _redPacketUnregister() {
    XCStompClient.ins.unsubscribe(XCStompAction.GlobalRedEnvelope, kGlobalRedPacketTopic);
//    XCStompClient.ins.unsubscribe(XCStompAction.GlobalRedEnvelope, '$kGlobalRedPacketTopic${config.userInfo?.account?.data?.merchantId}/');
  }

  static bool didShowGlobalRedPacket(){
    return _show && _context != null;
  }

  static void _globalRedEnvelopePushMsgCallback(Map<String,dynamic> msg) {
    GlobalRedPacketMsgModel model = GlobalRedPacketMsgModel.fromJson(msg);
    if((model?.redpackets?.length ?? 0) > 0 &&
        (model.redpackets[0]?.platformInfo?.contains('${config.userInfo.sportPlatformId}') ?? false))//当前平台没有包含在platformInfo中则不显示红包
    {
      String gidm = model.redpackets[0].gidm;
      String pre = gidm?.substring(0,gidm.indexOf('_'));
      var platformInfo = SportPlatform.ins.getPlatform('${config.userInfo.sportPlatformId}');
      if(platformInfo.sourceCompany.contains(pre)){
        bool redPacketsettings = AiCache.get().getBool(AiCache.pushMsg_globalRedPacket) ?? true;
        bool isSystemRepairPage = (config.userInfo.showSystemRepairPage ?? false);
        bool isDetail = (config.userInfo.showIsDetailPage ?? false);
        print('_globalRedEnvelopePushMsgCallback ---- redPacketsettings=$redPacketsettings isSystemRepairPage=$isSystemRepairPage, isDetail=$isDetail, _show=$_show 收到全局红包推送 >>>> ${msg.toString()}');
        if(isSystemRepairPage || isDetail || !redPacketsettings) return;
        print('0000 >>>>>>>> 展示全局红包');
        //GlobalRedPacketMsgModel model = GlobalRedPacketMsgModel.fromJson(msg);
        print('1111 >>>>>>>> 展示全局红包 ${model.redpackets.length}');
        if(model.redpackets.length != 0) {
          _redPackets.add(model.redpackets[0]);
          print('2222 >>>>>>>> 展示全局红包');
          if(didShowGlobalRedPacket()) return;
          print('333 >>>>>>>> 展示全局红包');
          showGlobalRedPacket(_redPackets.first);
        }
      }
    }
  }

  static void showGlobalRedPacket(GlobalRedPacketModel packet) {
    if(_context == null || _show || packet == null) {
      return;
    }

    if(config.globalRedPacketOverlayEntry != null) {
      hideGlobalRedPacket();
    }

    _show = true;
    WidgetsBinding.instance.addPostFrameCallback((callback){
      config.globalRedPacketOverlayEntry = OverlayEntry(builder: (context){
        return GlobalRedPacketView(redPacket: packet,);
      });

      Overlay.of(_context).insert(config.globalRedPacketOverlayEntry);
    });
  }

  /// hide
  static void hideGlobalRedPacket({bool cancel=true}){
    print('00 >>>>>>>> 移除全局红包 ${DateTime.now()}');
    if(_context == null){
      return;
    }
    print('11 >>>>>>>> 移除全局红包 ${DateTime.now()}');
    // 防重复提交
    if(_lastHitTime != null && DateTime.now().difference(_lastHitTime) < Duration(milliseconds: 500)) return;
    _lastHitTime = DateTime.now();
    print('22 >>>>>>>> 移除全局红包 count=${_redPackets.length} ${DateTime.now()}');
    if(_redPackets.length > 0) _redPackets.removeAt(0);
    config?.globalRedPacketOverlayEntry?.remove();
    config?.globalRedPacketOverlayEntry = null;
    _show = false;
    print('33 >>>>>>>> 移除全局红包 count=${_redPackets.length} ${DateTime.now()}');
    if(cancel) showNextGlobalRedPacket();
    print('44 >>>>>>>> 移除全局红包 ${DateTime.now()}');
  }

  static void showNextGlobalRedPacket(){
    //print('-------showNextGlobalRedPacket');
    if(_redPackets.length > 0) {
      Future.delayed(Duration(seconds: 3), (){
        showGlobalRedPacket(_redPackets.first);
      });
    }
  }
}



class GlobalRedPacketMsgModel {
  /*
  {
   action: 1020,
   topic: /topic/world/redpack/,
   groupId: null,
   data: [
   {
     packetId: eac788764a0772659be43f4b4375b2e4,
     systemId: 42684013,
     headImg: https://static02.zgyjjj.cn/avatar/20200207/e18917b4ead5f87c8d1924c875bce7e0.png,
     nickName: 酷哥讲盘,
     gidm: ib_554536,
     anchorId: 895,
     content: 2000.0
     }
   ]}
  */
  num action;
  String topic;
  String groupId;
  List<GlobalRedPacketModel> redpackets = [];
  PushType pushType = PushType.RedPacket;

  GlobalRedPacketMsgModel.fromJson(Map<String, dynamic>map) {
    //{action: 1021, topic: /topic/redpack/rob/03365665/, data: [{packetId: 18eb5c6c92933ad22a17ae59d1bac98a, headImg: , nickName: alex01, content: 38}], groupId: null}
    action = AiJson(map).getNum('action');
    topic = AiJson(map).getString('topic');
    groupId = AiJson(map).getString('groupId');
    List items = AiJson(map).getArray('data');
    if(items.length != 0) {
      try{
        redpackets.addAll(items.map((f)=>GlobalRedPacketModel.fromJson(f)).toList());
        print('GlobalRedPacketMsgModel.fromJson redpackets=${redpackets.length}');
      }
      catch(e){
        print('GlobalRedPacketMsgModel.fromJson error=$e');
      }
    }
  }
}

class GlobalRedPacketModel {
  String packetId;
  String systemId;
  String headImg;
  String nickName;
  String gidm;
  String anchorId;
  double content;
  int startTime;
  int currentDate;
  String walletId;
  String liveId;
  PushType pushType = PushType.RedPacket;
  List<dynamic> platformInfo;

  GlobalRedPacketModel({this.packetId, this.systemId, this.headImg, this.nickName, this.gidm, this.anchorId, this.content});

  GlobalRedPacketModel.fromJson(Map<String, dynamic> map) {
    packetId = AiJson(map).getString('packetId');
    systemId = AiJson(map).getString('systemId');
    headImg = AiJson(map).getString('headImg');
    nickName = AiJson(map).getString('nickName');
    gidm = AiJson(map).getString('gidm');
    anchorId = AiJson(map).getString('anchorId');
    content = AiJson(map).getDouble('content');
    startTime = AiJson(map).getTimestamp('startTime');
    currentDate = AiJson(map).getTimestamp('currentDate');
    platformInfo = AiJson(map).getArray('platformInfo');
    walletId = AiJson(map).getString('walletId');
    liveId = AiJson(map).getString('liveId');

    config.session.setSystemTime(currentDate);
  }
}