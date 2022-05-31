import 'package:fast_ai/performance/bean/port/i_data.dart';

class LogInfoData extends IData {
  static const int TYPE_LOG = 1;
  static const int TYPE_DEBUG = 2;
  static const int TYPE_INFO = 3;
  static const int TYPE_WARN = 4;
  static const int TYPE_ERROR = 5;

  LogInfoData(this.type, this.msg) {
    timestamp = DateTime.now();
  }

  final int type;
  final String msg;
  DateTime timestamp;

  String get typeStr {
    switch (type) {
      case TYPE_LOG:
        return 'TYPE_LOG';
      case TYPE_DEBUG:
        return 'TYPE_DEBUG';
      case TYPE_INFO:
        return 'TYPE_INFO';
      case TYPE_WARN:
        return 'TYPE_WARN';
      case TYPE_ERROR:
        return 'TYPE_ERROR';
      default:
        return '';
    }
  }

  String get timestampStr => '创建时间:$toTimeString';

  String get msgStr => '日志信息:\n$msg';

  String get toTimeString => '${timestamp.hour}:${timestamp.minute}:${timestamp.second}.${timestamp.millisecond}';

  @override
  getValue() {
    return '';
  }
}
