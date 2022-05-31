import 'dart:async';

import 'package:fast_ai/api/protocols/chatroom/room_info_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/send_message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/animation_new_msg_button.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_widget_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/redpacket_barrage_manager.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/redpacket_barrage_view.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/slider/chat_room_slider_match_widget.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/input_chat_room_barrage_widget.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../utils/ai_image.dart';
import 'chatroom_bloc.dart';
import 'chatroom_connectstatus/chatroom_connectstatus_model.dart';
import 'chatroom_connectstatus/chatroom_connectstatus_view.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */

//聊天室会话视图
class ChatroomWidget extends StatefulWidget {
  //房间号
  final String gidm;
  final String systemId;
  final String anchorId;
  final bool isFreeAnchor;
  final String liveId;
  final ChatroomController controller;
  final MatchDetailController swiperController;
  final HorizontalDragCallBack horizontalDragCallBack;
  final ValueChanged<PageSliderDirection> onRefresh;
  final bool isListDetail;
  final ValueChanged<bool> onOverWatchLiveTime;
//  final MatchesDetailModel matchesDetailModel;
  final String announcement;
  final bool isFreeLiveGameAnchor;

  ChatroomWidget(
      {this.controller,
      this.gidm,
      this.systemId,
      this.anchorId,
      this.isFreeAnchor,
      this.swiperController,
      this.horizontalDragCallBack,
      this.onRefresh,
      this.isListDetail,
      this.onOverWatchLiveTime,
      this.liveId,
//      this.matchesDetailModel,
      this.announcement,
      this.isFreeLiveGameAnchor = false,
      })
      : super(key: controller.key);

  @override
  _ChatroomWidgetState createState() => _ChatroomWidgetState();
}

class ChatroomController {
  GlobalKey<_ChatroomWidgetState> key = GlobalKey();

  // 页面无法销毁：精选页进详情，在从主播页重复进入详情导致黑屏
  bool chatRoomWantKeepAlive = true;

  void sendMessage(Message message) {
    // key.currentState?.sendMessage(message);
    key.currentState?.sendMessage(message);
  }

  void scrollToBottom() {
    key.currentState?.scrollToBottom();
  }

  void showFollowBetMsgScrollToBottom() {
    key.currentState?.showFollowBetMsgScrollToBottom();
  }

  ChatroomState _state = ChatroomState.None;

  ChatroomState get state => _state;
  Set<ValueChanged<ChatroomState>> _onStateChagnes = Set<ValueChanged<ChatroomState>>();

  void onStateChange(ValueChanged<ChatroomState> callback) {
    _onStateChagnes.add(callback);
  }

  void cleanStateChange(ValueChanged<ChatroomState> callback) {
    _onStateChagnes.remove(callback);
  }

  void fireStateChange(ChatroomState state) {
    if (_state == state) return;
    _state = state;
    _onStateChagnes.forEach((f) {
      f(_state);
    });
  }

  Future<RoomInfoRspProtocol> switchAnchorId(String selectAnchorId) async {
    var rst = await key.currentState?.bloc?.rePullChatRoomMsg(newAnchorId: selectAnchorId);
    _anchorSwitchChangeListener?.forEach((cb) {
      if (cb != null) {
        cb(selectAnchorId);
      }
    });
    return rst;
  }

  Set<ValueChanged<String>> _anchorSwitchChangeListener = Set<ValueChanged<String>>();

  void addAnchorSwitchChangeListener(ValueChanged<String> callback) {
    _anchorSwitchChangeListener.add(callback);
  }

  void removeAnchorSwitchChangeListener(ValueChanged<String> callback) {
    _anchorSwitchChangeListener.remove(callback);
  }

  //输入栏显示隐藏/////////////////////////////////////////////////////////

  // Set<ValueChanged<InputBarStatus>> _onInputBarChanges = Set<ValueChanged<InputBarStatus>>();
  //
  // void listenerInputBarChange(ValueChanged<InputBarStatus> callback) {
  //   _onInputBarChanges.add(callback);
  // }
  //
  // void removeInputBarChange(ValueChanged<InputBarStatus> callback) {
  //   _onInputBarChanges.remove(callback);
  // }
  //
  // void notifyInputBarChange(InputBarStatus state) {
  //   if (null == state) return;
  //   _onInputBarChanges.forEach((f) {
  //     f(state);
  //   });
  // }

