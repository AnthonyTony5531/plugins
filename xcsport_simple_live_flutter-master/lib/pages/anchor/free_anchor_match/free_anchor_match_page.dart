import 'dart:async';

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_refresh_grid_view.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_single/aibanner_single_model.dart';
import 'package:fast_ai/pages/anchor/empty_view.dart';
import 'package:fast_ai/pages/anchor/free_anchor_head.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor/free_anchor_item_view.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor/free_anchor_item_view_model.dart';
import 'package:fast_ai/pages/anchor/free_live_player/free_live_player_view.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'free_anchor_match_page_style.dart';
import 'free_anchor_match_page_view_model.dart';

///
/// {notes}
///
class FreeAnchorMatchPage extends StatefulView<FreeAnchorMatchPageStyle, FreeAnchorMatchPageViewModel> {
  final FreeAnchorMatchPageViewModel model;
  final FreeAnchorPosition freeAnchorPosition;
  final DetailSet detailSet;
  FreeAnchorMatchPage({Key key,  this.model, this.freeAnchorPosition = FreeAnchorPosition.none, this.detailSet}) : super(model: model, key: key);

  @override
  _FreeAnchorMatchPageState createState() => _FreeAnchorMatchPageState();
}

class _FreeAnchorMatchPageState extends ViewState<FreeAnchorMatchPageStyle, FreeAnchorMatchPageViewModel, FreeAnchorMatchPage> with TickerProviderStateMixin, WidgetsBindingObserver {
  FreeAnchorMatchPageViewModel _viewModel;
  AnimationController _animationController;
  num reserveClickTime = 0;
  num attentionClickTime = 0;
  bool isMyselfPage = false;
  bool isRefresh = false;
  bool isFreeAnchor = false;
  Timer checkVideoStatusTimer;
  StreamSubscription<FreeAnchorEntryDetailEvent> freeAnchorEntryDetailEvent;
  StreamSubscription<DetailVideoEvent> detailVideoEvent;
  StreamSubscription<CloseVideoEvent> closeVideoEvent;
  StreamSubscription<FreeAnchorVideoEvent> freeAnchorVideoEvent;
  StreamSubscription<SportPlatformChangeEvent> sportPlatformChange;
  StreamSubscription<FreeAnchorCloseVideoEvent> freeAnchorCloseVideoEvent;
  StreamSubscription<SelectBetTabbarItem> selectBetTabBarItemEvent;
  StreamSubscription<FreeAnchorEntryOtherPageEvent> freeAnchorEntryOtherPageEvent;
  StreamSubscription<FreeAnchorCloseDetailEvent> freeAnchorCloseDetailEvent;
  StreamSubscription<ChangeBottomBarEvent> changeBottomBarEvent;

  StreamSubscription networkStateEvent;
  bool get isDetailShow => widget.freeAnchorPosition == FreeAnchorPosition.detail;
  
  @override
  FreeAnchorMatchPageViewModel get defaultModel {
    _viewModel ??= FreeAnchorMatchPageViewModel();
    return _viewModel;
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    if(widget.freeAnchorPosition == FreeAnchorPosition.detail){
      model.freeAnchorPosition = widget.freeAnchorPosition;
      _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//      ContainerTimerManager.instance.addTimerCallBack(AppMenuKey.Live, _onTimerCallBack);
      WidgetsBinding.instance.addObserver(this);
    }
    else{
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      config.userInfo.freeAnchorPosition = widget.freeAnchorPosition;
      model.freeAnchorPosition = widget.freeAnchorPosition;
      _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
      WidgetsBinding.instance.addObserver(this);
//      ContainerTimerManager.instance.addTimerCallBack(AppMenuKey.Live, _onTimerCallBack);
      bindEvent();
    }
    config.userInfo.init();
    _refreshAccountInfo();
  }

  //刷新账号信息
  void _refreshAccountInfo() {
    Net.playAccount().then((rst) {
      config.userInfo.account = rst;
    });
  }

