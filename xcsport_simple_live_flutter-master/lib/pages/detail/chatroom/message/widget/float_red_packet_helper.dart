import 'dart:async';

import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/float_red_packet_portrait.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';
import 'package:flutter/material.dart';

class FloatRedPacketHelper {
  String systemId;
  String liveId;
  GlobalKey<FloatRedPacketPortraitState> _floatRedPacketKey;
  StreamSubscription<OpenedRedBagEvent> _openedRedBagEvent;
  FloatRedPacketHelper({this.systemId, this.gidm, this.liveId});

  bool _isLoading = false;

  String gidm;
  GlobalKey<FloatRedPacketPortraitState> get floatRedPacketKey => _floatRedPacketKey;

  void initHelper(){
    if(_openedRedBagEvent != null) return;
    _floatRedPacketKey = GlobalKey<FloatRedPacketPortraitState>();

    // 抢指定商户的红包
    XCStompClient.ins.subscribe(XCStompAction.RedBag, '/topic/redpack/${config.merchantAppConfig.merchantId}/', _redBagPushMsgCallback);
    XCStompClient.ins.subscribe(XCStompAction.FreeRedBag, '/topic/redpack/anchorLive/${config.merchantAppConfig.merchantId}/', _redBagPushMsgCallback);
    print('000-subscribeRedBagMsg merchantID=${config.userInfo?.account?.data?.merchantId}， merchantConfigDetail.merchantId=${config.merchantAppConfig.merchantId}');

    loadRedBagList(sysId: systemId);

    _openedRedBagEvent = Event.eventBus.on<OpenedRedBagEvent>().listen((OpenedRedBagEvent openRedBag){
      print('00-OpenedRedBagEvent>().listen-packetId=${openRedBag?.packetId} isError=${openRedBag?.isError} isTimeout=${openRedBag.isTimeout}');

      if(openRedBag != null && openRedBag.isError){
        config.syncRedPacketSystemTime(openRedBag.systemTime);

        if(config.redPackets.first.packetId == openRedBag.packetId){
          if(config.redPackets.length == 1 && !openRedBag.isTimeout) { // 只有一个红包报错就移除掉
            config.redPackets.clear();
          }
          else { // 第一个红包放到队列末尾
            config.redPackets.add(config.redPackets.first);
            config.redPackets.removeAt(0);
          }
        }
      } else {
        if(openRedBag?.packetId != null) { //刷新红包列表（抢的红包不再存在，角标-1）
          // 先刷新悬浮红包角标，然后再请求，防止在请求没回来前点击悬浮红包导致红包重复打开
          config.redPackets.removeWhere((e) => e.packetId == openRedBag.packetId);
          _floatRedPacketKey?.currentState?.updateFloatRedPacket();

          loadRedBagList(openedPacketId: openRedBag.packetId);
        }
      }
    });
  }

  void _redBagPushMsgCallback(Map<String,dynamic> msg){
    logDebug('收到普通红包推送 >>>> msg=${msg.toString()}');

    // {action: 1019, topic: /topic/redpack/, data: [{packetId: e32baf3159490ac038d4129fac788386, startTime:0，currentDate:0}], groupId: null}
    List<dynamic> data = msg['data'] ?? [];
    List<RedPacketModel> redPackets = data.map((m)=>RedPacketModel.from(m, 0)).toList();
    if(redPackets.length == 0) return;
    RedPacketModel redPacketModel = redPackets.first;
    // 判断是否同一个自由播房间，不是不添加
    if(liveId != null && liveId != redPacketModel?.liveId) return;
    // 赛事直播间，收到自由播的红包，不添加
    if(!isStrNullOrEmpty(gidm) && !isStrNullOrEmpty(redPacketModel?.liveId)) return;

    redPackets.first.gidm = gidm;
    config.redPackets.add(redPackets.first);
    config.syncRedPacketSystemTime(redPackets.first.systemTime);
    floatRedPacketKey?.currentState?.updateFloatRedPacket();
    //if(mounted) setState(() { });
  }


  void disposeHelper(){
    _openedRedBagEvent?.cancel();

    // 抢指定商户的红包
    XCStompClient.ins.unsubscribe(XCStompAction.RedBag, '/topic/redpack/${config.merchantAppConfig.merchantId}/');
    // 自由播红包
    XCStompClient.ins.unsubscribe(XCStompAction.FreeRedBag, '/topic/redpack/anchorLive/${config.merchantAppConfig.merchantId}/');
  }

  /// 红包列表
  void loadRedBagList({String openedPacketId, String sysId}) {
//    if(isEmpty(sysId) || _isLoading) return;
    if(!isStrNullOrEmpty(liveId) && isStrNullOrEmpty(sysId) || (!isStrNullOrEmpty(gidm) && !isStrNullOrEmpty(sysId))  || !_isLoading){
      _isLoading = true;
      String liveIdStr = !isStrNullOrEmpty(liveId) ? '$liveId' : '';
      print('00-loadRedBagList-sysId=$sysId, systemId=$systemId');
      RedBagListNewProtocol(systemId: sysId ?? systemId, liveId: liveIdStr).request().then((rsp){
        _isLoading = false;
        print('11-loadRedBagList-openedPacketId=$openedPacketId');
        config.redPackets.clear();
        if(rsp.isSuccess){
          for(var item in rsp.redBags){
            logDebug('22-loadRedBagList-红包id == ${item.packetId}');
          }

          if(openedPacketId != null) {
            rsp.redBags.removeWhere((m)=>m.packetId==openedPacketId);
          }
          // 过滤不是自己房间号的自由播红包
          if(!isStrNullOrEmpty(liveId)){
            rsp.redBags.removeWhere((element) => element.liveId != liveId);
          }
          if(!isStrNullOrEmpty(gidm)){
            rsp.redBags.removeWhere((element) => element.liveId != null);
          }
          if(rsp.redBags.length != 0) config.redPackets.addAll(rsp.redBags);
        }
        print('33-chatroom-红包个数：${config.redPackets.length}, floatRedPacketKey?.currentState=${floatRedPacketKey?.currentState}');
        //if(mounted) setState(() { });
        floatRedPacketKey?.currentState?.updateFloatRedPacket();
      });
    }

  }


}