  //////////////////////////未读消息/////////////////////////////////////////////
  //未读消息计数
  int _unreadMsgCount = 0;

  //已读消息计数
  int readMsgCount = 0;

  int get unreadMsgCount => _unreadMsgCount;

  set unreadMsgCount(int count) {
    _unreadMsgCount = count;
    notifyUnreadMsgCountChange();
  }

  Set<VoidCallback> _unreadMsgCountChanges = Set<VoidCallback>();

  void listenerUnreadMsgCountChange(VoidCallback callback) {
    _unreadMsgCountChanges.add(callback);
  }

  void removeUnreadMsgCountChange(VoidCallback callback) {
    _unreadMsgCountChanges.remove(callback);
  }

  void notifyUnreadMsgCountChange() {
    _unreadMsgCountChanges?.forEach((f) {
      f();
    });
  }
}

// /// 输入栏状态
// enum InputBarStatus {
//   show,
//   hide,
// }

class _ChatroomWidgetState extends State<ChatroomWidget> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final ScrollController controller = ScrollController();
  ChatRoomBloc bloc;
  ChatroomConnectstatusModel statusModel = ChatroomConnectstatusModel();

//  StreamSubscription<ChatMessageEvent> chatMessageStreamSubscription;
  StreamSubscription<SendMessage> sendMessageSubcription;

  StreamSubscription<ChatOwnMessageEvent> chatOwnMessageEventSubcription;
  StreamSubscription<ChatOwnGiftMessageEvent> chatOwnGiftMessageEventSubscription;
  StreamSubscription<CloseDetailPageEvent> closeDetailPage;

//  StreamSubscription<OpenedRedBagEvent> openedRedBagEvent;

  bool canScroll2Bottom = true;

  bool showHasNewMsgBtn = false;

  String refinedBg = '';
  String leagueColorStr = '';
  Color leagueColor = config.customStyle.refinedBgColor;

//  bool enablePullUpSwitchPage = false;

  //****************** 红包 ******************
  RedpacketBarrageManager _redPacketBarrageManager;
  AnimationController _redPacketController;
  StateSetter _redPacketBarrageSetState;
  Timer _timer;
  StreamController<bool> _scollBottomStream;

//  num bettingTotal = 0;
//  Timer watchLiveTimer;

  void _subscribeRedBagMsg() {
    // 抢指定商户的红包
    //XCStompClient.ins.subscribe(XCStompAction.RedBag, '/topic/redpack/${config.merchantAppConfig.merchantId}/', _redBagPushMsgCallback);
    //print('000-subscribeRedBagMsg merchantID=${config.userInfo?.account?.data?.merchantId}， merchantConfigDetail.merchantId=${config.merchantAppConfig.merchantId}');
    if (!ModuleSwitch.getInstance().redPacket()) {
      return;
    }
    // 抢全局红包弹幕
    var sysId = (isStrNullOrEmpty(widget.systemId) ? widget.liveId : widget.systemId) ?? '';
    var topic = '/topic/redpack/rob/$sysId/';
    print('_subscribeRedBagMsg>>>> sysId=$sysId, topic=$topic');
    XCStompClient.ins.subscribe(XCStompAction.RobGlobalRedEnvelope, topic, _robGlobalRedPacketCallback);
  }

  void _unsubscribeRedBagMsg() {
    // 抢指定商户的红包
    //XCStompClient.ins.unsubscribe(XCStompAction.RedBag, '/topic/redpack/${config.merchantAppConfig.merchantId}/');

    // 抢全局红包弹幕
    var sysId = widget.systemId ?? '';
    var topic = '/topic/redpack/rob/$sysId/';
    print('---_unsubscribeRedBagMsg>>>> sysId=$sysId, topic=$topic');
    XCStompClient.ins.unsubscribe(XCStompAction.RobGlobalRedEnvelope, topic);
  }

