import 'dart:async';
import 'package:fast_ai/api/protocols/chatroom/room_info_protocol.dart';
import 'package:fast_ai/api/protocols/detail/chat_see_video.dart';
import 'package:fast_ai/api/protocols/detail/record_watch_live_time_protocol.dart';
import 'package:fast_ai/api/protocols/detail/watch_live_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bet/live_bet_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/video_player/video_player.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';

class MoreFunctionBet extends StatefulWidget {
  NewHeadAnchorModel newHeadAnchorModel;
  ExtendModel extendModel;
  DetailSet detailSet;
  bool isShowLivePanel; // 播放器面板上是否显示投注提示
  bool isVlogLive; //小视频里面直播
  MatchesDetailModel matchesDetailModel;
  String gidm;
  String anchorId;
  final MatchDetailController swiperController;
  final BetStateController betStateController;
  final Orientation orientation;

  MoreFunctionBet(
      {Key key,
      this.anchorId,
      this.gidm,
      this.newHeadAnchorModel,
      this.extendModel,
      this.detailSet,
      this.isShowLivePanel = false,
      this.isVlogLive = false,
      this.matchesDetailModel,
      this.betStateController,
      this.orientation,
      this.swiperController})
      : super(key: key);

  @override
  _MoreFunctionBetState createState() => _MoreFunctionBetState();
}

class _MoreFunctionBetState extends State<MoreFunctionBet> {
  var baseLang = config.langMap['baseLang'];
  NewHeadAnchorModel get newHeadAnchorModel => widget.newHeadAnchorModel;
  DetailSet get detailSet => widget.detailSet;
  MatchesDetailModel get matchesDetailModel => widget.matchesDetailModel;
  String get gidm =>
      widget.gidm ?? widget?.matchesDetailModel?.data?.gidm ?? '';
  String get anchorId =>
      widget.anchorId ?? widget?.extendModel?.data?.anchorId ?? '';

  bool isShowBetPanel = false; // 投注额不满
  bool isShowBetHint = false; // 长时间没有投注
  StreamSubscription<BettingSuccessEvent> bettingSuccessEvent;
  StreamSubscription<DetailMoreChangeVideoEvent> changeVideoEvent;
  StreamSubscription<DetailSwiperChangeEvent> detailSwiperChangeEvent;
//  StreamSubscription<WatchLiveTimeEvent> watchLiveTimeEvent;
  String selectViewType = '';
  Timer timer;
  String videoBet = '';
  String betHint = '';
  String betHint2 = '';
  String betBtnText = '';
  String betBtnText1 = '';
  String betBtnText2 = '';
  String scoreName = '';
  String animationName = '';
  String videoName = '';
  List<Widget> listWidget = [];
  bool isAlreadySend = false;
  bool isAutoChangeVideo = false;
  Timer watchLiveTimer; // 长时间没有投注记录用户观看时间
  Timer reportTimer; // 上报用户观看视频时间60s上报一次
  bool isOverWatchLiveTime = false;
  int delayCheckSeconds = 0;
  StreamController<int>betStream;
  StreamSubscription<ChatRoomOpenStatus> chatRoomCloseStreamSubscription;

  ToolPanelController get toolPanel => widget?.betStateController?.toolPanel;
  CommonVideoPlayerController get videoPlayer => toolPanel?.videoPlayer;

