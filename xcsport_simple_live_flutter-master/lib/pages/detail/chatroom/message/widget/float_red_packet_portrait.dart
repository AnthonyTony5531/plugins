import 'dart:async';

import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_window.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';

class FloatRedPacketPortrait extends StatefulWidget {
  final String systemId;
  final bool isListDetail;
  final String liveId;
  const FloatRedPacketPortrait({Key key, this.systemId, this.isListDetail = false, this.liveId = ''}) : super(key: key);

  @override
  FloatRedPacketPortraitState createState() => FloatRedPacketPortraitState();
}

class FloatRedPacketPortraitState extends State<FloatRedPacketPortrait> {
  Timer redPacketTimer;
  int redPacketCountdown = 0;
  StateSetter redPacketCountDownSetState;
  var syncLock = Lock();
  void redPacketCountDown() async {
    if(config.redPackets.length == 0 || redPacketTimer != null) return;

    await syncLock.synchronized((){
      RedPacketModel model = config.redPackets.first;
      if(model.startTime > model.systemTime) {
        redPacketCountdown = (model.startTime - model.systemTime)~/1000;
        //if(redPacketCountdown > 30) redPacketCountdown = 28;
        assert(redPacketCountdown <= 30);
        print('--- ChatroomWidget redPacketCountdown=$redPacketCountdown model.startTime=${model.startTime}, model.systemTime=${model.systemTime}, systemTime=${config.session.systemTime}');
        redPacketTimer = Timer.periodic(Duration(seconds: 1), (timer){
          config.syncRedPacketSystemTime(config.redPackets.first.systemTime + 1000);
          print('detail chatroom redPack count down:$redPacketCountdown');
          if(redPacketCountdown <= 1) {
            redPacketCountdown = 0;
            redPacketTimer?.cancel();
            redPacketTimer = null;
          }
          else {
            redPacketCountdown--;
          }
          if(mounted) redPacketCountDownSetState(() {});
        });
      }
      else {
        redPacketCountdown = 0;
      }
    });
  }

  void updateFloatRedPacket(){
    if(mounted) setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    redPacketTimer?.cancel();
    print(' --- FloatRedPacketPortrait dispose --- ');
  }

  @override
  Widget build(BuildContext context) {
    print('00-float_red_packet_portrait-build-redPackets.length=${config.redPackets.length}');
    redPacketCountDown();

    return config.redPackets.length != 0 && (!isStrNullOrEmpty(widget.systemId) || !isStrNullOrEmpty(widget.liveId)) ? InkWell(
      onTap: (){
        if(widget.isListDetail)return;
        PopupShareService.ins.pause('_redPaketOpen');
        showRedBagWindow(context, redPacket: config.redPackets.first, systemId: widget.systemId, liveId: widget.liveId).then((value){
          PopupShareService.ins.resume('_redPaketOpen');
        });
      },
      child: Stack(
        clipBehavior: Clip.none, alignment: AlignmentDirectional.center,
        children: <Widget>[
          AiImage.asset('assets/images/detail/chatroom/redbag/new_redbag.gif', width: 60, scale: 1.5, fit: BoxFit.fitWidth),
          Positioned( // 红包个数角标
            top: -4,
            right: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7.5)),
              child: Container(
                height: 15,
                // alignment: Alignment.topRight,
                color: Theme.of(context).colorScheme.secondary,
                child: Text('  ${config.redPackets.length}  ',style: TextStyle(fontSize: 10, color: Color(0xFFFE3F47)),),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              redPacketCountDownSetState = setState;
              return Positioned(
                bottom: 7.5,
                child: Text(redPacketCountdown > 0 ? '$redPacketCountdown' : config.langMap['baseLang']['detail']['chatroom']['robRedPackage'], textAlign: TextAlign.center, style: AiTextStyle(
                  fontFamily: config.skin.fontFimaly.pingFang,
                  fontWeight: config.skin.fontWeight.regular,
                  fontSize: config.skin.fontSize.h6,
                  color: config.skin.colors.fontColorWhite,
                ),)
              );
            }
          ),
        ],
      ),
    ) : Container();
  }
}
