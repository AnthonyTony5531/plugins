import 'dart:math' as Math;

import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
//import 'package:fast_ai/models/order_more_betting.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/active_banner/active_banner.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/chat_room_be_follow_bet_popup.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/free_anchor_shared_message_view.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/share_game_message_view.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/shared_follow_bet_message_view.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_game_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_share_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/bet_share_message.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/banner/chatroom_banner.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/game/game_pop_widget.dart';
import 'package:fast_ai/pages/detail/game/live_game.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/animation_view/animated_box_size_view.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';
import '../selected_viewtype.dart';
import 'message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/gift/player/gif_gift_player.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'dart:async';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ChatRoom extends StatefulWidget {
  final String gidm;
  final String systemId;
  final ChatroomController controller;
  final String anchorId;
  final String matchAnchorId;
  final String showType;
  final MatchDetailController swiperController;
  final HorizontalDragCallBack horizontalDragCallBack;
  final bool isListDetail;
  final GlobalKey<ActiveBannerState> activeBannerKey;
  final String roomNo;
  final ValueChanged<bool> onOverWatchLiveTime;
//  final MatchesDetailModel matchesDetailModel;
  final bool isFreeAnchor;
  final String liveId;
  final String announcement;
  final VoidCallback onGoBackRefreshDetail;
  final DetailSet detailSet;
  ChatRoom({
    Key key,
    this.gidm,
    this.systemId,
    this.controller,
    this.anchorId,
    this.matchAnchorId,
    this.showType,
    this.swiperController,
    this.horizontalDragCallBack,
    this.isListDetail,
    this.roomNo,
    this.activeBannerKey,
    this.onOverWatchLiveTime,
//    this.matchesDetailModel,
    this.isFreeAnchor,
    this.liveId,
    this.announcement,
    this.onGoBackRefreshDetail,
    this.detailSet,
  }) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ChatroomController defaultController = ChatroomController();

  AnimatedBoxSizeController _boxSizeController = AnimatedBoxSizeController();
  AnimatedBoxSizeController _anchorGameBoxSizeController = AnimatedBoxSizeController();

  ChatroomController get controller => widget?.controller ?? defaultController;