//  void _redBagPushMsgCallback(Map<String,dynamic> msg){
//    logDebug('收到普通红包推送 >>>> msg=${msg.toString()}');
//
//    // {action: 1019, topic: /topic/redpack/, data: [{packetId: e32baf3159490ac038d4129fac788386, startTime:0，currentDate:0}], groupId: null}
//    List<dynamic> data = msg['data'] ?? [];
//    List<RedPacketModel> redPackets = data.map((m)=>RedPacketModel.from(m, 0)).toList();
//    if(redPackets.length == 0) return;
//
//    config.redPackets.add(redPackets.first);
//    config.syncRedPacketSystemTime(redPackets.first.systemTime);
//    if(mounted) setState(() { });
//  }

  void _robGlobalRedPacketCallback(Map<String, dynamic> msg) {
    // {action: 1021, topic: /topic/redpack/rob/03365665/, data: [{packetId: 18eb5c6c92933ad22a17ae59d1bac98a, headImg: , nickName: alex01, content: 38}], groupId: null}
    _redPacketBarrageManager.parseData(msg);
    updateRedPacketBarrageWidget();

    config.syncRedPacketSystemTime(_redPacketBarrageManager?.barrageData?.currentDate);
  }

  void updateRedPacketBarrageWidget() {
    print('>>>>>> 000 updateRedPacketBarrageWidget <<<<<<<');
    if (_redPacketBarrageManager.canShowBarrage) {
      print('>>>>>> 111 updateRedPacketBarrageWidget <<<<<<<');
      startAnimation();
    } else {
      print('>>>>>> 444 updateRedPacketBarrageWidget <<<<<<<');
      _redPacketBarrageSetState(() {});
    }
  }

  void startAnimation() {
    if (!_redPacketBarrageManager.canShowBarrage || !_redPacketController.isDismissed) return;

    print('>>>>>> 222 updateRedPacketBarrageWidget <<<<<<< start-${DateTime.now().toString()}');
    _redPacketBarrageManager.show = true;
    _redPacketBarrageSetState(() {});
    _redPacketController?.forward();
    Future.delayed(Duration(seconds: 4), () {
      _redPacketBarrageManager.show = false;
      _redPacketBarrageSetState(() {});
      _redPacketController?.reset();
      _redPacketBarrageManager.removeBarrageData();
      print('>>>>>> 333 updateRedPacketBarrageWidget <<<<<<< reset-${DateTime.now().toString()}');
      updateRedPacketBarrageWidget();
    });
  }

  //****************** 红包 ******************

  void sendMessage(Message message) async {
    if (Hooks.ins.isBlocked(HookName.StartSendChatMessage, {})) return;
    bloc.sendRoomMessage(context, content: message.messageBody.data);
    canScroll2Bottom = true;
    showHasNewMsgBtn = false;
  }

  //订阅接收到的内容
  void subcribeMessage() {
    sendMessageSubcription = Event.eventBus.on<SendMessage>().listen((event) {
      if (mounted) {
        bloc.sendRoomMessage(context, content: event.content);
      }
    });
//    chatMessageStreamSubscription =
//        Event.eventBus.on<ChatMessageEvent>().listen((event) {
//          if (mounted) {
//        bloc.onSubscribe(event.data);
//      }
//    });
    chatOwnMessageEventSubcription = Event.eventBus.on<ChatOwnMessageEvent>().listen((event) {
      if (mounted) {
        bloc.onOwnSubscribe(event.data);
      }
    });
    chatOwnGiftMessageEventSubscription = Event.eventBus.on<ChatOwnGiftMessageEvent>().listen((event) {
      if (mounted) {
        bloc.onOwnGiftSubscribe(event.giftInfoModel);
      }
    });
    closeDetailPage = Event.eventBus.on<CloseDetailPageEvent>().listen((e) {
      unsubcribeMessage();
    });
  }

  void unsubcribeMessage() {
//    chatMessageStreamSubscription?.cancel();
    sendMessageSubcription?.cancel();
    chatOwnMessageEventSubcription?.cancel();
    chatOwnGiftMessageEventSubscription?.cancel();
    closeDetailPage?.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
      subcribeMessage();
    }
    //后台
    else if (state == AppLifecycleState.paused) {
      unsubcribeMessage();
    }
  }

  @override
  void initState() {
    super.initState();
    _scollBottomStream = StreamController<bool>.broadcast();
    init();
  }

  void _onSharePopStateListener(bool state) {
    if (state) {
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: 600), () {
        scrollToBottom();
      });
    }
  }

  void init() async {
    await sleep(500);
    AnchorShareService.ins.addShowPopListener(_onSharePopStateListener);
    bloc = await ChatRoomBlocFactory.ins.getBloc(gidm: widget.gidm, systemId: widget.systemId, anchorId: widget.anchorId, liveId: widget.liveId,announcement: widget.announcement);
    this.bloc.bindOnMessage(onMessage);
//    bettingTotal = bloc?.bettingTotalObj ?? 0;
//    // 本地有缓存需要调整投注额
//    num currentBetGold = config?.userInfo?.currLaunchAllBetGold ?? 0;
//    if (bettingTotal > currentBetGold) {
//      bettingTotal = bettingTotal - currentBetGold;
//    }
//    // 满足投注额在查看是否长时间没有投注
//    String viewType = config?.userInfo?.detailSet?.selectViewType ?? '';
//    if(bettingTotal <= 0 && viewType == SelectViewTypeVideo){
//      recordWatchLive();
//    }
//    refinedBg = widget.matchesDetailModel?.data?.leagueBackgroundImage;
//    leagueColorStr = widget.matchesDetailModel?.data?.leagueColor;
//    leagueColor = RefinedMatch.leagueNameColor(leagueColorStr, defaultColor: config.customStyle.refinedBgColor);
    if (mounted) {
      setState(() {});
    }
    subcribeMessage();
    loadInitData().then((r) {
      if (bloc.state == ChatroomState.Inited) {
        ///红包
        //_loadRedBagList();
        if (ModuleSwitch.getInstance().redPacket()) {
          _subscribeRedBagMsg();
        }
      }
    });

    controller.addListener(() {
      if (!controller.hasClients) return;
      final max = controller.position.maxScrollExtent;
      final pixels = controller.position.pixels;

      // if (pixels == 0) {
      //   widget.chatRoomSliderTop.value = true;
      //   widget.chatRoomSliderBottom.value = false;
      // } else if (pixels >= max) {
      //   widget.chatRoomSliderTop.value = false;
      //   widget.chatRoomSliderBottom.value = true;
      // } else {
      //   widget.chatRoomSliderTop.value = false;
      //   widget.chatRoomSliderBottom.value = false;
      // }

      if (max - pixels <= 70) {
        canScroll2Bottom = true;
        if (mounted && showHasNewMsgBtn) {
          setState(() {
            showHasNewMsgBtn = false;
          });
        }
      } else {
        canScroll2Bottom = false;
      }
    });
    widget.controller.addAnchorSwitchChangeListener(anchorSwitchChangeListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });

