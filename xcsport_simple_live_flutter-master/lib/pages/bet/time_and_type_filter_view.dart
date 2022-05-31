import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/net.dart';
//import 'package:fast_ai/models/bet_order_record/game_type_model.dart';
import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import 'package:fast_ai/pages/bet/betting_date_selector.dart';
import 'package:fast_ai/pages/bet/game_type_model.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
//import 'package:fast_ai/pages/member/betting/betting_date_selector.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as _convert;
import 'member_game_type_selector.dart';

class TimeAndTypeFilterView extends StatefulWidget {
  final Function(String start, String end) timeFilterRange;
  final Function(String type) typeFilterRange;
  final BetFilterController betFilterController;
  final String gameKey;

  TimeAndTypeFilterView({
    Key key,
    this.timeFilterRange,
    this.typeFilterRange,
    this.betFilterController,
    this.gameKey,
  }) : super(key: key);

  @override
  _TimeAndTypeFilterViewState createState() => _TimeAndTypeFilterViewState();
}

class _TimeAndTypeFilterViewState extends State<TimeAndTypeFilterView> {
  String beginDate = "";
  String endDate = "";
  int filterIndex = 2;
  List<GameTypeInfo> gameTypeInfoList;

  @override
  void initState() {
    super.initState();

    getGameTypeInfo();
  }

  void getGameTypeInfo() async {
    var jsonStr = ccCache.getString('game.type.info', null);
    if (jsonStr != null) {
      var list = _convert.jsonDecode(jsonStr) as List;
      gameTypeInfoList = list?.map((e) => GameTypeInfo.fromMap(e))?.toList() ?? [];
      if(isNotEmpty(widget.gameKey)){
        var type = gameTypeInfoList?.firstWhere((e) => e.gameKey == widget.gameKey,orElse: ()=>null);
        if(type != null){

        }
      }
    }
    var model = await Net.getGameType({'supplierId': 'aigame'});
    if (model.isSuccess) {
      gameTypeInfoList = model.list;
      ccCache.setString('game.type.info', model.listJsonStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Text("${widget.betFilterController.dateFilterStr}", style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14).copyWith(fontWeight: FontWeight.w400)),
                  Icon(Icons.keyboard_arrow_down, color: Theme.of(context).textTheme.caption.color)
                ]),
              ),
              onTap: () {
                widget.betFilterController.isSport = true;
                showPopup(context, BettingDateSelector(betFilterController: widget.betFilterController, refresh: _refresh));
              }),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Text("${widget.betFilterController.filterGameTypeStr}", style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14).copyWith(fontWeight: FontWeight.w400)),
                  Icon(Icons.keyboard_arrow_down, color: Theme.of(context).textTheme.caption.color)
                ]),
              ),
              onTap: () {
                widget.betFilterController.isSport = true;
                showPopup(context, MemberGameTypeSelector(betFilterController: widget.betFilterController, refresh: _refreshType, gameTypeInfoList: gameTypeInfoList));
              }),
        ],
      ),
    );
  }

  void _refresh() {
    this.filterIndex = -1;

    if (widget.betFilterController.beginTime.isEmpty && widget.betFilterController.endTime.isEmpty) {
      this.beginDate = "";
      this.endDate = "";
    } else {
      this.beginDate = DateTime.parse("${AiDate.format("yyyy-MM-dd", int.parse(widget.betFilterController.beginTime))} 00:00:00").millisecondsSinceEpoch.toString();
      this.endDate = DateTime.parse("${AiDate.format("yyyy-MM-dd", int.parse(widget.betFilterController.endTime))} 23:59:59").millisecondsSinceEpoch.toString();
    }

    print("开始时间: $beginDate");
    print("结束时间: $endDate");
    if (this.mounted) this.setState(() {});

    if (widget.timeFilterRange != null) {
      widget.timeFilterRange(beginDate, endDate);
    }
  }

  void _refreshType() {
    widget.typeFilterRange?.call(widget.betFilterController.gameType);
  }
}