//  StreamSubscription<RefinedDetailEvent> refinedDetailEvent;

  bool _giftPlayModeConfig;
  DetailSet detailSet = config.userInfo.detailSet;
  List<AiGameCellModel> models = [];
  SwiperController swiperController = SwiperController();
  String gameUrl = '';
  String get gameKey => widget.detailSet?.detailParams?.gameKey ?? '';
  bool get isFreeLiveGameAnchor => widget.detailSet?.detailParams?.isFreeLiveGameAnchor ?? false; // 游戏自由播


  @override
  void initState() {
    _giftPlayModeConfig = AiCache.get().getBool(AiCache.gift_play_mode_config) ?? false;
    GiftPlayServer.ins.start();
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChatRoom);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AnchorShareService.ins.addShowPopListener(_onSharePopStateListener);
      if(isFreeLiveGameAnchor){
        AnchorGameService.ins.addShowPopListener(_onAnchorGamePopStateListener);
      }
    });
  }

  @override
  void dispose() {
    AnchorShareService.ins.removeShowPopListener(_onSharePopStateListener);
    AnchorGameService.ins.removeShowPopListener(_onAnchorGamePopStateListener);
    _boxSizeController?.dispose();
    if(isFreeLiveGameAnchor) {
      _anchorGameBoxSizeController?.dispose();
    }
    GiftPlayServer.ins.stop();
    PopupShareService.ins.close();
    super.dispose();
    print(' --- ChatRoomState-dispose --- ');
  }

  double bottomPadding = 0;
  double showBottomPadding = 0; // 主播分享气泡高度

  void _onSharePopStateListener(bool state) {
    if (state) {
      if (AnchorShareService.ins.betShareMessage != null) {
        //controller?.notifyInputBarChange(InputBarStatus.hide);
        _boxSizeController.showBox();
      }
    } else {
      _boxSizeController.dismissBox();
    }
  }

  void _onAnchorGamePopStateListener(bool state) {
    if (state) {
      if (AnchorGameService.ins.anchorGameMessage != null) {
        _anchorGameBoxSizeController.showBox();
      }
    } else {
      _anchorGameBoxSizeController.dismissBox();
    }
  }

  // bool get isShowRankIcon {
  //   return ModuleSwitch.getInstance().userContributionRank() &&
  //       detailSet.selectViewType == SelectViewTypeVideo &&
  //       !isStrNullOrEmpty(widget.matchAnchorId) &&
  //       widget.matchAnchorId == widget.anchorId &&
  //       !(widget.isListDetail ?? false);
  // }

  bool get isShowGame{
    return (ModuleSwitch.getInstance().game() && models.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    String rankIcon = config.isCnTwLang ? 'assets/images/detail/chatroom/chatroom_rank.png' : 'assets/images/detail/chatroom/icon_detail_top.png';

    final isShowGame =  !(ModuleSwitch.getInstance().gameYxxxts() && !(widget?.isListDetail ?? false));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // controller?.notifyInputBarChange(InputBarStatus.hide);
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      bottom: Math.max(bottomPadding, showBottomPadding),
                      duration: Duration(milliseconds: 600),
                      child: ChatroomWidget(
                        liveId: widget.liveId,
                        swiperController: widget.swiperController,
                        controller: controller,
                        gidm: widget.gidm,
                        systemId: widget.systemId,
                        anchorId: widget.anchorId,
                        horizontalDragCallBack: widget.horizontalDragCallBack,
                        isListDetail: widget.isListDetail,
                        onOverWatchLiveTime: widget?.onOverWatchLiveTime,
//                        matchesDetailModel: widget?.matchesDetailModel,
                        isFreeAnchor: widget.isFreeAnchor,
                        announcement: widget.announcement,
                        isFreeLiveGameAnchor: widget.detailSet?.detailParams?.isFreeLiveGameAnchor ?? false,
                      ),
                    ),
//                    Container(
//                      alignment: Alignment.bottomCenter,
//                      child: ChatRoomBeFollowBetPopup(
//                        showCallback: () {
//                          if (mounted) {
//                            setState(() {
//                              bottomPadding = 50;
//                            });
//                          }
//                          Future.delayed(Duration(milliseconds: 200), () {
//                            controller.showFollowBetMsgScrollToBottom();
//                          });
//                        },
//                        hideCallback: () {
//                          Future.delayed(Duration(milliseconds: 1000), () {
//                            if (mounted) {
//                              setState(() {
//                                bottomPadding = 0;
//                              });
//                            }
//                          });
//                        },
//                      ),
//                    ),
//                    // 主播气泡
//                    Positioned(
//                      bottom: 0.0,
//                      left: 8.0,
//                      right: 0.0,
//                      child: Show(
//                        isShow: !widget.isFreeLiveGameAnchor,
//                        child: AnimatedSizeBoxView(
//                          child: widget.isFreeAnchor
//                              ? FreeAnchorSharedMessageView(
//                                  onGoBackRefreshDetail: widget.onGoBackRefreshDetail,
//                                  betShareMessage: AnchorShareService.ins.betShareMessage,
//                                  anchorId: widget.anchorId,
//                                  roomNo: widget.roomNo,
//                                )
//                              : SharedFollowBetMessageView(betShareMessage: AnchorShareService.ins.betShareMessage),
//                          boxWidth: widget.isFreeAnchor ? 270.0 : 288.0,
//                          boxHeight: widget.isFreeAnchor ? 92.0 : 100.0,
//                          duration: Duration(milliseconds: 600),
//                          controller: _boxSizeController,
//                          onShowCallBack: () {
//                            if(widget.isFreeAnchor && isShowEmptyBetMessage){
//                              return;
//                            }
//                            if (mounted) {
//                              setState(() => showBottomPadding = 100.0);
//                            }
//                          },
//                          onDismissCallBack: () {
//                            if (mounted) {
//                              setState(() => showBottomPadding = 0);
//                            }
//                          },
//                        ),
//                      ),
//                    ),
//                    // 主播气泡
//                    Positioned(
//                      bottom: 0.0,
//                      left: 8.0,
//                      right: 0.0,
//                      child: Show(
//                        isShow: !isFreeLiveGameAnchor,
//                        child: AnimatedSizeBoxView(
//                          child: FreeAnchorSharedMessageView(
//                            onGoBackRefreshDetail: widget.onGoBackRefreshDetail,
//                            betShareMessage: AnchorShareService.ins.betShareMessage,
//                            anchorId: widget.anchorId,
//                            roomNo: widget.roomNo,
//                          ),
//                          boxWidth: 270.0,
//                          boxHeight: 92.0,
//                          duration: Duration(milliseconds: 600),
//                          controller: _boxSizeController,
//                          onShowCallBack: () {
//                            if(widget.isFreeAnchor && isShowEmptyBetMessage){
//                              return;
//                            }
//                            if (mounted) {
//                              setState(() => showBottomPadding = 100.0);
//                            }
//                          },
//                          onDismissCallBack: () {
//                            if (mounted) {
//                              setState(() => showBottomPadding = 0);
//                            }
//                          },
//                        ),
//                      ),
//                    ),
                    // 自由主播游戏气泡
                    Positioned(
                      bottom: 0.0,
                      left: 8.0,
                      right: 0.0,
                      child: Show(
                          isShow: isFreeLiveGameAnchor,
                          child: AnimatedSizeBoxView(
                            child: ShareGameMessageView(onShowGame: onShowGame,),
                            boxWidth: 240.0,
                            boxHeight: 56.0,
                            duration: Duration(milliseconds: 600),
                            controller: _anchorGameBoxSizeController,
                            onShowCallBack: () {
                              if (mounted) {
                                setState(() => showBottomPadding = 56.0);
                              }
                            },
                            onDismissCallBack: () {
                              if (mounted) {
                                setState(() => showBottomPadding = 0);
                              }
                            },
                          )
                      ),
                    ),
                    Positioned(
                      bottom: 40.0,
                      right: 10.0,
                      child: Offstage(
                        offstage: widget?.isListDetail ?? false,
                        child: ChatRoomBanner(
                          detailSet: widget.detailSet,
                          isListDetail: widget.isListDetail,
                          anchorId: widget.anchorId,
                          matchAnchorId: widget.matchAnchorId,
                          gidm: widget.gidm,
                          roomNo: widget.roomNo,
                          systemId: widget.systemId,
                          isFreeAnchor: widget.isFreeAnchor,
                          activeBannerKey: widget.activeBannerKey,
                          swiperController: widget.swiperController)
                        ),
                      ),
                    Positioned(
                      bottom: 85.0,
                      right: 10.0,
                      child: Offstage(
                        offstage: isShowGame,
                        child: GamePopWidget(
                          onPlayerGame: (gameKey,supplierId,gameType,table){
                            AiGameCellModel cellModel = AiGameCellModel(
                              gameKey: gameKey,
                              supplierId: supplierId,
                              roomNo: widget.roomNo,
                              anchorId: widget.anchorId,
                              tableId: table,
                            );
                            double dy = MediaQuery.of(context).size.height;
                            Offset offset = Offset(30.0, dy - 20.0);
                            Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: cellModel));
//                            LiveGame.openGamePan(
//                                context: context,
//                                supplierId: supplierId,
//                                gameKey: gameKey,
//                                roomNo: widget.roomNo,
//                                anchorId: widget.anchorId,
//                                tableId: table,
//                                callBack: (isSuccess){}
//                            );
                          },
                        ),
                      ),
                    ),
