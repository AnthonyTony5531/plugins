import 'dart:async';
//import 'package:fast_ai/models/bet_order_record/game_type_model.dart';
import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import 'package:fast_ai/pages/bet/game_type_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
import 'package:fast_ai/widgets/view_helper.dart';

/*
 * @author eureka
 * 投注记录筛选项
 */
class MemberGameTypeSelector extends StatefulWidget {
  final BetFilterController betFilterController;
  final Function refresh;
  final double marginBottom;
  final Map gameTypes;
  final List<GameTypeInfo> gameTypeInfoList;

  MemberGameTypeSelector({this.betFilterController, this.refresh, this.marginBottom = 0,this.gameTypes,this.gameTypeInfoList});

  @override
  MemberGameTypeSelectorState createState() => MemberGameTypeSelectorState();
}

class MemberGameTypeSelectorState extends State<MemberGameTypeSelector> {
  var baseLang = config.langMap['baseLang'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      header(),
      body(),
      SizedBox(
        height: widget.marginBottom ?? 0,
      )
    ]);
  }

  ///
  Widget header() {
    var ret = Container(
      //头部
      color: Colors.white,
      height: 54,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.clear, size: 24.0, color: Colors.black),
            onPressed: () => Navigator.maybePop(context),
          ),
          Center(
            child: Text(
              AiJson(config.langMap).getString('baseLang.member.bet.filterByGameType'),
              style: AiTextStyle(
                fontSize: 16,
                fontFamily: config.skin.fontFimaly.pingFang,
                color: Color(0xFF000000),
              ),
            ),
          )
        ],
      ),
    );
    return ret;
  }

  ///
  Widget body() {
    Widget body = Row(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: sportFilter(),
      ),
    ]);

    return Container(color: Colors.white, child: body);
  }

  ///按体育项筛选
  Widget sportFilter() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: gameItemList(),
          ),
        ));
  }

  ///
  List<Widget> gameItemList() {
    double w = (MediaQuery.of(context).size.width - 80.0 * 4 - 16) / 3;

    Map sports = {};
    for(var e in widget?.gameTypeInfoList){
      sports[e.gameKey] = e.gameName;
    }
    //var allKey = {'all': config.langMap['baseLang']['all']};

    List gameTypeKeys = sports.keys.toList();
    //gameTypeKeys.insert(0, allKey.keys.first);

    Wrap wrapView = Wrap(
      spacing: w,
      runSpacing: 10,
      clipBehavior: Clip.antiAlias,
      children: gameTypeKeys.map((key) {
        if (key == 'all') {
          return filterBtn(
            config.langMap['baseLang']['all'],
            sportOnTab(''),
            isSelected: this.widget.betFilterController.gameType.isEmpty,
          );
        } else {
          return filterBtn(
            sports[key],
            sportOnTab(key),
            isSelected: this.widget.betFilterController.gameType == key,
          );
        }
      }).toList(),
    );

    return <Widget>[
      Text(
        AiJson(config.langMap).getString('baseLang.appMenuLaoniao.gameBetRecord'),
        style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400).copyWith(
              fontSize: 12,
              color: Color(0xFFA3A8B1),
            ),
      ),
      InterValHelper.h(5),
      wrapView,
    ];
  }

  Function sportOnTab(String val) {
    return () {
      this.widget.betFilterController.gameType = val;
      this.widget.betFilterController.parlayNum = '';

      if (this.mounted) this.setState(() {});
      this.widget.refresh();
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.maybePop(context);
      });
    };
  }

  Widget filterBtn(String str, Function onTab, {bool isSelected}) {
    final style = Theme.of(context).textTheme.caption.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: isSelected ? config.customStyle.themeIncludeFontColor : null,
        );
    return GestureDetector(
      child: Container(
        width: 80.0,
        height: 34.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? config.customStyle.themeColor : null,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: isSelected ? Colors.transparent : Theme.of(context).textTheme.caption.color, width: 1),
        ),
        child: Center(
          child: Text(
            str,
            maxLines: 2,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: onTab,
    );
  }
}
