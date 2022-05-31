import 'dart:async';
import 'dart:math';
import 'package:fast_ai/api/protocols/aigames/ai_gamelist_protocol.dart';
import 'package:fast_ai/api/protocols/detail/live_room_info_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/active_banner/active_banner.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom_game/chatroom_game_page.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/game/live_game.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/refined_match.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/pinwheel/pinwheel_helper.dart';
import 'package:fast_ai/widgets/pinwheel/pinwheel_widget.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterswiper/flutter_swiper.dart';

class ChatRoomBanner extends StatefulWidget {

  final String gidm;
  final String roomNo;
  final String systemId;
  final bool isListDetail;
  final String anchorId;
  final String matchAnchorId;
  final bool isFreeAnchor;
  final GlobalKey<ActiveBannerState> activeBannerKey;
  final MatchDetailController swiperController;
  final DetailSet detailSet;
  ChatRoomBanner({
    Key key,
    @required this.isListDetail,
    @required this.anchorId,
    @required this.matchAnchorId,
    @required this.gidm,
    @required this.roomNo,
    @required this.systemId,
    @required this.activeBannerKey,
    @required this.swiperController,
    @required this.isFreeAnchor,
    this.detailSet,
  }) : super(key: key);

  @override
  _ChatRoomBannerState createState() => _ChatRoomBannerState();
}

class _ChatRoomBannerState extends State<ChatRoomBanner> {

  List<AiGameCellModel> models = [];
  DetailSet detailSet = config.userInfo.detailSet;
  SwiperController swiperController = SwiperController();
  bool isActiveBannerNoEmpty = true;
  double itemW = 42.0;
  double itemH = 42.0;
  List<Widget> indicatorList = [];
  int selectIndex = 0;
  bool isAutoPlay = false;
  bool isAlreadySendRequest = false;
  bool isPinwheelOpen = false;
  Timer showTimer;
  bool isHideWheel = false;
  Offset pinwheelOffset = Offset.zero;
  bool get isFreeLiveGameAnchor => widget.detailSet?.detailParams?.isFreeLiveGameAnchor ?? false; // 游戏自由播
  bool isAlreadyClick = false;

  @override
  void initState() {
    loadData(callBack: () {
      num liveStatus = widget.detailSet?.detailParams?.liveStatus;
      bool isFreeAnchorNoStart = liveStatus != null && liveStatus == 0;
      if(widget.detailSet?.detailParams?.freeLiveRoomInfo == null && !isFreeAnchorNoStart){
        checkLiveRoomInfo();
      }
      else{
        startShowWheel();
      }
    });
    PinwheelHelper.pinwheelStatusListener?.addListener(pinwheelStatusListen);
    super.initState();
  }

  @override
  void dispose() {
    PinwheelHelper.pinwheelStatusListener?.removeListener(pinwheelStatusListen);
    PinwheelHelper?.hide();
    showTimer?.cancel();
    super.dispose();
  }

  void checkLiveRoomInfo() async{
    String liveId = detailSet.detailParams?.liveId ?? '';
    var result = await LiveRoomInfoReqProtocol(liveId: liveId).request();
    if(result.isSuccess && detailSet.detailParams.freeLiveRoomInfo == null){
      String liveType = result?.liveRoomInfo?.liveType ?? '';
      detailSet.detailParams.freeLiveRoomInfo = result.liveRoomInfo;
      detailSet.detailParams.isFreeLiveGameAnchor = (liveType == config.freeAnchorGame);
      startShowWheel();
    }
    else{
      startShowWheel();
    }
  }

  void startShowWheel() {
    if(isFreeLiveGameAnchor){
      Future.delayed(Duration(seconds: 1),(){
        if(config.quickTap) {
          config.quickTap = false;
          return;
        }

        showWheel();
        showTimer?.cancel();
        showTimer = Timer(Duration(seconds: 5), (){
          showTimer?.cancel();
          hieWheel();
        });
      });
    }
  }