  @override
  void initState() {
    selectViewType = widget?.detailSet?.selectViewType ?? '';
    config.userInfo.isAlreadyShowBetHint = false;
    videoBet = baseLang['arg']['videoBet'];
    betHint = baseLang['detail']['betHint'];
    betHint2 = baseLang['detail']['betHint2'];
    betBtnText1 = baseLang['detail']['chatGift']['goBet'];
    betBtnText2 = baseLang['detail']['chatGift']['know'];
    betBtnText = betBtnText1;
    scoreName = baseLang['detail']['scoreLive1'];
    animationName = baseLang['detail']['animationLive'];
    videoName = baseLang['detail']['videoLive'];
    betStream = StreamController.broadcast();
    bindEvent();
    // delayCheckStatus();
    listWidget = betBtnListWidget();
    if (widget.isVlogLive) {
      Future.delayed(Duration(seconds: 3), () {
//        loadData(onFinish:delayCheckStatus);
        seeVideo(onFinish: delayCheckStatus);
      });
    } else {
//      loadData(onFinish:delayCheckStatus);
      // 获取投注总额调用聊天室接口chat/intoRoom导致重复进入聊天室有可能发送消息失败，现改为发通知
//      chatRoomCloseStreamSubscription =Event.eventBus.on<ChatRoomOpenStatus>().listen((event) {
//        // 满足投注额在查看是否长时间没有投注
//        String viewType = detailSet?.selectViewType ?? '';
//        if (viewType == SelectViewTypeVideo) {
//          recordWatchLive(onFinish: delayCheckStatus);
//        }
//      });
      // 满足观看视频用新的接口
      seeVideo(onFinish: delayCheckStatus);
    }
    super.initState();
  }

  @override
  void dispose() {
    betStream?.close();
    chatRoomCloseStreamSubscription?.cancel();
    config.userInfo.isAlreadyShowBetHint = false;
    stopTimer();
    unbindEvent();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 比分,动画不显示
    if (selectViewType != SelectViewTypeVideo || !isShowBetPanel) {
      config.userInfo.isAlreadyShowBetHint = false;
      // 长时间未投注停止观看视频提示
      if (isShowBetHint) {
        return betHintWidget();
      }
      return Container();
    }
    // 投注额不够
    num betTotal = config?.userInfo?.videoBettingTotal ?? 0;
    num currentBet = config?.userInfo?.videoCurrAllBetGold ?? 0;
    if (betTotal <= currentBet) {
      return Container();
    }
    config.userInfo.isAlreadyShowBetHint = true;
    num money = betTotal - currentBet;
    String text = videoBet.replaceAll('{arg}', '$money');
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: videoBetWidget(text, listWidget));
  }

  List<Widget> betBtnListWidget() {
    var anchorViews = <Widget>[];
    List<Map> typeArr = getMatchData();
    typeArr.forEach((item) {
      String icon = item['icon'];
      String type = item['type'];
      String name = item['name'];
      //动画，比分直播
      if (type != 'video') {
        bool isSelectItem = false;
        if (widget.detailSet.selectViewType == type &&
            type == SelectViewTypeScore) {
          icon = 'icon_detail_more_score_selected.svg';
          isSelectItem = true;
        } else if (widget.detailSet.selectViewType == type &&
            type == SelectViewTypeAnimation) {
          icon = 'icon_detail_more_animation_selected.svg';
          isSelectItem = true;
        }
        anchorViews.add(createButton(
            type: type, icon: icon, name: name, isSelectItem: isSelectItem));
      }
    });
    if (anchorViews.length >= 1) {
      anchorViews.insert(1, w(8));
    }
    return anchorViews;
  }

  Widget videoBetWidget(String text, List<Widget> anchorViews) {
    return Container(
      color: Color(0xFF071C29).withOpacity(0.9),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              betHint,
              textAlign: TextAlign.center,
              style: betTitleStyle()
                  .copyWith(color: Colors.white.withOpacity(0.4)),
            ),
          ),
          h(5.0),
          Container(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: betTitleStyle().copyWith(fontSize: 12),
            ),
          ),

          h(15.0),
          Show(isShow: !widget.isVlogLive, child: goBetWidget())
          // h(15.0),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: anchorViews,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget goBetWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(widget.orientation == Orientation.landscape){
          widget?.betStateController?.show();
          toolPanel?.hide();
        }
        else{
          if (widget?.swiperController != null) {
            if (widget?.swiperController?.index != 0) {
              betStream.add(0);
              widget?.swiperController?.move(0);
            } else {
              betStream.add(1);
              widget?.swiperController?.move(1);
            }
          }
        }
      },
      child: StreamBuilder(
          stream: betStream.stream,
          initialData: widget?.swiperController?.index ?? 0,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            int index  = snapshot.data ?? 0;
            return Container(
              height: 26.0,
              width: 70.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                border: Border.all(color: config.customStyle.themeColor, width: 1),
                color: config.customStyle.themeColor,
              ),
              child: Text(
                getGobetBtnText(index),
                style: titleStyle().copyWith(color: Colors.black),
              ),
            );
      }),
