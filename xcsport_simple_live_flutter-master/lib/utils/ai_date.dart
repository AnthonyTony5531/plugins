
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/*
 * NOTE 中国的时区'东八区'与中时区相差8小时
 */
class AiDate {
  static String format(String format, dynamic timestamp) {
    initializeDateFormatting('zh_CN');
    var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(format, 'zh_CN').format(dt);
  }

  static String now(String format, {DateTime dateTime}) {
    initializeDateFormatting('zh_CN');
    return DateFormat(format, 'zh_CN').format(dateTime ?? DateTime.now());
  }

  //YYYYMMddHHmmss 转 MM-dd HH:mm
  static String formatMMddHHmm(String data){
   var result;
   try{
     var parseDate = DateTime.parse(data);
     initializeDateFormatting('zh_CN');
     result = DateFormat("MM-dd HH:mm", 'zh_CN').format(parseDate);
   }catch(e){
     print(e);
   }
   return result;
  }

  //获取某月最后一天
  static DateTime getEndMothDay(int timestamp){
    DateTime currentDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    DateTime nextMonthDateTime = new DateTime(currentDateTime.year,currentDateTime.month+1,1);

    DateTime endMonthOfDay = nextMonthDateTime.subtract(Duration(days: 1));
    return endMonthOfDay;
  }

  static String getFormatDate(String dateString,{String format = 'yyyy-MM-dd HH:mm:ss'}){

    DateTime dateTime = DateTime.parse(dateString);
    String dateStr = AiDate.format(format, dateTime.millisecondsSinceEpoch);
    return dateStr;
  }

  static int getDateTimestamp(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.millisecondsSinceEpoch;
  }

  ///
  static int getFormatTimestamp(int timestamp){
    String format = 'yyyy-MM-dd';
    String dateStr = AiDate.format(format, timestamp);
//    print('当天时间-----：$dateStr');
    var parseDate = DateTime.parse(dateStr);
    return parseDate.millisecondsSinceEpoch;
  }

  static String getDateString(int number){
    String date = '';
    if (number.toString().length >= 2) {
      date = number.toString();
    } else {
      date = '0$number';
    }
    return date;
  }

  // 倒计时
  static String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;

    if(hour != 0){
      return '${getDateString(hour)}:${getDateString(minute)}:${getDateString(second)}';
    }else if(minute !=0){
      return '${getDateString(minute)}:${getDateString(second)}';
    }else if(second!=0){
      return '${getDateString(second)}';
    }else {
      return '';
    }
  }
}