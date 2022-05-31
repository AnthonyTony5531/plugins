
// import 'package:fast_ai/utils/model_controller_builder.dart';
// import 'package:flutter/material.dart';
//
// import '../../live_player_controller.dart';
// import 'live_topbar_model.dart';
//
// class LiveTopbarController extends ModelController<LiveTopbarModel> with LivePlayerChildController  {
//   LiveTopbarController({LiveTopbarModel defaultMoel}) : super(defaultModel : defaultMoel ?? LiveTopbarModel());
//
//   AnimationController animationController;
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
//     this.leagueGameTap.setParent(player?.anyAction);
//     this.backTap.setParent(player?.anyAction);
//     this.pickupChanged.setParent(player?.anyAction);
//     this.moreTap.setParent(player?.anyAction);
//   }
//
// }



