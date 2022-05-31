/*
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:flutter/material.dart';

import '../../live_player_controller.dart';
import 'anchor_selector_model.dart';

class AnchorSelectorController extends ModelController<AnchorSelectorModel> with LivePlayerChildController {
  AnchorSelectorController({AnchorSelectorModel defaultModel}) : super(defaultModel : defaultModel ?? AnchorSelectorModel());

  int currentIndex = 0;

  AnimationController animationController;
  void hide() {
    animationController?.reverse();
  }
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

  @override
  void setPlayer(LivePlayerController player){
    super.setPlayer(player);
    this.anchorVideoChanged.setParent(player?.anyAction);
  }
}
 */
