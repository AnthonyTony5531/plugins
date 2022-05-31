import 'dart:async';
import 'package:flutter/material.dart';

/// PanelAnimateAction
mixin PanelAnimateAction on BaseModelController {
  AnimationController animationController;
  void hideAnimation() {
    animationController?.forward();
  }

  void showAnimation() {
    animationController?.reverse();
  }

  bool get isShowFinished {
    return (animationController?.value ?? 0) == 0;
  }

  bool get isHideFinished {
    return (animationController?.value ?? 0) == 1;
  }
}

/// PanelAction
mixin PanelAction {
  bool isShow = false;
  void show();
  void hide();
}

/// BaseModelController
abstract class BaseModelController<T> {
  BaseModelController({@required T model}) : _model = model;

  StreamController<T> _controller;
  T _model;
  T get model => _model;
  set model(T model) {
    _model = model;
    if(_controller != null){
      _controller.sink.add(model);
    }
  }

  Stream<T>stream() {
    if(_controller != null) {
      _controller.close();
    }
    _controller = StreamController<T>();
    return _controller.stream;
  }

  void update() {
    if(_controller == null) return;

    _controller.sink.add(model);
  }

  dispose(){
    _controller?.close();
  }
}

/*
  LiveTopbarController
  var leagueGameTap = VoidListener(); //点击显示联赛
  var backTap = VoidListener();    //点击回退
  var pickupChanged = ValueChangedListener<bool>();  //收点状态变化
  var moreTap = VoidListener();


  LiveBottombarController
  var settingTap = VoidListener();
  var anchorSelectorTap = VoidListener();
  var autioStateChanged = ValueChangedListener<AutioState>();
  var videoTypeChanged = ValueChangedListener<VideoType>();
  var screenDirectionChanged = ValueChangedListener<ScreenDirection>();
  void setVideoType(VideoType videoType){
    currentModel.videoType = videoType;
    videoTypeChanged.fire(videoType);
  }


  LiveVideoSelectorController
  LiveVideoSelectorState state;
  bool get isShowed {
    return state?.isShowed ?? false;
  }


  AnchorSelectorController
  bool get isShowed{
    if(animationController == null)
      return false;
    return animationController.value == 1;
  }
  VoidListener anchorVideoChanged = VoidListener();


  AnchorSelectorController
  int currentIndex = 0;
  void show() {
    currentIndex = 0;
    animationController?.forward();
  }
  bool get isShowed{
    if(animationController == null)
      return false;
    return animationController.value == 1;
  }
  VoidListener anchorVideoChanged = VoidListener();


  LiveChatBarController
  void synText(String text) {
    key.currentState?.setText(text);
  }
  void showBroad() {
    key.currentState?.showBoard();
  }
  void sendMessage() {
    key.currentState?.sendMessage();
  }


  LiveBottombarTextController
  void setText(String text) {
    textKey.currentState?.textEditingController?.text = text;
  }
  void fresh() {
    textKey.currentState?.fresh();
  }


  ActiveBannerController
  var leagueGameTap = VoidListener(); //点击显示联赛
  var backTap = VoidListener();    //点击回退
  var pickupChanged = ValueChangedListener<bool>();  //收点状态变化
  var moreTap = VoidListener();
  */