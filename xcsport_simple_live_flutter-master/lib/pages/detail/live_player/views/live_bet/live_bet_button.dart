//**********************************************************************
//* author:Sam
//* date:2020-03-07
//**********************************************************************


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//投注按钮
class LiveBetButton extends StatelessWidget {
  final BetStateController betStateController;
  LiveBetButton({this.betStateController});

  @override
  Widget build(BuildContext context) {
    if(betStateController.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();
    return InkWell(
      onTap: (){
        betStateController.show();
        betStateController.toolPanel.hide();
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Row(
          children: <Widget>[
            AiSvgPicture.asset("assets/images/liveplayer/icon_live_bet_normal.svg", width: 28,height: 28,),
            InterValHelper.w(10),
            TextHelper.build(config.langMap['baseLang']['detail']['bet'], textColor: Colors.white.value, fontSize: 16),
            InterValHelper.w(12),
          ],
        ),
      ),
    );
  }
}
