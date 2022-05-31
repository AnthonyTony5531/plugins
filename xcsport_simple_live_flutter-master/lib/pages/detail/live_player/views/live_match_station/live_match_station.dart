//**********************************************************************
//* author:Sam
//* date:2020-03-06
//**********************************************************************

//import 'package:fast_ai/pages/detail/data/data_match_result/data_match_result.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_frame/live_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//赛况数据
class LiveMatchStation extends StatefulWidget {
  final MatchStationController controller;
  LiveMatchStation({this.controller, Key key}):super(key:key);

  @override
  LiveMatchStationState createState() => LiveMatchStationState();
}

class LiveMatchStationState extends State<LiveMatchStation> {

  final LiveFrameController controller   = new LiveFrameController();

  void show(){
    if(mounted){
      controller.show();
    }
  }

  void dismiss(){
    if(mounted){
      controller.dismiss();
    }
  }


  @override
  void initState() {
    super.initState();
    widget.controller.onPanel = onPanel;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.onPanel = null;
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.show : {
        show();
        break;
      }
      case PanelActionType.hide : {
        dismiss();
        break;
      }
      default : {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();

    return SafeArea(
      child: LiveFrame(
          width: 375,
          liveFrameController: controller,

//        child: Stack(
//          children: <Widget>[
//            Positioned(
//              left: 0,
//              right: 0,
//              top: 0,
//              bottom: 0,
//                child: DataMatchResult(
//                  matchesDetailModel: widget.controller.toolPanel.horizontalPlayListModel.matchesDetailModel,
//                  isLandscape: true,
//                  formPage: 'live',
//                ))
//
//          ],
//        ),
      
      ),
    );
  }



}
