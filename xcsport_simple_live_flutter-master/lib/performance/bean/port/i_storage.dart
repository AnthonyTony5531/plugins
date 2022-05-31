import 'package:fast_ai/performance/bean/port/i_data.dart';

/// @author grey
/// Function : 

abstract class IStorage {

  bool save(IData data);

  bool contains(IData data);

  List<IData> getAll();

  void clear();

}