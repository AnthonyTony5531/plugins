import 'dart:async';

import 'package:common_component/component/route/route.dart';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/aigames/ai_game_select_by_game_key.dart';
import 'package:fast_ai/api/protocols/detail/gift_buy_gift_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
//import 'package:fast_ai/pages/betting_2p0/betting_bottom_dialog.dart';
//import 'package:fast_ai/pages/betting_2p0/betting_container_2p0.dart';
import 'package:fast_ai/pages/detail/bottom_nav/bottom_navigation_bar_extent_config.dart';
import 'package:fast_ai/pages/detail/bottom_nav/chat_room_msg_count_bg_clip_path.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/all_shared_record_view.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/send_share_v2/share_bet_record_page.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_game_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_share_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/bet_share_message.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/share_bet_order_tab/share_bet_order_tab_page.dart';
//import 'package:fast_ai/pages/detail/bottom_nav/share/share_bet_order_tab/share_bet_order_tab_page_view_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/widget/circle_button.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom_input_pop_view.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/send_message_filter.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/game/live_game.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_pan_page.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
//import 'package:fast_ai/pages/found/share_bet_publish/share_bet_publish_page.dart';
//import 'package:fast_ai/pages/found/share_bet_publish/share_bet_publish_page_view_model.dart';
//import 'package:fast_ai/pages/game/game_match/game_match.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
//import 'package:fast_ai/pages/wallet/wallet_util.dart';
import 'package:fast_ai/router.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/styles.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/news_report/news_cross_slip.dart';
import 'package:fast_ai/widgets/news_report/news_report.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/xc_bottom_sheet/xc_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import '../follow_bet/match_follow_bet_record.dart';
import 'bottom_navigation_bar_model.dart';
import 'bottom_navigation_bar_style.dart';

const String stopAllRequestError = 'stop before request';

