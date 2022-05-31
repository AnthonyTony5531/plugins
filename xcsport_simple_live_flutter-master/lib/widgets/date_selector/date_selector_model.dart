

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：时期选择
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:intl/intl.dart';

class DateSelectorModel {
  DateTime currentDate;
  String title;
  Map<String,String> subTitles;
  //设置启用的时间范围
  DateTime startDate;
  DateTime endDate;
  //全部数据
  String allCount = "";
  List<DateTime> enableDates;

  DateSelectorModel({
    this.currentDate,
    this.title, 
    this.subTitles,
    this.startDate,
    this.endDate
  }){
    if(this.currentDate==null)
      this.currentDate = DateTime.now();
    if(this.title == null)
      this.title = "${config.langMap['baseLang']['widgets']['dateSelector']['chooseDate']}";
    if(this.subTitles == null)
      this.subTitles = {};
  }

  DateTime get endEnableDate{
    if(endDate != null)
      return endDate;
    if(enableDates != null && enableDates.length > 0)
      return enableDates.last; 
    return null;
  }

  String getSubTitle(DateTime date){
    var dateStr = DateFormat("yyyy-MM-dd").format(date);
    if (subTitles.containsKey(dateStr)) {
        return subTitles[dateStr];
    }
    return "";
  }

  bool isEnable(DateTime date){
    if(date == null){
      //没有指定时期时不全选
      if(enableDates == null || enableDates.length == 0)
        return false;
      //指定了日期，date为空时，表示全选
      return true;
    }
    if(enableDates != null){
      return enableDates.contains(date);
    }
    try{
      var dd = DateTime(date.year,date.month,date.day);
      if(startDate != null){
        var start = DateTime(startDate.year,startDate.month,startDate.day);
        if(dd.difference(start).inDays < 0)
          return false;
      }
      if(endDate != null){
        var end = DateTime(endDate.year,endDate.month,endDate.day);
        if(dd.difference(end).inDays > 0)
          return false;
      }
      if(startDate == null && endDate == null && (enableDates == null || enableDates.length == 0)){
        //没有指定时期时不全选
        return false;
      }
      return true;
    }catch(e){
      logError(e);
      return false;
    }
  }

}