//    if(openedRedBagEvent == null) { //用户点开红包后event
//      openedRedBagEvent = Event.eventBus.on<OpenedRedBagEvent>().listen((openRedBag){
//        if(openRedBag != null && openRedBag.isError){
//          config.syncRedPacketSystemTime(openRedBag.systemTime);
//
//          if(config.redPackets.first.packetId == openRedBag.packetId){
//            if(config.redPackets.length == 1 && !openRedBag.isTimeout) { // 只有一个红包报错就移除掉
//              config.redPackets.clear();
//            } else {
//              // 第一个红包放到队列末尾
//              config.redPackets.add(config.redPackets.first);
//              config.redPackets.removeAt(0);
//            }
//          }
//        } else {
//          if(openRedBag?.packetId != null){
//            //刷新红包列表（抢的红包不再存在，角标-1）
//            _loadRedBagList(openedPacketId: openRedBag.packetId);
//          }
//        }
//      });
//    }

    if (_redPacketController == null) {
      _redPacketController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
      _redPacketBarrageManager = RedpacketBarrageManager();
    }
    //消息列表未充满消息列表视口情况下，自动将消息标为已经读
    widget.swiperController.addListener(() {
      if (widget.controller.unreadMsgCount > 0 && (controller?.position?.maxScrollExtent ?? 0) <= 0.0 && widget.swiperController.index == 1) {
        widget.controller.readMsgCount = bloc?.messages?.length ?? 0;
        widget.controller.unreadMsgCount = 0;
      } else if (!showHasNewMsgBtn) {
        widget.controller.readMsgCount = bloc?.messages?.length ?? 0;
        widget.controller.unreadMsgCount = 0;
      }
    });
  }

