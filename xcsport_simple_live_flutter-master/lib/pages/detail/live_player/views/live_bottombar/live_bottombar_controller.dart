/*
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:flutter/material.dart';

import '../../live_player_controller.dart';
import 'live_bottombar_model.dart';

class LiveBottombarController extends ModelController<LiveBottombarModel> with LivePlayerChildController {
  LiveBottombarController({LiveBottombarModel defaultModel}) : super(defaultModel : defaultModel ?? LiveBottombarModel());

  bool _pingStatus = false;

  AnimationController animationController;
  void hide() {
    animationController?.forward();
  }
  void show(){
    animationController?.reverse();
  }
  bool get isShowFinished{
    return (animationController?.value ?? 0) == 0;
  }
  bool get isHideFinished{
    return (animationController?.value ?? 0) == 1;
  }

  var settingTap = VoidListener();
  var anchorSelectorTap = VoidListener();
  var autioStateChanged = ValueChangedListener<AutioState>(); 
  var videoTypeChanged = ValueChangedListener<VideoType>(); 
  var screenDirectionChanged = ValueChangedListener<ScreenDirection>(); 

  void setVideoType(VideoType videoType){
    // 多语言非中文动画显示比分(动画比赛信息无法显示多语言)
//    if(config.isNotCnTwLang && videoType == VideoType.Animation){
//      videoType = VideoType.Score;
//    }
    currentModel.videoType = videoType;
    videoTypeChanged.fire(videoType);
  }




  @override
  void setPlayer(LivePlayerController player){
    super.setPlayer(player);
    this.settingTap.setParent(player?.anyAction);
    this.anchorSelectorTap.setParent(player?.anyAction);
    this.autioStateChanged.setParent(player?.anyAction);
    this.videoTypeChanged.setParent(player?.anyAction);
    this.screenDirectionChanged.setParent(player?.anyAction);
  }

//  ///
//  void setPingStatus(bool ping){
//    _pingStatus = ping;
//    _pingStatusListener.forEach((l){
//      if(l!=null){
//        l(ping);
//      }
//    });
//  }
//
//  ///
//  bool getPingStatus(){
//    return _pingStatus;
//  }
//
//  List<ValueChanged<bool>> _pingStatusListener = [];
//  void addPingStatusListener(ValueChanged<bool> listener){
//    _pingStatusListener.add(listener);
//  }
//
//  void removePingStatusListener(ValueChanged<bool> listener){
//    _pingStatusListener.remove(listener);
//  }

}
*/
