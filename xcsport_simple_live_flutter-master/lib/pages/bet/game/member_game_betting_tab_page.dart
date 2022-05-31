import 'dart:convert' as _convert;
import 'dart:io';

import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/models/bet_order_record/game_type_model.dart';
import 'package:fast_ai/models/order_game_bet_record_model.dart';
import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import 'package:fast_ai/pages/bet/bet_record_time_line_view.dart';
import 'package:fast_ai/pages/bet/bet_statics_by_data.dart';
import 'package:fast_ai/pages/bet/betting_date_selector.dart';
import 'package:fast_ai/pages/bet/game/member_game_bet_item_view.dart';
import 'package:fast_ai/pages/bet/game_type_model.dart';
import 'package:fast_ai/pages/bet/member_betting_blank.dart';
import 'package:fast_ai/pages/bet/member_betting_loading.dart';
import 'package:fast_ai/pages/bet/white_web_view_page.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
//import 'package:fast_ai/pages/member/betting/bet_record_time_line_view.dart';
//import 'package:fast_ai/pages/member/betting/bet_statics_by_data.dart';
//import 'package:fast_ai/pages/member/betting/betting_date_selector.dart';
//import 'package:fast_ai/pages/member/betting/game/member_game_bet_item_view.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_blank.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_loading.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../../../white_web_view_page.dart';

///
///
///
///
typedef SendData2Parent = Function(dynamic data);

class MemberGameBettingTabPage extends StatefulWidget {

  final String startDate;
  final String endDate;
  final bool itemIsCard;
  final bool showTimeLine;
  final Color bgColor;
  final BetFilterController betFilterController;
  final SendData2Parent sendData2Parent;
  final bool isShowEmptyBtn;
  final VoidCallback refreshTimeAndTypeFilterView;

  MemberGameBettingTabPage({
    Key key,
    this.startDate,
    this.endDate,
    this.itemIsCard = false,
    this.showTimeLine = false,
    this.bgColor,
    this.betFilterController,
    this.sendData2Parent,
    this.isShowEmptyBtn = false,
    this.refreshTimeAndTypeFilterView,
  }):super(key:key);

  @override
  MemberGameBettingTabState createState() => MemberGameBettingTabState();
}

class MemberGameBettingTabState extends State<MemberGameBettingTabPage> {
  var baseLang = config.langMap['baseLang'];
  String startDate;
  String endDate;
  bool isClear = false;
  String error = '';

  BetFilterController _betFilterController = BetFilterController();
  BetFilterController get betFilterController => widget?.betFilterController ?? _betFilterController;

  ///
  void updateDate(String startDate,String endDate){
    if(mounted){
      setState(() {
        this.startDate = startDate;
        this.endDate = endDate;
        isClear = true;
      });
    }
  }

  ///
  void updateType(String type){
    if(mounted){
      setState(() {
        isClear = true;
      });
    }
  }

  @override
  void initState() {
    startDate = widget?.startDate;
    endDate = widget?.endDate;
    super.initState();
  }

