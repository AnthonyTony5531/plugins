import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/query_kit.dart';
import 'package:fast_ai/performance/bean/tag_select_kit.dart';

/// @author grey
/// Function :

class CommonKitRouter {
  static const String KIT_QUERY = 'kit_query';
  static const String KIT_LOGGER_TAG = 'kit_logger_tag';
}

class CommonKitName {
  static const String KIT_QUERY = '查询条件';
  static const String KIT_LOGGER_TAG = '标签筛选';
}

class CommonKitManager {
  factory CommonKitManager() => _getInstance();

  static CommonKitManager get instance => _getInstance();

  static CommonKitManager _instance;

  static CommonKitManager _getInstance() {
    if (_instance == null) _instance = new CommonKitManager._internal();
    return _instance;
  }

  CommonKitManager._internal();

  final Map<String, IKit> kitMap = <String, IKit>{
    CommonKitRouter.KIT_QUERY: QueryKit(),
    CommonKitRouter.KIT_LOGGER_TAG: TagSelectKit(),
  };

  T getKit<T extends IKit>(String name) {
    assert(name != null);
    if (kitMap.containsKey(name)) {
      return kitMap[name] as T;
    }
    return null;
  }

  void initData() {
    kitMap.forEach((key, value) {
      value.init();
    });
  }
}
