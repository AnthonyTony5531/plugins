import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
//import 'package:fast_ai/pages/anchor/anchor_match/anchor_match_model.dart';
import 'package:fast_ai/pages/anchor/anchor_match_slide_cell.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_view_model.dart';
//import 'package:fast_ai/pages/hot/banner/aibanner.dart';
//import 'package:fast_ai/pages/hot/banner/aibanner_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_slide_cell.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/enter_game_detail_config.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/top_alert/top_alert.dart';
import 'package:flutter/material.dart';

class MoreFunctionSlideVideo extends StatefulWidget {
  final MoreLiveModel moreLiveModel;
  final LiveVideoInfo currentLiveVideoInfo;
  final VoidCallback closeCallback;
  final bool isFreeAnchor; //自由播主播
  final bool isListDetail; //精选页进详情

  MoreFunctionSlideVideo({Key key, this.moreLiveModel, this.currentLiveVideoInfo, this.closeCallback, this.isFreeAnchor = false, this.isListDetail = false})
      : super(key: key);

  @override
  MoreFunctionSlideVideoState createState() => MoreFunctionSlideVideoState();
}

class MoreFunctionSlideVideoState extends State<MoreFunctionSlideVideo> {
  MoreLiveViewModel viewModel;
  var baseLang = config.langMap['baseLang'];
  final defaultMoreLiveModel = MoreLiveModel();
  final AiBannerModel bannerModel = AiBannerModel();

