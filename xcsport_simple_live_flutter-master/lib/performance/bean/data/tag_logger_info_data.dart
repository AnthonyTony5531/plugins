import 'package:fast_ai/performance/bean/port/i_data.dart';

/// @author grey
/// Function : 标签日志信息

class TagLoggerInfoData extends IData {
  String tag;
  String message;
  dynamic stack;
  DateTime createDate;

  TagLoggerInfoData() {
    createDate = DateTime.now();
  }

  @override
  String toString() {
    return 'TagLoggerInfoData{tag: $tag \n, message: $message \n, stack: $stack \n, createDate: ${createDate.toIso8601String()} \n';
  }

  @override
  getValue() => this.toString();

  String get simpleString {
    if (stack != null && stack.isNotEmpty) {
      return toString();
    }
    return message ?? '';
  }

  String get tagStr => '标签 : $tag';

  String get createTimeStr => '创建时间 : ${createDate.toIso8601String()}';

  String get messageStr => '日志 : \n$message';

  String get stackStr => '堆栈 : \n$stack';

  num get createTime => createDate.millisecondsSinceEpoch;
}