//                    if (isShowRankIcon)
//                      Positioned(
//                        right: 14.0,
//                        bottom: 125.0,
//                        child: InkWell(
//                          splashColor: Colors.transparent,
//                          highlightColor: Colors.transparent,
//                          onTap: () {
//                            showContribution();
//                          },
//                          child: SizedBox(
//                            width: 54.0,
//                            height: 54.0,
//                            child: AiImage.asset(
//                                rankIcon,
//                                fit: BoxFit.contain, width: 54.0, height: 54.0, scale: 1.0),
//                          ),
//                        ),
//                      ),
//                    if (MediaQuery.of(context).orientation == Orientation.portrait && ModuleSwitch.getInstance().floatingWindow())
//                      Offstage(
//                        offstage: (detailSet.showLoading || widget.isListDetail || RefinedMatch.isFinishGame),
//                        child: ActiveBanner(key: widget.activeBannerKey, isPortraitBanner: true),
//                      ),
//                    if(isShowGame)
//                      Positioned(
//                        right: 14.0,
//                        bottom: 190.0,
//                        width: 54.0,
//                        height: 54.0,
//                        child: Swiper(
//                          onIndexChanged: (index){
//                          },
//                          controller: swiperController,
//                          scrollDirection: Axis.horizontal,
//                          containerWidth: 54.0,
//                          itemWidth: 54.0,
//                          autoplay: true,
//                          loop: true,
//                          itemCount: 1,
//                          itemBuilder: (BuildContext ctx, int index){
//                            if(index >= models.length) return Container();
//                            AiGameCellModel cellModel = models[index];
//                            String icon = cellModel.icon ?? cellModel.img;
//                            String url = cellModel.url;
//                            return GestureDetector(
//                              behavior: HitTestBehavior.opaque,
//                              child: Container(
//                                color: Colors.red.withOpacity(0.3),
//                                width: 54.0,
//                                height: 54.0,
//                                child: AiImage.fromUrl(icon, '',BoxFit.cover),
//                              ),
//                              onTap: (){
//                                showGame(cellModel);
//                              },
//                            );
//                          },
//                        )
//                      )
                  ],
                ),
              ), //
              //ChatRoomInput(controller: controller,),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              GifGiftPlayer(
                position: 0,
              ),
              GifGiftPlayer(
                position: 1,
              ),
            ],
          ),