  // 检查状态防止有重复的声音
  void checkVideoStatus() {
    checkVideoStatusTimer?.cancel();
    checkVideoStatusTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      if(DetailPage.currentPageIsDetailPage ||
          model.isLeaveFreeAnchorPage ||
          model.isHiddenVideo){
        checkVideoStatusTimer?.cancel();
        videoStopPlay(delayTime: 50);
      }
    });
  }

  void destroy() {
    if(widget.freeAnchorPosition == FreeAnchorPosition.detail){
      _animationController?.dispose();
//      ContainerTimerManager.instance?.removeTimerCallBack(AppMenuKey.Live);
      WidgetsBinding.instance?.removeObserver(this);
    }
    else{
      checkVideoStatusTimer?.cancel();
      unbindEvent();
      _animationController?.dispose();
      WidgetsBinding.instance?.removeObserver(this);
//      ContainerTimerManager.instance?.removeTimerCallBack(AppMenuKey.Live);
    }
  }

  void renewInitTimer() {
//    ContainerTimerManager.instance.addTimerCallBack(AppMenuKey.Live, _onTimerCallBack);
    WidgetsBinding.instance.addObserver(this);
  }

  void destroyTimer() {
//    ContainerTimerManager.instance?.removeTimerCallBack(AppMenuKey.Live);
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void dispose() {
    destroy();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    //前台
    if (AppLifecycleState.resumed == state) {
//      Timer(Duration(milliseconds: 100),(){
//        if(isRefreshData() && !model.betListStopPlay && !model.isLeaveFreeAnchorPage){
//          refreshData();
//        }
//        else{
//          hiddenVideo();
//        }
//      });
    }
    //后台
    else if (AppLifecycleState.paused == state) {
//      hiddenVideo();
    }
  }

  void bindEvent(){
    // 主播列表进详情
    freeAnchorEntryDetailEvent = Event.eventBus.on<FreeAnchorEntryDetailEvent>().listen(freeAnchorEntryDetail);
    detailVideoEvent = Event.eventBus.on<DetailVideoEvent>().listen(detailVideo);
    closeVideoEvent = Event.eventBus.on<CloseVideoEvent>().listen(closeVideo);
    freeAnchorVideoEvent = Event.eventBus.on<FreeAnchorVideoEvent>().listen(freeAnchorVideo);
    sportPlatformChange = Event.eventBus.on<SportPlatformChangeEvent>().listen(platformChange);
    freeAnchorCloseVideoEvent = Event.eventBus.on<FreeAnchorCloseVideoEvent>().listen(freeAnchorCloseVideo);
    selectBetTabBarItemEvent = Event.eventBus.on<SelectBetTabbarItem>().listen(selectBetTabBarItem);
    freeAnchorEntryOtherPageEvent = Event.eventBus.on<FreeAnchorEntryOtherPageEvent>().listen(freeAnchorEntryOtherPage);
    networkStateEvent = Event.eventBus.on<NetworkStateEvent>().listen(networkStateListen);
    freeAnchorCloseDetailEvent = Event.eventBus.on<FreeAnchorCloseDetailEvent>().listen(freeAnchorCloseDetail);

    changeBottomBarEvent = Event.eventBus.on<ChangeBottomBarEvent>().listen(changeBottomBar);

    model?.liveStream = StreamController.broadcast();


  }

  void unbindEvent(){
    closeVideoEvent?.cancel();
    freeAnchorEntryDetailEvent?.cancel();
    detailVideoEvent?.cancel();
    freeAnchorVideoEvent?.cancel();
    sportPlatformChange?.cancel();
    freeAnchorCloseVideoEvent?.cancel();
    selectBetTabBarItemEvent?.cancel();
    freeAnchorEntryOtherPageEvent?.cancel();
    networkStateEvent?.cancel();
    model.liveStream?.close();
    freeAnchorCloseDetailEvent?.cancel();
    changeBottomBarEvent?.cancel();
  }

  @override
  Widget render(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
//    double itemWidth = (screenWidth - (16.0 * 2 + 14.0) ) / 2.0;
//    double itemHeight = itemWidth * 160.0/162.0;
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FF),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            Expanded(
              child: AiRefreshGideView(
                physics: BouncingScrollPhysics(),
                refreshViewController: model.scRefreshViewController,
                headers: model.isFirstLoad
                    ? [Container()]
                    : [isDetailShow
                      ? FreeAnchorHead(
                          anchorIcon: widget.detailSet?.detailParams?.anchorIcon ?? '',
                          anchorName: widget.detailSet?.detailParams?.anchorName ?? '',
                        )
                      :StreamBuilder<bool>(
                        stream: model?.liveStream?.stream,
                        initialData: true,
                        builder: (cxt, span) {
                          AnchorSubCellModel liveCellModel;
                          if(model.freeAnchors.length > 1){
                            FreeAnchorItemViewModel anchorModel = model.freeAnchors[1];
                            liveCellModel =  anchorModel?.anchorMatchCellModel?.hotLiveModel;
                            model?.freeLivePlayerViewModel?.freeAnchorModel = liveCellModel;
                            isFreeAnchor = liveCellModel.isShowFreeAnchor;
                          }
                          if (!span.data || config.userInfo.isCloseFreeAnchor || !model.isHaveRBGame){
                            return sh(8.0);
                          }
                          // banner
    //                      int length = model?.bannerModel?.enableBanners?.length ?? 0;
    //                      Widget banner = SizedBox.shrink();
    //                      if(length > 0 && ModuleSwitch.getInstance().anchorRank()){
    //                        banner = Container(
    //                          margin: EdgeInsets.only(bottom: 8.0),
    //                          child: AiBanner(
    //                            isDetailActiveBanner: true,
    //                            isAutoplay: model.bannerModel.enableBanners.length > 1,
    //                            bgColor: Colors.transparent,
    //                            bannerHeight: 100.0,
    //                            model: model.bannerModel,
    //                            onClickBanner: (){
    //                              onEntryBanner();
    //                            },
    //                            goBack: goBack,
    //                            onBannerIndexChanged: (AiBannerSingleModel bannerModel) {
    //                              if (bannerModel == null) return;
    //                            },
    //                          ),
    //                        );
    //                      }
                          if (span.data != null && span.data && liveCellModel == null ||
                              model.isHiddenVideo ||
                              !isRefreshData() ||
                              model.betListStopPlay ||
                              model.isLeaveFreeAnchorPage ||
                              model.isExitApp){
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0, bottom: 12.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                        child: Container(
                                          color: Colors.white,
                                          height: isFreeAnchor ? 194.0 : 244.0,
                                          width: MediaQuery.of(context).size.width - 16.0,
                                        )
                                    ),
                                  ),
    //                              banner,
                                ],
                              ),
                            );
                          }
                          return Container(
                            child: Column(
                              children: [
                                FreeLivePlayerView(
                                  model: model?.freeLivePlayerViewModel,
                                  onCloseVideo: (){
                                    model.notifyStateChanged();
                                  },
                                  goBack: goBack,
                                  onEntryDetail: onEntryBanner,
                                ),
    //                            banner,
                              ],
                            )
                          );
                        },
                      )
                ],
                loadingView: Container(
                  height: screenHeight - 20.0,
                  child: MatchLoading(isFreeAnchor: true, count: 5,),
                ),
                errorView: EmptyView(
                  emptyType: EmptyType.NetError,
                  onTap: () {
                    refresh();
                  },
                ),
                emptyView: DefaultView(
                  backgroundColor: Colors.transparent,
                  name: 'rank_list',
                  height: 300.0,
                  onTap: () => refresh()
                ),
                model: model.anchorViewModel,
                sliverGridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 14.0,
                  childAspectRatio: 162.0 / 160.0,
                ),
                builder: (viewModel, index) {
                  if(index >= model.freeAnchors.length){
                    return SizedBox.shrink();
                  }
                  FreeAnchorItemViewModel  itemModel = model.freeAnchors[index];
                  return Container(
                      child: FreeAnchorItemView(
                        freeAnchorPosition: widget.freeAnchorPosition,
                        isNewFreeAnchor: true,
                        anchorModel: itemModel,
                        bgColor: isDetailShow ? Colors.white.withOpacity(0.06) : Colors.transparent,
//                        onAnchorMore: onAnchorMore,
                        onLookLive: onEntryDetail,
//                        onLookAnchor: onLookAnchor,
                        goBack: goBack,
                      )
                  );
                })
            ),
            config.isTabSDK
             ? Padding(padding: EdgeInsets.only(bottom: 50.0))
             : SizedBox.shrink()
          ],
        ),
      )
    );
  }

  void networkStateListen(event){
    if (event is NetworkStateEvent) {
      if (event.state == XCNetworkState.none) {
        model.isHaveRBGame = false;
        model.notifyStateChanged();
      } else {
        model.refresh();
      }}
  }

  void freeAnchorCloseDetail(e) async{
    await sleep(500);
    destroyTimer();
    await sleep(100);
    renewInitTimer();
  }

  // 定时刷新任务
  void _onTimerCallBack() async {
//    bool isCurrentTab = (config.currentSeletedItem == SeletedItem.sport && config.userInfo.currentMenuKey == AppMenuKey.Live);
    if(model.isLeaveFreeAnchorPage){
      return;
    }
    if (isRefreshData() && !model.betListStopPlay && !model.isLeaveFreeAnchorPage) {
      /// tab为主播时才定时刷新数据
      refresh();
    }
  }

  void platformChange(event){
    if(event is SportPlatformChangeEvent){
      refresh();
    }
  }

  void freeAnchorCloseVideo(event){
    if(event is FreeAnchorCloseVideoEvent){
      refresh();
    }
  }

  void changeBottomBar(event) {
    if(event is ChangeBottomBarEvent) {
      if(event.isPlayVideo) {
        refreshData();
      }
      else {
        hiddenVideo();
      }
    }
  }

  void freeAnchorEntryOtherPage(event){
    if(config.userInfo.isMatchDetail){
      return;
    }
    if(event is FreeAnchorEntryOtherPageEvent){
      if(event.isEntryOtherPage){
        if(event.isExitApp){
          model.isExitApp = true;
        }
        model.isLeaveFreeAnchorPage = true;
        hiddenVideo(delayTime: 50);
      }
      else{
        model.isExitApp = false;
        isRefresh = false;
        goBack();
      }
    }
  }

  // 点击底部投注页
  void selectBetTabBarItem(event){
    if(event is SelectBetTabbarItem){
      if(event.isActivePage){
        model.betListStopPlay = true;
//        stopPlay();
        hiddenVideo();
      }
      else{
        model.betListStopPlay = false;
        isRefresh = false;
        refreshData();
//        play();
      }
    }
  }

  void freeAnchorVideo(event){
    if(event is FreeAnchorVideoEvent){
      if(!event.isPlayVideo){
        hiddenVideo();
      }
      else{
        refreshData();
      }
      cancelRequest();
    }
  }
  void freeAnchorEntryDetail(event){
    if(event is FreeAnchorEntryDetailEvent){
      if(event.isExitDetail){
        refresh();
      }
    }
  }

  void closeVideo(event) {
    if(event is CloseVideoEvent){
      stopPlay();
    }
  }

  void detailVideo(event){
    if(event is DetailVideoEvent){
      if(event.state == 'stop'){
        stopPlay();
      }
      if(config.isTabSDK && event.state == 'playing' && isRefreshData()){
        play();
      }
    }
  }

  void refreshData(){
    model.isHiddenVideo = false;
    if(!isRefresh){
      model?.liveStream?.add(true);
      isRefresh = true;
      refresh();
    }
  }
  void hiddenVideo({int delayTime = 20}){
    isRefresh = false;
    model.isHiddenVideo = true;
    stopPlay();
    Timer(Duration(milliseconds: delayTime), (){
      model?.liveStream?.add(true);
      model?.notifyStateChanged();
    });
    checkVideoStatus();
  }

  void videoStopPlay({int delayTime = 20}){
    isRefresh = false;
    model.isHiddenVideo = true;
    stopPlay();
    Timer(Duration(milliseconds: delayTime), (){
      model?.liveStream?.add(true);
      model?.notifyStateChanged();
    });
  }

  bool isRefreshData(){
    // 切换时显示页面是否列表主播,发现主播
//    if(config.isTabSDK){
//      return config.userInfo.freeAnchorPosition == widget.freeAnchorPosition && config.userInfo.currentMenuKey == AppMenuKey.Live;
//    }
//    return (config.userInfo.freeAnchorPosition == widget.freeAnchorPosition && config.userInfo.currentMenuKey == AppMenuKey.Live && config.currentSeletedItem == SeletedItem.sport) ||
//        (config.userInfo.freeAnchorPosition == widget.freeAnchorPosition && config.userInfo.foundCurrentMenuKey == AppMenuKey.Live && config.currentSeletedItem == SeletedItem.found);
    return true;
  }

  void cancelRequest(){
//    if(!isRefreshData() && model.req != null){
//      model?.req?.cancel();
//    }
  }

  void onEntryDetail(AnchorSubCellModel cellModel){
    model.isLeaveFreeAnchorPage = true;
    hiddenVideo(delayTime: 50);
//    questLookFreeAnchor(cellModel);
  }

  void onEntryBanner(){
    model.isLeaveFreeAnchorPage = true;
    hiddenVideo(delayTime: 50);
  }

  void goBack(){
    Timer(Duration(milliseconds: 50),(){
      model.isLeaveFreeAnchorPage = false;
      refreshData();
    });
    // 检查是否有浮窗显示
//    clearFloatMatchDetail();
//    closeFloatPage(context);
  }

  void stopPlay(){
    model?.freeLivePlayerViewModel?.stopPlay();
  }

  void play(){
    if(isRefreshData()){
      print('刷新视频-----播放:${widget.freeAnchorPosition}');
      model?.freeLivePlayerViewModel?.play();
    }
    else{
      model?.freeLivePlayerViewModel?.stopPlay();
      print('刷新视频-----暂停:${widget.freeAnchorPosition}');
    }
  }

  void refresh(){
    if(isRefreshData()){
      print('刷新视频-----显示:${widget.freeAnchorPosition}');
      model.refresh();
    }
    else{
      print('刷新视频-----隐藏:${widget.freeAnchorPosition}');
      hiddenVideo();
    }
  }

  var _anchorKey = GlobalKey();
