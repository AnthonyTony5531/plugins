import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：时期选择 的 日期显示面板
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/date_selector/date_selector_model.dart';
import 'package:fast_ai/widgets/date_selector/date_selector_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectorPanel extends StatelessWidget {
  final DateSelectorModel model;
  final DateTime displayMouth;
  final DateTime selectedDate;
  final Map<String, String> subTitles;
  final ValueChanged<DateTime> dateSelected;
  final DateSelectorStyle style;
  final bool isAllDate;
  DateSelectorPanel({
    Key key,
    @required this.displayMouth,
    @required this.selectedDate,
    @required this.subTitles,
    @required this.dateSelected,
    @required this.style,
    @required this.model,
    this.isAllDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createDivideLine(), //分隔线
        createTitle(context), //星期几
        createDay(context, 0),
        createDivideLine(), //分隔线
        createDay(context, 1),
        createDivideLine(), //分隔线
        createDay(context, 2),
        createDivideLine(), //分隔线
        createDay(context, 3),
        createDivideLine(), //分隔线
        createDay(context, 4),
        //createDivideLine(), //分隔线
        createDay(context, 5),
      ],
    );
  }

  Widget createDivideLine() {
    return Container(
        width: double.infinity, height: 1, color: Color(0xFFEEEEEE)); //分隔线
  }

  static var _days = [
    config.langMap['baseLang']['widgets']['dateSelector']['days']['sun'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['mon'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['tue'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['wed'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['thu'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['fri'],
    config.langMap['baseLang']['widgets']['dateSelector']['days']['sat']
  ];
  Widget createTitle(BuildContext context) {
    return Container(
        //星期几
        width: double.infinity,
        height: style.dateLineHeight - 10,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _days
                .map((f) => Text(f, style: style.dateTitleStyle))
                .toList()));
  }

  //创建日期显示列
  Widget createDay(BuildContext context, int idx) {
    if (displayMouth == null) return Container();
    var mouthDays = List<DateTime>();
    var date = DateTime(displayMouth.year, displayMouth.month, 1);
    // mouthDays.addAll(List<DateTime>.filled(date.weekday - 1, null));
    // hank 日期与星期对不上 5570
    mouthDays.addAll(List<DateTime>.filled(date.weekday, null));
    for (var i = 1; i <= 31; i++) {
      var year = date.year;
      var mouth = date.month;
      var dd = DateTime(year, mouth, i);
      if (dd.month == date.month) {
        mouthDays.add(dd);
      }
    }

    mouthDays.addAll(List<DateTime>.filled(14, null));
    bool isEmpty = true;
    var ret = Container(
        width: double.infinity,
        height: style.dateLineHeight,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: mouthDays.skip(idx * 7).take(7).map((f) {
              bool isEnable = model.isEnable(f);
              var dateStyle = AiTextStyle(
                  color: isSelectedDay(f)
                      ? config.customStyle.themeIncludeFontColor
                      : config.skin.colors.fontColorDark,
                  fontWeight: config.skin.fontWeight.medium,
                  fontFamily: config.skin.fontFimaly.liGothicMed);

              var subTitleStyle = style.subTitleStyle;
              if (!isEnable) {
                dateStyle = style.dateDisableStyle;
                subTitleStyle = style.subDisableTitleStyle;
              }
              if (f != null) isEmpty = false;
              var subTitle = getSubTitle(f);
              return GestureDetector(
                onTap: () => selectDate(f),
                child: Container(
                  width: style.dateLineHeight - style.datePanddingSize,
                  height: style.dateLineHeight - style.datePanddingSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isSelectedDay(f)
                        ? config.customStyle.themeColor
                        : Color(0),
                  ),
                  child: isNullOrEmpty(subTitle)
                      ? Text(f == null ? "" : f.day.toString(),
                          style: dateStyle)
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(f == null ? "" : f.day.toString(),
                                style: dateStyle),
                            Text(getSubTitle(f), style: isSelectedDay(f) ? subTitleStyle.copyWith(color: config.customStyle.themeIncludeFontColor): subTitleStyle),
                          ],
                        ),
                ),
              );
            }).toList()));
    //去掉空行
    if (isEmpty) {
      return Container();
    }
    return ret;
  }

  String getSubTitle(DateTime date) {
    if (date == null) return "";
    if (subTitles == null) return "";
    var dateStr = DateFormat("yyyy-MM-dd").format(date);
    if (subTitles.containsKey(dateStr)) return subTitles[dateStr];
    return "";
  }

  selectDate(DateTime date) {
    if (date == null) return;

    bool isEnable = model.isEnable(date);
    if (!isEnable) return;

    if (dateSelected != null) dateSelected(date);
  }

  bool isSelectedDay(DateTime date) {
    if (selectedDate == null) return false;
    if (date == null) return false;
    if (isAllDate) {
      bool isEnable = model.isEnable(date);
      return isEnable;
    }

    if (selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day) {
      bool isEnable = model.isEnable(date);
      if (!isEnable) {
        doSelectEnableDate();
        return false;
      }
      return true;
    }
    return false;
  }

  doSelectEnableDate() async {
    var date = DateTime(displayMouth.year, displayMouth.month, 1);
    for (var i = 0; i < 31; i++) {
      var enable = model.isEnable(date);
      if (enable) {
        if (dateSelected != null) await sleep(10);
        dateSelected(date);
        return;
      }
      date = date.add(Duration(days: 1));
    }
  }
}
