import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
//import 'package:fast_ai/pages/anchor/anchor_match/anchor_match_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/video_live/video_live_cell.dart';
import 'package:fast_ai/pages/detail/video_live/video_live_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
//import 'package:fast_ai/widgets/default_views/sport_match_empty.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/line_border.dart';
import 'package:fast_ai/widgets/top_alert/top_alert.dart';
import 'package:flutter/material.dart';

class VideoLivePage extends StatefulWidget {
  VideoLivePage({Key key,this.model,this.onClose,this.currentLiveVideoInfo}) : super(key: key);
  final VideoLiveModel model;
  final VoidCallback onClose;
  final LiveVideoInfo currentLiveVideoInfo;
  @override
  _VideoLivePageState createState() => _VideoLivePageState();
}

class _VideoLivePageState extends State<VideoLivePage>{

  final defaultModel = VideoLiveModel();
  VideoLiveModel get model => widget?.model ?? defaultModel;

  ScrollController _scrollController;
  String error = '';
  String alertMsg = '';
  bool isClear = false;
  bool isFirstLoading = true;
  final freshListController = FreshListController();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      pageSize: 20,
      divider: Container(),
      loadData: loadData,
      drawWidget: drawWidget,
      nonDataWidget: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height -
            AiMeasure.topOffset(context) -
            40 -
            60 -
            AiMeasure.topOffset(context),
//        child: SportMatchEmpty(),
      ),
      loadingWidget: isFirstLoading
          ? MatchLoading(
              count: 2,
              isListView: false,
            )
          : Container(),
      // fixList: fixCells(),
    );

    Widget matchView;
    if (error.isNotEmpty) {
      matchView = LoadFail(error: error,onRefresh: () => onRefresh(),
      );
    } else {
      matchView = Container(
        color: Colors.white,
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
    
    return Scaffold(
      body: Column(
        children: <Widget>[
          videoLiveHead(),
          LineBorder(),
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

  Widget videoLiveHead(){

    String icon = config.userInfo.isHiddenRBSameLive ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc';
    return Container(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 45,
            height: 55,
            child: IconButton(
              iconSize: 23,
              icon: AiImage.svgLogo("assets/images/member/follow/icon_popup_x_black.svg",size: 23,),
              onPressed: (){
                if(widget?.onClose != null){
                  widget.onClose();
                }
              }),
          ),
          Expanded(
            child: Center(
              child: Text(config.langMap['baseLang']['detail']['videoLive'],style: AiTextStyle(
                  color: Colors.black,
                  fontSize: config.skin.fontSize.h3,
                  fontWeight: config.skin.fontWeight.regular,
                  fontFamily: config.skin.fontFimaly.pingFang
                )
              )
            )
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 80,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AiImage.svgLogo("assets/images/liveplayer/$icon.svg",size: 12,),  
                  Container(
                    margin: EdgeInsets.only(left: 5,right: 12),
                    child: Text(config.langMap['baseLang']['detail']['hideSame'],style: AiTextStyle(
                        color: Color(0xFF404040),
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
              isFirstLoading = true;
              resetState();              
              // freshListController.state.setState((){});
            },
          ),
        ],
      ),
    );
  }

  //列表页生成显示单元格
  Widget drawWidget(ListResult listResult, int index) {

    var list = listResult.data as List<AnchorSubCellModel>;
    if((list?.length ?? 0) > index){
      var cellModel = list[index];
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: VideoLiveCell(
            cellModel: cellModel,
            onChangeLive: onChangeLive,
          ),
        onTap: (){
        },
      );
    }
    return Container();
  }

  Future onRefresh() async {
    // isInited = false;
    //上拉刷新只刷新第一页
    // await model.navModel.loadFromServer();
    // await requestMatch(null,true);
    isFirstLoading = true;
    resetState();
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



  bool showAlertMsg = false;
  bool isInited = false;
  Future<ListResult> loadData(int currentPage, int pageSize) async {

    if(!isNullOrEmpty(error))isInited = false;
    alertMsg = '';
    error = "";
    isFirstLoading = false;
    if(!isInited){
      await sleep(200);
    }
    try {
      model.liveVideoInfo = widget?.currentLiveVideoInfo;
      var list = await model.requestRBLiveFromServer(currentPage);
      ListResult ret = ListResult();
      ret.listCount = list.length;
      ret.totalCount = model.totalCount;
      ret.data = list;    
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

  void onChangeLive(AnchorSubCellModel cellModel) async{

   DetailParams params =  DetailParams(
//DetailParams      gidm: cellModel.gidm,
//      gameType: cellModel.gameType,
//      showtype: cellModel.showType,
//      homeTeam: cellModel.homeName,
//      awayTeam: cellModel.awayName,
//      homeLogo: cellModel.homeLogo,
//      awayLogo: cellModel.awayLogo,
//      leagueName: cellModel.leagueName,
//      gameDate: cellModel.gameDate,
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

//    // 观看类型：1：主播直播，2：视频直播
//    String videoType = (cellModel.anchorId ?? '').isNotEmpty ? '1' : '2';
//    var rsp = await AnchorMatchModel().requestLookAnchorLiveFromServer(cellModel.anchorId, cellModel.gidm,videoType: videoType,videoUrl: cellModel.url);
//    if(rsp.code == 200){
//      print('观看主播');
//    }
  }

}
