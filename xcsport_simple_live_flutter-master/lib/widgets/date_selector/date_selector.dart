import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：时期选择
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_selector_model.dart';
import 'date_selector_panel.dart';
import 'date_selector_style.dart';

class DateSelector extends StatefulWidget {
  final DateSelectorModel model;
  final DateSelectorStyle style;
  //是否禁用了
  final bool disable;
  final ValueChanged<DateTime> onDateChanged;
  //是否显示全部按钮
  final bool showAllBtn;
  final bool onlyMouthHeight;
  final bool exitWhenSelected;
  final VoidCallback onClose;
  DateSelector(
      {Key key,
      this.model,
      this.style,
      this.onDateChanged,
      this.disable = false,
      this.showAllBtn = false,
      this.onlyMouthHeight = false,
      this.exitWhenSelected = false,
      this.onClose})
      : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final defaultStyle = DateSelectorStyle();
  final defaultModel = DateSelectorModel();
  DateSelectorStyle get style {
    return widget?.style ?? defaultStyle;
  }

  DateSelectorModel get model {
    return widget?.model ?? defaultModel;
  }

  DateTime currentDate = DateTime.now();
  bool isAllDate = false;

  @override
  void initState() {
    currentDate = model.currentDate;
    isAllDate = false;
    if (currentDate == null) {
      currentDate = DateTime.now();
      isAllDate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!style.olnyBody) {
      return Column(children: <Widget>[
        createHeader(),
        createDivideLine(), //分隔线
        createSelectMonthBtn(context),
        createDatePanel(),
        Container(width: double.infinity, height: 30, color: Colors.white), //底部
      ]);
    } else {
      return Column(children: <Widget>[
        createSelectMonthBtn(context),
        createDatePanel(),
      ]);
    }
  }

  Widget createDivideLine() {
    return Container(
        width: double.infinity, height: 1, color: Color(0xFFEEEEEE)); //分隔线
  }

