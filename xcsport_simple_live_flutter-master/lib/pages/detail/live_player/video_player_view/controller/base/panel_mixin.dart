import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:flutter/material.dart';
import '../../common_video_player_controller.dart';
import '../tool_panel_controller.dart';

mixin ToolPanel {
  ToolPanelController toolPanel;
  CommonVideoPlayerController videoPlayer;

  /// 设置(VoidListener)Parent回调
  void setPlayer(CommonVideoPlayerController player) {
    videoPlayer = player;
  }
}

/// PanelAnimateAction
mixin PanelAnimateAction {
  bool isShow = false;
  AnimationController _animationController;
  set animationController(AnimationController newValue) {
    _animationController = newValue;
  }

  void hide([bool forward = true]) {
    if(!(_animationController?.isAnimating ?? false)) {
      if(forward) {
        _animationController?.forward();
      }
      else {
        _animationController?.reverse();
      }
    }
    isShow = false;
  }

  void show([bool reverse = true]) {
    if(!(_animationController?.isAnimating ?? false)) {
      if(reverse) {
        _animationController?.reverse();
      }
      else {
        _animationController?.forward();
      }
    }
    isShow = true;
  }

  bool get isShowFinished {
    return (_animationController?.value ?? 0) == 0;
  }

  bool get isHideFinished {
    return (_animationController?.value ?? 0) == 1;
  }

  bool get isShowed {
    if(_animationController == null)
      return false;
    return (_animationController?.value ?? 0) == 1;
  }
}

/// PanelAction
mixin PanelAction {
  ValueChanged<PanelActionModel> _onPanel;
  ValueChanged<PanelActionModel> get onPanel => _onPanel;
  set onPanel(ValueChanged<PanelActionModel> newValue) {
    _onPanel = newValue;
  }
  bool isShow = false;

  void show() {
    isShow = true;
    _onPanel?.call(PanelActionModel());
  }

  void hide() {
    isShow = false;
    _onPanel?.call(PanelActionModel(type: PanelActionType.hide, value: false));
  }

  void showBroad() {
    _onPanel?.call(PanelActionModel(type: PanelActionType.showKeyBoard));
  }

  void hideKeyBoard() {
    _onPanel?.call(PanelActionModel(type: PanelActionType.hideKeyBoard, value: false));
  }

  void sendMessage() {
    _onPanel?.call(PanelActionModel(type: PanelActionType.sendMessage, value: ''));
  }

  void setText(String text) {
    _onPanel?.call(PanelActionModel(type: PanelActionType.setText, value: text));
  }
  void fresh() {
    _onPanel?.call(PanelActionModel(type: PanelActionType.fresh, value: ''));
  }
}

enum PanelActionType {
  show,
  hide,
  showKeyBoard,
  hideKeyBoard,
  sendMessage,
  setText,
  fresh,
}


class PanelActionModel {
  PanelActionType type;
  dynamic value;
  PanelActionModel({this.type = PanelActionType.show, this.value = true});
}