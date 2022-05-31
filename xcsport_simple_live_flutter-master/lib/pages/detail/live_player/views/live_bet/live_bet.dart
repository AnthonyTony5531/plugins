//**********************************************************************
//* author:Sam
//* date:2020-03-06
//**********************************************************************

import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
//import 'package:fast_ai/pages/detail/live_player/views/HorizontalBet/HorizontalPlayList.dart';
//import 'package:fast_ai/pages/detail/live_player/views/HorizontalBet/HorizontalPlayListModel.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_frame/live_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//赛况数据
class LiveBet extends StatefulWidget {
  final BetStateController controller;

  LiveBet({this.controller});

  @override
  LiveBetState createState() => LiveBetState();
}

class LiveBetState extends State<LiveBet> {
  final LiveFrameController controller = new LiveFrameController();

  void show() {
    if (mounted) {
      controller.show();
    }
  }

  void dismiss() {
    if (mounted) {
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
    if (widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return SizedBox.shrink();

    return SafeArea(
      child: LiveFrame(
        //width: 434,
        width: 350,
        liveFrameController: controller,
//        child: HorizontalPlayList(
//          horizontalPlayListModel: widget.controller?.toolPanel?.horizontalPlayListModel ?? HorizontalPlayListModel(),
//        ),
      ),
    );
  }
}