//  void recordWatchLive(){
//    // 获取观看视频时长
//    WatchLiveReqProtocol req = WatchLiveReqProtocol();
//    req.request().then((value){
//      watchLiveTimer?.cancel();
//      watchLiveTimer = null;
//      if(config.userInfo.watchLiveTime > 0){
//        watchLiveTimer = Timer(Duration(seconds: config.userInfo.watchLiveTime),(){
//          num betTotal = config?.userInfo?.roomFirstBettingTotal;
//          num currentBet = config?.userInfo?.currLaunchAllBetGold;
//          // 用户满足投注额且投注过可以观看视频
//          if(betTotal <= 0 && currentBet > 0){
//            return;
//          }
//          if(widget?.onOverWatchLiveTime != null){
//            widget?.onOverWatchLiveTime(true);
//          }
//          // 关闭视频
//          watchLiveTimer?.cancel();
//          watchLiveTimer = null;
//          Event.eventBus.fire(WatchLiveTimeEvent(isCloseLive: true));
//        });
//      }
//      else{
//        // 观看视频时间为0
//        if(config.userInfo.watchLiveTime == 0){
//          if(widget?.onOverWatchLiveTime != null){
//            widget?.onOverWatchLiveTime(true);
//          }
//          watchLiveTimer?.cancel();
//          Event.eventBus.fire(WatchLiveTimeEvent(isCloseLive: true));
//        }
//      }
//    });
//  }

  bool isShowLeagueBgColor() {
//    return !isStrNullOrEmpty(refinedBg) && !isStrNullOrEmpty(leagueColorStr);
    // 该功能暂时屏蔽掉,等产品确认后再放开
    return false;
  }

  void onMessage() {
    if (mounted) {
      setState(() {});
    }
    // 投注页显示聊天消息
    if (bloc != null && (bloc?.messages ?? []).isNotEmpty) {
      Event.eventBus.fire(LiveChatMessageEvent(bloc?.messages));
    }
    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) {
        bool onBottom = controller.position.maxScrollExtent - controller.position.pixels <= 70;
        widget.controller?.fireStateChange(bloc.state);
        if ((onBottom || canScroll2Bottom) /*&& widget.swiperController.index == 1*/) {
          if (widget.swiperController.index == 1) {
            widget.controller.readMsgCount = bloc?.messages?.length ?? 0;
            widget.controller.unreadMsgCount = 0;
          } else {
            int len = bloc?.messages?.length ?? 0;
            int limit = bloc.maxMsgTopLimit - bloc.maxMsgBottomLimit;
            if (len < (widget.controller.readMsgCount + widget.controller.unreadMsgCount)) {
              if (widget.controller.readMsgCount >= limit) {
                widget?.controller?.readMsgCount -= limit;
              } else if (widget.controller.readMsgCount > 0 && widget.controller.readMsgCount < limit) {
                widget?.controller?.readMsgCount = 0;
              } else {
                widget.controller.readMsgCount = 0;
              }
            }
            widget.controller.unreadMsgCount = (bloc?.messages?.length ?? 0) - (widget?.controller?.readMsgCount ?? 0);
            if (widget.controller.unreadMsgCount > bloc.maxMsgBottomLimit) {
              widget.controller.unreadMsgCount = bloc.maxMsgBottomLimit;
            }
          }
          Future.delayed(Duration(milliseconds: 100), () {
            scrollToBottom();
          });
        } else {
          widget.controller.unreadMsgCount = (bloc?.messages?.length ?? 0) - (widget?.controller?.readMsgCount ?? 0);
          if (controller.position.maxScrollExtent > 0) {
            showHasNewMsgBtn = true;
          }
        }
        setState(() {});
      }
    });
  }

  void anchorSwitchChangeListener(String anchorId) {
    if (mounted) {
      setState(() {
        showHasNewMsgBtn = false;
      });
    }
  }

  void showFollowBetMsgScrollToBottom() {
    canScroll2Bottom = true;
    scrollToBottom();
  }

  scrollToBottom() async {
    if (mounted && controller.position.maxScrollExtent != null) {
      int i = 0;
      do {
        i++;

        if (controller.hasClients) {
          await controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.bounceInOut).then((v) {
            //print("");
          });
          _scollBottomStream.add(true);
//          controller.jumpTo(controller.position.maxScrollExtent);
        }
        await sleep(20);
      } while (controller.position.maxScrollExtent > controller.position.pixels && i < 5);
      if (mounted && showHasNewMsgBtn) {
        showHasNewMsgBtn = false;
        setState(() {});
      }
    }
  }

  Future loadInitData() async {
    try {
      //await bloc.pullChatRoomMsg();
    } catch (e) {
      logError(e);
    }
  }

  /// 红包列表