  @override
  void didUpdateWidget(MemberGameBettingTabPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


  void _updateFilterData(){
    if(mounted){
      setState(() {
        this.isClear = true;
      });
    }
  }

  void timeLineOnTap(){
    showPopup(context, BettingDateSelector(betFilterController: betFilterController,refresh: _updateFilterData));
  }

  @override
  Widget build(BuildContext context) {
    Widget matchView;
    if (error.isNotEmpty) {
      matchView = Container(
        color: Theme.of(context).backgroundColor,
        child: LoadFail(error: error,onRefresh: () => onRefresh(),
        ),
      );
    } else {
      matchView = FreshListView(
          isNoDateMagin: false,
          loadData: _loadData,
          isClear: isClear,
          onClear: (v) => isClear = v,
          drawWidget: _drawWidget,
          nonDataWidget: Container(color: Theme.of(context).backgroundColor,child: MemberBettingBlank(parentContext: context, height: 300,needPop: true,isShowEmptyBtn: false,)),
          loadingWidget: MemberBettingLoading(),
          loadingListCount: 3,
          divider: Container(height: 10.0, decoration: BoxDecoration(color: Theme.of(context).backgroundColor)));
    }
    return Scaffold(
      backgroundColor: widget?.bgColor ?? Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[
          isNullOrEmpty(betFilterController.itemDateFilterStr) || !widget.showTimeLine
              ? SizedBox()
              : BetRecordTimeLineView(
                  bgColor: widget.bgColor,
                  horizontalPadding: 10,
                  onTap: timeLineOnTap,
                  betNum: _betStaticsMap[betFilterController.itemDateFilterStr]?.betNum ?? 0,
                  winLoss: _betStaticsMap[betFilterController.itemDateFilterStr]?.winLoss ?? 0.0,
                  ymd: betFilterController.itemDateFilterStr,
                ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: matchView,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String lastDataStr = '';
  List<GameOrder> _allData = [];

  Future<ListResult> _loadData(int currentPage, int pageSize) async {
    try{
      await getGameTypeInfo();
      if(currentPage == 1){
        this.lastDataStr = '';
        _betStaticsMap.clear();
        _allData.clear();
        if(widget.sendData2Parent != null){
          widget.sendData2Parent(_allData);
        }
      }
      //0未结算1已结算2已取消
      String orderState;
      if(betFilterController?.orderState == '1'){
        orderState = '1';
      } else if(betFilterController?.orderState == '0'){
        orderState = '0';
      }

      ListResult result = ListResult();
      var item = await Net.gameBetRecordTab(
          page: currentPage,
          pageSize: pageSize,
          orderState: orderState,
          startDate: this.startDate,
          gameKey: betFilterController.gameType,
          endDate: this.endDate);

//    /// TODO: del test code
//    OrderGameBetRecordModel item = OrderGameBetRecordModel();
//    if (true) {
//      List<GameOrder> pageDTOList = [];
//      for(int i = 0;i<10;i++){
//        GameOrder g1 = GameOrder();
//        g1.id = '5e9ae51597499c65fd2c6c12';
//        g1.playerId = 'da057948529955a9b5eb7bfe052a80b2';
//        g1.playerName = 'lake';
//        g1.supplierId = 'cq9';
//        g1.supplierName = '腾讯游戏';
//        g1.gameKey = '16';
//        g1.gameName = '五行$i';
//        g1.orderId = 'rel-bet-3173122300:cq9';
//        g1.setId = '3173122375';
//        g1.creditStatus = '0';
//        g1.ticketStatus = '0';
//        g1.tradeStatus = '成功';
//        g1.betTime = 1586837013000 + 37013000 * i;
//        g1.betAmount = 100;
//        g1.betTimeGroup = '20200418';
//        pageDTOList.add(g1);
//      }
//
//      GameBetRecordModel model1 = GameBetRecordModel(2,pageDTOList);
//      item.data = model1;
//      item.code = 200;
//    }

      if (item.code == 200) {
        _dataStaticsByData(item);
        result.data = item;
        result.listCount = item.data?.pageDTOList?.length ?? 0;
        result.totalCount = item.data?.totalCount;
        if((item.data?.pageDTOList?.length ?? 0) > 0){
          _allData.addAll(item.data?.pageDTOList);
          if(widget.sendData2Parent != null){
            widget.sendData2Parent(_allData);
          }
          item.data?.pageDTOList?.forEach((g){
            bool showTag = false;
            String ymd = AiDate.format('y-M-d', g.betTime);
            if(isNullOrEmpty(lastDataStr)){
              showTag = true;
            } else if(ymd != lastDataStr){
              showTag = true;
            }
            lastDataStr = ymd;
            g.showTimeLine = showTag;
          });
        }
      } else {
        result.errorMsg = item.msg;
      }
      return result;
    } catch(_){
      ListResult ret = ListResult();
      ret.listCount = 0;
      ret.totalCount = 0;
      ret.data = null;
      if(mounted){
        setState(() {
          error = getErrorMessage();
        });
      }
      return ret;
    }
  }

  Future<void> getGameTypeInfo() async {
    if(isEmpty(widget.betFilterController.gameType)){
      var model = await Net.getGameType({'supplierId': 'aigame'});
      if (model.isSuccess) {
        ccCache.setString('game.type.info', model.listJsonStr);
      }
      var jsonStr = ccCache.getString('game.type.info', null);
      if (jsonStr != null) {
        var list = _convert.jsonDecode(jsonStr) as List;
        var gameTypeInfoList = list?.map((e) => GameTypeInfo.fromMap(e))?.toList() ?? [];
        var type = gameTypeInfoList?.first;
        if(type != null){
          widget.betFilterController.gameType = type.gameKey;
          widget.refreshTimeAndTypeFilterView?.call();
        }
      }
    }

  }

  Future onRefresh() async {
    resetState();
  }

  void resetState() {
    if (mounted) {
      setState(() {
        if(error?.isNotEmpty ?? false){
          error = "";
        } else {
          isClear = true;
        }
      });
    }
  }


  // 数据处理：按天归类计算盈亏
  Map<String,BetStaticsByData> _betStaticsMap = {};
  /// 按天统计数据
  void _dataStaticsByData(OrderGameBetRecordModel model){
    if(model.data == null || model.data.pageDTOList == null || model.data.pageDTOList.length <= 0) {
      return;
    }

    model.data?.pageDTOList?.forEach((g){
      String ymd = AiDate.format('y-M-d', g.betTime);
      BetStaticsByData data;
      if(!_betStaticsMap.containsKey(ymd)){
        data = BetStaticsByData(data: ymd,betNum: 0,winLoss: 0.0);
        _betStaticsMap[ymd] = data;
      } else {
        data = _betStaticsMap[ymd];
      }
      data.betNum += 1;

      //0确认中 1成功 2赢 3输 4和 5已取消 6已撤单 7失败
      //0未结算1已结算2已取消
      if(g?.ticketStatus == '1' || g?.ticketStatus == '2' || g?.ticketStatus == '3' || g?.ticketStatus == '4'){
        if(g.creditStatus == '1' && g.payment != null && g.betAmount != null){
          double winOrLose = g.payment - g.betAmount;
          data.winLoss += winOrLose ?? 0.0;
        }
      }
    });

    print(_betStaticsMap);
    _dataStaticsByFilterData();
  }

  /// 根据过滤日期统计数据
  void _dataStaticsByFilterData(){
    if(!isNullOrEmpty(betFilterController?.itemDateFilterStr)){
      String ymd = betFilterController.itemDateFilterStr;
      _betStaticsMap.remove(ymd);
      BetStaticsByData filterData = BetStaticsByData(data: ymd,betNum: 0,winLoss: 0.0);
      _betStaticsMap?.values?.forEach((data){
        filterData.betNum += data?.betNum ?? 0;
        filterData.winLoss += data?.winLoss ?? 0.0;
      });
      _betStaticsMap[ymd] = filterData;
      sleep(100,(){
        if(mounted){
          setState(() {});
        }
      });
    }
  }

  ///
  Widget _drawWidget(ListResult listResult, int index) {
    GameOrder item = (listResult.data as OrderGameBetRecordModel).data.pageDTOList[index];
    String ymd = AiDate.format('y-M-d', item.betTime);
    return MemberGameBetItemView(
      item:item,
      itemIsCard:true,
      showTimeLine: widget.showTimeLine && isNullOrEmpty(betFilterController?.itemDateFilterStr),
      bgColor:Colors.transparent,
      betFilterController: betFilterController,
      timeLineOnTap:(){
        showPopup(context, BettingDateSelector(betFilterController: betFilterController,refresh: _updateFilterData));
      },
      onTapGo2Detail:(){
        //http://dev.caccarat-h5.xc.com/cocosBetRecordDetail?token=7533bb7731b542d49c3d399bea0cf389
        // &lang=zh-cn&terType=2&wid=1&ticketId=622d9f185e2e066d687f3073&groupId=1
        String host = Api.baseMainUrl;
        String token = config.userInfo.token;
        String lang = config.userInfo.lang;
        String terType = Platform.isAndroid ? (config.isVs ? '12' : config.isGbet ? '7' : '4') : (config.isVs ? '11' : config.isGbet ? '6' : '3');
        String wid = '${config.userInfo.walletId}';
        String ticketId = item.id;
        String groupId = '${config.userInfo.sportPlatformId}';
        String gameKey = item.gameKey;
        String url = "$host/commonpage/comboIndex?token=$token&lang=$lang&terType=$terType&wid=$wid&ticketId=$ticketId&groupId=$groupId&gameKey=$gameKey";

        showSystemDefaultMaterialPageRoute(
            context,
            WhiteWebViewPage(
              url:url,title: AiJson(config.langMap).getString('baseLang.order.orderDetail'),
              //cacheMode: CacheMode.LOAD_NO_CACHE,
            )
        );
      },
      staticsByData:_betStaticsMap[ymd],
    );
  }
}