//  void onAnchorMore(AnchorSubCellModel cellModel) {
//    if(cellModel != null){
//      AnchorMatchToast.toast(
//        context,
//        controller: _animationController,
//        type: AnimatedType.scale,
//        childWidget: AnchorMatchView(
//          key: _anchorKey,
//          cellModel: cellModel,
//          onReserveAnchor: onReserveAnchor,
//          onAttentionAnchor: onAttentionAnchor,
//          onLookLive: onLookLive,
//          onLookAnchor: onLookAnchor,
//        ),
//      );
//    }
//  }

//  // 预约直播
//  void onReserveAnchor(AnchorSubCellModel cellModel) async {
//    num timestamp = DateTime.now().millisecondsSinceEpoch;
//    if(timestamp - reserveClickTime < 1000 || cellModel == null){
//      return;
//    }
//    reserveClickTime = timestamp;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsFoundAppointment);
//    cellModel.reserve = !cellModel.reserve;
//    if (mounted) {
//      _anchorKey?.currentState?.setState(() {});
//    }
//    // 1：预约，2：取消预约
//    var rsp = await model.requestAnchorReserveFromServer(cellModel.reserve ? '1' : '2', cellModel.anchorId,
//        videoUrl: cellModel.url, videoType: (cellModel.anchorId.isNotEmpty ? 1 : 2).toString());
//    if (rsp.code == 200) {
//      isMyselfPage = true;
//      Event.eventBus.fire(AnchorReserveEvent());
//      showToas(cellModel.reserve
//          ? config.langMap['baseLang']['anchor']['anchorReserveMessage']
//          : config.langMap['baseLang']['anchor']['anchorCancelMessage']);
//      cellModel.reserveTotal += cellModel.reserve ? 1 : -1;
//      if (mounted) {
//        model.notifyStateChanged();
////        setState(() {});
//      }
//    } else {
//      showToas(config.langMap['baseLang']['anchor']['reserveFailed']);
//      cellModel.reserve = !cellModel.reserve;
//    }
//    if (mounted) {
//      _anchorKey?.currentState?.setState(() {});
//    }
//  }

  // 关注主播
