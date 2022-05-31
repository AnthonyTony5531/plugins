
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import 'package:fast_ai/pages/bet/game/member_game_betting_tab_page.dart';
import 'package:fast_ai/pages/bet/time_and_type_filter_view.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
//import 'package:fast_ai/pages/member/betting/game/member_game_betting_tab_page.dart';
//import 'package:fast_ai/pages/member/betting/time_and_type_filter_view.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

class MemberGameBettingPage extends StatefulWidget {

  final String gameKey;

  const MemberGameBettingPage({Key key,this.gameKey = '',}):super(key: key);

  @override
  MemberGameBettingPageState createState() => MemberGameBettingPageState();
}

class MemberGameBettingPageState extends State<MemberGameBettingPage> {

  String beginDate = "";
  String endDate = "";

  GlobalKey<MemberGameBettingTabState> gameBettingKey = GlobalKey();
  BetFilterController _betFilterController = BetFilterController();

  @override
  void initState() {
    _monthInit();
    _betFilterController.gameType = widget.gameKey ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child:  Column(
          children: <Widget>[
            TimeAndTypeFilterView(timeFilterRange: _timeFilterRange,typeFilterRange: _typeFilterRange,betFilterController: _betFilterController,),
            InterValHelper.h(12),
            Expanded(child: MemberGameBettingTabPage(
              key: gameBettingKey,
              startDate: beginDate,
              endDate: endDate,
              isShowEmptyBtn: true,
              betFilterController: _betFilterController,
              refreshTimeAndTypeFilterView: _refreshTimeAndTypeFilterView,
            )),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AiAppBar(
      brightness: Brightness.light,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      title: AiAppBar(
        backgroundColor: Colors.white,
        title: Text(
          '投注记录',
          style: titleStyle,
        ),
        brightness: Brightness.light,
      ),
      leading:IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: Colors.black,
        ),
        onPressed: () {
          AiRouter.pop(context);
        },
      ),
    );
  }

  TextStyle get titleStyle => AiTextStyle(
    fontSize: config.skin.fontSize.h3,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: FontWeight.w500,
    color: Color(0xFF222222),
  );


  void _timeFilterRange(String start,String end){
    gameBettingKey.currentState.updateDate(start, end);
    print('beginDate$beginDate   endDate:$endDate');
  }

  void _typeFilterRange(String type){
    gameBettingKey.currentState.updateType(type);
    if(mounted){
      setState(() {});
    }
  }

  void _refreshTimeAndTypeFilterView(){
    if(mounted){
      setState(() {});
    }
  }

  //默认初始化选中当前月
  void _monthInit(){
    DateTime today = DateTime.now();
    DateTime monthOfBeginDay = DateTime(today.year,today.month,1);
    DateTime monthOfEndDay = AiDate.getEndMothDay(monthOfBeginDay.millisecondsSinceEpoch);

    String monthOfBeginDayStr =  AiDate.format("yyyy-MM-dd",monthOfBeginDay.millisecondsSinceEpoch);
    String monthOfEndDayStr = AiDate.format("yyyy-MM-dd",monthOfEndDay.millisecondsSinceEpoch);
    this.beginDate = DateTime.parse("$monthOfBeginDayStr 00:00:00").millisecondsSinceEpoch.toString();
    this.endDate = DateTime.parse("$monthOfEndDayStr 23:59:59").millisecondsSinceEpoch.toString();
    if(this.mounted){
      this.setState((){});
    }
  }


}
