
import 'package:fast_ai/utils/util.dart';
import 'package:intl/intl.dart';

class DateUtil{


  ///
  ///
  ///
  static int getGameDate(String ed,String et){
    if(isNullOrEmpty(ed) || !ed.contains('/')){
      return 0;
    }
    List<String> dayMonth = ed.split('/');
    if(dayMonth.length < 2){
      return 0;
    }
    DateTime today = DateTime.now();
    DateTime year = DateTime(today.year);
    String yyyy = DateFormat("yyyy").format(year);
    if(isNullOrEmpty(et)){
      return DateTime.parse("$yyyy-${dayMonth[1]}-${dayMonth[0]} 00:00:00").millisecondsSinceEpoch;
    } else if(et.length > 5){
      return DateTime.parse("$yyyy-${dayMonth[1]}-${dayMonth[0]} $et").millisecondsSinceEpoch;
    } else {
      return DateTime.parse("$yyyy-${dayMonth[1]}-${dayMonth[0]} $et:00").millisecondsSinceEpoch;
    }
  }
}