//  void _loadRedBagList({String openedPacketId}) {
//    RedBagListNewProtocol(systemId: widget.systemId).request().then((rsp){
//      config.redPackets.clear();
//      if(rsp.isSuccess){
//        for(var item in rsp.redBags){
//          logDebug('红包id == ${item.packetId}');
//        }
//
//        if(openedPacketId != null) {
//          rsp.redBags.removeWhere((m)=>m.packetId==openedPacketId);
//        }
//        if(rsp.redBags.length != 0) config.redPackets.addAll(rsp.redBags);
//      }
//      print('chatroom-红包个数：${config.redPackets.length}');
//      if(mounted) setState(() { });
//    });
//  }

  @override
  void dispose() {
    // widget.chatRoomSliderBottom.dispose();
    // widget.chatRoomSliderTop.dispose();
    _scollBottomStream?.close();
    AnchorShareService.ins.removeShowPopListener(_onSharePopStateListener);
    _timer?.cancel();
//    watchLiveTimer?.cancel();
    _timer = null;
    _redPacketBarrageManager?.clearBarrageData();
    _redPacketController?.dispose();
    //redPacketTimer?.cancel();
    config.redPackets.clear();
    unsubcribeMessage();

    _unsubscribeRedBagMsg();
    widget.controller.removeAnchorSwitchChangeListener(anchorSwitchChangeListener);
    super.dispose();

    print(' --- ChatroomWidget-dispose --- ');
  }

  bool isCloseChatTitle = false;

  double uiMaxWidth;

