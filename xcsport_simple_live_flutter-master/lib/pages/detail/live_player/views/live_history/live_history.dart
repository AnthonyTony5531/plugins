//**********************************************************************
//* author:Sam
//* date:2020-03-06
//**********************************************************************

//import 'package:fast_ai/pages/detail/data/data_match_data/data_match_data.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_frame/live_frame.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//历史数据
class LiveHistory extends StatefulWidget {
  final HistoryController controller;

  LiveHistory({this.controller, Key key}) : super(key: key);

  @override
  LiveHistoryState createState() => LiveHistoryState();
}

class LiveHistoryState extends State<LiveHistory> {
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
    widget.controller.onPanel = onPanel;
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.onPanel = null;
    super.dispose();
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
    if (widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();

    return SafeArea(
      child: LiveFrame(
        width: AiMeasure.screenWidth(context)*0.8,
        liveFrameController: controller,
//        child: Stack(
//          children: <Widget>[
//            Positioned(
//                left: 0,
//                right: 0,
//                top: 0,
//                bottom: 0,
//                child: DataMatchData(
//                  matchesDetailModel: widget.controller.toolPanel.horizontalPlayListModel.matchesDetailModel,
//                  isLandscape: true,
//                )
//            ),
//          ],
//        ),
      ),
    );
  }
}