  ///
  void pinwheelStatusListen(value){
    if(value == PinwheelStatus.open){
      isPinwheelOpen = true;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if(mounted){
          setState(() {});
        }
      });
    } else if(value == PinwheelStatus.close){
      isPinwheelOpen = false;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if(mounted){
          setState(() {});
        }
      });
    }
  }

  // 龙虎榜小游戏测试
  Future<void> loadData({VoidCallback callBack}) async {
    if(!ModuleSwitch.getInstance().game()) return;
    AiGameListNewReqProtocol().request().then((req){
      if (req.isSuccess) {
        models = req.models;
        if(models.length > 7) models = models.sublist(0, 7);
        config.userInfo.gameModels.clear();
        config.userInfo.gameModels.addAll(models);
        callBack?.call();
        isAutoPlay =  models.length > 1;
          if (mounted) {
            setState(() {});
          }
      } else {
        throw req.msg;
      }
    });


  }

  bool get isShowGame{
    return (ModuleSwitch.getInstance().game() && models.isNotEmpty);
  }

  bool get isShowRankIcon {
    bool isA = ModuleSwitch.getInstance().userContributionRank();
    bool isB = detailSet.selectViewType == SelectViewTypeVideo;
    bool isC = !isStrNullOrEmpty(widget.matchAnchorId);
    bool isD = widget.matchAnchorId == widget.anchorId;
    bool isE = !(widget.isListDetail ?? false);

    if(widget.isFreeAnchor){
      return isA && isB && isE;
    }
    return isA && isB && isC && isD && isE;
  }

  GlobalKey pinwheelKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    indicatorWidget();

    return Container(
      child: isPinwheelOpen ? SizedBox() : Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Show(
              isShow: isShowGame,
              child: GestureDetector(
                key: pinwheelKey,
                behavior: HitTestBehavior.opaque,
                onTap:(){
                  int curTime = DateTime.now().millisecondsSinceEpoch;
                  if(curTime - time1 < 1000) {
                    return;
                  }
                  time1 = curTime;
                  isHideWheel = true;
                  showWheel();
                },
                child: Container(
                  width: itemW,
                  height: itemH,
                  child: AiImage.asset(
                      'assets/images/detail/chatroom/gif_details_live_game.gif',
                      scale: 1.0,width: 42,height:42),
                ),
              )
          ),
//          if (MediaQuery.of(context).orientation == Orientation.portrait && ModuleSwitch.getInstance().floatingWindow())
//          Offstage(
//              offstage: (detailSet.showLoading || widget.isListDetail || RefinedMatch.isFinishGame || !isActiveBannerNoEmpty),
//              child: Column(
//                children: [
//                  Container(
//                    width: itemW,
//                    height: itemH,
//                    child: ActiveBanner(
//                      key: widget.activeBannerKey,
//                      isPortraitBanner: true,
//                      onActiveBannerIsEmpty: (bool isDataEmpty){
//                        isActiveBannerNoEmpty = isDataEmpty;
//                        if(mounted){setState(() {});}
//                      },
//                    ),
//                  ),
//                  sh(50.0),
//                ],
//              )
//          ),
//          Offstage(
//            offstage: !isShowRankIcon,
//            child: Column(
//              children: [
//                InkWell(
//                  splashColor: Colors.transparent,
//                  highlightColor: Colors.transparent,
//                  onTap: () {
//                    showContribution();
//                  },
//                  child: SizedBox(
//                    width: itemW,
//                    height: itemH,
//                    child: AiImage.asset(
//                        rankIcon,
//                        fit: BoxFit.contain, width: itemW, height: itemH, scale: 1.0),
//                  ),
//                ),
//                sh(16.0)
//              ],
//            ),
//          ),
//          Offstage(
//            offstage: !isShowRankIcon,
//            child: Column(
//              children: [
//                InkWell(
//                  splashColor: Colors.transparent,
//                  highlightColor: Colors.transparent,
//                  onTap: () {
//                    showContribution();
//                  },
//                  child: SizedBox(
//                    width: itemW,
//                    height: itemH,
//                    child: AiImage.asset(
//                        rankIcon,
//                        fit: BoxFit.contain, width: itemW, height: itemH, scale: 1.0),
//                  ),
//                ),
//                sh(16.0)
//              ],
//            ),
//          ),
//          Show(
//            isShow: isShowGame,
//            child: Column(
//              children: [
//                if(models.isNotEmpty)
//                  SizedBox(
//                    width: itemW,
//                    height: itemH,
//                    child: Swiper(
//                      onIndexChanged: onCurrentSelectIndex,
//                      controller: swiperController,
//                      scrollDirection: Axis.horizontal,
//                      containerWidth: itemW,
//                      itemWidth: itemW,
//                      autoplay: isAutoPlay,
//                      autoplayDelay: 5000,
//                      index: selectIndex,
//                      itemCount: models.length,
//                      itemBuilder: (BuildContext ctx, int index){
//                        if(index >= models.length) return Container();
//                        AiGameCellModel cellModel = models[index];
//                        String icon = cellModel?.icon ?? cellModel?.img ?? '';
//                        return GestureDetector(
//                          behavior: HitTestBehavior.opaque,
//                          child: Container(
//                            width: itemW,
//                            height: itemH,
//                            child: AiImage.fromUrl(icon, errorUrl,BoxFit.cover),
//                          ),
//                          onTap: (){
//                            cellModel.url = '';
//                            Event.eventBus.fire(OpenGameEvent());
//                            Future.delayed(Duration(milliseconds: 100),(){
//                              showGame(index);
//                            });
//                          },
//                        );
//                      },
//                    ),
//                  ),
//                Offstage(
//                  offstage: (models.length <= 1),
//                  child: Container(
//                    width: itemW,
//                    height: 12.0,
//                    margin: EdgeInsets.only(top: 5.0),
//                    alignment: Alignment.center,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: indicatorList,
//                    ),
//                  ),
//                ),
//                sh(16.0)
//              ],
//            )
//          )
        ],
      ),
    );
  }

  int time = 0;
  int time1 = 0;
  void showWheel() {
    if(!isShowGame) return;
    RenderBox renderBox = pinwheelKey?.currentContext?.findRenderObject();
    Offset offset = renderBox?.localToGlobal(Offset.zero);
    pinwheelOffset = offset;
    PinwheelHelper?.show(
      context,
      anchorCenterX: offset.dx + 21,
      anchorCenterY: offset.dy + 21,
      child: PinwheelWidget(
          builder: ({BuildContext context, int index, double itemWidth}){
            if(index >= models.length) return SizedBox.shrink();
            AiGameCellModel gameModel = models[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                 int curTime = DateTime.now().millisecondsSinceEpoch;
                 if(curTime - time < 500) {
                   return;
                 }
                 time = curTime;
                Event.eventBus.fire(ShowGameEvent(isShowGame: true));
                isHideWheel = true;
                PinwheelHelper?.hide();
                openGamePan(gameModel);
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Color(0x3FFFFFF),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  child: AiImage.fromUrl(gameModel.icon ?? '', '', BoxFit.cover, 40.0,  40.0),
                ),
              ),
            );
          },
          itemCount: min(models.length,7),
          controller: PinwheelController(initStatus: PinwheelStatus.open),
          isShowBlurBg: true,
          animationMode: min(models.length,7) > 4 ? AnimationMode.mainScaleItemCircleRotation : AnimationMode.mainScaleItemBreathingLight,
      ),
    );
  }

  void hieWheel() {
    isAlreadyClick = false;
    if(isHideWheel) return;
    PinwheelHelper?.hide();
  }

  void openGamePan(AiGameCellModel gameModel) {
    isAlreadyClick = false;
    Offset offset = Offset(pinwheelOffset.dx + 21.0, pinwheelOffset.dy + 21.0);
    Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: gameModel));
