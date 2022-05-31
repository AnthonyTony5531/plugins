import 'package:fast_ai/performance/bean/base_info_kit.dart';
import 'package:fast_ai/performance/bean/http_kit.dart';
import 'package:fast_ai/performance/bean/log_kit.dart';
import 'package:fast_ai/performance/bean/memory_kit.dart';
import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/tag_logger_kit.dart';

/// @author grey
/// Function :  工具箱 - 管理器

class KitRouter {
  static const String KIT_INFO = 'kit_info';
  static const String KIT_HTTP = 'kit_http';
  static const String KIT_LOG = 'kit_log';
  static const String KII_LOGGER = 'kit_logger';
  static const String KIT_MEMORY = 'kit_memory';
}

class KitName {
  static const String KIT_INFO = '基本信息';
  static const String KIT_HTTP = '网络请求';
  static const String KIT_LOG = '日志查看';
  static const String KIT_LOGGER = '标签日志';
  static const String KIT_MEMORY = '内存泄漏';
}

class KitIcon {
  static const String KIT_INFO = 'assets/images/kit/kit_log.jpg';
  static const String KIT_HTTP = 'assets/images/kit/kit_log.jpg';
  static const String KIT_LOG = 'assets/images/kit/kit_log.jpg';
  static const String KIT_LOGGER = 'assets/images/kit/kit_log.jpg';
  static const String KIT_MEMORY = 'assets/images/kit/kit_log.jpg';
}

class KitManager {
  factory KitManager() => _getInstance();

  static KitManager get instance => _getInstance();

  static KitManager _instance;

  static KitManager _getInstance() {
    if (_instance == null) _instance = new KitManager._internal();
    return _instance;
  }

  KitManager._internal();

  final Map<String, IKit> kitMap = <String, IKit>{
    KitRouter.KIT_INFO: BaseInfoKit(),
    KitRouter.KIT_HTTP: HttpKit(),
    KitRouter.KIT_LOG: LogKit(),
    KitRouter.KII_LOGGER: TagLoggerKit(),
    KitRouter.KIT_MEMORY: MemoryKit(),
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
