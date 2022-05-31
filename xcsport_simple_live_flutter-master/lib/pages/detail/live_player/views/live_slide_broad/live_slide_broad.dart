//**********************************************************************
//* author:Sam
//* date:2020-03-20
//**********************************************************************

import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveSlideBroad   extends StatelessWidget {
  final ToolPanelController toolPanelController;
  final HorizontalDragCallBack horizontalDragCallBack;

  LiveSlideBroad(this.toolPanelController,{this.horizontalDragCallBack});

  @override
  Widget build(BuildContext context) {
    return XcSlide(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
      ),
      slideFreshCallback: (direction){
        if(SlideDirection.left == direction){
          print(direction);
          toolPanelController.moreLeagueController.show();
          toolPanelController.hide();
        }
      },
      horizontalDragCallBack:horizontalDragCallBack
    );
  }
}