//    LiveGame.openGamePan(
//        context: context,
//        supplierId: gameModel.supplierId,
//        gameKey: gameModel.gameKey,
//        roomNo: widget.roomNo,
//        anchorId: widget.anchorId,
//        callBack: (isSuccess){
//          Event.eventBus.fire(ShowGameEvent(isShowGame: false));
//        }
//    );

  }

  /// 贡献榜
  void showContribution() {
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsChatRoomList);
    PopupShareService.ins.pause('_showContribution');
    showModalBottomSheetRoute(context,
        child: AnchorContribution(
          isFreeLiveGameAnchor: isFreeLiveGameAnchor,
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

  /// 龙虎榜
  bool isEnableClick = true;
  void showGame(int index) async{
    if(index > models.length || models.isEmpty) return;
    config.userInfo.isClickGameFloat = true;
    AiGameCellModel cellModel = models[index];
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]
    );
    //640 * 960适配(w*h)
    double screenW = MediaQuery.of(context).size.width;
    double height = 960.0 * screenW / 640.0;
    PopupShareService.ins.pause('_showGame');
    showModalBottomSheetRoute(context,
        enableDrag: false,
        height: height + 40,
        child: ChatroomGamePage(
          anchorId: widget.anchorId,
          roomNo: widget.roomNo,
          games: models,
          selectGameKey: cellModel.gameKey,
        ),
        barrierColor: Colors.transparent)
        .then((v) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      PopupShareService.ins.resume('_showGame');
    });

