import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_bet.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_live.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_full.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_right.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bet/live_bet.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bet/live_bet_button.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chat/live_chat_message.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chatbar/live_chatbar.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_history/live_history.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_hot_helper/live_hot_helper.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_lock/live_lock.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_match_station/live_match_station.dart';
//import 'package:fast_ai/pages/detail/live_player/views/live_more_league/live_more_league.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_more_menu/live_more_menu.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_redPacket/float_red_packet_landscape.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_slide_broad/live_slide_broad.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_video_selector/live_video_selector.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';

import '../live_error.dart';
import '../live_flux_tips.dart';

class LiveToolPanel extends StatefulWidget {
  final CommonVideoPlayerController videoPlayerController;
  final EdgeInsets padding;
  final Size size;
  final HorizontalDragCallBack horizontalDragCallBack;
  final MatchesDetailModel matchesDetailModel;
  final ExtendModel extendModel;
  final NewHeadAnchorModel newHeadAnchorModel;
  final DetailSet detailSet;
  final VoidCallback onShowMatchInfo;
  final bool isVlogLive; //小视频里面直播
  final VoidCallback onEntryGameDetail; // 小视频回调进比赛详情
  final MatchDetailController swiperController;
  final Orientation orientation;
  final bool isFreeAnchor;
  final bool isFreeLiveGameAnchor; // 游戏自由播正在播

  final String roomNo;
  final String anchorId;

  LiveToolPanel({
    Key key,
    @required this.videoPlayerController,
    @required this.size,
    @required this.padding,
    this.horizontalDragCallBack,
    this.matchesDetailModel,
    this.extendModel,
    this.newHeadAnchorModel,
    this.detailSet,
    this.onShowMatchInfo,
    this.isVlogLive = false,
    this.isFreeAnchor = false,
    this.onEntryGameDetail,
    this.swiperController,
    this.orientation,
    this.roomNo,
    this.anchorId,
    this.isFreeLiveGameAnchor = false,
  })  : assert(videoPlayerController != null),
        super(key: key);

  @override
  _LiveToolPanelState createState() => _LiveToolPanelState();
}

class _LiveToolPanelState extends State<LiveToolPanel> {
  ToolPanelController get toolPanel => widget.videoPlayerController.toolPanel;
  AiVideoController get player => widget.videoPlayerController.player;
  CommonVideoPlayerController get videoPlayerController => widget.videoPlayerController;

  StreamSubscription moduleChangeEvent;
  StreamSubscription<ShowGameEvent> showGameEvent;
  bool isShowChatMessage = false;

  @override
  void initState() {
    toolPanel.bottomBar.settingTap.addListener(settingTap);
    toolPanel.bottomBar.anchorSelectorTap.addListener(anchorSelectorTap);
    videoPlayerController.anyAction.addListener(anyActionResetTime);
    startTimer();
    bindEvent();
    super.initState();
  }

  void bindEvent() {
    moduleChangeEvent = Event.eventBus.on<ModuleSwitchChangeEvent>().listen((e) {
          if (mounted) {
            setState(() {});
          }
        });
    showGameEvent = Event.eventBus.on<ShowGameEvent>().listen(showGameAlert);
  }

  void unbindEvent() {
    moduleChangeEvent?.cancel();
    showGameEvent?.cancel();
  }

  @override
  void dispose() {
    stopTimer();
    toolPanel.bottomBar.settingTap.removeListener(settingTap);
    toolPanel.bottomBar.anchorSelectorTap.removeListener(anchorSelectorTap);
    videoPlayerController.anyAction.removeListener(anyActionResetTime);
    toolPanel.moreMenuController.setPlayer(null);
    moduleChangeEvent?.cancel();
    super.dispose();
  }

  void showGameAlert(e) {
    if(e is ShowGameEvent){
      isShowChatMessage = e.isShowGame;
      print('');
      if(mounted)setState(() {});
    }
  }

  void settingTap() {
    toolPanel.videoSelector.show();
  }

  void anchorSelectorTap() {
    if (toolPanel.bottomBar.model.screenDirection ==
        ScreenDirection.LeftRight) {
      toolPanel.anchorSelectorRight.show(false);
    } else {
      toolPanel.anchorSelectorFull.show(false);
    }
  }

  DateTime _lastTime = DateTime.now();

  void anyActionResetTime() {
    _lastTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var width = widget.size.width;
    var height = widget.size.height;

    var body = ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        width: width,
        height: height,
        // color: Color(0x88FF0000),
        // padding: EdgeInsets.all(10),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Show(
              isShow: !widget.isFreeAnchor,
              child: LiveSlideBroad(
                toolPanel,
                horizontalDragCallBack: widget?.horizontalDragCallBack,
              ),
            ),
            Positioned(
                top: 10.0,
                right: 9.0,
                child: Show(isShow: !widget.isFreeLiveGameAnchor, child: merchantInfoWidget())
            ),
            Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                width: 116.0,
                child: Show(
                    isShow: isShowChatMessage,
                    child: LiveChatMessage(
//                      isFreeAnchorListEntry: true,
                      swiperController: widget.swiperController,
                      extendModel: widget.extendModel,
                      toolPanelController: toolPanel,
                      detailParams: widget.detailSet.detailParams,
                      matchesDetailModel: widget.matchesDetailModel,
                    )
                )
            ),
            Positioned(
              top: 0,
              child: LiveTopBar(
                controller: toolPanel.topBar,
                size: widget.size,
                isFreeAnchor: widget.isFreeAnchor,
              ),
            ),
            LiveChatBar(
              chatBarController: toolPanel.chatBarController,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LiveBottomBar(
                  isFreeLiveGameAnchor: widget.isFreeLiveGameAnchor,
                  controller: toolPanel.bottomBar,
                  size: widget.size,
                  isFreeAnchor: widget.isFreeAnchor,
                  onChanged: (String value) {},
                )),
            LiveError(
              player: videoPlayerController,
              isFreeAnchor: widget.isFreeAnchor,
              onEntryGameDetail: widget.onEntryGameDetail,
              isVlogLive: widget.isVlogLive,
            ),
            LiveFluxTipsLayout(
              player: videoPlayerController,
            ),
            // 用户不满足投注额提示(不能观看视频)
            // Positioned(
            //     left: 0,
            //     top: 0,
            //     right: 0,
            //     bottom: 0,
            //     child: Container(
            //       child: MoreFunctionBet(
            //         orientation: widget.orientation,
            //         betStateController: toolPanel.betStateController,
            //         swiperController: widget.swiperController,
            //         isVlogLive: widget.isVlogLive,
            //         isShowLivePanel: true,
            //         newHeadAnchorModel: widget?.newHeadAnchorModel,
            //         extendModel: widget?.extendModel,
            //         detailSet: widget?.detailSet,
            //         matchesDetailModel: widget?.matchesDetailModel,
            //       ),
            //     )
            // ),
            //主播直播切换
