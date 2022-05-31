import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
import 'package:fast_ai/utils/ai_date.dart';
//import 'package:fast_ai/widgets/nokeybord_textfield.dart';
//import 'package:fast_ai/widgets/purekeyboard_textfield.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';

/*
 * @eureka
 * 投注记录的时间筛选控制器
 *
 * @wilson 20200513
 * 优化了数据选择逻辑：
 * 当未选择具体日期，则按日期选择 显示范围为今天，按月显示 显示为当月
 * 如已选择具体日期，则按日期选择 初始显示为该日期，按月显示 以结束日期对应月份显示
 * 如已选择具体月份，则按月显示 默认显示该选择的月份， 按日期显示 以选择月份的月初到月末
 *
 */
typedef Callback = void Function();

class BettingDateSelector extends StatefulWidget {
  BettingDateSelector({this.betFilterController, this.refresh, this.marginBottom = 0});

  final BetFilterController betFilterController;
  final Callback refresh;
  final double marginBottom;

  @override
  _BettingDateSelector createState() => _BettingDateSelector();
}

class _BettingDateSelector extends State<BettingDateSelector>
    with WidgetsBindingObserver {
  TextEditingController startController;
  TextEditingController endController;
  TextEditingController monthController;

  FocusElement currentFocusElement;

  bool _isResetting = false;

  @override
  void initState() {
    super.initState();
    this.startController = new TextEditingController();
    this.endController = new TextEditingController();
    this.monthController = new TextEditingController();

    _initDate();
  }

  void _initDate(){
    if (this.widget.betFilterController.filterChange !=
        BetFilterController.DAY) {
      this.monthController.text =
      this.widget.betFilterController.monthTmp.isNotEmpty
          ? this.widget.betFilterController.monthTmp
          : BetFilterController.MM_FORMAT.format(DateTime.now());
      currentFocusElement = FocusElement.month;
    } else {
      this.startController.text = this.widget.betFilterController.startDate ??
          BetFilterController.DD_FORMAT.format(DateTime.now());
      this.endController.text = this.widget.betFilterController.endDate ??
          BetFilterController.DD_FORMAT.format(DateTime.now());
      currentFocusElement = FocusElement.end;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[_header(), _body(), _footer(),SizedBox(height: widget.marginBottom ?? 0)]);
  }

  Widget _header() {
    var ret = Container(
      //头部
      color: Colors.white,
      height: 54,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.clear, size: 24.0, color: Colors.black),
              onPressed: () => Navigator.maybePop(context)),
          Center(
            child: Text(
                config.langMap['baseLang']['member']['bet']['chooseDate'],
                style: AiTextStyle(
                    fontSize: 16,
                    fontFamily: config.skin.fontFimaly.pingFang,
                    color: Color(0xFF000000))),
          )
        ],
      ),
    );
    return ret;
  }

  Widget _body() {

    EdgeInsets edgeInsets = config.isCnTwLang ? EdgeInsets.only(left: 20.0 , right: 20.0) : EdgeInsets.only(left: 8.0 , right: 8.0);
    Widget body =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12.0),
          padding:
              EdgeInsets.only(right: 8.0, left: 8.0, top: 7.0, bottom: 6.0),
