import 'package:fast_ai/utils/ai_cache.dart';

class VideoPlayerCache {
  /// 保存移动流量自动播放视频设置
  static void saveFluxTips(bool autoPlayingWithMobile) {
    AiCache.get().setBool('FluxTipsCache_autoPlayingWithMobile', autoPlayingWithMobile);
  }

  static bool isAutoPlayingWithMobile() {
    return true;
    // var value = AiCache.get().get('FluxTipsCache_autoPlayingWithMobile');
    // if (null == value) return true;
    // return value;
  }


  /// 设置视频浮动窗口缓存
  static set floatVideoAble(bool value) {
    AiCache.get().setBool('select_float_video', value);
  }
  static bool get floatVideoAble => AiCache.get().getBool('select_float_video') ?? true;
}