//      child: StatefulBuilder(
//          builder: (BuildContext context, StateSetter stateSetter) {
//        return Container(
//          height: 26.0,
//          width: 70.0,
//          alignment: Alignment.center,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(13.0),
//            border: Border.all(color: config.customStyle.themeColor, width: 1),
//            color: config.customStyle.themeColor,
//          ),
//          child: Text(
//            getGobetBtnText(),
//            style: titleStyle().copyWith(color: Colors.black),
//          ),
//        );
//      }),
    );
  }

  Widget betHintWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        color: Color(0xFF071C29).withOpacity(0.9),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                betHint,
                textAlign: TextAlign.center,
                style: betTitleStyle()
                    .copyWith(color: Colors.white.withOpacity(0.4)),
              ),
            ),
            h(5.0),
            Container(
              child: Text(
                betHint2,
                textAlign: TextAlign.center,
                style: betTitleStyle().copyWith(fontSize: 12),
              ),
            ),
            h(15.0),
            Show(isShow: !widget.isVlogLive, child: goBetWidget())
          ],
        ),
      ),
    );
  }

  void setDefaultPannel() {
    bool hasAnimateLive = widget?.newHeadAnchorModel?.hasAnimateLive ?? false;
    selectViewType =
        hasAnimateLive ? SelectViewTypeAnimation : SelectViewTypeScore;
    MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
    widget.detailSet.selectViewType = selectViewType;
    widget.detailSet.isChangeViewType = true;
    matchViewChooseModel.gidm = toolPanel.topBar.model.gidm;
    matchViewChooseModel.extendModel = widget.extendModel;
    matchViewChooseModel.selectItem = selectViewType;
    if (widget.detailSet.selectViewType == SelectViewTypeVideo) {
      videoPlayer?.dispose();
    }
    toolPanel.anchorSelectorFull.model.currentAnchor = null;
    VideoType videoType = VideoType.Score;
    if (hasAnimateLive) {
      videoType = VideoType.Animation;
    }
    Event.eventBus.fire(DetailMoreChangeVideoEvent(videoType: videoType));
    Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
    Event.eventBus.fire(ChatRoomChooseEvent(null));
    Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));
    isShowBetHint = false;
    if (mounted) setState(() {});
  }

  void setDefaultVideo() {
    if (detailSet.selectViewType == SelectViewTypeVideo) {
      Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
      isShowBetHint = false;
      config.userInfo.watchLiveTime = -1;
      if (mounted) setState(() {});
      return;
    }
  }

  List<Map<String, dynamic>> getMatchData() {
    bool hasAnimateLive = widget?.newHeadAnchorModel?.hasAnimateLive ?? false;
    List<Map<String, dynamic>> list = [
      {
        'type': SelectViewTypeVideo,
        'icon': 'icon_detail_more_video.svg',
        'name': videoName
      },
    ];
    if (hasAnimateLive) {
      list.add({
        'type': SelectViewTypeAnimation,
        'icon': 'icon_detail_more_animation.svg',
        'name': animationName
      });
    }
    list.add({
      'type': SelectViewTypeScore,
      'icon': 'icon_detail_more_score.svg',
      'name': scoreName
    });
    return list;
  }

  Widget createButton(
      {String type,
      String icon,
      String name,
      LiveVideoInfo liveVideoInfo,
      bool isSelectItem = false}) {
    return GestureDetector(
      onTap: () {
        MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
        selectViewType = type;
        widget.detailSet.selectViewType = type;
        widget.detailSet.isChangeViewType = true;
        matchViewChooseModel.gidm = toolPanel.topBar.model.gidm;
        matchViewChooseModel.extendModel = widget.extendModel;
        matchViewChooseModel.selectItem = type;
        if (type == "video") {
          toolPanel.anchorSelectorFull.model.currentAnchor = liveVideoInfo;
          toolPanel?.anchorSelectorFull?.model?.currentAnchor?.isSelectAnchorLive = false;
          Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
          toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
        } else {
          if (widget.detailSet.selectViewType == SelectViewTypeVideo) {
            videoPlayer?.dispose();
          }
          toolPanel.anchorSelectorFull.model.currentAnchor = null;
        }
        VideoType videoType = VideoType.Score;
        if (type == SelectViewTypeVideo) {
          videoType = VideoType.Video;
        } else if (type == SelectViewTypeAnimation) {
          videoType = VideoType.Animation;
        }
        Event.eventBus.fire(DetailMoreChangeVideoEvent(videoType: videoType));
        Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
        Event.eventBus.fire(ChatRoomChooseEvent(null));
        Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));
        listWidget.clear();
        listWidget = betBtnListWidget();
//        isShowLive = false;
        if (mounted) setState(() {});
      },
      child: menuItem(name, icon,
          isSelectCurrentAnchor: false, isSelectItem: isSelectItem),
    );
  }

  Widget menuItem(String text, String image,
      {bool isSelectCurrentAnchor = false, bool isSelectItem = false}) {
    return Container(
      width: 72.0,
      height: 26.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          border: Border.all(color: Colors.white.withOpacity(0.4))),
      alignment: Alignment.center,
      child: Text(
        text,
        style: titleStyle(),
      ),
    );
  }

  //默认6分钟观看
  void delayCheckStatus() {
    int seconds= config.userInfo.watchLiveTime;
    if (delayCheckSeconds < seconds) {
      timer?.cancel();
      timer = null;
      timer = Timer(Duration(seconds: seconds), () {
        delayCheckSeconds += seconds;
        refreshBetStatus();
      });
    } else {
      refreshBetStatus();
    }
  }

  void bindEvent() {
    bettingSuccessEvent =
        Event.eventBus.on<BettingSuccessEvent>().listen(bettingSuccessListen);
    changeVideoEvent =
        Event.eventBus.on<DetailMoreChangeVideoEvent>().listen(changeVideo);
    detailSwiperChangeEvent = Event.eventBus.on<DetailSwiperChangeEvent>().listen(swiperListener);
//    watchLiveTimeEvent = Event.eventBus.on<WatchLiveTimeEvent>().listen(watchLiveTime);
  }

  void unbindEvent() {
    bettingSuccessEvent?.cancel();
    changeVideoEvent?.cancel();
    detailSwiperChangeEvent?.cancel();
//    watchLiveTimeEvent?.cancel();
    //widget?.playerController?.videoPlayer?.playStateChanged?.removeListener(listenerVideoState);
  }

  void listenerVideoState(e) {
    if (e is AiVideoState) {
      if (e == AiVideoState.started) {
        if (isShowBetHint || isShowBetPanel) {
          Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        }
      }
      if(e == AiVideoState.error){
        isShowBetHint = false;
        isShowBetPanel = false;
        if(mounted)setState(() {});
      }
    }
  }

  String getGobetBtnText(int index) {
    String text = betBtnText;
    if(widget.orientation == Orientation.landscape){
      text = betBtnText1;
    }
    else{
      if (widget?.swiperController != null) {
        text = index == 0 ? betBtnText2 : betBtnText1;
      }
    }
    return text;
  }

  void bettingSuccessListen(e) {
    num betTotal = config?.userInfo?.videoBettingTotal;
    num currentBet = config?.userInfo?.videoCurrAllBetGold;
    int watchLiveTime = config?.userInfo?.watchLiveTime;
    // 投注额不够用户
    if (betTotal > 0) {
      isShowBetHint = false;
      isShowBetPanel = betTotal > currentBet;
      if (isShowBetPanel) {
        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
      } else {
        Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
      }
      if (mounted) setState(() {});
    } else {
      // 长时间没有投注用户
      if (betTotal <= 0 && currentBet > 0 && watchLiveTime >= 0) {
        setDefaultVideo();
      }
    }
  }

  void changeVideo(e) {
    if (e is DetailMoreChangeVideoEvent) {
      if (e.videoType == VideoType.Video) {
        selectViewType = SelectViewTypeVideo;
      } else if (e.videoType == VideoType.Animation) {
        selectViewType = SelectViewTypeAnimation;
      } else if (e.videoType == VideoType.Score) {
        selectViewType = SelectViewTypeScore;
      }
      if (e.videoType != VideoType.Video) {
        if (isShowBetHint) {
          isShowBetHint = false;
          if (mounted) setState(() {});
        }
        if (isShowBetPanel) {
          isShowBetPanel = false;
          if (mounted) setState(() {});
        }
        return;
      }
      num betTotal = config?.userInfo?.videoBettingTotal;
      if (betTotal <= 0) {
        if (config.userInfo.watchLiveTime >= 0) {
          Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
          if (isAutoChangeVideo) {
            isAutoChangeVideo = false;
            return;
          }
          isShowBetHint = true;
        }
      } else {
        isShowBetPanel = false;
        //切换视频源不需要重新计时
        delayCheckStatus();
      }
      if (mounted) setState(() {});
    }
  }

  void swiperListener(e){
    if(e is DetailSwiperChangeEvent){
      if(widget?.swiperController != null){
        int index = e?.index ?? 0;
        betStream.add(index);
      }
    }
  }

  void stopWatchLiveTime() {
    // 视频播放添加监听需要延时
    Future.delayed(Duration(seconds: 2), () {
      addPlayListener();
    }).then((value){
      if(videoPlayer.player.isError){
        isShowBetHint = false;
        if (mounted) setState(() {});
        return;
      }
      isShowBetHint = true;
      Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
      if (mounted) setState(() {});
    });
  }

  void refreshBetStatus() {
    String viewType = widget.detailSet.selectViewType ?? '';
    num betTotal = config?.userInfo?.videoBettingTotal;
    num currentBet = config?.userInfo?.videoCurrAllBetGold;
    if (betTotal > currentBet && viewType == SelectViewTypeVideo) {
      Future.delayed(Duration(seconds: 2),(){
        addPlayListener();
      }).then((value){
        if(videoPlayer.player.isError){
          isShowBetPanel = false;
          if (mounted) setState(() {});
          return;
        }
        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        isShowBetPanel = true;
        if (mounted) setState(() {});
      });
    }
  }

  StreamSubscription<AiVideoState> _videoStateSubscription;
  void addPlayListener(){
    if(_videoStateSubscription != null) {
      _videoStateSubscription.cancel();
      _videoStateSubscription = videoPlayer.player.onVideoState.listen(listenerVideoState);
    }
  }

  void loadData({VoidCallback onFinish}) {
    String systemId = matchesDetailModel.data.systemId ?? '';
    RoomInfoReqProtocol(systemId: systemId, gidm: gidm, anchorId: anchorId)
        .request()
        .then((value) {
      if (value.isSuccess) {
        RoomInfoRspProtocol result = value;
        num bettingTotal = result?.bettingTotal ?? 0;
        num currentBetGold = config?.userInfo?.videoCurrAllBetGold ?? 0;
        if (bettingTotal > currentBetGold) {
          bettingTotal = bettingTotal - currentBetGold;
        }
        // 满足投注额在查看是否长时间没有投注
        String viewType = detailSet?.selectViewType ?? '';
        // if (bettingTotal <= 0 && viewType == SelectViewTypeVideo) {
        if (viewType == SelectViewTypeVideo) {
          recordWatchLive(onFinish: onFinish);
        }
      }
    });
  }

  void seeVideo({VoidCallback onFinish}){
    ChatSeeVideoReqProtocol req = ChatSeeVideoReqProtocol();
    req.request().then((value){
      // 满足投注额在查看是否长时间没有投注
      String viewType = detailSet?.selectViewType ?? '';
      if (viewType == SelectViewTypeVideo) {
        recordWatchLive(onFinish: onFinish);
      }
    });
  }

  void recordWatchLive({VoidCallback onFinish}) {
    // 获取观看视频时长
    WatchLiveReqProtocol req = WatchLiveReqProtocol();
    req.request().then((value) {
      if (value.isSuccess) {
        watchLiveTimer?.cancel();
        watchLiveTimer = null;
        onFinish();
        if (config.userInfo.watchLiveTime > 0) {
          // 上报用户观看视频时间
          startUploadReport();
          watchLiveTimer =
              Timer(Duration(seconds: config.userInfo.watchLiveTime), () {
            num betTotal = config?.userInfo?.videoBettingTotal;
            num currentBet = config?.userInfo?.videoCurrAllBetGold;
            // 用户满足投注额且投注过可以观看视频
            if (betTotal <= 0 && currentBet > 0) {
              stopTimer();
              return;
            }
            isOverWatchLiveTime = true;
            // 关闭视频
            stopTimer();
//          Event.eventBus.fire(WatchLiveTimeEvent(isCloseLive: true));
            stopWatchLiveTime();
          });
        } else {
          // 观看视频时间为0
          if (config.userInfo.watchLiveTime == 0) {
            isOverWatchLiveTime = true;
            stopTimer();
//          Event.eventBus.fire(WatchLiveTimeEvent(isCloseLive: true));
            stopWatchLiveTime();
          }
        }
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    watchLiveTimer?.cancel();
    reportTimer?.cancel();
    reportTimer = null;
    watchLiveTimer = null;
    timer = null;
  }

  void startUploadReport() {
    reportTimer?.cancel();
    reportTimer = null;
    int time = config.fiexd.earlyMatchUpdateTime;
    reportTimer = Timer.periodic(Duration(seconds: time), (timer) {
      watchLiveTimeReport(time);
    });
  }

  //观看视频时间上报(包含提前开播)
  void watchLiveTimeReport(int watchLiveTime) {
    // String showType = this.matchesDetailModel?.data?.showtype ?? '';
    // String gameType = this.matchesDetailModel?.data?.gameType ?? '';
    //投注额不够不用上报时间(会停止视频的播放)
    num betTotal = config?.userInfo?.videoBettingTotal;
    num currentBet = config?.userInfo?.videoCurrAllBetGold;
    if ((betTotal <= 0 && currentBet > 0) ||
        config.userInfo.isAlreadyShowBetHint ||
        config.userInfo.isBetMoneyApiError ||
        config.userInfo.watchLiveTime <= 0 ||
        isOverWatchLiveTime) {
      return;
    }
    if (detailSet.selectViewType == SelectViewTypeVideo) {
      int second = watchLiveTime;
      // 60s上报一次
      sendWatchLiveTimeQuest(second);
    }
  }

  void sendWatchLiveTimeQuest(int second) {
    if (second == null || second == 0) return;
    RecordWatchLiveTimeReqProtocol req = RecordWatchLiveTimeReqProtocol();
    req.second = second;
    req.request();
  }

  TextStyle betTitleStyle() {
    return AiTextStyle(
      color: Colors.white.withOpacity(0.8),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Colors.white.withOpacity(0.4),
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }
}