//          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).backgroundColor,
          ),
          child: GestureDetector(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                        "${this.widget.betFilterController.filterChange == "DAY" ? config.langMap['baseLang']['member']['bet']['filterDate'] : config.langMap['baseLang']['member']['bet']['filterMonth']}",
                        style: AiTextStyle(
                            fontSize: 12, color: Color(0xFF000000))),
                    AiSvgPicture.asset(
                        "assets/images/search/icon_bethistory_switch_normal.svg")
                  ]),
              onTap: () {
                if (this.widget.betFilterController.filterChange ==
                    BetFilterController.DAY) {
                  this.widget.betFilterController.filterChange =
                      BetFilterController.MONTH;
                  currentFocusElement = FocusElement.month;
                  print('monthController.text:${this.monthController.text}');
                } else {
                  this.widget.betFilterController.filterChange =
                      BetFilterController.DAY;
                  if (this.startController.text.isEmpty) {
                    currentFocusElement = FocusElement.start;
                    print('startController.text:${this.startController.text}');
                  } else {
                    currentFocusElement = FocusElement.end;
                    print('endController.text:${this.endController.text}');
                  }
                }
                if (this.widget.betFilterController.filterChange !=
                    BetFilterController.DAY) {
                  this.monthController.text = this
                          .widget
                          .betFilterController
                          .monthTmp
                          .isNotEmpty
                      ? this.widget.betFilterController.monthTmp
                      : BetFilterController.MM_FORMAT.format(DateTime.now());
                  currentFocusElement = FocusElement.month;
                } else {
                  this.startController.text =
                      this.widget.betFilterController.startDate ??
                          BetFilterController.DD_FORMAT.format(DateTime.now());
                  this.endController.text =
                      this.widget.betFilterController.endDate ??
                          BetFilterController.DD_FORMAT.format(DateTime.now());
                  currentFocusElement = FocusElement.end;
                }

                if (this.mounted) this.setState(() {});
              }),
        ),
        this.widget.betFilterController.isHideDate
            ? Container(
                child: Row(children: <Widget>[
                this.widget.betFilterController.filterChange ==
                        BetFilterController.MONTH
                    ? SizedBox()
                    : GestureDetector(
                        child: Container(
//                          width: 60.0,
                          height: 28.0,
                          padding: edgeInsets,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(color: Color(0xFFCCCCCC), width: 1.0),
//                              image: DecorationImage(
//                                  image: AiImage.assetImage(
//                                      "assets/images/search/bg_bethostory_choice_normal.png"),
//                                  fit: BoxFit.cover)
                          ),
                          child: Center(
                              child: Text(
                                  "${config.langMap['baseLang']['utils']['date']['yesterday']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontWeight: FontWeight.w400)
                                      .copyWith(
                                          color: Color(0xFF4E2E09),
                                          fontSize: 12))),
                        ),
                        onTap: () {
                          DateTime yesterday =
                              DateTime.now().subtract(Duration(days: 1));
                          print(yesterday);
                          String yesterdayStr =
                              BetFilterController.DD_FORMAT.format(yesterday);

                          this.widget.betFilterController.beginTime =
                              DateTime.parse("$yesterdayStr 00:00:00")
                                  .millisecondsSinceEpoch
                                  .toString();
                          this.widget.betFilterController.endTime =
                              DateTime.parse("$yesterdayStr 23:59:59")
                                  .millisecondsSinceEpoch
                                  .toString();

                          String month =
                              BetFilterController.MM_FORMAT.format(yesterday);
                          this.widget.betFilterController.monthTmp = month;

                          _refreshParent();
                        }),
                InterValHelper.w(10),
                this.widget.betFilterController.filterChange ==
                        BetFilterController.MONTH
                    ? SizedBox()
                    : GestureDetector(
                        child: Container(
//                          width: 60.0,
                          height: 28.0,
                          padding: edgeInsets,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(color: Color(0xFFCCCCCC), width: 1.0),
//                              image: DecorationImage(
//                                  image: AiImage.assetImage(
//                                      "assets/images/search/bg_bethostory_choice_normal.png"),
//                                  fit: BoxFit.cover)
                          ),
                          child: Center(
                              child: Text(
                                  "${config.langMap['baseLang']['utils']['date']['week']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontWeight: FontWeight.w400)
                                      .copyWith(
                                          color: Color(0xFF4E2E09),
                                          fontSize: 12))),
                        ),
                        onTap: () {
                          DateTime today = DateTime.now();
                          DateTime monday = DateTime.now()
                              .subtract(Duration(days: today.weekday - 1));
                          DateTime sunday = monday.add(Duration(days: 6));
                          String mondayStr =
                              BetFilterController.DD_FORMAT.format(monday);
                          String sundayStr =
                              BetFilterController.DD_FORMAT.format(sunday);
                          print("本周开始时间:$mondayStr 本周结束时间:$sundayStr");
                          this.widget.betFilterController.beginTime =
                              DateTime.parse("$mondayStr 00:00:00")
                                  .millisecondsSinceEpoch
                                  .toString();
                          this.widget.betFilterController.endTime =
                              DateTime.parse("$sundayStr 23:59:59")
                                  .millisecondsSinceEpoch
                                  .toString();

                          String month =
                              BetFilterController.MM_FORMAT.format(sunday);
                          this.widget.betFilterController.monthTmp = month;

                          _refreshParent();
                        }),
                this.widget.betFilterController.filterChange ==
                        BetFilterController.DAY
                    ? SizedBox()
                    : GestureDetector(
                        child: Container(
//                          width: 60.0,
                          height: 28.0,
                          padding: edgeInsets,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(color: Color(0xFFCCCCCC), width: 1.0),
                          ),
                          child: Center(
                              child: Text(
                                  config.langMap['baseLang']['member']['bet']
                                      ['tabType']['lastMonth'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontWeight: FontWeight.w400)
                                      .copyWith(
                                          color: Color(0xFF4E2E09),
                                          fontSize: 12))),
                        ),
                        onTap: () {
                          DateTime today = DateTime.now();
                          DateTime monthOfBeginDay =
                              DateTime(today.year, today.month - 1, 1);
                          DateTime monthOfEndDay = AiDate.getEndMothDay(
                              monthOfBeginDay.millisecondsSinceEpoch);

                          String monthOfBeginDayStr = BetFilterController
                              .DD_FORMAT
                              .format(monthOfBeginDay);
                          String monthOfEndDayStr = BetFilterController
                              .DD_FORMAT
                              .format(monthOfEndDay);
                          print(
                              "上月开始时间:$monthOfBeginDayStr 上月结束时间:$monthOfEndDayStr");
                          this.widget.betFilterController.beginTime =
                              DateTime.parse("$monthOfBeginDayStr 00:00:00")
                                  .millisecondsSinceEpoch
                                  .toString();
                          this.widget.betFilterController.endTime =
                              DateTime.parse("$monthOfEndDayStr 23:59:59")
                                  .millisecondsSinceEpoch
                                  .toString();

                          String month = BetFilterController.MM_FORMAT
                              .format(monthOfBeginDay);
                          this.widget.betFilterController.monthTmp = month;

                          _refreshParent();
                        }),
                InterValHelper.w(10),
                GestureDetector(
                    child: Container(
//                      width: 60.0,
                      height: 28.0,
                      padding: edgeInsets,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        border: Border.all(color: Color(0xFFCCCCCC), width: 1.0),
                      ),
                      child: Center(
                          child: Text(
                              config.langMap['baseLang']['member']['bet']
                                  ['tabType']['thisMonth'],
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontWeight: FontWeight.w400)
                                  .copyWith(
                                      color: Color(0xFF4E2E09), fontSize: 12))),
                    ),
                    onTap: () {
                      DateTime today = DateTime.now();
                      DateTime monthOfBegin =
                          DateTime(today.year, today.month, 1);
                      DateTime monthOfEnd = AiDate.getEndMothDay(
                          monthOfBegin.millisecondsSinceEpoch);
                      String monthOfBeginDayStr =
                          BetFilterController.DD_FORMAT.format(monthOfBegin);
                      String monthOfEndDayStr =
                          BetFilterController.DD_FORMAT.format(monthOfEnd);
                      print(
                          "本月开始时间:$monthOfBeginDayStr 本月结束时间:$monthOfEndDayStr");
                      this.widget.betFilterController.beginTime =
                          DateTime.parse("$monthOfBeginDayStr 00:00:00")
                              .millisecondsSinceEpoch
                              .toString();
                      this.widget.betFilterController.endTime =
                          DateTime.parse("$monthOfEndDayStr 23:59:59")
                              .millisecondsSinceEpoch
                              .toString();

                      String thisMonth =
                          BetFilterController.MM_FORMAT.format(today);
                      this.widget.betFilterController.monthTmp = thisMonth;

                      _refreshParent();
                    })
              ]))
            : SizedBox()
      ]),
      Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          padding: EdgeInsets.only(top: 50.0),
          child: this.widget.betFilterController.filterChange == "DAY"
              ? Row(children: <Widget>[
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          currentFocusElement = FocusElement.start;
                          if(mounted){
                            setState(() {});
                          }
                        },
                        child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: currentFocusElement == FocusElement.start ? config.customStyle.themeColor : Colors.black, width: 0.8))),
                            child: Text("${this.startController.text}",textAlign: TextAlign.center,),
                        ),
                      ),
                      flex: 1),
                  Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                          config.langMap['baseLang']['member']['bet']['to'],
                          style: AiTextStyle(
                              color: Color(0xFF000000), fontSize: 12))),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        currentFocusElement = FocusElement.end;
                        if(mounted){
                          setState(() {});
                        }
                      },
                      child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: currentFocusElement == FocusElement.end ? config.customStyle.themeColor : Colors.black, width: 0.8))),
                          child: Text("${this.endController.text}",textAlign: TextAlign.center,),
                      ),
                    ),
                    flex: 1,
                  )
                ])
              : Center(
                  child: InkWell(
                    onTap: (){
                      currentFocusElement = FocusElement.month;
                      if(mounted){
                        setState(() {});
                      }
                    },
                    child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: currentFocusElement == FocusElement.month ? config.customStyle.themeColor : Colors.black, width: 0.8))),
                        child: Text("${this.monthController.text}",textAlign: TextAlign.center,),
                    ),
                  ))),
      Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(top: 20.0, right: 8.0),
                  /*child: AiSvgPicture.asset('assets/images/delete.svg')*/),
              /*onTap: _reset*/)),
      Container(
        //color: Colors.red,
        child: Stack(
          children: [
            Offstage(
              offstage: currentFocusElement == FocusElement.month,
              child: _isResetting ? Container(height: 210,) : _getDatePickerWidget(initialDateTime()),
            ),
            Offstage(
              offstage: currentFocusElement != FocusElement.month,
              child: _isResetting ? Container(height: 210,) : _getDatePickerWidget(initialDateTime()),
            ),
          ],
        ),
      )
    ]);

    return Container(color: Colors.white, child: body);
  }

  Widget _getDatePickerWidget(DateTime dateTime) {
    return Container(
      height: 210,
      child: DatePickerWidget(
          onMonthChangeStartWithFirstDate: false,
          maxDateTime: DateTime.now(),
          initialDateTime: dateTime,
          dateFormat: this.widget.betFilterController.filterChange ==
                  BetFilterController.DAY
              ? BetFilterController.YYYYMMDD
              : BetFilterController.YYYYMM,
          locale: DateTimePickerLocale.zh_cn,
          pickerTheme: DateTimePickerTheme(
              backgroundColor: Colors.white,
              showTitle: false,
              confirm: null,
              cancel: null),
          onChange: (DateTime date, a) {
            String dateStr = this.widget.betFilterController.filterChange ==
                    BetFilterController.DAY
                ? BetFilterController.DD_FORMAT.format(date)
                : BetFilterController.MM_FORMAT.format(date);
            if (this.widget.betFilterController.filterChange ==
                BetFilterController.DAY) {
              if (currentFocusElement == FocusElement.start){
                this.startController.text = dateStr;
              }
              if (currentFocusElement == FocusElement.end) {
                this.endController.text = dateStr;
              }
            } else {
              this.monthController.text = dateStr;
            }
            if(mounted){
              setState(() {});
            }
          }),
    );
  }

  DateTime preDateTime;

  DateTime initialDateTime() {
    DateTime selectedDateTime;
    if (this.widget.betFilterController.filterChange !=
        BetFilterController.DAY) {
      if (currentFocusElement != FocusElement.month) {
        currentFocusElement = FocusElement.month;
      }
      if (this.widget.betFilterController.monthTmp.isNotEmpty) {
        selectedDateTime = DateTime.parse(
            '${this.widget.betFilterController.monthTmp}-01 00:00:00');
      } else {}
    } else {
      if (currentFocusElement == FocusElement.start) {
        if (this.startController.text.isNotEmpty) {
          selectedDateTime = DateTime.parse(this.startController.text);
        }
      } else if (currentFocusElement == FocusElement.end) {
        if (this.endController.text.isNotEmpty) {
          selectedDateTime = DateTime.parse(this.endController.text);
        }
      }
    }
    DateTime nowDateTime = selectedDateTime ?? DateTime.now();
    preDateTime = nowDateTime;
    return nowDateTime;
  }

  Widget _footer() {
    return Container(
      //下面的按钮
//      padding: EdgeInsets.only(bottom: 15),
      height: 62,
      color: config.skin.colors.bgColorLocal,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Theme.of(context).backgroundColor,
                                  width: 1))),
                      child: Center(
                          child: Container(
                        //padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                            config.langMap['baseLang']['member']['bet']
                                ['reset'],
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontWeight: FontWeight.w400)
                                .copyWith(color: Colors.grey, fontSize: 14)),
                      ))),
                  onTap: _reset)),
          Expanded(
              flex: 1,
              child: InkWell(
                  child: Container(
                    //color: config.skin.colors.attentionColor1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: config.customStyle.themeLinearColor),
                    ),
                    child: Center(
                        child: Container(
                            //padding: EdgeInsets.only(bottom: 15),
                            child: Text("${config.langMap['baseLang']['ok']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.w400)
                                    .copyWith(
                                        color: config
                                            .customStyle.themeIncludeFontColor,
                                        fontSize: 14)))),
                  ),
                  onTap: () {
                    if (this.widget.betFilterController.filterChange ==
                        BetFilterController.DAY) {
                      if (this.startController.text.isEmpty ||
                          this.endController.text.isEmpty) {
                        _refreshParent();
                        return;
                      }
                      //不能跨年筛选判断
                      DateTime beginDateTime = DateTime.parse(
                          "${this.startController.text} 00:00:00");
                      DateTime endDateTime =
                          DateTime.parse("${this.endController.text} 23:59:59");

                      // //不能跨年
                      // if (beginDateTime.year != endDateTime.year) {
                      //   Flushbar(
                      //     title:
                      //         "${config.langMap['baseLang']['message']['title']}",
                      //     message: config.langMap['baseLang']['member']
                      //         ['noFilterNextYear'],
                      //     duration: Duration(seconds: 1),
                      //   ).show(context);
                      //   return;
                      // }

                      //开始时间不能大于结束时间
                      if (!beginDateTime.isBefore(endDateTime)) {
                        Flushbar(
                          title:
                              "${config.langMap['baseLang']['message']['title']}",
                          message:
                              "${config.langMap['baseLang']['msgBar']['biannually']['content']}",
                          duration: Duration(seconds: 1),
                        ).show(context);
                        return;
                      }

                      //只能查询90天以内的记录！
                      if (DateTime.now().difference(beginDateTime).inDays >
                          90) {
                        Flushbar(
                          title:
                              "${config.langMap['baseLang']['message']['title']}",
                          message: config.baseLang['member']['bet']['selectLimitTip'],
                          duration: Duration(seconds: 1),
                        ).show(context);
                        return;
                      }

                      this.widget.betFilterController.beginTime =
                          beginDateTime.millisecondsSinceEpoch.toString();
                      this.widget.betFilterController.endTime =
                          endDateTime.millisecondsSinceEpoch.toString();
                      this.widget.betFilterController.monthTmp =
                          BetFilterController.MM_FORMAT.format(endDateTime);
                      this.monthController.clear();
                    } else {
                      if (this.monthController.text.isEmpty) {
                        _refreshParent();
                        return;
                      }
                      this.widget.betFilterController.monthTmp =
                          this.monthController.text;
                      DateTime monthDateTime =
                          DateTime.parse(this.monthController.text + "-01");
                      //获取本月最后一天
                      DateTime lastDay = AiDate.getEndMothDay(
                          monthDateTime.millisecondsSinceEpoch);
                      DateTime firstDay = DateTime.parse(
                          "${AiDate.format("yyyy-MM", lastDay.millisecondsSinceEpoch)}-01");
                      print("第一天: $firstDay 最后一天: $lastDay");
                      this.widget.betFilterController.beginTime =
                          firstDay.millisecondsSinceEpoch.toString();
                      this.widget.betFilterController.endTime =
                          lastDay.millisecondsSinceEpoch.toString();
                    }

                    this.widget.refresh();
                    Future.delayed(Duration(milliseconds: 100), () {
                      Navigator.maybePop(context);
                    });
                  }))
        ],
      ),
    );
  }

  //重置
  void _reset() {
    this.startController.clear();
    this.endController.clear();
    this.monthController.clear();
    this.widget.betFilterController.beginTime = "";
    this.widget.betFilterController.endTime = "";
    this.widget.betFilterController.monthTmp = "";
    _initDate();
    _isResetting = true;
    if(mounted){
      setState(() {});
    }
    WidgetsBinding.instance.addPostFrameCallback((_){
      _isResetting = false;
      if(mounted){
        setState(() {});
      }
      showToas(config.baseLang['member']['bet']['resetSuccess']);
    });

  }

  void _refreshParent() {
    this.widget.refresh();
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.maybePop(context);
    });
  }
}

enum FocusElement{
  start,end,month,
}