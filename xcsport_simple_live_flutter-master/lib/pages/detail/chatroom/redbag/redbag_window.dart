import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_normal.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_opened.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/widgets/alert/text_explain_alert.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/material.dart';



///通用show方法
Future showRedBagWindow(BuildContext context, {RedPacketModel redPacket, String systemId, String liveId}){
  return showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return XCRedBagView(redPacket: redPacket, systemId: systemId, liveId: liveId,);
    },
  );
}


///最外层
class XCRedBagView extends StatefulWidget {
  final RedPacketModel redPacket;
  final String systemId;
  final String liveId;
  const XCRedBagView({Key key,this.redPacket,this.systemId, this.liveId}) : super(key:key);

  @override
  XCRedBagViewState createState() => XCRedBagViewState();
}

class XCRedBagViewState extends State<XCRedBagView>{
  bool isOpened = false;
  RedPacketStatus redPacketStatus = RedPacketStatus.normal;
  RedBagInfo redBagInfo;
  OpenedRedBagData openedRedBagData;

  bool _receivedRsp = false;

  void _loadRedBagInfo(String packetId){
    if(config.isNotConnect) {
      showToas(config.baseLang['networkError']['netWorkErrorRetry2']);
      AiRouter.pop(context);
      if(mounted) setState(() { });
      return;
    }

    if(packetId == null || packetId.length <= 0){
      return;
    }

    var req = RedBagInfoProtocol(packetId: packetId);
    Future.delayed(Duration(milliseconds: 3000), (){
      if(!_receivedRsp){
        showToas(config.baseLang['redBag']['message1']);
        req.cancel();
      }
    });

    _receivedRsp = false;
    req.request().then((rsp){
      _receivedRsp = true;
      if(!rsp.isSuccess){
        bool timeout = false;
        if(rsp.code == 401){
          showToas(config.baseLang['login']['tokenOverdue']);
        }
        else if(rsp.msg.contains('timed out') || rsp.msg.contains('Failed host lookup') || rsp.msg.contains('Connection refused')) {
          showToas(config.baseLang['networkError']['networkNoNet']);
          AiRouter.pop(context);
          timeout = true;
        }
        else {
          showToas(config.baseLang['redBag']['message1']);
          AiRouter.pop(context);
        }
        Event.eventBus.fire(OpenedRedBagEvent(packetId: packetId, systemTime: rsp.systemTime, isError: true, isTimeout: timeout));
        return;
      }
      print('11-RedBagInfoProtocol');
      redBagInfo = rsp.redBagInfo;
      redBagInfo.gidm = widget.redPacket.gidm; // 全局红包推送 或 详情传进来
      int count = (redBagInfo.startTime - redBagInfo.systemTime)~/1000;
      redPacketStatus = count > 0 ? RedPacketStatus.countdown : RedPacketStatus.open;
      print('22-RedBagInfoProtocol, count=$count, startTime=${redBagInfo.startTime}, systemTime=${redBagInfo.systemTime}');
      if(mounted) setState(() { });
    });
  }

  /// 开红包
  void _requestOpenRedBag() async{
    if(config.isNotConnect) {
      showToas(config.baseLang['networkError']['netWorkErrorRetry2']);
      redPacketStatus = RedPacketStatus.open;
      if(mounted) setState(() { });
      return;
    }

    var rsp = await OpenRedBagProtocol(
      packetId: redBagInfo.packetId,
      systemId: widget.systemId,
      liveId: widget.liveId,
    ).request().catchError((e){
      print('e ---> $e');



    });

    print('_requestOpenRedBag-rsp.code=${rsp.code} rsp.msg=${rsp.msg} systemTime=${rsp?.systemTime}');
    if(!rsp.isSuccess) {
      bool timeout = false;
      redPacketStatus = RedPacketStatus.normal;
      print('OpenRedBagProtocol msg=${rsp.msg}');
      if(rsp.code == 202){
        showToas(rsp.msg);//主播不能抢自己发的红包
      }else if(rsp.code == 401){
        showToas(config.baseLang['login']['tokenOverdue']);
      }else if(rsp.msg.contains('timed out') || rsp.msg.contains('Failed host lookup') || rsp.msg.contains('Connection refused')) {
        timeout = true;
        showToas(config.baseLang['networkError']['netWorkErrorRetry2']);
        RedPacketModel redPacket = config.redPackets.firstWhere((m)=>m.packetId==redBagInfo.packetId);
        if(redPacket != null) {
          int count = (redPacket.startTime - redPacket.systemTime)~/1000;
          redPacketStatus = count > 0 ? RedPacketStatus.countdown : RedPacketStatus.open;
        }
      }
      else {
        showToas(config.baseLang['redBag']['message2']);
        redPacketStatus = RedPacketStatus.open;
      }
      Event.eventBus.fire(OpenedRedBagEvent(packetId: redBagInfo.packetId, systemTime: rsp?.systemTime, isError: true, isTimeout: timeout));
      if(mounted) setState(() { });
      return;
    }

    Event.eventBus.fire(OpenedRedBagEvent(packetId: redBagInfo.packetId, systemTime: rsp?.systemTime));
    isOpened = true;
    openedRedBagData = rsp.openRedBagData;
    redPacketStatus = RedPacketStatus.normal;
    if(mounted) setState(() { });
  }

  @override
  void initState() {
    super.initState();
    print('XCRedBagViewState-initState-systemId=${widget.systemId}, packetId=${widget.redPacket.packetId}');
    ///未打开红包
    _loadRedBagInfo(widget.redPacket.packetId);
  }

  @override
  void dispose() {
    //退出打开红包页面
    Event.eventBus.fire(RedBagDisposeEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.center,
          child: InkWell(
            onTap: (){ },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: isPortrait ? (isOpened ? 469 : 449) : null ,
              child: !isOpened ? XCNormalRedBagView(
                redPacketStatus: redPacketStatus, // isOpening是否展示红包gif
                redBag: redBagInfo,
                openAction: (){
                  if(redPacketStatus == RedPacketStatus.countdown) {
                    redPacketStatus = RedPacketStatus.open;
                  }
                  else if(redPacketStatus == RedPacketStatus.open) {
                    redPacketStatus = RedPacketStatus.opening;
                    Future.delayed(Duration(milliseconds: 1000),(){
                      _requestOpenRedBag();
                    });
                  }
                  if(mounted) setState(() {});
                },
              ) : XCOpenedRedBagView(openedData: openedRedBagData,),
            ),
          ),
        ),
      ),
    );
  }

}



