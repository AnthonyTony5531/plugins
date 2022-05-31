import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/order_game_bet_record_detail_model.dart';
import 'package:fast_ai/pages/bet/member_betting_blank.dart';
import 'package:fast_ai/pages/bet/member_betting_loading.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_blank.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_loading.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

class MemberGameBettingDetailPage extends StatefulWidget {
  final String tradeNo;

  MemberGameBettingDetailPage({Key key, this.tradeNo});

  @override
  _MemberGameBettingDetailPageState createState() => _MemberGameBettingDetailPageState();
}

class _MemberGameBettingDetailPageState extends State<MemberGameBettingDetailPage> {
  var baseLang = config.langMap['baseLang'];
  bool isClear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AiAppBar(
          brightness: Brightness.light,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            ),
            onPressed: () {
              AiRouter.pop(context);
            },
          ),
          actions: <Widget>[Container(width: 30.0)],
          title: Text(config.langMap['baseLang']['member']['bet']['title'],
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Color(0xFF000000), fontSize: 16.0))),
      body: Column(
        children: <Widget>[
          LineHelper.buildHLine(),
          Expanded(
            child: FreshListView(
                loadData: _loadData,
                isClear: isClear,
                onClear: (v) => isClear = v,
                drawWidget: _drawWidget,
                nonDataWidget: MemberBettingBlank(parentContext: context, height: MediaQuery.of(context).size.height-500,needPop: true,),
                loadingWidget: MemberBettingLoading(),
                loadingListCount: 3,
                divider: Container(height: 10.0, decoration: BoxDecoration(color: Theme.of(context).backgroundColor))),
          ),
        ],
      ),
    );
  }

  Future<ListResult> _loadData(int currentPage, int pageSize) async {
    ListResult result = ListResult();
    var item = await Net.gameBetRecordDetail(tradeNo: widget.tradeNo,);
    if (item.code == 200) {
      result.data = item;
      result.listCount = 1;
      result.totalCount = 1;
    } else {
      result.errorMsg = item.msg;
    }
    return result;
  }


  ///
  Widget _drawWidget(ListResult listResult, int index) {
    GameBetRecordDetailModel data = listResult.data.data;
    List<Widget> contents = [];
    contents.add(_title(data));
    contents.add(_betOrderSummary(data));

    contents.add(_gameItemSummary(data));

    return Column(
      children: contents,
    );
  }

  ///
  Widget _title(GameBetRecordDetailModel data) {
    return Container(
      height: 132,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //creditStatus	结算状态 0未结算 1已结算 2已取消
          Text(baseLang['order']['payOutTotalMoney'],style: config.skin.memberBettingDetailStyle.statusName),
          InterValHelper.h(15),
          Text(data.creditStatus == '1' ? '${numString(data?.payment)}' : (data.creditStatus == '0' ? '--' : '${numString(data?.betAmount)}'),style: config.skin.memberBettingDetailStyle.money),
          InterValHelper.h(12),
          Text(data.creditStatus == '1' ? '${baseLang['order']['payOutSuccess']}' : (data.creditStatus == '0' ? '${baseLang['order']['noPayOut']}' : config.langMap['baseLang']['member']['bet']['canceled']),style: config.skin.memberBettingDetailStyle.status),
        ],
      ),
    );
  }

  //
  Widget _betOrderSummary(GameBetRecordDetailModel data) {
    return Column(
      children: <Widget>[
        _rowInfo(baseLang['order']['game'], '${data?.gameName}'),
        _rowInfo(baseLang['order']['orderDate'], data?.betTime != null ? yyyy_MM_dd_HH_mm_ss(data.betTime) : ''),
        _rowInfo(baseLang['order']['payOutDate'], data?.billTime != null ? yyyy_MM_dd_HH_mm_ss(data.billTime) : ''),
        _rowInfo(baseLang['order']['orderNo'], '${string(data?.id)}'),
        _rowInfo(baseLang['order']['orderMoney'], numString(data?.betAmount)),
        _rowInfo(baseLang['order']['okMoney'], numString(data?.betAmount)),
      ],
    );
  }

  ///
  Widget _gameItemSummary(GameBetRecordDetailModel data) {

    List<Widget> children = [];
    children.add(_gameTitle(config.langMap['baseLang']['member']['bet']['mainGame'],),);
    children.add(Offstage(offstage: data.isFree != 'N',child: _rowInfo(baseLang['order']['orderMoney'],  numString(data?.betAmount))),);
    //children.add(Offstage(offstage: data.isFree != 'N',child: _rowInfo('押注乘数', '',);
    children.add(_rowInfo(baseLang['order']['payOutMoney'], data.creditStatus == '1' ? '${numString(data?.payment)}' : (data.creditStatus == '0' ? '--' : '${numString(data?.betAmount)}')),);
    children.addAll(data?.displayData?.map((f){return _rowInfo(f.name, f.html);})?.toList());

    return Column(
      children: children,
    );
  }

  ///
  Widget _rowInfo(String key, String value) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          InterValHelper.w(12),
          Text('$key',style: config.skin.memberBettingDetailStyle.rowKey,),
          Expanded(
            child: SizedBox(),
          ),
          Text('$value',style: config.skin.memberBettingDetailStyle.rowValue.copyWith(fontFamily: config.skin.fontFimaly.money)),
          InterValHelper.w(20),
        ],
      ),
    );
  }

  ///
  Widget _gameTitle(String name, {String pic}) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 15, 20, 15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('$name',style: config.skin.memberBettingDetailStyle.gameName,),
          isNullOrEmpty(pic)
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.only(top: 15),
                  child: AiImage.fromUrl(pic, pic, BoxFit.fill),
                ),
        ],
      ),
    );
  }
}
