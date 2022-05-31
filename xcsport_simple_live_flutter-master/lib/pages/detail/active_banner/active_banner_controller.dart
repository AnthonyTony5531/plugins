// import 'package:fast_ai/pages/detail/active_banner/active_banner_model.dart';
// import 'package:fast_ai/pages/detail/live_player/live_player_controller.dart';
// import 'package:fast_ai/utils/model_controller_builder.dart';
// import 'package:flutter/material.dart';
//
// class ActiveBannerController extends ModelController<ActiveBannerModel> with LivePlayerChildController  {
//   ActiveBannerController({ActiveBannerModel activeBannerModel}) : super(defaultModel : activeBannerModel ?? ActiveBannerModel());
//
//   AnimationController animationController;
//
//   Orientation orientation = Orientation.portrait;
//
//   void hide() {
//     animationController?.forward();
//   }
//   void show(){
//     animationController?.reverse();
//   }
//   bool get isShowFinished{
//     return (animationController?.value ?? 0) == 0;
//   }
//   bool get isHideFinished{
//     return (animationController?.value ?? 0) == 1;
//   }
//
//   var leagueGameTap = VoidListener(); //点击显示联赛
//   var backTap = VoidListener();    //点击回退
//   var pickupChanged = ValueChangedListener<bool>();  //收点状态变化
//   var moreTap = VoidListener();
//
//   @override
//   void setPlayer(LivePlayerController player){
//     super.setPlayer(player);
//     leagueGameTap.setParent(player?.anyAction);
//     backTap.setParent(player?.anyAction);
//     pickupChanged.setParent(player?.anyAction);
//     moreTap.setParent(player?.anyAction);
//   }
//
// }
//
//
//