//  Timer redPacketTimer;
//  int redPacketCountdown = 0;
//  StateSetter redPacketCountDownSetState;
//  var syncLock = Lock();
//  void redPacketCountDown() async {
//    if(config.redPackets.length == 0 || redPacketTimer != null) return;
//
//    await syncLock.synchronized((){
//      RedPacketModel model = config.redPackets.first;
//      if(model.startTime > model.systemTime) {
//        redPacketCountdown = (model.startTime - model.systemTime)~/1000;
//        //if(redPacketCountdown > 30) redPacketCountdown = 28;
//        assert(redPacketCountdown <= 30);
//        print('--- ChatroomWidget redPacketCountdown=$redPacketCountdown model.startTime=${model.startTime}, model.systemTime=${model.systemTime}, systemTime=${config.session.systemTime}');
//        redPacketTimer = Timer.periodic(Duration(seconds: 1), (timer){
//          config.syncRedPacketSystemTime(config.redPackets.first.systemTime + 1000);
//          print('detail chatroom redPack count down:$redPacketCountdown');
//          if(redPacketCountdown <= 1) {
//            redPacketCountdown = 0;
//            redPacketTimer?.cancel();
//            redPacketTimer = null;
//          }
//          else {
//            redPacketCountdown--;
//          }
//          if(mounted) redPacketCountDownSetState(() {});
//        });
//      }
//      else {
//        redPacketCountdown = 0;
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      return Container(
        color: Colors.transparent,
      );
    }
    //redPacketCountDown();

    print('000-BarrageData len=${_redPacketBarrageManager?.barrageDataLen}, redBags.lenght=${config.redPackets?.length}');
    if (uiMaxWidth == null) {
      uiMaxWidth = MediaQuery.of(context).size.width * 0.8;
    }

    Widget list = ListView.builder(
      padding: EdgeInsets.only(top: 10),
      physics: ClampingScrollPhysics(),
      controller: controller,
      itemCount: bloc?.messages?.length ?? 0,
      itemBuilder: (BuildContext itemContext, int index) {
        if (index == 0) {
          List<Widget> widgets = [];
          // widgets.add(ChatTopTitleBar());
          //widgets.add(InterValHelper.h(12));
          //@wilson 20200309 ： 修复第一条消息没有显示问题
          var message = bloc.messages[index];
          var msgWidget = ChatConversationWidgetFactory.create(message, uiMaxWidth, widget.anchorId);
          widgets.add(msgWidget);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgets,
          );
        } else if (index - 1 < bloc.messages.length) {
          //@wilson 20200309 ：修复最新一条消息没有显示问题
          var message = bloc.messages[index];
          var msgWidget = ChatConversationWidgetFactory.create(message, uiMaxWidth, widget.anchorId);
          return msgWidget;
        } else {
          return Container();
        }
      },
    );
    // return body;

    Widget body = Stack(
      children: <Widget>[
//        Positioned.fill(child: _buildSliderContainerArea()),
        Positioned.fill(
            child: StreamBuilder<bool>(
          initialData: (config.userInfo.isShowRefinedDetail || widget.isListDetail) ? true : false,
          stream: _scollBottomStream.stream,
          builder: (cxt, span) {
            return Opacity(
              opacity: span.data ? 1.0 : 0.0,
              child: list,
            );
          },
        )),

        Container(
          height: 90.0,
          decoration: BoxDecoration(gradient: LinearGradient(
            colors: getGradientColors(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Positioned(
          bottom: 10,
          left: (MediaQuery.of(context).size.width - 90) / 2,
          right: (MediaQuery.of(context).size.width - 90) / 2,
          child: showHasNewMsgBtn
              ? OpacityAnimationButton(
                  child: _newMsgBtn(),
                )
              : SizedBox(),
        ),
        StatefulBuilder(
          // 进入聊天室弹幕
          builder: (BuildContext context, setState) {
            return IgnorePointer(
              child: InputChatRoomBarrageWidget(
                isFreeAnchor: widget.isFreeAnchor,
              ),
            );
          },
        ),
        StatefulBuilder(
          // 抢红包结果弹幕
          builder: (BuildContext context, setState) {
            _redPacketBarrageSetState = setState;
            print('--StatefulBuilder--show=${!_redPacketBarrageManager.show}');
            return Offstage(
              offstage: !_redPacketBarrageManager.show,
              child: RedpacketBarrageView(
                redpacket: _redPacketBarrageManager.barrageData,
                controller: _redPacketController,
              ),
            );
          },
        ),
//        (config.redPackets.length > 0 && bloc.state == ChatroomState.Inited)  ? Positioned(
//          right: 4,
//          top: 20,
//          child: InkWell(
//            onTap: (){
//              showRedBagWindow(context, redPacket: config.redPackets.first, systemId: widget.systemId);
//            },
//            child: Stack(
//              overflow: Overflow.visible,
//              alignment: AlignmentDirectional.center,
//              children: <Widget>[
//                AiImage.asset('assets/images/detail/chatroom/redbag/new_redbag.gif', width: 60, scale: 1.5, fit: BoxFit.fitWidth),
//                Positioned( // 红包个数角标
//                  top: -4,
//                  right: 2,
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(7.5)),
//                    child: Container(
//                      height: 15,
//                      // alignment: Alignment.topRight,
//                      color: Theme.of(context).colorScheme.secondary,
//                      child: Text('  ${config.redPackets.length}  ',style: TextStyle(fontSize: 10, color: Color(0xFFFE3F47)),),
//                    ),
//                  ),
//                ),
//                StatefulBuilder(
//                  builder: (BuildContext context, setState) {
//                    redPacketCountDownSetState = setState;
//                    return Positioned(
//                      bottom: 7.5,
//                      child: Text(redPacketCountdown > 0 ? '$redPacketCountdown' : '领红包', textAlign: TextAlign.center, style: AiTextStyle(
//                        fontFamily: config.skin.fontFimaly.pingFang,
//                        fontWeight: config.skin.fontWeight.regular,
//                        fontSize: config.skin.fontSize.h6,
//                        color: config.skin.colors.fontColorWhite,
//                      ),)
//                    );
//                  }
//                ),
//              ],
//            ),
//          ),
//        ) : Container(),

        Positioned(
          top: 0,
          child: ChatroomConnectStatusView(model: statusModel),
        ),
      ],
    );

//    return ChatRoomGestureWidget(
//      body: body,
//    );

    return ChatRoomSliderMatchWidget(
      body: body,
      isListDetail: widget.isListDetail,
      horizontalDragCallBack: widget.horizontalDragCallBack,
    );

//    return ChatRoomSliderMatchWidget(
//      body: body,
//      isListDetail: widget.isListDetail,
//      horizontalDragCallBack: widget.horizontalDragCallBack,
//    );
  }

  List<Color> getGradientColors(){
    List<Color> gradientColors = [config.customStyle.refinedBgColor, config.customStyle.refinedBgColor.withOpacity(0.0)];
    // 显示配置的颜色
    if (isShowLeagueBgColor()) {
      gradientColors = [leagueColor, leagueColor.withOpacity(0.0)];
    }
    if(widget.isListDetail){
      return gradientColors;
    }
    if(widget.isFreeLiveGameAnchor){
      return [Color(0xFF19191E), Color(0xFF19191E).withOpacity(0.0)];
    }
    return [Color(0xFF0A2536), Color(0x000A2536).withOpacity(0.0)];
  }

  ///
  Widget _newMsgBtn() {
    return GestureDetector(
      onTap: _newMsgBtnOnTap,
      child: Container(
        height: 26,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Theme.of(context).colorScheme.secondary,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Text(
              config.langMap['baseLang']['detail']['chatroom']['recievedNewMsg'],
              style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontWeight: config.skin.fontWeight.regular,
                fontSize: config.skin.fontSize.h5,
                color: config.skin.colors.fontColorDark.withOpacity(0.85),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black.withOpacity(0.85),
              size: 25,
            ),
          ],
        ),
      ),
    );
  }

  ///
  void _newMsgBtnOnTap() {
    if (mounted) {
      setState(() {
        widget.controller.readMsgCount = bloc?.messages?.length ?? 0;
        widget.controller.unreadMsgCount = 0;
        showHasNewMsgBtn = false;
      });

      Future.delayed(Duration(milliseconds: 50), () async {
        int i = 0;
        do {
          i++;

          if (controller.hasClients) {
//            controller.jumpTo(controller.position.maxScrollExtent);
            await controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.bounceIn).then((v) {
              //print("");
            });
          }
          await sleep(20);
        } while (controller.position.maxScrollExtent > controller.position.pixels && i < 5);
        if (mounted && showHasNewMsgBtn) {
          showHasNewMsgBtn = false;
          setState(() {});
        }
      });
    }
  }

//  // 页面无法销毁：精选页进详情，在从主播页重复进入详情导致黑屏
//  @override
//  bool get wantKeepAlive => (widget?.controller?.chatRoomWantKeepAlive ?? true);
  @override
  bool get wantKeepAlive => true;
}
