import 'dart:collection';

import 'package:fast_ai/performance/bean/data/tag_logger_gather_data.dart';
import 'package:fast_ai/performance/bean/data/tag_logger_info_data.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';


/// @author grey
/// Function :

class TagLoggerStorage extends IStorage {
  final HashMap<String, TagLoggerGatherData> _map = HashMap();

  @override
  void clear() {
    _map.clear();
  }

  @override
  bool contains(IData data) {
    if (data is TagLoggerInfoData && data.tag != null && data.tag != '') {
      return _map.containsKey(data.tag);
    }
    return false;
  }

  @override
  List<IData> getAll() => _map.values.toList() ?? [];

  @override
  bool save(IData data) {
    if (data is TagLoggerInfoData && data.tag != null && data.tag != '') {
      final loggerGather = _map[data.tag] ??= TagLoggerGatherData();
      loggerGather.addData(data);
      _map[data.tag] = loggerGather;
      return true;
    }
    return false;
  }

  List<String> getKeys() => _map.keys.toList() ?? [];

  TagLoggerGatherData getLoggerInfoData(String key) {
    if (key == null) return null;
    if (key == '') return null;
    if (!_map.containsKey(key)) return null;
    return _map[key];
  }
}