  MoreLiveModel get model => widget?.moreLiveModel ?? defaultMoreLiveModel;
  ScrollController _scrollController;
  String error = '';
  String alertMsg = '';
  bool isClear = false;
  bool isFirstLoading = true;
  bool isReverseAnchor = false;
  bool isAttentionAnchor = false;
  int matchLoadTotal = 0;
  int temPage = 0;
  int rbLastPageLength = 0;
  bool isMatchLoadFinish = false;
  int loadNum = 20;
  bool isHaveActivityBanner = false;
  bool isShowHiddenSame = false;
  final freshListController = FreshListController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
//    Future.delayed(Duration(milliseconds: 200), () {
//      loadBanner();
//    });
  }

  @override
  Widget build(BuildContext context) {
    // 列表
    Widget freshListWidget = FreshListView(
      isFirstLoad: isFirstLoading,
      loadingIsBlackStyle: true,
      loadingListCount: 3,
      isDetailSlide: true,
      isNoDateMagin: false,
      controller: _scrollController,
      freshListController: freshListController,
      isClear: isClear,
      onClear: (bool c) => isClear = false,
      pageSize: loadNum,
      divider: Container(),
      loadData: loadData,
      drawWidget: drawWidget,
      matchLoadingCount: 3,
      backgroundColor: Color(0xFF19191E),
      nonDataWidget: Container(
        alignment: Alignment.center,
        child: matchEmpty(),
      ),
    );

    Widget matchView;
    if (error.isNotEmpty) {
      matchView = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          child: matchEmpty(isError: true),
        ),
        onTap: () {
          onRefresh();
        },
      );
    } else {
      matchView = Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              createBanner(),
              Expanded(
                flex: 1,
                child: MediaQuery.removeViewPadding(
                  context: context,
                  child: freshListWidget,
                  removeTop: true,
                ),
              )
            ],
          ));
    }

    return Scaffold(
      body: Container(
          color: Color(0xFF19191E),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              getHeadWidget(),
              Expanded(
                child: Stack(children: <Widget>[
                  matchView,
                  TopAlert(
                    msg: alertMsg,
                    onFinished: () => alertMsg = "",
                  ),
                ]),
              )
            ],
          )),
    );
  }

  Widget createBanner() {
    double topMargin = AiMeasure.topOffset(context);
    return Container(
      padding: EdgeInsets.only(top: topMargin),
    );

    return isHaveActivityBanner
        ? Container(
            margin: EdgeInsets.only(top: topMargin + 20.0),
            child: AiBanner(
              isHiddenBg: true,
              bannerHeight: 82.0,
              model: bannerModel,
              onClickBanner: onClickBanner,
            ),
          )
        : Container(
            padding: EdgeInsets.only(top: topMargin),
          );
  }

  void onClickBanner() {
    if (widget?.closeCallback != null) {
      widget?.closeCallback();
    }
  }

  Widget matchEmpty({bool isError = false}) {
    var baseLang = config.langMap['baseLang'];
    String title = '暂时没有直播';
    double height = (MediaQuery.of(context).size.height - 260.0) / 2;
    return Container(
      margin: EdgeInsets.only(top: isError ? 0.0 : height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 70.0,
            height: 53.0,
            margin: EdgeInsets.only(bottom: 15.0),
            child: AiImage.asset('assets/images/nodataicon/icon_empty_detail_video.png'),
          ),
          Text(
            title,
            style: titleStyle(),
          )
        ],
      ),
    );
  }

  Widget sectionTitleWidget() {
    var baseLang = config.langMap['baseLang'];
    String title = model.totalCount >= 0 ? baseLang['detail']['videoRecomend'] : baseLang['detail']['willLive'];
    return Container(
        color: Colors.white.withOpacity(0.1),
        padding: EdgeInsets.only(left: 10.0),
        margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: titleStyle(),
            ),
            Expanded(child: getHiddenSameWidget()),
          ],
        ));
  }

  Widget getHeadWidget() {
    return Container(
      color: Colors.transparent,
      height: 40,
      width: 90.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            top: 1,
            bottom: 1,
            child: getHiddenSameWidget(),
          ),
        ],
      ),
    );
  }

  //列表页生成显示单元格
  Widget drawWidget(ListResult listResult, int index) {
    var list = listResult.data as List<AnchorSubCellModel>;
    if ((list?.length ?? 0) > index) {
      var cellModel = list[index];
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: AnchorMatchSlideCell(
          model: cellModel,
          onSelectVideo: onLookLive,
          onHiddenSame: onHiddenSame,
        ),
        onTap: () {
          print('点击主播');
          onLookLive(cellModel);
        },
      );
    }
    return Container();
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Colors.white.withOpacity(0.4),
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  Widget getHiddenSameWidget() {
    return Container(
        color: Colors.transparent,
        child: StatefulBuilder(builder: (BuildContext context, StateSetter stateSetter) {
          String icon = config.userInfo.isHiddenRBSameLive ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc';
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
                width: 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AiImage.svgLogo(
                      "assets/images/liveplayer/$icon.svg",
                      size: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 12),
                      child: Text(
                        config.langMap['baseLang']['detail']['hideSame'],
                        style: AiTextStyle(
                          color: Colors.white,
                          fontFamily: config.skin.fontFimaly.pingFang,
                          fontSize: config.skin.fontSize.h5,
                          fontWeight: config.skin.fontWeight.regular,
                        ),
                      ),
                    ),
                  ],
                )),
            onTap: () {
              config.userInfo.isHiddenRBSameLive = !config.userInfo.isHiddenRBSameLive;
              stateSetter(() {});
              resetState();
              isFirstLoading = true;
              // freshListController.state.setState((){});
            },
          );
        }));
  }

  Future onRefresh() async {
    isFirstLoading = true;
    model.clear();
    resetState();
  }

  bool showAlertMsg = false;
  bool isInited = false;

  Future<ListResult> loadData(int currentPage, int pageSize) async {
    if (!isNullOrEmpty(error)) isInited = false;
    if (currentPage == 1) {
      model.clear();
      temPage = 1;
      isShowHiddenSame = false;
      isMatchLoadFinish = false;
    }

    alertMsg = '';
    error = "";
    if (!isInited) {
      await sleep(200);
    }
    try {
      // 滚球直播
      var list = [];
      model.liveVideoInfo = widget?.currentLiveVideoInfo;
      list = await model.requestMatchLiveFromServer(currentPage,isFreeAnchor: widget.isFreeAnchor, isListDetail: widget.isListDetail);
      ListResult ret = ListResult();
      ret.listCount = list.length;
      ret.totalCount = model.totalCount;
      ret.data = list;
      print('直播总数----${model.totalCount}');
      print('直播长度----${list.length}');
      return ret;
      // 全部
    } catch (e) {
      logError(e);
      ListResult ret = ListResult();
      ret.listCount = 0;
      ret.totalCount = 0;
      ret.data = null;
      if (mounted) {
        setState(() {
          isFirstLoading = false;
          error = getErrorMessage();
          alertMsg = error;
        });
      }
      return ret;
    } finally {
      if (currentPage == 1 && mounted) {
        isFirstLoading = false;
      }
      if (mounted) {
        setState(() {});
      }
    }
  }

//  void loadBanner() async {
//    await bannerModel.requestFromServer();
//    isHaveActivityBanner = (bannerModel?.filterActivityBanner()?.length ?? 0) > 0;
//    if (mounted) {
//      setState(() {});
//    }
//  }

  //重置状态，全部重新刷新
  resetState() {
    if (mounted) {
      setState(() {
        showAlertMsg = true;
        isClear = true;
        error = "";
        model.clear();
      });
    }
  }

  void onHiddenSame(bool isHiddenSame) {
    resetState();
    isFirstLoading = true;
    freshListController.state.setState(() {});
  }

  void onLookLive(AnchorSubCellModel cellModel) async {
    DetailParams params = EntryGameDetailConfig.getDetailParams(
      cellModel,
      playPriority: isEmpty(cellModel.anchorId) ? PlayPriority.live : PlayPriority.anchor,
      isDetailMoreLiveChange: true,
    );
    Event.eventBus.fire(params);
    if (widget.closeCallback != null) {
      widget.closeCallback();
    }
  }
}