  Widget createHeader() {
    if (widget.onlyMouthHeight) return Container();
    return Container(
      //头部
      color: Colors.white,
      height: style.headerHeight,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.clear, size: 24.0, color: Color(0xFF555555)),
            onPressed: () => exitSelector(),
          ),
          Center(
            child: Text(model.title,
                style: AiTextStyle(
                  fontSize: 16,
                  fontFamily: config.skin.fontFimaly.pingFang,
                )),
          )
        ],
      ),
    );
  }

  //顶上的月份条
  Widget createSelectMonthBtn(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        //选择月份
        width: double.infinity,
        height: style.mouthHeight + (widget.onlyMouthHeight ? 10.0 : 0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            enablePreMouth
                ? IconButton(
                    icon: AiImage.asset(
                        "assets/images/public/icon_calendar_arrow_left.png"),
                    onPressed: decMouth)
                : Container(
                    width: 44,
                    height: 24,
                  ),
            Container(
              child: Text(DateFormat("yyyy-MM").format(currentDate)),
            ),
            enableNextMouth
                ? IconButton(
                    icon: AiImage.asset(
                        "assets/images/public/icon_calendar_arrow_right.png"),
                    onPressed: addMouth)
                : Container(
                    width: 44,
                    height: 24,
                  ),
          ],
        ),
      ),
      Positioned(
          //全部
          top: 5,
          right: 20,
          child: createAllBtn()),
      Positioned(
        //全部
        top: 10,
        left: 10,
        child: InkWell(
          child: Icon(Icons.clear, size: 26.0, color: Color(0xFF555555)),
          onTap: () => exitSelector(),
        ),
      )
    ]);
  }

  Widget createAllBtn() {
    if (!widget.showAllBtn) return Container();

    var allBtn = Text(
      config.langMap['baseLang']['all'],
      style: AiTextStyle(
          fontSize: 12,
          color: isAllDate
              ? config.customStyle.themeIncludeFontColor
              : config.skin.colors.fontColorDark,
          fontWeight: config.skin.fontWeight.medium),
    );
    bool nohasAllCount = isNullOrEmpty(model.allCount);
    // print('nohasAllCount $nohasAllCount');
    var ret = InkWell(
      onTap: onAllTap,
      child: ClipOval(
        //borderRadius: BorderRadius.circular(50),
        child: Container(
          width: style.mouthHeight - 10,
          height: style.mouthHeight - 10,
          alignment: Alignment(0, 0),
          color: isAllDate ? config.customStyle.themeColor : Colors.transparent,
          child: nohasAllCount
              ? allBtn
              : TitleText(
                  position: TitlePosition.Top,
                  spanSize: 1,
                  title: allBtn,
                  text: Text("${model.allCount}",
                      style: AiTextStyle(
                        fontSize: 9,
                        color: isAllDate
                            ? config.customStyle.themeIncludeFontColor
                            : config.skin.colors.fontColorDark,
                      )),
                ),
        ),
      ),
    );
    return ret;
  }

  Widget createDatePanel() {
    return DateSelectorPanel(
      style: style,
      displayMouth: currentDate,
      selectedDate: currentDate,
      subTitles: model.subTitles,
      dateSelected: dateSelected,
      model: model,
      isAllDate: isAllDate,
    );
  }

  bool get enableNextMouth {
    //禁用了
    if (widget.disable) return false;
    if (currentDate == null) return false;

    var year = currentDate.year;
    var mouth = currentDate.month;
    var day = currentDate.day;
    mouth = (mouth + 1);
    year = year + (mouth - 1) ~/ 12;
    mouth = (mouth - 1) % 12 + 1;
    var newDate = DateTime(year, mouth, day);
    if (newDate.month != mouth) newDate = DateTime(year, mouth, 1);
    //下个月无效
    if (!model.isEnable(DateTime(year, mouth, 1))) {
      return false;
    }
    return true;
  }

  void addMouth() {
    //禁用了
    if (widget.disable) return;
    if (currentDate == null) return;

    var year = currentDate.year;
    var mouth = currentDate.month;
    var day = currentDate.day;
    mouth = (mouth + 1);
    year = year + (mouth - 1) ~/ 12;
    mouth = (mouth - 1) % 12 + 1;
    var newDate = DateTime(year, mouth, day);
    if (newDate.month != mouth) newDate = DateTime(year, mouth, 1);
    //下个月无效
    if (!model.isEnable(DateTime(year, mouth, 1))) {
      return;
    }

    //无效时间
    if (!model.isEnable(newDate)) {
      newDate = model.endEnableDate;
    }

    // currentDate = newDate;
    dateSelected(newDate);
    // if(mounted){
    //   setState(() {});
    // }
  }

  bool get enablePreMouth {
    //禁用了
    if (widget.disable) return false;
    if (currentDate == null) return false;

    var year = currentDate.year;
    var mouth = currentDate.month;
    var day = currentDate.day;
    var preMouthLastDay = DateTime(year, mouth, 1).add(Duration(days: -1));
    //前一个月没有可用的时间
    if (!model.isEnable(preMouthLastDay)) {
      return false;
    }
    return true;
  }

  void decMouth() {
    //禁用了
    if (widget.disable) return;
    if (currentDate == null) return;

    var year = currentDate.year;
    var mouth = currentDate.month;
    var day = currentDate.day;
    var preMouthLastDay = DateTime(year, mouth, 1).add(Duration(days: -1));
    //前一个月没有可用的时间
    if (!model.isEnable(preMouthLastDay)) {
      return;
    }
    mouth = (mouth - 1);
    if (mouth == 0) {
      mouth = 12;
      year = year - 1;
    }
    var newDate = DateTime(year, mouth, day);
    if (newDate.month != mouth) newDate = DateTime(year, mouth, 1);

    //无效时间
    if (!model.isEnable(newDate)) {
      newDate = model.startDate;
    }
    // currentDate = newDate;
    dateSelected(newDate);
    // if(mounted){
    //   setState(() {});
    // }
  }

  exitSelector() {
    if (widget.onClose != null) {
      widget.onClose();
    }
    AiRouter.pop(context);
  }

  //全部
  onAllTap() {
    setState(() {
      isAllDate = !isAllDate;
      if (isAllDate)
        model.currentDate = null;
      else
        model.currentDate = currentDate;

      if (widget.onDateChanged != null) {
        widget.onDateChanged(model.currentDate);
        if (widget.exitWhenSelected) AiRouter.pop(context);
      }
    });
  }

  dateSelected(DateTime date) {
    if (date == null) return;

    //禁用了
    if (widget.disable) return;
    currentDate = date;
    isAllDate = false;
    if (mounted) {
      setState(() {});
    }
    if (widget.onDateChanged != null) {
      model.currentDate = currentDate;
      widget.onDateChanged(date);
      if (widget.exitWhenSelected) AiRouter.pop(context);
    } else {
      model.currentDate = currentDate;
      AiRouter.pop(context);
    }
  }
}