//            Positioned(
//                left: 0,
//                top: 0,
//                right: 0,
//                bottom: 0,
//                child: Container(
//                  child: MoreFunctionLive(
//                    isShowLivePanel: true,
//                    newHeadAnchorModel: widget?.newHeadAnchorModel,
//                    playerController: videoPlayerController,
////                    extendModel: widget?.extendModel,
//                    detailSet: widget?.detailSet,
//                  ),
//                )),

            //视频主播
            Positioned(
              bottom: 40,
              right: 50 * 1.5,
              child: LiveVideoSelector(
                controller: toolPanel.videoSelector,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: AnchorSelectorFull(
                controller: toolPanel.anchorSelectorFull,
                size: widget.size,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: AnchorSelectorRight(
                controller: toolPanel.anchorSelectorRight,
                size: widget.size,
              ),
            ),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 2 - 280 / 2,
              child: LiveHotHelper(
                controller: toolPanel.hotHelperController,
              ),
            ),

            Positioned.fill(
              child: LiveHistory(
                  controller: toolPanel.historyController,
              ),
            ),
            Show(
              isShow: !widget.isFreeAnchor,
              child: Positioned.fill(
                child: LiveMatchStation(
                    controller: toolPanel.matchStationController,
                ),
              ),
            ),

//            Show(
//              isShow: !widget.isFreeAnchor,
//              child: Positioned.fill(
//                child: LiveMoreLeague(
//                  controller: toolPanel.moreLeagueController,
//                ),
//              ),
//            ),

            Show(
              isShow: !widget.isFreeAnchor,
              child: Positioned.fill(
                child: LiveMoreMenu(
                  anchorId: widget.anchorId,
                  roomNo: widget.roomNo,
                  controller: toolPanel.moreMenuController,
                  matchesDetailModel: widget.matchesDetailModel,
                  extendModel: widget.extendModel,
                  newHeadAnchorModel: widget.newHeadAnchorModel,
                  detailSet: widget.detailSet,
                  onShowMatchInfo: widget.onShowMatchInfo,
                ),
              ),
            ),

            Positioned.fill(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: LiveLock(
                toolPanelController: toolPanel,
              ),
            ),
            //投注
            Show(
              isShow: !widget.isFreeAnchor,
              child: Positioned(
                right: 0,
                bottom: 80,
                child: LiveBetButton(
                  betStateController: toolPanel.betStateController,
                ),
              ),
            ),
            Show(
              isShow: !widget.isFreeAnchor,
              child: Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: LiveBet(
                    controller: toolPanel.betStateController,
                ),
              ),
            ),

//            Show(
//              isShow: MediaQuery.of(context).orientation == Orientation.landscape,
//              child: Positioned(
//                top: 80,
//                right: 20,
//                child: FloatRedPacketLandscape(toolPanelController: toolPanel),
//              ),
//            ),
          ],
        ),
      ),
    );
    // return body;
    return InkWell(
      excludeFromSemantics: true,
      onTap: () {
        if (toolPanel.isShowFinished) {
          toolPanel.hide();
        } else {
          toolPanel.show();
        }
        toolPanel.dismiss();
        anyActionResetTime();
      },
      child: body,
    );
  }

  Widget merchantInfoWidget() {
    String liveName = config.userInfo.merchantLiveInfo["liveName"];
    String liveLogo = config.userInfo.merchantLiveInfo["liveLogo"];
    if (isStrNullOrEmpty(liveName) && isStrNullOrEmpty(liveLogo)) {
      return Container();
    }
    TextStyle textStyle = AiTextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
    return Container(
//      width: 80.0,
      height: 28.0,
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          !isStrNullOrEmpty(liveLogo)
            ? Container(
                margin: EdgeInsets.only(right: 3),
                width: 16.0,
                child: AiImage.fromUrl(liveLogo, "team", BoxFit.fill),
              )
            : Container(),
          Text(
            liveName,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: textStyle,
          ),
        ],
      ),
    );
  }

  Timer _timer;

  startTimer() {
    if (_timer != null) return;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timer = timer;
      if (toolPanel.isHideFinished) return;

      var diff = DateTime.now().difference(_lastTime);
      if (diff.inSeconds > 8) {
        if (toolPanel.isShowFinished) {
          toolPanel.hide();
        }
      }
    });
  }

  stopTimer() {
    try {
      _timer?.cancel();
    } catch (e) {
      logError(e);
    }
  }
}
