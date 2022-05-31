import 'dart:async';
import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_window.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';


class FloatRedPacketLandscape extends StatefulWidget {
  final ToolPanelController toolPanelController;
  FloatRedPacketLandscape({Key key, this.toolPanelController,}) : super(key: key);
  @override
  _FloatRedPacketLandscapeState createState() => _FloatRedPacketLandscapeState();
}

class _FloatRedPacketLandscapeState extends State<FloatRedPacketLandscape> {
  ToolPanelController get toolPanel => widget.toolPanelController;
//  String get systemId => toolPanel.horizontalPlayListModel.matchesDetailModel?.data?.systemId;
  //List<RedPacketModel> redPackets = [];

//  StreamSubscription<SyncRedPacketEvent> syncRedPacketEvent;

  @override
  void initState() {
    super.initState();
//    print('000-initState-systemId=$systemId');
  }


  @override
  void dispose() {
    super.dispose();

    redPacketTimer?.cancel();
    print(' --- FloatRedPacketLandscape dispose --- ');
  }


  Timer redPacketTimer;
  int redPacketCountdown = 0;
  StateSetter redPacketCountDownSetState;
  var syncLock = Lock();
  void redPacketCountDown() async {
    if(config.redPackets.length == 0 || redPacketTimer != null) return;
    print('--- FloatRedPacketLandscape-redPacketCountDown');

    await syncLock.synchronized((){
      RedPacketModel model = config.redPackets.first;
      if(model.startTime > model.systemTime) {
        redPacketCountdown = (model.startTime - model.systemTime)~/1000;
        //if(redPacketCountdown > 30) redPacketCountdown = 28;
        print('--- FloatRedPacketLandscape redPacketCountdown=$redPacketCountdown model.startTime=${model.startTime}, model.systemTime=${model.systemTime}');
        assert(redPacketCountdown <= 30);

        redPacketTimer = Timer.periodic(Duration(seconds: 1), (timer){
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


  @override
  Widget build(BuildContext context) {
//    print('00-build orientation=${MediaQuery.of(context).orientation}, systemId=$systemId redPacketTimer=$redPacketTimer, len=${config.redPackets.length}');
    if(MediaQuery.of(context).orientation == Orientation.portrait || config.redPackets.length == 0) {
      print('--- FloatRedPacketLandscape redPacketTimer cancel ---');
      return Container();
    }
    redPacketCountDown();
//    print('11-build orientation=${MediaQuery.of(context).orientation}, systemId=$systemId redPacketTimer=$redPacketTimer');

    return InkWell(
      onTap: () {
        toolPanel.betStateController.hide();
        toolPanel.hide();
//        showRedBagWindow(context, redPacket: config.redPackets.first, systemId: systemId);
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
                color: Theme.of(context).colorScheme.secondary,
                child: Text('  ${config.redPackets.length}  ', style: TextStyle(fontSize: 10, color: Color(0xFFFE3F47)),),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              redPacketCountDownSetState = setState;
              return Positioned(
                bottom: 7.5,
                child: Text(redPacketCountdown > 0 ? '$redPacketCountdown' : config.baseLang['detail']['chatroom']['robRedPackage'], textAlign: TextAlign.center, style: AiTextStyle(
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
    );
  }
}



