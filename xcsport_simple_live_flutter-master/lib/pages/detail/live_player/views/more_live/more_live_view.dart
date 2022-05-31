import 'package:fast_ai/pages/anchor/anchor_match_cell.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/more_live/more_live_view_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
//import 'package:fast_ai/widgets/default_views/sport_match_empty.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/top_alert/top_alert.dart';
import 'package:flutter/material.dart';

typedef ValueChangedLiveVideo = void Function(String gidm,String anchorId,String flv,String m3u8,String rtmp,String url);

class MoreLiveView extends StatefulWidget {
  final String gameType;
  final ValueChangedLiveVideo didSelectLiveVideo;
  final String currentGidm;
  final MoreLiveModel moreLiveModel;
  final LiveVideoInfo currentLiveVideoInfo;
  MoreLiveView({Key key, this.gameType, this.didSelectLiveVideo,this.moreLiveModel,this.currentGidm,this.currentLiveVideoInfo}) : super(key: key);
  
  @override
  _MoreLiveViewState createState() => _MoreLiveViewState();
}

class _MoreLiveViewState extends State<MoreLiveView>{
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
  // AnchorSubCellModel lookLiveModel;
  // StreamSubscription<AnchorLiveEvent> _anchorLiveEvent;
  // RunningNavController menuController = RunningNavController();
  final freshListController = FreshListController();

  @override
  void initState() { 
    super.initState();
    _scrollController = ScrollController();
    // viewModel = MoreLiveViewModel(widget.currentGidm);
    // queryLiveVideo();
  }

  // void queryLiveVideo() async {
  //   await viewModel.queryFromServe(widget.gameType ?? 'FT');
  //   setState(() {});
  // }

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
        height: MediaQuery.of(context).size.height -
            AiMeasure.topOffset(context) -
            40 -
            AiMeasure.topOffset(context),
//        child: SportMatchEmpty(name: 'anchorLive',isFixedText: true,),
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
      color: Colors.transparent,
      child: Column(
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



    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: 330,
    //   color: Colors.transparent,
    //   // color: Colors.greenAccent,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       Container(
    //         margin: EdgeInsets.only(top: 30,right: 40),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Container(
    //               height: 40,
    //               // color: Colors.orangeAccent,
    //               alignment: Alignment.center,
    //               margin: EdgeInsets.only(right: 20),
    //               // padding: EdgeInsets.only(top: 42, bottom: viewModel.cellModels.length == 0 ? 0 : 16),
    //               child: Text(
    //                 '更多直播场次', 
    //                 style: AiTextStyle(
    //                   color: Colors.white,
    //                   fontFamily: config.skin.fontFimaly.pingFang,
    //                   fontSize: config.skin.fontSize.h3,
    //                   fontWeight: config.skin.fontWeight.medium,
    //                 )
    //               ),
    //             ),
    //             getHiddenSameWidget()
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //           child: Container(
    //             margin: EdgeInsets.only(left:40, right: 40),
    //             child: viewModel.cellModels.length == 0 ? buildDefaultView() : GridView.builder(
    //             itemCount: viewModel.cellModels.length,
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               crossAxisSpacing: 9,
    //               mainAxisSpacing: 10,
    //               childAspectRatio: 118/95,
    //             ), 
    //             itemBuilder: (BuildContext context, int idx) {                
    //               return MoreLiveCell(model: viewModel.cellModels[idx], didSelectLiveVideo: widget.didSelectLiveVideo,);
    //             }
    //           )
    //           )
    //         )
    //     ],
    //   ),
    // );
  }

  Widget getHeadWidget(){
    return  Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            // color: Colors.orangeAccent,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 60),
            // padding: EdgeInsets.only(top: 42, bottom: viewModel.cellModels.length == 0 ? 0 : 16),
            child: Text(config.langMap['baseLang']['detail']['livePlayer']['moreLive'],
              style: AiTextStyle(
                color: Colors.white,
                fontFamily: config.skin.fontFimaly.pingFang,
                fontSize: config.skin.fontSize.h3,
                fontWeight: config.skin.fontWeight.medium,
              )
            ),
          ),
          getHiddenSameWidget()
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
        // child: AnchorMatchCell(model: cellModel,onAnchorMore: onAnchorMore,onLookLive: onEntryDetailLook,),
        child: AnchorMatchCell(bgColor: Colors.transparent,isEntryDetail: false,onLookLive: onLookLive,),
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
                      color: Colors.white,
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
//      var list = await model.requestRBLiveFromServer(currentPage);
      ListResult ret = ListResult();
//      ret.listCount = list.length;
//      ret.totalCount = model.totalCount;
//      ret.data = list;
//      print('直播总数----${model.totalCount}');
//      print('直播长度----${list.length}');
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

  void onLookLive(AnchorSubCellModel cellModel){
    if(widget?.didSelectLiveVideo != null){
//      widget?.didSelectLiveVideo(
//        cellModel.anchorId,
//        cellModel.flv,
//        cellModel.m3u8,
//        cellModel.rtmp,
//        cellModel.url,
//      );
    }
  }

  // Widget buildDefaultView() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[            
  //       Container(
  //         margin: EdgeInsets.only(bottom: 8),
  //         child: Text(baseLang['detail']['noMoreOtherMatchLive'], style: config.skin.moreLiveViewStyle.defaultTitle,)
  //       ),
  //       Text(baseLang['detail']['waiteatch'], style: config.skin.moreLiveViewStyle.defaultSubtitle,),
  //     ],
  //   );
  // }
}