////    String url = 'http://dev.m.yc365d.com/ai/mobile/game/url?supplierId=aigame&gameKey=LHD';
//    if(isStrNullOrEmpty(cellModel?.supplierId) || isStrNullOrEmpty(cellModel?.gameKey)) return;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChatRoomGame);
//    String url = cellModel?.url;
//    if(isAlreadySendRequest){
//      return;
//    }
//    isAlreadySendRequest = true;
//    if(isStrNullOrEmpty(url)){
//      final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
//      loading.show(context);
//      var result = await AiGameURlRequestProtocol(supplierId: cellModel.supplierId, gameKey: cellModel.gameKey).request();
//      loading.dismiss();
//      await sleep(500);
//      url = result.url;
//      if(result.isError){
//        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//        isAlreadySendRequest = false;
//        return;
//      }
//    }
//    String screen = cellModel.screen;
//    if(isStrNullOrEmpty(cellModel?.screen)){
//      screen = '1';
//    }
//    config.userInfo.isClickGameFloat = true;
//    // 统计用
//    url = '$url&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
//    print('游戏url----:$url');
//    if(screen == '1'){
//      showMaterialPageRoute(
//          context,
//          NewUserCoursePage(
//            url: url,
//            title: '${cellModel.gameName}',
//          ));
//      return;
//    }
//    Future.delayed(Duration(seconds: 1),(){
//      isAlreadySendRequest = false;
//    });
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp]
//    );
//    //640 * 960适配(w*h)
//    double screenW = MediaQuery.of(context).size.width;
//    double height = 960.0 * screenW / 640.0;
//    PopupShareService.ins.pause('_showGame');
//    showModalBottomSheetRoute(context,
//        enableDrag: false,
//        height: height + 50,
//        child: NewUserCoursePage(
//            isJointLang: false,
//            url: url,
//            title: '${cellModel.gameName}',
//        ),
//        barrierColor: Colors.transparent)
//        .then((v) {
//      SystemChrome.setPreferredOrientations([
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//        DeviceOrientation.landscapeLeft,
//        DeviceOrientation.landscapeRight,
//      ]);
//      PopupShareService.ins.resume('_showGame');
//    });
  }

  void onCurrentSelectIndex(int index) {
    selectIndex = index;
    if (mounted) {
      setState(() {});
    }
  }

  void indicatorWidget (){
    indicatorList.clear();
    double margin = models.length >= 5 ? 1.0 : 2.0;
    for (int index = 0; index < models.length; index++) {
      indicatorList.add(Container(
        width: 4.0,
        height: 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: index == selectIndex ? Colors.white.withOpacity(0.7) : Colors.white.withOpacity(0.2),
        ),
        margin: EdgeInsets.only(left: margin, right: margin),
      ));
    }
  }
}

