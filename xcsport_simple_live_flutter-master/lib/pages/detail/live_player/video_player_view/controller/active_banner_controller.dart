import 'package:fast_ai/pages/detail/active_banner/active_banner_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:flutter/material.dart';

import '../common_video_player_controller.dart';
import 'base/panel_mixin.dart';
import 'base/panel_model_controller.dart';

class ActiveBannerController extends PanelModelController<ActiveBannerModel> with PanelAnimateAction, ToolPanel {
  ActiveBannerController({ActiveBannerModel model}) : super(model: model ?? ActiveBannerModel());

  Orientation orientation = Orientation.portrait;

  var leagueGameTap = VoidListener(); //点击显示联赛
  var backTap = VoidListener();    //点击回退
  var pickupChanged = ValueChangedListener<bool>();  //收点状态变化
  var moreTap = VoidListener();


  @override
  void setPlayer(CommonVideoPlayerController player){
    super.setPlayer(player);
    leagueGameTap.setParent(player?.anyAction);
    backTap.setParent(player?.anyAction);
    pickupChanged.setParent(player?.anyAction);
    moreTap.setParent(player?.anyAction);
  }
}