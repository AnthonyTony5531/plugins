import 'dart:collection';

import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';


/// @author grey
/// Function : 常用的存储类

class CommonStorage implements IStorage {
  final int maxCount;

  Queue<IData> items = Queue<IData>();

  CommonStorage({this.maxCount});

  @override
  void clear() => items.clear();

  @override
  bool contains(IData data) => items.contains(data);

  @override
  List<IData> getAll() => items.toList();

  @override
  bool save(IData data) {
    if (items.length >= maxCount) {
      items.removeFirst();
    }
    items.add(data);
    return true;
  }
}
