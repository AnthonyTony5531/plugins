import 'dart:collection';

import 'package:fast_ai/performance/bean/data/http_gather_data.dart';
import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';


/// @author grey
/// Function : 网络请求存储类

class HttpInfoStorage extends IStorage {
  final HashMap<String, HttpGatherData> _maps = HashMap();

  @override
  void clear() => _maps.clear();

  @override
  bool contains(IData data) {
    if (data is HttpInfo && data.httpKey != null && data.httpKey != '') {
      return _maps.containsKey(data.httpKey);
    }
    return false;
  }

  @override
  List<IData> getAll() => _maps.values.toList() ?? [];

  @override
  bool save(IData data) {
    if (data is HttpInfo && data.httpKey != null && data.httpKey != '') {
      final httpGather = _maps[data.httpKey] ??= HttpGatherData(data.httpKey);
      httpGather.addData(data);
      _maps[data.httpKey] = httpGather;
      return true;
    }
    return false;
  }
}