//  void onAttentionAnchor(AnchorSubCellModel cellModel) async {
//    num timestamp = DateTime.now().millisecondsSinceEpoch;
//    if(timestamp - attentionClickTime < 1000){
//      return;
//    }
//    attentionClickTime = timestamp;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsFoundAttentionAnchor);
//    int follow = cellModel.isFollowAnchor ? 2 : 1;
//    var params = {
//      'playerId': cellModel.anchorId,
//      'followType': 2, // 1.大神 2.主播
//      'follow': follow,
//    };
//    // 先更新状态
//    cellModel.isFollowAnchor = !cellModel.isFollowAnchor;
//    if (mounted) {
//      _anchorKey?.currentState?.setState(() {});
//    }
//    var rsp = await model.requestAnchorAttentionFromServer(params);
//    if (rsp.code == 200) {
//      showToas(cellModel.isFollowAnchor ? config.langMap['baseLang']['anchor']['followed'] : config.langMap['baseLang']['anchor']['unfollow']);
//      List followList = config?.userInfo?.account?.data?.followPlayerIds;
//      if (!cellModel.isFollowAnchor) {
//        followList.remove(cellModel.anchorId);
//      } else {
//        followList.add(cellModel.anchorId);
//      }
//    } else {
//      showToas(
//          cellModel.isFollowAnchor ? config.langMap['baseLang']['anchor']['followFailed'] : config.langMap['baseLang']['anchor']['unfollowFailed']);
//      cellModel.reserve = !cellModel.reserve;
//    }
//    if (mounted) {
//      _anchorKey?.currentState?.setState(() {});
//    }
//  }