//          InkWell(
//            onTap: (){
//              _giftPlayModeConfig = !_giftPlayModeConfig;
//              AiCache.get().setBool(AiCache.gift_play_mode_config, _giftPlayModeConfig);
//              if(mounted){
//                setState(() {});
//              }
//            },
//            child: Container(
//              padding: EdgeInsets.only(top: 8,right: 8),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: [
//                  AiSvgPicture.asset('assets/images/liveplayer/${_giftPlayModeConfig ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc'}.svg',width: 12,height: 12,),
//                  SizedBox(width: 5,),
//                  Text("${config.langMap['baseLang']['detail']['chatroom']['giftPlayModeConfig']}",style: AiTextStyle(
//                    color: _giftPlayModeConfig ? Color(0xFF5078FF) : config.skin.colors.fontColorWhite,
//                  ),),
//                ],
//              ),
//            ),
//          ),
        ],
      ),
    );
  }

//  Widget bottomHitWidget(){
//    String text = baseLang['detail']['chatroom']['betTitleHit'];
//    return Positioned(
//        left: 0,
//        bottom: 0,
//        right: 0,
//        child: Offstage(
//          offstage: !(isListDetail ?? false),
//          child: Container(
//              height: 130.0,
//              alignment: Alignment(0.0, 0.5),
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [
//                        Colors.transparent,
//                        Color(0xFF003254),
//                      ]
//                  )
//              ),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Expanded(
//                    child: Container(
//                      margin: EdgeInsets.only(left: 12.0,right: 12.0),
//                      height: 1.0,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Container(
//                    child: Row(children: [
//                      AiImage.asset('assets/images/square/icon_live.gif',width: 16.0,height: 16.0),
//                      Text(text,style: titleStyle(),)
//                    ],
//                    ),
//                  ),
//                  Expanded(
//                    child: Container(
//                      margin: EdgeInsets.only(left: 12.0,right: 12.0),
//                      height: 1.0,
//                      color: Colors.white,
//                    ),
//                  ),
//                ],
//              )
//          ),
//        )
//    );
//  }

//  bool get isShowEmptyBetMessage {
//    BetShareMessage betMessage = AnchorShareService.ins.betShareMessage;
//    BettingData betData = betMessage.bettingData;
//    String playTypeName = config.match.getPlayTypeName(
//      gameType: betData?.gameType,
//      playType: betData?.playType,
//      session: betData?.session,
//      specifiers: betData?.specifiers,
//      suffix: betData?.teamSuffix,
//      verType: "1",
//      home: betData?.homeTeam,
//      away: betData?.awayTeam,
//      gameTypeSon: string(
//          betData?.gameTypeSon, defaultVal: betData?.gameTypeSon),
//    );
//    return isStrNullOrEmpty(playTypeName);
//  }

  TextStyle titleStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h3);
  }

  void onShowGame(AiGameCellModel gameModel){
    double dy = MediaQuery.of(context).size.height;
    Offset offset = Offset(30.0, dy - 20.0);
    Event.eventBus.fire(ShowGameEvent(isShowGame: true));
    Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: gameModel));
//    LiveGame.openGamePan(
//        context: context,
//        supplierId: gameModel.supplierId,
//        gameKey: gameModel.gameKey,
//        roomNo: widget.roomNo,
//        anchorId: widget.anchorId,
//        callBack: (isSuccess){}
//    );
  }

  /// 贡献榜
  void showContribution() {
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsChatRoomList);
    PopupShareService.ins.pause('_showContribution');
    showModalBottomSheetRoute(context,
            child: AnchorContribution(
              gidm: widget.gidm,
              anchorId: widget.anchorId,
              roomNo: widget.roomNo,
              systemId: widget.systemId,
              isFreeAnchor: widget.isFreeAnchor,
            ),
            barrierColor: Colors.transparent)
        .then((v) {
      PopupShareService.ins.resume('_showContribution');
    });
  }
//  /// 龙虎榜
//  bool isEnableClick = true;
//  void showGame(AiGameCellModel cellModel) async{
////    if(isStrNullOrEmpty(cellModel.url)) return;
////    String url = 'http://dev.m.yc365d.com/ai/mobile/game/url?supplierId=aigame&gameKey=LHD';
//    if(isStrNullOrEmpty(gameUrl)){
//      var result = await AiGameURlRequestProtocol(supplierId: 'aigame', gameKey: 'LHD').request();
//      gameUrl = result.url;
//    }
//    String url = gameUrl;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsChatRoomList);
//    PopupShareService.ins.pause('_showGame');
//    showModalBottomSheetRoute(context,
//        child: NewUserCoursePage(
//          url: url,
//          title: '龙虎榜'
//        ),
//        barrierColor: Colors.transparent)
//        .then((v) {
//      PopupShareService.ins.resume('_showGame');
//    });
//  }

}
