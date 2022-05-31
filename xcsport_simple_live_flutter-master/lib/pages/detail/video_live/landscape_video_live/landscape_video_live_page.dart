import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/anchor/anchor_match/anchor_match_model.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_match_model.dart';
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
import 'package:fast_ai/widgets/line_border.dart';
import 'package:fast_ai/widgets/top_alert/top_alert.dart';
import 'package:flutter/material.dart';

class LandscapeVideoLivePage extends StatefulWidget {
  LandscapeVideoLivePage({Key key,this.model}) : super(key: key);
  final AnchorMatchModel model;

  @override
  _LandscapeVideoLivePageState createState() => _LandscapeVideoLivePageState();
}

class _LandscapeVideoLivePageState extends State<LandscapeVideoLivePage> with TickerProviderStateMixin{
 final defaultModel = AnchorMatchModel();
  AnchorMatchModel get model => widget?.model ?? defaultModel;

  AnimationController _animationController;
  ScrollController _scrollController;
  String error = '';
  String alertMsg = '';
  bool isClear = false;
  bool isFirstLoading = true;
  bool isReverseAnchor = false;
  bool isAttentionAnchor = false;
  final freshListController = FreshListController();

  @override
  void initState() {
    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 列表
    Widget freshListWidget = FreshListView(
      isNoDateMagin: false,
      controller: _scrollController,
      freshListController: freshListController,
      isClear: isClear,
      onClear: (bool c) => isClear = false,
      pageSize: 40,
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
              count: 3,
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
        color: config.skin.list.backgroundColor,
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
    
    // return Scaffold(
    //   appBar: AiAppBar(
    //     backgroundColor: Color(0xFF222222),
    //     centerTitle: true,
    //     title: Text('主播',style: Theme.of(context).textTheme.subhead.copyWith(color:Colors.white,fontSize: config.skin.fontSize.h3)
    //     ),
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20.0,),
    //       onPressed: (){
    //         AiRouter.pop(context);
    //       }),
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       LineBorder(),
    //       Expanded(
    //         child: Stack(
    //           children: <Widget>[
    //             matchView,
    //             TopAlert(msg: alertMsg, onFinished: ()=>alertMsg="",),
    //           ]
    //         ),
    //       )
    //     ],
    //   )
    // );
    return Container(
      width: 330,
      child: Column(
        children: <Widget>[
          matchView
        ],
      )
    );
  }

  //列表页生成显示单元格
  Widget drawWidget(ListResult listResult, int index) {
    var list = listResult.data as List<AnchorMatchCellModel>;
    if((list?.length ?? 0) > index){
      var cellModel = list[index];
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: AnchorMatchCell(),
        onTap: (){
          print('点击主播');
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
    model.clear();
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
    if(currentPage == 1){
      model.clear();
    }
    alertMsg = '';
    error = "";
    if(!isInited){
      await sleep(200);
    }
    try {
      var list = await model.requestAnchorLiveFromServer(currentPage, 1);
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
      setState(() {});
    }
  }
  


 

}