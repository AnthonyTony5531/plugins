import 'package:fast_ai/widgets/ai_video_player/ai_web_player_view/ai_web_player_value.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_web_player_view/ai_web_player_view.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 对外统一输出播放器状态，替换原AiWebVideoPlayerState
// 后面所有引入播放器都需要状态该类状态
enum AiVideoState { idle, initialized, asyncPreparing, prepared, started, paused, completed, stopped, error, end }

// 对外统一输出播放器 - 进度状态
class AiVideoProgress {
  Duration totalPos;
  Duration bufferPos;
  Duration currentPos;
}

// 对外统一输出播放器参数，所有引入播放器参数都得转换成该类
// webview 播放器仅提供state和exception信息
class AiVideoValue {
  bool audioRenderStart;
  bool videoRenderStart;
  Size size;
  int rotate;
  Duration duration;
  bool fullScreen;
  AiVideoState state;
  AiVideoException exception;

  /// 拓展信息
  Map<String, dynamic> params;

  bool get isError {
    if (exception != null && exception.isError) return true;
    if (state != null && state == AiVideoState.error) return true;
    return false;
  }

  // 对应播放器,对应构造方法
  AiVideoValue.fijkValue(FijkValue fijkValue) {
    this.audioRenderStart = fijkValue.audioRenderStart;
    this.videoRenderStart = fijkValue.videoRenderStart;
    this.size = fijkValue.size;
    this.rotate = fijkValue.rotate;
    this.duration = fijkValue.duration;
    this.fullScreen = fijkValue.fullScreen;
    this.params = {};
    switch (fijkValue.state) {
      case FijkState.idle:
        this.state = AiVideoState.idle;
        break;
      case FijkState.initialized:
        this.state = AiVideoState.initialized;
        break;
      case FijkState.asyncPreparing:
        this.state = AiVideoState.asyncPreparing;
        break;
      case FijkState.prepared:
        this.state = AiVideoState.prepared;
        break;
      case FijkState.started:
        this.state = AiVideoState.started;
        break;
      case FijkState.paused:
        this.state = AiVideoState.paused;
        break;
      case FijkState.completed:
        this.state = AiVideoState.completed;
        break;
      case FijkState.stopped:
        this.state = AiVideoState.stopped;
        break;
      case FijkState.error:
        this.state = AiVideoState.error;
        break;
      case FijkState.end:
        this.state = AiVideoState.end;
        break;
    }
    this.exception = AiVideoException(fijkValue.exception.code, fijkValue.exception.message);
  }

  AiVideoValue.webViewValue(AiWebPlayerValue value) {
    switch (value.state) {
      case AiWebPlayState.idle:
      case AiWebPlayState.initialized:
      case AiWebPlayState.asyncPreparing:
      case AiWebPlayState.prepared:
        this.state = AiVideoState.prepared;
        break;
      case AiWebPlayState.started:
        this.state = AiVideoState.started;
        break;
      case AiWebPlayState.paused:
        this.state = AiVideoState.paused;
        break;
      case AiWebPlayState.completed:
        this.state = AiVideoState.completed;
        break;
      case AiWebPlayState.stopped:
        this.state = AiVideoState.stopped;
        break;
      case AiWebPlayState.error:
        this.state = AiVideoState.error;
        break;
      case AiWebPlayState.end:
        this.state = AiVideoState.end;
        break;
    }
    this.exception = AiVideoException(value.code, value.errorMsg);
  }

  void copy(AiVideoValue newValue) {
    this.audioRenderStart = newValue.audioRenderStart;
    this.videoRenderStart = newValue.videoRenderStart;
    this.size = newValue.size;
    this.rotate = newValue.rotate;
    this.duration = newValue.duration;
    this.fullScreen = newValue.fullScreen;
    this.state = newValue.state;
    this.exception.copy(newValue.exception);
    this.params = newValue.params ?? {};
  }

  @override
  String toString() {
    return 'AiVideoValue{audioRenderStart: $audioRenderStart, videoRenderStart: $videoRenderStart, size: $size, '
        'rotate: $rotate, duration: $duration, fullScreen: $fullScreen, state: $state, '
        'exception: ${exception.toString()}, params: $params}';
  }
}

class AiVideoException {
  int code;
  String message;

  bool get isError => code != 0;

  AiVideoException(int code, String msg) {
    this.code = code;
    this.message = msg;
  }

  void copy(AiVideoException newValue) {
    this.code = newValue.code;
    this.message = newValue.message;
  }

  @override
  String toString() {
    return 'AiVideoException{code: $code, message: $message}';
  }
}