class BottomNavBarView
    extends StatefulView<BottomNavBarStyle, BottomNavBarModel> {
  final String gameType;
  final String showType;
  final MatchDetailController swiperController;
  final ChatroomController chatRoomController;
  final String gidm;
  final String systemId;
  final String roomNo;
  final String anchorId;
  final bool inited;
  final UpdateRoomInfoController roomInfoController;
  final BottomNavBarModel model;
  final bool isFreeAnchor;
  final String liveId;
  final String announcement;
  final VoidCallback onGoBack;
  final DetailSet detailSet;
  BottomNavBarView({
    Key key,
    this.gameType = 'FT',
    this.showType = 'FT',
    this.gidm = '',
    this.systemId = '',
    this.roomNo = '',
    this.anchorId,
    this.inited = false,
    this.model,
    this.isFreeAnchor = false,
    this.liveId,
    this.onGoBack,
    @required this.swiperController,
    @required this.chatRoomController,
    this.roomInfoController,
    this.announcement,
    this.detailSet,
  }) : super(key: key, model: model);

  @override
  _BottomNavBarViewState createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState
    extends ViewState<BottomNavBarStyle, BottomNavBarModel, BottomNavBarView> {
  bool hasSharedRecordBtn = false;

  // bool hasAnchorSharedRecordBtn = false;
  bool hasVideoBtn = false;
  bool hasMatchIndexBtn = false;
  bool hasShareBetBtn = false;
  bool hasChatRoomBtn = false;
  bool hasFollowBetBtn = false;
  bool hasMoreBtn = true;
  bool hasGiftBtn = false;
  bool hasMatchDataBtn = false;
  int currentIndex = 0;
  int selectMessageIndex = 0;
  List<String> messages = [];
  StreamSubscription _hitOptionCountEvent;
  StreamSubscription<OpenGameEvent> _openGame;
  StreamSubscription<AnchorTypeChangedEvent> _onAnchorTypeChanged;
  int _hitOptionCount = 0;
  num bettingTotal = 0;
  bool isAllowSendMsg = false;
  bool chatroomIsOpen = true;

  StreamSubscription moduleChangeEvent,
      hasNewBetShareEvent,
      bettingSuccessEvent,
      showGiftEvent;
  ChatroomState _state = ChatroomState.None;
  bool _hideBottomNav = false;

  GlobalKey _gameBtnKey = GlobalKey();
  GlobalKey _shopCarKey = GlobalKey();
  StateSetter shopCarStateSetter;
  StateSetter showSharedRecordStateSetter;
  StateSetter showAnchorSharedRecordStateSetter;

  // bool isShowShopCarAnimation = true;
  bool isHasNewBetShareMessage = false;
  bool isPullNewData = false;
  CancelToken sendReqCancelToken; // 礼物发送撤销请求
  GiftInfoModel selectGiftModel;
  GlobalKey<NewsCrossSlipState> newsKey = GlobalKey();
  Timer watchLiveTimer;
  AiGameCellModel gameModel;
  bool get isFreeLiveGameAnchor => widget.detailSet?.detailParams?.isFreeLiveGameAnchor ?? false ; // 游戏自由播正在播
  String _roomNo;
  String _anchorId;
  String get gameKey => widget.detailSet?.detailParams?.gameKey ?? ''; // 小游戏Key

  String get roomNo => _roomNo ?? widget?.roomNo;

  String get anchorId => _anchorId ?? widget?.anchorId;

  Offset gameBtnOffset = Offset.zero;

  @override
  void initState() {

    _roomNo = widget?.roomNo;
    _anchorId = widget?.anchorId;
    widget.roomInfoController?.updateRoomInfoFunc = _updateRoomInfo;
    widget.roomInfoController?.resetRoomStatusFunc = _resetRoomStatusFunc;

    if (widget.showType == 'RB') {
      hasVideoBtn = true;
      hasMatchIndexBtn = true;
      hasChatRoomBtn = true;
    } else {
      hasVideoBtn = false;
      if (widget.gameType == 'FT' || widget.gameType == 'BK') {
        hasMatchIndexBtn = true;
      }
      hasChatRoomBtn = true;
    }

    hasMatchDataBtn = widget.gameType == 'FT' || widget.gameType == 'BK';
    hasFollowBetBtn = false; //config.userInfo.currentSaveHitOptionType != HitOptionType.combo;
//    _hitOptionCount = config.userInfo.hitMap[config.userInfo.currentSaveHitOptionType]?.length ?? 0;
    widget?.chatRoomController?.onStateChange(onStateChange);
    widget?.swiperController?.addListener(swiperListener);
    _state = widget?.chatRoomController?.state ?? ChatroomState.None;
    if (_state == ChatroomState.Inited) {
      model.updateHasSharedRecordBtn(hasSharedRecordBtn);
      // hasAnchorSharedRecordBtn = config.userInfo.currentSaveHitOptionType != HitOptionType.combo && !isNullOrEmpty(anchorId); //false;//聊天室开启后开放
    }
    loadHistoryMessage();
    chatRoomState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bindEvent();
      updateShopCarPosition();
      updateGameBtnPosition();
    });
    widget.chatRoomController
        .listenerUnreadMsgCountChange(_chatRoomUnreadMsgCountChange);
    // 开启购物车动画计时
    _startTimer();
    if(widget.isFreeAnchor){
      currentIndex = 1;
    }
    if(isFreeLiveGameAnchor){
      loadGameData();
    }
    super.initState();
  }

  void bindEvent() {
    _hitOptionCountEvent =
        Event.eventBus.on<HitOptionCount>().listen(hitOptionCount);
    moduleChangeEvent =
        Event.eventBus.on<ModuleSwitchChangeEvent>().listen(moduleChangeListen);
    hasNewBetShareEvent =
        Event.eventBus.on<HasNewBetShareEvent>().listen(hasNewBetShareListen);
    bettingSuccessEvent =
        Event.eventBus.on<BettingSuccessEvent>().listen(bettingSuccessListen);
    showGiftEvent = Event.eventBus.on<ShowGiftEvent>().listen(showGift);
    _openGame = Event.eventBus.on<OpenGameEvent>().listen(openGameEvent);
    _onAnchorTypeChanged = Event.eventBus.on<AnchorTypeChangedEvent>().listen(_anchorTypeChanged);
    if(isFreeLiveGameAnchor){
      AnchorGameService.ins.addShowPopListener(_onAnchorGamePopStateListener);
    }
  }

  void _onAnchorGamePopStateListener(bool state) {
    if (state) {
      if (AnchorGameService.ins.anchorGameMessage != null) {
        openGameEvent(null);
      }
    }
  }

  void _anchorTypeChanged(event) {
    if(isFreeLiveGameAnchor){
      loadGameData();
    }
  }

  void unbindEvent() {
    _hitOptionCountEvent?.cancel();
    moduleChangeEvent?.cancel();
    hasNewBetShareEvent?.cancel();
    bettingSuccessEvent?.cancel();
    showGiftEvent?.cancel();
    _openGame?.cancel();
    _onAnchorTypeChanged?.cancel();
    AnchorGameService.ins?.removeShowPopListener(_onAnchorGamePopStateListener);
  }

  Future<void> loadGameData() async{
    var result = await AiGameSelectByGameKeyReqProtocol(gameKey: gameKey).request();
    if(result.isSuccess){
      gameModel = result.gameModel;
    }
    if(mounted)setState(() { });
  }

  //更新房间信息
  void _updateRoomInfo({String anchorId, String roomNo}) {
    //print("_updateInfo   anchorId:$anchorId   roomNo:$roomNo");
    _roomNo = roomNo;
    _anchorId = anchorId;
    chatRoomState();
  }

  //重置房间状态信息
  void _resetRoomStatusFunc() {
    //print("_updateInfo   _resetRoomStatusFunc");
    if (mounted) {
      setState(() {
        messages?.clear();
        _state = ChatroomState.None;
        hasSharedRecordBtn = false;
        model.updateHasSharedRecordBtn(hasSharedRecordBtn);

        hasGiftBtn = false;
      });
    }
  }

  void bettingSuccessListen(e) async {
    num currentBetGold = config?.userInfo?.currLaunchAllBetGold ?? 0;
    num betTotal = config?.userInfo?.roomFirstBettingTotal ?? 0;
    if (isAllowSendMsg) return;
    if (bettingTotal <= 0) return;
    if (currentBetGold < betTotal) {
      // 更新需要投注额度
      bettingTotal = betTotal - currentBetGold;
      String balanceLessText1 =
          config.langMap['baseLang']['detail']['prohibitSpeak1'];
      String balanceLessText2 =
          config.langMap['baseLang']['detail']['prohibitSpeak2'];
      String balanceLessText =
          balanceLessText1 + '$bettingTotal' + balanceLessText2;
      if (newsKey?.currentState != null) {
        newsKey?.currentState?.updateData([balanceLessText, balanceLessText]);
      }
      return;
    }
    var histories = await bloc.pullChatRoomStatus(isPullNewData: true);
    bettingTotal = bloc?.bettingTotalObj ?? 0;
    isAllowSendMsg = bloc?.hasPermission2SendMessageObj ?? false;
    chatroomIsOpen = !(bloc?.hasNotBegun ?? false) ?? false;
    if (mounted) {
      setState(() {});
    }
  }

  void _chatRoomUnreadMsgCountChange() {
    if (mounted) {
      setState(() {});
    }
  }

  /// 检查聊天室是否已经开放
  void chatRoomState() async {
    IntoChatRoomStatus.ins
        .queryStream(
            tag: "match_detail_bottom",
            systemId: widget.systemId,
            gidm: widget.gidm,
            anchorId: anchorId,
            liveId: widget.liveId)
        .listen((roomRsp) {
      if (roomRsp.isSuccess) {
        _state = ChatroomState.Inited;
        if (mounted) {
          setState(() {
            if (ModuleSwitch.getInstance().gifts()) {
              hasGiftBtn = isNotEmpty(anchorId);
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              updateShopCarPosition();
            });
            model.updateHasSharedRecordBtn(hasSharedRecordBtn);
          });
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant BottomNavBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    model.updateHasSharedRecordBtn(hasSharedRecordBtn);
  }

  void hitOptionCount(event) {
    if (mounted) {
      setState(() {
      });
    }
  }

  ChatRoomBloc bloc;
  bool _blocDidLoad = false;
  Future<void> loadHistoryMessage() async {
    bloc = await ChatRoomBlocFactory.ins.getBloc(
        gidm: widget.gidm,
        systemId: widget.systemId,
        anchorId: anchorId,
        liveId: widget.liveId,
        announcement: widget.announcement,
        onMessage: () {
          if (isNullOrEmpty(anchorId)) {
            widget.chatRoomController.unreadMsgCount =
                (bloc?.messages?.length ?? 0) -
                    (widget?.chatRoomController?.readMsgCount ?? 0);
          }
        },
        updateReadCount: (count) {
          widget.chatRoomController.readMsgCount += (count ?? 0);
        });
    if (isNullOrEmpty(anchorId)) {
      widget?.chatRoomController?.readMsgCount = (bloc?.messages?.length ?? 0);
    }
    var histories = await bloc.pullHistoryMsg(newAnchorId: anchorId);
    bettingTotal = bloc?.bettingTotalObj ?? 0;
    // 本地有缓存需要调整投注额
    num currentBetGold = config?.userInfo?.currLaunchAllBetGold ?? 0;
    if (bettingTotal > currentBetGold) {
      bettingTotal = bettingTotal - currentBetGold;
    }
    _blocDidLoad = true;
    isAllowSendMsg = bloc?.hasPermission2SendMessageObj ?? false;
    chatroomIsOpen = !(bloc?.hasNotBegun ?? false) ?? false;
    histories?.forEach((value) {
      String text = value?.messageBody?.data ?? '';
      if (text.isNotEmpty && !text.contains('gif') && !text.contains('jpeg')) {
        messages.add(text);
      }
    });
    if (mounted) {
      setState(() {});
    }
    bloc?.bindOnLiveMessage(onMessage);
    Future.delayed(Duration(seconds: 1), () {
      onMessage();
    });
  }

  void onMessage() {
    // 投注页显示聊天消息
    if (bloc != null && (bloc?.messages ?? []).isNotEmpty) {
      Event.eventBus.fire(LiveChatMessageEvent(bloc?.messages));
    }
  }

  void onStateChange(ChatroomState state) async {
    await sleep(10);
    if (mounted)
      setState(() {
        _state = state;
        if (_state == ChatroomState.Inited) {
          model.updateHasSharedRecordBtn(hasSharedRecordBtn);
        }
      });
  }

  void swiperListener() {
    if (mounted) {
      setState(() {
        currentIndex = widget?.swiperController?.index ?? 0;
        Event.eventBus.fire(DetailSwiperChangeEvent(index: currentIndex));
      });
    }
  }

  void updateShopCarPosition() {
    RenderBox rb = _shopCarKey.currentContext?.findRenderObject();
    if(rb != null){
      var offset = rb?.localToGlobal(Offset.zero);
      Event.eventBus.fire(UpdateFlyEndPointEvent(
          offsetX: (MediaQuery.of(context).size.width - offset.dx) - 20,
          offsetY: MediaQuery.of(context).size.height - offset.dy));
    }
  }

  void updateGameBtnPosition() {
    RenderBox rb = _gameBtnKey?.currentContext?.findRenderObject();
    if (rb != null) {
      gameBtnOffset = rb?.localToGlobal(Offset.zero);
    }
  }

  @override
  void dispose() {
    watchLiveTimer?.cancel();
    sendReqCancelToken?.cancel();
    sendReqCancelTokenTimer?.cancel();
    unbindEvent();
    widget?.swiperController?.removeListener(swiperListener);
    widget?.chatRoomController
        ?.removeUnreadMsgCountChange(_chatRoomUnreadMsgCountChange);
    loop = false;
    super.dispose();
  }

  ///跟投模块开关状态变化事件监听处理
  void moduleChangeListen(e) {
    if (mounted) {
      setState(() {});
    }
  }

  ///有新注单分享事件
  void hasNewBetShareListen(e) {
    if (mounted) {
      setState(() {});
    }
  }

  bool _preventMultiTap = false;
  void resetMultiTap(){
    if(_preventMultiTap) return;
    _preventMultiTap = true;
    Future.delayed(Duration(milliseconds: 250), (){
      _preventMultiTap = false;
    });
  }

  @override
  Widget render(BuildContext context) {
    List<Widget> children = <Widget>[];



    // 主播推单和游戏
    if(!isStrNullOrEmpty(anchorId) && isFreeLiveGameAnchor){
      String gameIcon = !isStrNullOrEmpty(gameModel?.icon) ? gameModel?.icon : gameModel?.img;
      children.add(
          GestureDetector(
            key: _gameBtnKey,
            behavior: HitTestBehavior.opaque,
            onTap: ()=>openAnchorShare(context),
            child: Container(
              alignment: Alignment.center,
              width: 42.0,
              height: 42.0,
              child: isFreeLiveGameAnchor
                ? AiImage.fromUrl(gameIcon ?? '', '', BoxFit.cover, 40.0,  40.0)
                : AiImage.asset('assets/images/detail/chatroom/gif_details_live_share.gif',scale: 1.0),
            ),
          )
      );
    }
    children.add(const SizedBox(width: 5.0));

    // 键盘输入框
    if (ModuleSwitch.getInstance().chatRoom()) {
      children.add(_editTextView(context));
    }

    // icon_detail_share_blank
    // children.addAll(leftBtnGroup());
    //
    children.addAll(rightBtnGroup());

    // 修复14279bug，底部栏过高
    double iphone6Max = 49.0;
    double iphoneXsMax = 83.0;
    double iphoneXs = 34.0;
    double bottom = config.devicePadding?.bottom ?? 0;
    if (bottom > iphone6Max && bottom <= iphoneXsMax) {
      bottom = iphoneXs;
    } else if (bottom > iphoneXs && bottom <= iphone6Max) {
      bottom = 1.0;
    }
    double bottomMargin = 0.0;
    if(defaultTargetPlatform == TargetPlatform.iOS && bottom > 0){
      bottomMargin = 10.0;
    }
    return Container(
      width: double.infinity,
      height: 60.0 + bottom / 2,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5.0, right: 10.0, bottom: bottomMargin),
              child: Row(children: children),
            ),
          ),
          _chatRoomUnReadCountWidget(),
        ],
      ),
    );
  }

  /// 聊天室未读消息数冒泡
  Widget _chatRoomUnReadCountWidget() {
    int unreadCount = (widget?.chatRoomController?.unreadMsgCount ?? 0);
    if (unreadCount > 0 && widget?.swiperController?.index == 0) {
      return Container(
        margin: EdgeInsets.only(left: 65.0, top: 6.0),
        child: ClipPath(
          clipper: ChatRoomMsgCountBgClipPath(count: unreadCount),
          child: InkWell(
            onTap: () {
              if (model.isReconnecting) {
                return;
              }
              widget.swiperController.move(1);
            },
            child: Container(
              height: 19.0,
              width: unreadCount > 99 ? 22 : (unreadCount >= 10 ? 18 : 14),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.only(top: 1.0),
              child: Text(
                '${unreadCount > 99 ? '99+' : unreadCount}',
                style: AiTextStyle(
                  color: config.skin.colors.fontColorWhite,
                  fontSize: config.skin.fontSize.h6,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }

  ///
  List<Widget> leftBtnGroup() {
    if (BottomNavigationBarExtentConfig.getIns().hasLeftExtent()) {
      return BottomNavigationBarExtentConfig.getIns().leftBtnGroup(context, getLeftDefaultInfo());
    }
    return <Widget>[];
  }

  ///
  List<Widget> rightBtnGroup() {
    Color bgColor = Colors.white.withOpacity(0.1);
    num liveStatus = widget.detailSet.detailParams?.liveStatus;
    bool isFreeAnchorNoStart = (widget.detailSet.detailParams.isFreeAnchor && liveStatus != null && liveStatus == 0);
    return BottomNavigationBarExtentConfig.getIns().hasRightExtent()
        ? BottomNavigationBarExtentConfig.getIns()
            .rightBtnGroup(context, getRightDefaultInfo())
        : <Widget>[

            // 更多
            Show(
              isShow: hasMoreBtn,
              child: CircleButton(
                bgColor: Colors.white.withOpacity(0.1),
                icon: AiSvgPicture.asset('assets/images/detail/more/icon_details_more.svg'),
                onTap: showMore,
              ),
            ),
//              (hasMoreBtn && widget.isFreeAnchor)
//              ? CircleButton(
//                  bgColor: Colors.white.withOpacity(0.1),
//                  icon: AiSvgPicture.asset('assets/images/detail/more/icon_detail_bot_more.svg'),
//                  onTap: showMore,
//                  )
//              : SizedBox(),

//              (hasGiftBtn && ModuleSwitch.getInstance().videoAndAnchor())
//                ? CircleButton(
//                    bgColor: bgColor,
//                    icon: AiImage.asset(
//                        'assets/images/gift/icon_detail_gift.gif',
//                        scale: 1.0),
//                    onTap: openGiftPan,
//                  )
//                : SizedBox(),
            //比赛数据
            Show(
              isShow: hasMatchDataBtn && !widget.isFreeAnchor, //比赛数据
              child: CircleButton(
                bgColor: bgColor,
                icon: AiSvgPicture.asset('assets/images/detail/more/icon_details_data.svg'),
                onTap: _showMatchGlobalInfo
              )
            ),

            // 礼物
            Show(
              isShow: (hasGiftBtn && ModuleSwitch.getInstance().videoAndAnchor()),
              child: CircleButton(
                bgColor: bgColor,
                icon: AiImage.asset('assets/images/gift/icon_detail_gift.gif', scale: 1.0),
                onTap: openGiftPan,
              )
            ),

            // 转移到首位
            // Offstage(
            //   offstage: !hasMoreBtn,
            //   child: CircleButton(bgColor: bgColor, icon: AiSvgPicture.asset('assets/images/detail/more/icon_detail_bot_more.svg'), onTap: showMore),
            // ),

            // 投注单购物车
            // Show(
            //   isShow: !isFreeLiveGameAnchor,
            //   child: StatefulBuilder(
            //     builder: (BuildContext ctx, StateSetter setState) {
            //       shopCarStateSetter = setState;
            //       // icon_detail_shopping_cart.gif 替换为icon_detail_betlist.gif
            //       return CircleButton(
            //         key: _shopCarKey,
            //         bgColor: bgColor,
            //         icon: AiImage.asset(
            //             'assets/images/detail/more/icon_detail_betlist.gif',
            //             scale: 1.0),
            //         // icon: isShowShopCarAnimation
            //         //     ? AiImage.asset('assets/images/detail/more/icon_detail_betlist.gif', scale: 1.0)
            //         //     : AiSvgPicture.asset('assets/images/detail/more/icon_detail_bot_betlist.svg'),
            //         onTap: _openShoppingCar,
            //         showNum: _hitOptionCount > 0,
            //         count: _hitOptionCount,
            //         isTopRightShowNum: true,
            //       );
            //     },
            //   ),
            // ),

//            Show(
//              isShow: widget.isFreeAnchor,
//              replacement: Show(
//                  isShow: hasMatchDataBtn, //比赛数据
//                  child: CircleButton(
//                      bgColor: bgColor,
//                      icon: AiSvgPicture.asset(
//                          'assets/images/detail/more/icon_detail_bot_data.svg'),
//                      onTap: _showMatchGlobalInfo)),
//              child: Show(
//                isShow: ModuleSwitch.getInstance().shareBetOrder() && !widget.isFreeLiveGameAnchor,
//                child: CircleButton(
//                    //主播爆料
//                    bgColor: bgColor,
//                    icon: AiImage.asset(
//                        'assets/images/detail/icon_details_news.gif'),
//                    onTap: _showAnchorShare),
//              ),
//            ),
              //主播爆料
            //  Show(
            //     isShow: (hasShareBetBtn || isFreeAnchorNoStart)
            //         && !config.isDeleteInternationalAppointModule
            //         && !isFreeLiveGameAnchor,
            //         //&& ModuleSwitch.getInstance().shareBetOrder(),
            //     child: CircleButton(
            //         bgColor: bgColor,
            //         icon: AiImage.asset(
            //             'assets/images/detail/more/icon_detail_sharebet_en-us.gif'),
            //         onTap: _showShareBetOrderTabPage),
            //   ),

//            !widget.isFreeAnchor
//              ? Show(
//                  isShow: !widget.isFreeAnchor,
//                  replacement: CircleButton(
//                    bgColor: bgColor,
//                    icon: AiImage.asset(
//                        'assets/images/share_bet_order/icon_details_share_list.png'),
//                    onTap: openAnchorShare,
//                  ),
//                  child: hasFollowBetBtn
//                      ? CircleButton(
//                          bgColor: bgColor,
//                          icon: AiSvgPicture.asset(
//                              'assets/images/detail/more/icon_detail_bot_share.svg'),
//                          onTap: () {
//                            _followBetRecord();
//                          },
//                        )
//                      : sw(0),
//                 )
//              : SizedBox(),

//          Offstage(
//            offstage: !hasSharedRecordBtn,
//            child: CircleButton(
//              bgColor: Color(0xFF222226),
//              icon: isHasNewBetShareMessage
//                ? AiImage.asset('assets/images/detail/more/icon_detail_share.gif',scale: 1.0)
//                : AiSvgPicture.asset('assets/images/detail/more/icon_detail_bot_sharebet.svg'),
//              onTap: _showSharedRecord,
//              showNum: false,
//              count: PopupShareService.ins.hasNewShare ? 1 : 0,),
//          ),

            // 3.11  assets/images/detail/more/icon_detail_user_share.gif 替换 icon_detail_sharebet.gif
//            Show(
//              isShow: !widget.isFreeAnchor,
//              child: hasSharedRecordBtn
//                  ? ((isEmpty(widget.anchorId) || !ModuleSwitch.getInstance().videoAndAnchor())
//                      ? StatefulBuilder(builder:
//                          (BuildContext context, StateSetter setStater) {
//                          showSharedRecordStateSetter = setStater;
//                          return CircleButton(
//                            bgColor: bgColor,
//                            icon: AiImage.asset(
//                              'assets/images/detail/more/icon_detail_sharebet.gif',
//                              scale: 1.0,
//                              userInternational: true,
//                            ),
////                      icon: isHasNewBetShareMessage
////                          ? AiImage.asset('assets/images/detail/more/icon_detail_user_share.gif',scale: 1.0)
////                          : AiSvgPicture.asset('assets/images/detail/more/icon_detail_bot_sharebet.svg'),
//                            onTap: _showSharedRecord,
//                            showNum: false,
//                            count: PopupShareService.ins.hasNewShare ? 1 : 0,
//                          );
//                        })
//                      : GestureDetector(
//                          behavior: HitTestBehavior.opaque,
//                          onTap: _showSharedRecord,
//                          child: Container(
//                            width: 34 + 6.0,
//                            height: 34,
//                          ),
//                        ))
//                  : SizedBox(),
//            ),

            // Offstage(
            //   offstage: !hasAnchorSharedRecordBtn,
            //   child: StatefulBuilder(builder: (BuildContext context, StateSetter setStater) {
            //     showAnchorSharedRecordStateSetter = setStater;
            //     return CircleButton(
            //       bgColor: bgColor,
            //       icon: AiImage.asset('assets/images/detail/more/icon_detail_anchor_share.gif', scale: 1.0),
            //       onTap: _showAnchorSharedRecord,
            //       showNum: false,
            //       count: PopupShareService.ins.hasNewShare ? 1 : 0,
            //     );
            //   }),
            // ),
          ];
  }

  double rightCircleAllButonWidth() {
    double width = 40.0;
    double right = 10.0;
    double left = 10.0;
    double totalWidth =
        width * 2.0 + right + left; //(一个width：购物车图标，另一个width是跟投图标)
//    if(hasMatchIndexBtn){
//      totalWidth += width;
//    }
//    if(hasVideoBtn){
//      totalWidth += width;
//    }
    if (!hasFollowBetBtn && !widget.isFreeAnchor) {
      //跟投图标
      totalWidth -= width;
    }
    if (hasGiftBtn) {
      totalWidth += width;
    }
    if (hasMoreBtn) {
      totalWidth += width;
    }
    if ((hasMatchDataBtn && !widget.isFreeAnchor) ||
        ModuleSwitch.getInstance().shareBetOrder()) {
      totalWidth += width;
    }
    if (hasShareBetBtn &&
        !config.isDeleteInternationalAppointModule &&
        !widget.isFreeAnchor) {
      totalWidth += width;
    }
    if (hasSharedRecordBtn && !widget.isFreeAnchor) {
      totalWidth += width;
    }
    // if (hasAnchorSharedRecordBtn) {
    //   totalWidth += width;
    // }
    return totalWidth;
  }

  ///
  List<DefaultBtnConfigInfo> getLeftDefaultInfo() {
    var info = <DefaultBtnConfigInfo>[];
    info
      ..add(DefaultBtnConfigInfo(
        index: 1,
        showHide: BtnStatus.hide,
        callback: _shareBet,
        bgColor: Colors.white.withOpacity(.6),
        bgIcon: null,
        icon: AiSvgPicture.asset(
            'assets/images/detail/icon_detail_share_blank.svg'),
        btnLayout: BtnLayout.left,
        count: null,
        showNum: null,
      ));
    return info;
  }

  ///
  List<DefaultBtnConfigInfo> getRightDefaultInfo() {
    var info = <DefaultBtnConfigInfo>[];
    info
      ..add(DefaultBtnConfigInfo(
        index: 0,
        showHide: !hasMatchIndexBtn ? BtnStatus.hide : BtnStatus.show,
        callback: _showMatchGlobalInfo,
        bgColor: Theme.of(context).colorScheme.secondary,
        bgIcon: null,
        icon: AiSvgPicture.asset(
            'assets/images/detail/icon_detail_deta_blank.svg'),
        btnLayout: BtnLayout.right,
        count: null,
        showNum: null,
      ))
      ..add(DefaultBtnConfigInfo(
        index: 1,
        showHide: !hasVideoBtn ? BtnStatus.hide : BtnStatus.show,
        callback: _showVideoList,
        bgColor: Theme.of(context).colorScheme.secondary,
        bgIcon: null,
        icon: AiSvgPicture.asset(
            'assets/images/detail/icon_detail_living_blank.svg'),
        btnLayout: BtnLayout.right,
        count: null,
        showNum: null,
      ))
      ..add(DefaultBtnConfigInfo(
        index: 2,
        showHide: BtnStatus.hide,
        callback: _showSharedRecord,
        bgColor: Theme.of(context).colorScheme.secondary,
        bgIcon: null,
        icon: AiSvgPicture.asset(
            'assets/images/detail/icon_detail_sharedbet_blank.svg'),
        btnLayout: BtnLayout.right,
        count: null,
        showNum: null,
      ));
    return info;
  }

  Widget _editTextView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double viewPortWidth = screenWidth - rightCircleAllButonWidth() - 5 - (20 + 5 + 14);
    String balanceEnoughText = config.langMap['baseLang']['detail']['saySomething'];
    String chatroomReconnecting = config.langMap['baseLang']['detail']['chatroom_reconnecting'];
    balanceEnoughText = this.model.isReconnecting ? chatroomReconnecting : balanceEnoughText;
    String balanceLessText1 = config.langMap['baseLang']['detail']['prohibitSpeak1'];
    String balanceLessText2 = config.langMap['baseLang']['detail']['prohibitSpeak2'];
    String chatroomCloseText = config.langMap['baseLang']['detail']['chatroomClose'];
    String balanceLessText = balanceLessText1 + '$bettingTotal' + balanceLessText2;
//    Color enoughFontColor = config.skin.colors.fontColorDark;
//    Color lessFontColor = config.skin.colors.fontColorDark.withOpacity(0.4);
    Color enoughFontColor = Colors.white.withOpacity(0.5);
    Color lessFontColor = Colors.white.withOpacity(0.5);
    List<String> scrollMessages = [];
    scrollMessages.add(balanceLessText);
    scrollMessages.add(balanceLessText);

    final isReconnecting = model.isReconnecting;
    final defaultCol = Colors.grey.withOpacity(0.2);

    Widget chatFrameWidget = chatPlaceholderWidget(balanceEnoughText, isReconnecting ? defaultCol : enoughFontColor);
    if (chatroomIsOpen) {
      if (currentIndex == 0 && messages.isNotEmpty && !isReconnecting) {
        // 有聊天消息
        chatFrameWidget = Container(
          alignment: Alignment.centerLeft,
          child: NewsReportCarousel(
            widgetList: chatMessageChildren(),
            itemHeight: 34.0,
            isAutoScoll: true,
            showCount: 1,
            carouselTime: 1,
          ),
        );
      } else if (isAllowSendMsg) {
        // 没有聊天消息,投注额够
        chatFrameWidget = chatPlaceholderWidget(balanceEnoughText, isReconnecting ? defaultCol : enoughFontColor);
      } else {
        // 没有聊天消息,投注额不够
        if (bettingTotal > 0) {
          if (!needScroll(balanceLessText, config.userInfo.walletId)) {
            chatFrameWidget = chatPlaceholderWidget(
              balanceLessText,
              isReconnecting ? defaultCol : lessFontColor,
              walletId: config.userInfo.walletId,
            );
          } else {
            // 小屏滚动显示
            chatFrameWidget = NewsCrossSlip(
              key: newsKey,
              messages: scrollMessages,
              width: viewPortWidth,
              textStyle: placeholderTextStyle(enoughFontColor).copyWith(color: isReconnecting ? defaultCol : enoughFontColor),
              walletId: config.userInfo.walletId,
            );
          }
        }
      }
    } else {
      chatFrameWidget = chatPlaceholderWidget(chatroomCloseText, isReconnecting ? defaultCol : lessFontColor);
    }
    num liveStatus = widget.detailSet.detailParams?.liveStatus;
    bool isFreeAnchorNoStart = (liveStatus != null && liveStatus == 0);
    if(isFreeAnchorNoStart){
      chatFrameWidget = chatPlaceholderWidget('聊天室还未开放', defaultCol);
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if(_preventMultiTap) return;
          resetMultiTap();

          if (model.isReconnecting || isFreeAnchorNoStart) return;
          _go2ChatRoomSendMsg(context);
        },
        child: Container(
          height: 34.0,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.white.withOpacity(.1),
          ),
          child: chatFrameWidget,
        ),
      ),
    );
  }

  var coinNameStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h6,
    color: config.skin.colors.fontColorWhite,
  );

  var editTextStyle = AiTextStyle(
    fontSize: config.skin.fontSize.h5,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
  );

  bool needScroll(String text, String walletId) {
    double editTextWidth =
        MediaQuery.of(context).size.width - rightCircleAllButonWidth() - 5 - 48;
//    double textWidth = AiMeasure.measureTextWidth(WalletUtil.ins.getCoinName(walletId), coinNameStyle) + AiMeasure.measureTextWidth(text, editTextStyle) + 20;
//    if (editTextWidth < textWidth) {
//      return true;
//    }
    return false;
  }

  Widget chatPlaceholderWidget(String text, Color color, {String walletId}) {
    if (isNullOrEmpty(walletId)) {
      return Text(
        // config.langMap['baseLang']['detail']['saySomething'],
        text,
        overflow: TextOverflow.ellipsis,
        style: AiTextStyle(
          fontSize: config.skin.fontSize.h5,
          fontFamily: config.skin.fontFimaly.pingFang,
          fontWeight: config.skin.fontWeight.regular,
          // color: config.skin.colors.fontColorDark,
          color: color,
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
//          WalletUtil.ins.getCoinTagWidget(
//            walletId: '$walletId',
//            height: 16,
//            bgColor: Color(0xFFFFFFFF).withOpacity(0.1),
//            topLeftRadius: 2,
//            topRightRadius: 2,
//            bottomLeftRadius: 2,
//            bottomRightRadius: 2,
//            textStyle: coinNameStyle,
//          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              // config.langMap['baseLang']['detail']['saySomething'],
              text,
              overflow: TextOverflow.ellipsis,
              style: AiTextStyle(
                fontSize: config.skin.fontSize.h5,
                fontFamily: config.skin.fontFimaly.pingFang,
                fontWeight: config.skin.fontWeight.regular,
                // color: config.skin.colors.fontColorDark,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
  }

  TextStyle placeholderTextStyle(Color color) {
    return AiTextStyle(
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      // color: config.skin.colors.fontColorDark,
      color: color,
    );
  }

  List<Widget> chatMessageChildren() {
    List<Widget> messageList = [];
    int index = 0;
    messages.forEach((value) {
      messageList.add(
        MessageItem(
          index: index,
          text: value,
        ),
      );
      ++index;
    });
    return messageList;
  }

  final filter = SendMessageFilter();

  void _go2ChatRoomSendMsg(BuildContext context) {
    if (chatroomIsOpen) {
      // status = isAllowSendMsg ? InputBarStatus.show : InputBarStatus.hide;
    }
    if (widget?.swiperController?.index != 1) {
      widget.swiperController?.move(1);
      // if (mounted) {
      //   setState(() {
      // if (_state == ChatroomState.Inited) {
      // Future.delayed(Duration(milliseconds: 200), () {
      //   _hideBottomNav = true;
      //   widget?.chatRoomController?.notifyInputBarChange(status);
      // });
      // }
      // });
      // }
    } else {
      if (!isAllowSendMsg && _blocDidLoad && widget?.swiperController?.index == 1) {
        widget.swiperController?.move(0);
      } else {
        if (_state == ChatroomState.Inited) {
          ChatRoomInputDialog(
            roomNo: widget.roomNo,
            onCallBack: (msg) async {
              // 延迟200ms等输入框动画消失之后发送
              await Future.delayed(const Duration(milliseconds: 200));
              widget.chatRoomController?.sendMessage(msg);
            },
          ).show(context: context,isLoadBg: true);
          // sleep(10, () {
          //   widget?.chatRoomController?.notifyInputBarChange(status);
          // });
        }
      }
    }
  }

  /// 分享注单
  void _shareBet() {
//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailBottomShare);
//    PopupShareService.ins.pause('_shareBet');
//    showModalBottomSheetRoute(
//      context,
//      child: ShareBetRecordPage(
//        systemId: widget.systemId,
//        roomNo: roomNo,
//        gidm: widget.gidm,
//      ),
//      height: MediaQuery.of(context).size.height,
//      //child: MyBettingRecordView(systemId: widget.systemId,roomNo: roomNo)
//    ).then((v) {
//      PopupShareService.ins.resume('_shareBet');
//    });
  }

  /// 显示更多
  void showMore() {
    if(_preventMultiTap) return;
    resetMultiTap();

//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailBottomMore);
    Event.eventBus.fire(DetailMoreFunctionEvent());
  }

  int time = 0;
  void openAnchorShare(BuildContext ctx){
    if(_preventMultiTap) return;
    resetMultiTap();

    if(isFreeLiveGameAnchor){
      int curTime = DateTime.now().millisecondsSinceEpoch;
      if(curTime - time < 1000) {
        return;
      }
      time = curTime;
      config.quickTap = true;
      if(gameBtnOffset == null){
        RenderBox renderBox = _gameBtnKey?.currentContext?.findRenderObject();
        gameBtnOffset = renderBox?.localToGlobal(Offset.zero);
      }
      Offset offset = Offset(gameBtnOffset.dx + 20.0, gameBtnOffset.dy + 25.0);
      Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: gameModel));
      Event.eventBus.fire(ShowGameEvent(isShowGame: true));
//      LiveGame.openGamePan(
//        context: ctx,
//        supplierId: gameModel.supplierId,
//        gameKey: gameModel.gameKey,
//        roomNo: widget.roomNo,
//        anchorId: widget.anchorId,
//        callBack: (isSuccess){
//          Event.eventBus.fire(ShowGameEvent(isShowGame: false));
//        }
//      );
    }
    else{
      ccRoute.push(
          routeName: FastAiRouteTableName.AnchorOrderSharePage,
          pushType: PushType.BottomDialog,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          opaque: false,
          routeParams: {
            'anchorId': widget.anchorId,
            'roomNo': roomNo,
            'onGoBackRefreshDetail': widget.onGoBack
          }).then((value){
//            widget.onGoBack?.call();
      });
    }
  }

  /// 打开礼物面板
  void openGiftPan() {
    if(_preventMultiTap) return;
    resetMultiTap();

    if (Hooks.ins.isBlocked(HookName.SendGift, {})) return;
    if (widget?.swiperController?.index == 0) {
      widget.swiperController.move(1);
    }
//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailBottomGift);
    PopupShareService.ins.pause('_openGiftPan');
    sendReqCancelToken?.cancel(stopAllRequestError);
    sendReqCancelToken = CancelToken();
    showModalBottomSheetRoute(context,
            child: GiftPanPage(
              anchorId: anchorId ?? '',
              roomNo: roomNo ?? '',
              gidm: widget.gidm ?? '',
              onSendGift: onSendGift,
              detailSet: widget.detailSet,
//              isFreeAnchor: widget.isFreeAnchor,
            ),
            height: 450.0,
            isClip: false,
            barrierColor: Colors.transparent)
        .then((v) {
      PopupShareService.ins.resume('_openGiftPan');
    });
  }

  void openGameEvent(e) {
    Future.delayed(Duration(milliseconds: 100),(){
      AiGameCellModel model = AnchorGameService.ins.anchorGameMessage;
      if(model != null){
        gameModel = model;
        if(mounted)setState(() {});
      }
    });
  }

  void showGift(e) {
    if(e is ShowGiftEvent){
      if(e.isDelay){
        Future.delayed(Duration(milliseconds: 600), () {
          openGiftPan();
        });
      }
      else{
        openGiftPan();
      }
    }
  }

  /// 显示更多直播视频列表
  void _showVideoList() {
    Event.eventBus.fire(MoreVideoEvent());
//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailVideoLive);
  }

  /// 显示比赛指标信息：赛况、阵容、历史战绩
  void _showMatchGlobalInfo() {
    if(_preventMultiTap) return;
    resetMultiTap();

//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailBottomMoreData);
    Event.eventBus.fire(MatchGlobalInfoEvent());
  }

//  void _showAnchorShare() {
//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsShareBetPublish);
//    showModalBottomSheetRoute(
//      context,
//      height: MediaQuery.of(context).size.height,
//      barrierColor: Colors.transparent,
//      child: ShareBetPublishPage(
//          model: ShareBetPublishPageViewModel.create(
//              fromChatRoom: true, roomNo: roomNo)),
//    );
//  }


  /// 爆料
  void _showShareBetOrderTabPage() {
//    if(_preventMultiTap) return;
//    resetMultiTap();
//
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailAnchorShareBet);
//    PopupShareService.ins.pause('_showShareBetOrderTabPage');
//
//    showModalBottomSheetRoute(
//      context,
//      barrierColor: Colors.transparent,
//      child: ShareBetOrderTabPage(model: ShareBetOrderTabPageViewModel.create(gidm: widget.gidm, gameType: widget.gameType),)
//    ).then((v) {
//      PopupShareService.ins.resume('_showShareBetOrderTabPage');
//    });
  }

  /// 显示该场比赛的所有分享记录 主播推介 跟大神收米 最热投注项
  void _showSharedRecord() {
//    ModuleStatistics.ins
//        .statisticsEvent(StatisticsType.StatisticsDetailFollowStar);
//    PopupShareService.ins.pause('_showSharedRecord');
//
//    showModalBottomSheetRoute(context,
//        barrierColor: Colors.transparent,
//        child: AllSharedRecordView(
//          gidm: widget.gidm,
//          anchorId: anchorId,
//          systemId: widget.systemId,
//          roomNo: roomNo,
//          gameType: widget.gameType,
//          isFreeAnchor: widget.isFreeAnchor,
//        )).then((v) {
//      PopupShareService.ins.resume('_showSharedRecord');
//    });
  }

  /// 显示该场比赛的主播分享记录
  // void _showAnchorSharedRecord() { // 推 去掉
  //
  //   PopupShareService.ins.pause('_showAnchorSharedRecord');
  //   showModalBottomSheetRoute(
  //       context,
  //       child: AnchorSharedBetRecordPage(
  //         gidm: widget.gidm,
  //         anchorId: anchorId,
  //         systemId: widget.systemId,
  //         showTitle: true,
  //         roomNo: _roomNo,
  //       ),
  //   ).then((v) {
  //     PopupShareService.ins.resume('_showAnchorSharedRecord');
  //   });
  // }

//  /// 购物车
//  void _openShoppingCar() {
//    if(_preventMultiTap) return;
//    resetMultiTap();
//
//    if (Hooks.ins.isBlocked(HookName.StartShowBookCar, {})) return;
//    PopupShareService.ins.pause('_openShoppingCar');
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//    ]);
//    xcShowModalBottomSheet(
//        settings: RouteSettings(name: AiRouter.BettingContainer2P0),
//        isScrollControlled: true,
//        backgroundColor: Colors.transparent,
//        context: context,
//        elevation: 0,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        builder: (BuildContext _context) {
//          return BettingBottomDialog(
//            child: Theme(
//                data: Styles.aiTheme,
//                child: BettingContainer2P0(
//                  parentContext: _context,
//                  tabIndex: (config.userInfo.getHitCount(null) > 0 ? 0 : 1),
//                  addPaddingTop: 90,
//                  rightPadding: 10,
//                  leftPadding: 10,
//                )),
//          );
//        }).then((v) {
//      PopupShareService.ins.resume('_openShoppingCar');
//      SystemChrome.setPreferredOrientations([
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//        DeviceOrientation.landscapeLeft,
//        DeviceOrientation.landscapeRight,
//      ]);
//    });
//  }

  /// 跟投
  void _followBetRecord() {
//    PopupShareService.ins.pause('_followBetRecord');
//    showModalBottomSheetRoute(
//      context,
//      child: MatchFollowBetRecord(
//        gidm: widget.gidm,
//      ),
//    ).then((_) {
//      PopupShareService.ins.resume('_followBetRecord');
//    });
  }

  bool loop = false;

  Future _startTimer() async {
    if (loop) return;
    loop = true;
    int shopCarCount = 0;
    int shareCount = 0;
    while (loop) {
      await sleep(5000);
      shopCarCount++;
      shareCount++;
      if (!loop) break;
      if (shopCarCount >= 2) {
        shopCarCount = 0;
        if (mounted && shopCarStateSetter != null) {
          // isShowShopCarAnimation = !isShowShopCarAnimation;
          shopCarStateSetter(() {});
        }
      }
      if (shareCount >= 3) {
        shareCount = 0;
        if (mounted && showSharedRecordStateSetter != null) {
          isHasNewBetShareMessage = !isHasNewBetShareMessage;
          showSharedRecordStateSetter(() {});
        }
      }
    }
    loop = false;
  }

  // 发送礼物
  Timer sendReqCancelTokenTimer;

  void onSendGift(GiftInfoModel giftModel, int giftNum) async {
    selectGiftModel = giftModel;
    selectGiftModel.count = giftNum;
    num myBalance = num.tryParse(config.userInfo.myBalance);
    try {
      sendReqCancelToken = CancelToken();
      sendReqCancelTokenTimer = Timer(Duration(seconds: 15), () {
        sendReqCancelTokenTimer?.cancel();
        sendReqCancelToken?.cancel();
      });

      GiftBuyGiftReqProtocol req = GiftBuyGiftReqProtocol();
      req.goodsId = giftModel.giftId;
      req.buyCounts = giftNum ?? 1;
      req.roomNo = widget.roomNo;
      req.anchorId = widget.anchorId;
      req.gidm = widget.gidm;
      req.anchorType = widget.isFreeAnchor ? '1' : '';
      var rsp = await req.request(cancelToken: sendReqCancelToken);
      sendReqCancelTokenTimer?.cancel();
      // 更新余额
      var result = await queryBalance();

      if (rsp.isTradeSuccess) {
//        ModuleStatistics.ins
//            .statisticsEvent(StatisticsType.StatisticsDetailBottomSendGift);
        sendGiftAnimation();
      } else if ('${rsp.code}' == '602017') {
        showToas(baseLang['detail']['chatGift']['gameFinishSendGiftFail']);
      } else {
        // 有扣钱但是未发送成功的情况
        num newBalance = num.tryParse(config.userInfo.myBalance);
        if (myBalance > newBalance) {
          sendGiftAnimation();
          return;
        }
        showBuyFailureAlter();
      }
    } catch (e) {
      sendReqCancelTokenTimer?.cancel();
      showBuyFailureAlter();
    }
  }

  // 更新余额
  Future queryBalance() async {
    try {
      var balance = await Net.getBalance(walletId: config.userInfo.walletId);
      if (balance.isSuccess) {
        config.userInfo.balance = balance;
//        if (bottomMenuKey?.currentState != null) {
//          bottomMenuKey?.currentState?.refresh();
//        }
      }
      return balance;
    } catch (e) {}
  }

  void sendGiftAnimation() {
    if (selectGiftModel == null) {
      return;
    }
    // gift动画参数
    GiftInfoModel infoModel = GiftInfoModel(
        playerId: config.userInfo.playerId,
        type: GiftType.gif,
        gif: selectGiftModel.giftImage,
        svga: '',
        image: selectGiftModel.pngImage,
        nickName: config.userInfo.nickName,
        giftName: selectGiftModel.giftName,
        count: selectGiftModel.count,
        msgTime: selectGiftModel.msgTime,
        price: selectGiftModel.price);
    // svga动画参数
    if (selectGiftModel.isGif == 0) {
      infoModel.gif = '';
      infoModel.svga = selectGiftModel.giftImage;
      infoModel.type = GiftType.svga;
    }
    GiftPlayServer.ins.addGift(infoModel);
    Event.eventBus.fire(ChatOwnGiftMessageEvent(selectGiftModel));
  }

  void showBuyFailureAlter() {
    showToas(baseLang['detail']['chatGift']['hitContentBuyFailure']);
    // TipsAlter.showCenterCancelTipsAlter(
    //   context,
    //   title: baseLang['detail']['chatGift']['hitTitle'],
    //   content: baseLang['detail']['chatGift']['hitContentBuyFailure'],
    //   cancel: baseLang['detail']['chatGift']['know'],
    // );
  }

  BottomNavBarModel navBarModel = new BottomNavBarModel();

  @override
  BottomNavBarModel get defaultModel => navBarModel;
}

class MessageItem extends StatefulWidget {
  final int index;
  final String text;

  MessageItem({Key key, this.index = 0, this.text = ''}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      child: Container(
        padding: EdgeInsets.only(top: 0, right: 15.0),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AiTextStyle(
            fontSize: config.skin.fontSize.h5,
            fontFamily: config.skin.fontFimaly.pingFang,
            fontWeight: config.skin.fontWeight.regular,
            color: Colors.white.withOpacity(0.5),
//              color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}

typedef UpdateInfoFunc = Function({String anchorId, String roomNo});

//
class UpdateRoomInfoController {
  UpdateInfoFunc updateRoomInfoFunc;

  VoidCallback resetRoomStatusFunc;

  UpdateRoomInfoController();
}
