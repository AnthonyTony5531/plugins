import 'package:fast_ai/pages/anchor/anchor_match_cell.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_view_model.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/top_alert/top_alert.dart';
import 'package:flutter/material.dart';


class VideoLiveView extends StatefulWidget {
  final String gameType;
  final String currentGidm;
  final MoreLiveModel moreLiveModel;
  final LiveVideoInfo currentLiveVideoInfo;
  final VoidCallback closeCallback;
  VideoLiveView({Key key, this.gameType, this.moreLiveModel,this.currentGidm,this.currentLiveVideoInfo,this.closeCallback}) : super(key: key);

  @override
  _VideoLiveViewState createState() => _VideoLiveViewState();
}

class _VideoLiveViewState extends State<VideoLiveView>{
  MoreLiveViewModel viewModel;
  var baseLang = config.langMap['baseLang'];
  final  defaultMoreLiveModel = MoreLiveModel();
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
  final freshListController = FreshListController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

  }

  @override
  Widget build(BuildContext context) {

    // 列表
    Widget freshListWidget = FreshListView(
      isFirstLoad: isFirstLoading,
      isNoDateMagin: false,
      controller: _scrollController,
      freshListController: freshListController,
      isClear: isClear,
      onClear: (bool c) => isClear = false,
      pageSize: loadNum,
      divider: Container(),
      loadData: loadData,
      drawWidget: drawWidget,
      matchLoadingCount: 1,
      nonDataWidget: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height - AiMeasure.topOffset(context) - 40 - AiMeasure.topOffset(context),
        child: Container(),
      ),
      loadingWidget: isFirstLoading
          ? MatchLoading(
              count: 1,
              isListView: false,
            )
          : Container(),
    );

    Widget matchView;
    if (error.isNotEmpty) {
      matchView = LoadFail(error: error,onRefresh: () => onRefresh(),
      );
    } else {
      matchView = Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child:freshListWidget,
              )
            ],
          )
      );
    }

    return Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getHeadWidget(),
            Expanded(
              child: Stack(
                  children: <Widget>[
                    matchView,
                    TopAlert(msg: alertMsg, onFinished: ()=>alertMsg="",),
                  ]
              ),
            )
          ],
        )
    );
  }

  Widget getHeadWidget(){
    return  Container(
      color: Colors.white,
      height: 40,
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Positioned.fill(child: Container(
            alignment: Alignment.center,
            child: Text(
                '${config.langMap['baseLang']['widgets']['liveView']['type']['video']}',
                style: AiTextStyle(
                  color: Colors.black,
                  fontFamily: config.skin.fontFimaly.pingFang,
                  fontSize: config.skin.fontSize.h4,
                  fontWeight: config.skin.fontWeight.medium,
                )
            ),
          ),),
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
    var list = listResult.data as List<AnchorMatchCellModel>;
    if((list?.length ?? 0) > index){
      var cellModel = list[index];
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: AnchorMatchCell(bgColor: Colors.transparent,isEntryDetail: false,onLookLive: onLookLive,isDetailChangeVideo: true,),
        onTap: (){
          print('点击主播');
        },
      );
    }
    return Container();
  }

  Widget getHiddenSameWidget(){
    return Container(
      // color: Colors.redAccent,
        child: StatefulBuilder(builder: (BuildContext context,StateSetter stateSetter){
          String icon = config.userInfo.isHiddenRBSameLive ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc';
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
                width: 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AiImage.svgLogo("assets/images/liveplayer/$icon.svg",size: 12,),
                    Container(
                      margin: EdgeInsets.only(left: 5,right: 12),
                      child: Text(config.langMap['baseLang']['detail']['hideSame'],style: AiTextStyle(
                        color: Colors.black,
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: config.skin.fontSize.h5,
                        fontWeight: config.skin.fontWeight.regular,
                      ),
                      ),
                    ),
                  ],
                )
            ),
            onTap: (){
              config.userInfo.isHiddenRBSameLive = !config.userInfo.isHiddenRBSameLive;
              stateSetter(() {});
              resetState();
              isFirstLoading = true;
              // freshListController.state.setState((){});
            },
          );
        })
    );
  }


  Future onRefresh() async {
    resetState();
  }

  bool showAlertMsg = false;
  bool isInited = false;
  Future<ListResult> loadData(int currentPage, int pageSize) async {

    if(!isNullOrEmpty(error))isInited = false;
    if(currentPage == 1){
      model.totalCount = 0;
    }
    isFirstLoading = false;
    alertMsg = '';
    error = "";
    if(!isInited){
      await sleep(200);
    }
    try {
      // 滚球直播
      model.liveVideoInfo = widget?.currentLiveVideoInfo;
      var list = await model.requestRBLiveFromServer(currentPage);
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
    } finally{
      if (currentPage == 1 && mounted) {
        isFirstLoading = false;
      }
      if(mounted){
        setState(() {});
      }
    }
  }

  //重置状态，全部重新刷新
  resetState() {
    if (mounted) {
      setState(() {
        showAlertMsg = true;
        isClear = true;
        error = "";
      });
    }
  }

  void onLookLive(AnchorSubCellModel cellModel) async {
    DetailParams params =  DetailParams(
        anchorId: cellModel.anchorId,
        playPriority: isEmpty(cellModel.anchorId) ? PlayPriority.live : PlayPriority.anchor,
        liveParams: {
          'flv' : cellModel.flv,
          'm3u8' : cellModel.m3u8,
          'rtmp' : cellModel.rtmp,
          'url' : cellModel.url,
        }
    );
    Event.eventBus.fire(params);
    if(widget.closeCallback != null){
      widget.closeCallback();
    }
  }

}

