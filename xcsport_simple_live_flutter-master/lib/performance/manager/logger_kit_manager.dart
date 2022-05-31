import 'package:fast_ai/performance/bean/data/log_info_data.dart';
import 'package:fast_ai/performance/bean/data/tag_logger_info_data.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';

/// @author grey
/// Function :

void aiLog({String tag, String message, dynamic stack = ''}) {
  LoggerKitManager.instance.log(tag ?? LogTag.progress, message, stack);
}

class LoggerKitManager {
  factory LoggerKitManager() => _getInstance();

  static LoggerKitManager get instance => _getInstance();

  static LoggerKitManager _instance;

  static LoggerKitManager _getInstance() {
    if (_instance == null) _instance = new LoggerKitManager._internal();
    return _instance;
  }

  bool _inProduction = const bool.fromEnvironment("dart.vm.product");
  bool _isPrint = false;

  LoggerKitManager._internal();

  Function listener;

  void registerListener(Function listener) {
    this.listener = listener;
  }

  void unregisterListener() {
    listener = null;
  }

  /// 开发人员代码调试用，使用完请注释代码
  /// 正式环境不记录debug日志
  // void debugLog(String tag, String message, [dynamic stack = '']) {
  //   if (!_inProduction) {
  //     log(tag, message, stack);
  //   } else {
  //     print('$message $stack');
  //   }
  // }

  /// 线上问题定位调试用，长期保留
  /// 每个便签日志上限256条
  void log(String tag, String message, [dynamic stack = '']) {
    if (_inProduction && _isPrint) {
      if (stack != null && stack != '') {
        print('$message \n$stack');
      } else {
        print('$message');
      }
    }

    if (KitManager.instance.getKit(KitRouter.KII_LOGGER) != null) {
      TagLoggerInfoData infoData = TagLoggerInfoData();
      infoData.tag = tag;
      infoData.message = message;
      infoData.stack = stack;

      KitManager.instance.getKit(KitRouter.KII_LOGGER)?.storage?.save(infoData);
    }
  }

  /// 系统打印日志
  void addSystemLog(int type, String msg) {
    if (KitManager.instance.getKit(KitRouter.KIT_LOG) != null) {
      final LogInfoData log = LogInfoData(type, msg);
      KitManager.instance.getKit(KitRouter.KIT_LOG).save(log);
      listener?.call(log);
    }
  }
}

class LogTag {
  static final String progress = 'Progress';
  static final String pushMsg = 'PushMessage';
  static final String fijkMsg = 'fijkMessage';
  static final String inputChatUser = 'InputChatUser';
  static final String assetsMsg = 'AssetsMessage';
  static final String useAssetsMsg = 'UseAssetsMessage';
  static final String useFileMsg = 'UseFileMessage';
  static final String autoOddsMsg = 'AutoOddsMsg';
  static final String gameSdkMsg = 'GameSdkMsg';
  static final String gameNotify = 'GameNotify';

}
