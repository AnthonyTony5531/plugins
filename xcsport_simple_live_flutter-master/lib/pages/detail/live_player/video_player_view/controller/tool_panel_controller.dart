//import 'package:fast_ai/pages/detail/live_player/views/HorizontalBet/HorizontalPlayListModel.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:flutter/material.dart';

import '../common_video_player_controller.dart';
import 'active_banner_controller.dart';
import 'anchor_selector_controller.dart';
import 'base/panel_mixin.dart';
import 'bottom_bar_controller.dart';
import 'top_bar_controller.dart';

/// 播放器控制面板-控制器
class ToolPanelController {
  CommonVideoPlayerController videoPlayer;

  final TopBarController topBar;
  final BottomBarController bottomBar;
  final AnchorSelectorController anchorSelectorFull;
  final AnchorSelectorController anchorSelectorRight;
  final VideoSelectorController videoSelector;
  final HotHelperController hotHelperController;
  final HistoryController historyController;
  final MatchStationController matchStationController;
  final MoreMenuController moreMenuController;
  final MoreLeagueController moreLeagueController;
  final BetStateController betStateController;
  final VideoLiveController videoLiveController;
  final ActiveBannerController activeBannerController;
  final ChatBarController chatBarController;
  final BottomBarTextController bottomBarTextController;

//  HorizontalPlayListModel horizontalPlayListModel = HorizontalPlayListModel();

  ToolPanelController({
    @required LiveTopbarModel topBarModel,
    @required LiveBottombarModel bottomBarModel,
    @required AnchorSelectorModel anchorSelectorModel
  }) :  this.topBar = TopBarController(model: topBarModel ?? LiveTopbarModel()),
        this.bottomBar = BottomBarController(model: bottomBarModel ?? LiveTopbarModel()),
        this.anchorSelectorFull = AnchorSelectorController(model: anchorSelectorModel ?? AnchorSelectorModel()),
        this.anchorSelectorRight = AnchorSelectorController(model: anchorSelectorModel ?? AnchorSelectorModel()),
        this.videoSelector = VideoSelectorController(),
        this.hotHelperController = HotHelperController(),
        this.historyController = HistoryController(),
        this.matchStationController = MatchStationController(),
        this.moreMenuController = MoreMenuController(),
        this.moreLeagueController = MoreLeagueController(),
        this.betStateController = BetStateController(),
        this.videoLiveController = VideoLiveController(),
        this.activeBannerController = ActiveBannerController(),
        this.chatBarController = ChatBarController(),
        this.bottomBarTextController = BottomBarTextController();

  void _setToolPanel(CommonVideoPlayerController player) {
    videoPlayer = player;
    ToolPanelController panel = player != null ? this : null;
    topBar.toolPanel = panel;
    bottomBar.toolPanel = panel;
    anchorSelectorFull.toolPanel = panel;
    anchorSelectorRight.toolPanel = panel;
    videoSelector.toolPanel = panel;
    hotHelperController.toolPanel = panel;
    historyController.toolPanel = panel;
    matchStationController.toolPanel = panel;
    moreMenuController.toolPanel = panel;
    moreLeagueController.toolPanel = panel;
    betStateController.toolPanel = panel;
    videoLiveController.toolPanel = panel;
    activeBannerController.toolPanel = panel;
    chatBarController.toolPanel = panel;
    bottomBarTextController.toolPanel = panel;
  }

  void setPlayer(CommonVideoPlayerController player) {
    _setToolPanel(player);

    topBar.setPlayer(player);
    bottomBar.setPlayer(player);
    //videoSelector.setPlayer(player);
    anchorSelectorFull.setPlayer(player);
    activeBannerController.setPlayer(player);
    moreMenuController.setPlayer(player);
  }

  bool get isShowFinished => topBar.isShowFinished && bottomBar.isShowFinished && activeBannerController.isShowFinished;
  bool get isHideFinished => topBar.isHideFinished && bottomBar.isHideFinished && activeBannerController.isHideFinished;

  void hide() {
    topBar.hide();
    bottomBar.hide();
    videoSelector.hide();
    anchorSelectorFull.hide(false);
    anchorSelectorRight.hide(false);
    hotHelperController.hide();
    videoLiveController.hide();
    activeBannerController.hide();
  }

  void dismiss() {
    historyController.hide();
    matchStationController.hide();
    moreMenuController.hide();
    betStateController.hide();
    chatBarController.hide();
    moreLeagueController.hide();
    anchorSelectorFull.hide(false);
    anchorSelectorRight.hide(false);
    chatBarController.hideKeyBoard();
  }


  void show() {
    topBar.show();
    bottomBar.show();
    videoLiveController.show();
    activeBannerController.show();
    bottomBarTextController.fresh();
  }


  void updateAnchors(List<LiveVideoInfo> anchors, String defaultAnchorId, {bool isFreeAnchor = false}) {
    this.anchorSelectorFull.model.defaultAnchorId = defaultAnchorId;
    this.anchorSelectorFull.model.anchors = anchors;
    this.anchorSelectorRight.model.anchors = anchors;
    this.anchorSelectorFull.update();
    this.anchorSelectorRight.update();
    if(isFreeAnchor){
      this.anchorSelectorFull.model.setFreeCurrentAnchor();
    }
  }
}


/* ------ 其他组件控制器  ------ */
class VideoSelectorController with PanelAction, ToolPanel {
}

class HotHelperController with PanelAction, ToolPanel {}

class HistoryController with PanelAction, ToolPanel {}

class MatchStationController with PanelAction, ToolPanel {}

class MoreMenuController with PanelAction, ToolPanel {}

class MoreLeagueController with PanelAction, ToolPanel {}

class BetStateController with PanelAction, ToolPanel {}

class ChatBarController with PanelAction, ToolPanel {}

class BottomBarTextController with PanelAction, ToolPanel {}

class VideoLiveController with PanelAction, ToolPanel {}