//  void onLookLive(AnchorSubCellModel cellModel) async {
//    onEntryDetail(cellModel);
//    AnchorMatchToast.hideToast();
//    questLookAnchor(cellModel);
//    DetailParams detailParams = getDetailParams(cellModel);
//    DetailPage.show(
//        context,
//        DetailPage(
//          params: detailParams,
//        ),goBack: goBack);
//  }

//  void onLookAnchor(AnchorSubCellModel cellModel) {
////    stopPlay();
//    model.isLeaveFreeAnchorPage = true;
//    hiddenVideo();
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsFoundAnchorHead);
//    AnchorMatchToast.hideToast();
//    var params = {
//      "anchorId": cellModel.anchorId,
//      "playerName": cellModel.name,
//      'anchorIcon': cellModel.icon,
//      "isAnchor": true,
//    };
//    showMaterialPageRoute(context, PersonalPage(params: params)).then((value) {
//      List followPlayerIds = config?.userInfo?.account?.data?.followPlayerIds ?? [];
//      cellModel.isFollowAnchor = followPlayerIds.contains(cellModel.anchorId);
//      model.isLeaveFreeAnchorPage = false;
//      goBack();
//    });
//  }

//  void questLookAnchor(AnchorSubCellModel cellModel) async {
//    if (cellModel.showType == 'RB') {
//      bool isLookAnchorLive = isEmpty(cellModel.anchorId) ? false : true;
//      var rsp = await model.requestLookAnchorLiveFromServer(cellModel.anchorId, cellModel.gidm,
//          videoUrl: cellModel.url, videoType: isLookAnchorLive ? '1' : '2');
//      if (rsp.code == 200) {
//        print('观看直播成功');
//        cellModel.watchTotal += 1;
//        if (mounted) {
//          model.notifyStateChanged();
////          setState(() {});
//        }
//      }
//    }
//  }

  void questLookFreeAnchor(AnchorSubCellModel cellModel) async {
    if (cellModel.isShowFreeAnchor) {
      var rsp = await model.requestWatchAnchorLiveFromServer(liveId: cellModel.liveId);
      if (rsp != null && rsp.code == 200) {
        print('观看直播成功');
        cellModel.watchTotal += 1;
        if (mounted) {
          model.notifyStateChanged();
        }
      }
    }
  }

  DetailParams getDetailParams(AnchorSubCellModel model) {
    String anchorId = model.anchorId;
    String type = '1';
    if (isStrNullOrEmpty(model.anchorId)) {
      type = '2';
    }
    return DetailParams(
        anchorId: anchorId,
        type: type,
        playPriority: PlayPriority.anchor,
        liveParams: {
          'flv': model.flv,
          'm3u8': model.m3u8,
          'rtmp': model.rtmp,
          'url': model.url,
        });
  }
}