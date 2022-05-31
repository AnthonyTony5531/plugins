import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static String toMMdd(String date) {
    var formatter = DateFormat('MM-dd');
    return formatter.format(DateTime.tryParse(date));
  }

  static String toMMddHHmm(String date) {
    var formatter = DateFormat('MM月dd日 HH:mm');
    return formatter.format(DateTime.tryParse(date));
  }

  static String toyyyyMMddHHmm(String date) {
    var formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(DateTime.tryParse(date));
  }

  static String getCurrentDate() {
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(DateTime.now());
  }

  static String getCurrentYearMonthDay() {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.now());
  }

  static String ddMMHHmm(num dateTime) {
    var formatter = DateFormat('dd/MM HH:mm');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(dateTime));
  }

  static Duration dateDifferent(String date) {
    if (date == null) return Duration.zero;
    DateTime systemDate = DateTime.now();
    DateTime endDate = DateTime.tryParse(date);
    Duration duration = endDate.difference(systemDate);
    return duration;
  }
}


