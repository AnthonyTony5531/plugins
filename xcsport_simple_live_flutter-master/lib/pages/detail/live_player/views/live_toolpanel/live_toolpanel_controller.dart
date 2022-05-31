/*
import 'package:fast_ai/pages/detail/active_banner/active_banner_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/HorizontalBet/HorizontalPlayListModel.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bet/live_bet_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chatbar/live_chatbar.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_history/live_history_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_hot_helper/live_hot_helper_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_match_station/live_match_station_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_more_league/live_more_league_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_more_menu/live_more_menu_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_video_selector/live_video_selector_controller.dart';
import 'package:fast_ai/pages/detail/video_live/views/video_live_controller.dart';
import 'package:fast_ai/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';

import '../../live_player_controller.dart';


class ToolPanelController extends LivePlayerChildController {
  final LiveTopbarController topbar;
  final LiveBottombarController bottombar;
  final LiveVideoSelectorController videoSelector;
  final AnchorSelectorController anchorSelectorFull;
  final LiveHotHelperController liveHotHelperController;
  final LiveHistoryController historyController;
  AnchorSelectorController anchorSelectorRight;
  LivePlayerChildController livePlayerChildController;
  final LiveMatchStationController matchStationController;
  final LiveMoreMenuController moreMenuController;
  final LiveMoreLeagueController moreLeagueController;
  final LiveBetStateController betStateController;
  final LiveChatBarController chatBarController = LiveChatBarController();
  final LiveBottombarTextController bottombarTextController = LiveBottombarTextController();
  final VideoLiveController videoLiveController;
  final ActiveBannerController activeBannerController;

  HorizontalPlayListModel horizontalPlayListModel = HorizontalPlayListModel();

  ToolPanelController({
    @required LiveTopbarModel topbarModel,
    @required LiveBottombarModel bottombarModel,
    @required AnchorSelectorModel anchorSelectorModel,
  })
      :
        this.topbar = LiveTopbarController(
            defaultMoel: topbarModel ?? LiveTopbarModel()),
        this.bottombar = LiveBottombarController(
            defaultModel: bottombarModel ?? LiveTopbarModel()),
        this.videoSelector = LiveVideoSelectorController(),
        this.anchorSelectorFull = AnchorSelectorController(
            defaultModel: anchorSelectorModel ?? AnchorSelectorModel()),
        this.anchorSelectorRight = AnchorSelectorController(
            defaultModel: anchorSelectorModel ?? AnchorSelectorModel()),
        this.liveHotHelperController = LiveHotHelperController(),
        this.historyController = LiveHistoryController(),
        this.matchStationController = LiveMatchStationController(),
        this.moreMenuController = LiveMoreMenuController(),
        this.betStateController = LiveBetStateController(),
        this.moreLeagueController = LiveMoreLeagueController(),
        this.videoLiveController = VideoLiveController(),
        activeBannerController = ActiveBannerController();

  void setPlayer(LivePlayerController player) {
    super.setPlayer(player);
    this.topBar.setPlayer(player);
    this.bottomBar.setPlayer(player);
    this.videoSelector.setPlayer(player);
    this.anchorSelectorFull.setPlayer(player);
    this.anchorSelectorRight.setPlayer(player);
    this.liveHotHelperController.setPlayer(player);
    this.videoLiveController.setPlayer(player);
    activeBannerController.setPlayer(player);
  }


  bool get isShowFinished {
    return topbar.isShowFinished
        && bottombar.isShowFinished
        && activeBannerController.isShowFinished;
  }

  bool get isHideFinished {
    return topbar.isHideFinished
        && bottombar.isHideFinished
        && activeBannerController.isHideFinished;
  }

  @override
  void setHotExpression(LiveHotHelperController hotExpression) {
    super.setHotExpression(hotExpression);
    this.topBar.setHotExpression(hotExpression);
    this.bottomBar.setHotExpression(hotExpression);
    this.videoSelector.setHotExpression(hotExpression);
    this.anchorSelectorFull.setHotExpression(hotExpression);
    this.anchorSelectorRight.setHotExpression(hotExpression);
    this.liveHotHelperController.setHotExpression(hotExpression);
    this.matchStationController.setHotExpression(hotExpression);
    this.moreMenuController.setHotExpression(hotExpression);
    this.moreLeagueController.setHotExpression(hotExpression);
    this.videoLiveController.setHotExpression(hotExpression);
    activeBannerController.setHotExpression(hotExpression);
  }

  @override
  void setLiveHistoryController(LiveHistoryController liveHistoryController) {
    super.setLiveHistoryController(liveHistoryController);
    this.topBar.setLiveHistoryController(liveHistoryController);
    this.bottomBar.setLiveHistoryController(liveHistoryController);
    this.videoSelector.setLiveHistoryController(liveHistoryController);
    this.anchorSelectorFull.setLiveHistoryController(liveHistoryController);
    this.anchorSelectorRight.setLiveHistoryController(liveHistoryController);
    this.liveHotHelperController.setLiveHistoryController(
        liveHistoryController);
    this.matchStationController.setLiveHistoryController(liveHistoryController);
    this.moreMenuController.setLiveHistoryController(liveHistoryController);
    this.moreLeagueController.setLiveHistoryController(liveHistoryController);
    this.videoLiveController.setLiveHistoryController(liveHistoryController);
    activeBannerController.setLiveHistoryController(liveHistoryController);
  }

  @override
  void setLiveMatchStationController(
      LiveMatchStationController liveMatchStationController) {
    super.setLiveMatchStationController(liveMatchStationController);
    this.topBar.setLiveMatchStationController(liveMatchStationController);
    this.bottomBar.setLiveMatchStationController(liveMatchStationController);
    this.videoSelector.setLiveMatchStationController(
        liveMatchStationController);
    this.anchorSelectorFull.setLiveMatchStationController(
        liveMatchStationController);
    this.anchorSelectorRight.setLiveMatchStationController(
        liveMatchStationController);
    this.liveHotHelperController.setLiveMatchStationController(
        liveMatchStationController);
    this.matchStationController.setLiveMatchStationController(
        liveMatchStationController);
    this.moreMenuController.setLiveMatchStationController(
        liveMatchStationController);
    this.moreLeagueController.setLiveMatchStationController(liveMatchStationController);
    this.videoLiveController.setLiveMatchStationController(liveMatchStationController);
    activeBannerController.setLiveMatchStationController(liveMatchStationController);
  }

  @override
  void setLiveMoreMenuController(
      LiveMoreMenuController liveMoreMenuController) {
    super.setLiveMoreMenuController(liveMoreMenuController);
    this.topBar.setLiveMoreMenuController(liveMoreMenuController);
    this.bottomBar.setLiveMoreMenuController(liveMoreMenuController);
    this.videoSelector.setLiveMoreMenuController(liveMoreMenuController);
    this.anchorSelectorFull.setLiveMoreMenuController(liveMoreMenuController);
    this.anchorSelectorRight.setLiveMoreMenuController(liveMoreMenuController);
    this.liveHotHelperController.setLiveMoreMenuController(
        liveMoreMenuController);
    this.matchStationController.setLiveMoreMenuController(
        liveMoreMenuController);
    this.moreMenuController.setLiveMoreMenuController(liveMoreMenuController);
    this.moreLeagueController.setLiveMoreMenuController(liveMoreMenuController);
    this.videoLiveController.setLiveMoreMenuController(liveMoreMenuController);
    activeBannerController.setLiveMoreMenuController(liveMoreMenuController);
  }



  @override
  void setLiveMoreLeagueController(LiveMoreLeagueController controller) {
    super.setLiveMoreLeagueController(controller);
    this.topBar.setLiveMoreLeagueController(controller);
    this.bottomBar.setLiveMoreLeagueController(controller);
    this.videoSelector.setLiveMoreLeagueController(controller);
    this.anchorSelectorFull.setLiveMoreLeagueController(controller);
    this.anchorSelectorRight.setLiveMoreLeagueController(controller);
    this.liveHotHelperController.setLiveMoreLeagueController(
        controller);
    this.matchStationController.setLiveMoreLeagueController(
        controller);
    this.moreMenuController.setLiveMoreLeagueController(controller);
    this.videoLiveController.setLiveMoreLeagueController(controller);
    activeBannerController.setLiveMoreLeagueController(controller);
  }



  void hide() {
    topbar.hide();
    bottombar.hide();
    videoSelector.hide();
    anchorSelectorFull.hide();
    anchorSelectorRight.hide();
    liveHotHelperController.dismiss();
    videoLiveController.hide();
    activeBannerController.hide();
  }

  void dismiss() {
    liveHistoryController.dismiss();
    matchStationController.dismiss();
    moreMenuController.dismiss();
    betStateController.dismiss();
    // chatBarController.hide();
    moreLeagueController.dismiss();
    anchorSelectorFull.hide();
    anchorSelectorRight.hide();
    // hideKeyBoard(chatBarController.key.currentState?.context);
  }


  void show() {
    topbar.show();
    bottombar.show();
    videoLiveController.show();
    activeBannerController.show();
    // bottombarTextController.fresh();
  }


  void updateAnchors(List<LiveVideoInfo> anchors, String defaultAnchorId, {bool isFreeAnchor = false}) {
    this.anchorSelectorFull.model.defaultAnchorId = defaultAnchorId;
    this.anchorSelectorFull.model.anchors = anchors;
    this.anchorSelectorRight.model.anchors = anchors;
    this.anchorSelectorFull.update();
    this.anchorSelectorRight.update();
    if(isFreeAnchor){
      this.anchorSelectorFull?.model?.setFreeCurrentAnchor();
    }
  }
}
 */

