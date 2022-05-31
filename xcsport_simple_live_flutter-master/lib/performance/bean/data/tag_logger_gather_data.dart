import 'dart:collection';

import 'package:fast_ai/performance/bean/data/tag_logger_info_data.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';


/// @author grey
/// Function : 标签日志 - 集合item

class TagLoggerGatherData extends IData {
  static final loggerGatherMax = 255;

  Queue<TagLoggerInfoData> loggers = Queue<TagLoggerInfoData>();

  void addData(TagLoggerInfoData data) {
    if (loggers.length > loggerGatherMax) {
      loggers.removeFirst();
    }
    loggers.add(data);
  }

  void clean() => loggers.clear();

  @override
  getValue() => '';
}
