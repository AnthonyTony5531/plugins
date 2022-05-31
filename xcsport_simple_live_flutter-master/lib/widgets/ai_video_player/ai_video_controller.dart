import 'dart:async';

import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_web_player_view/ai_web_player_value.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef UserOptionEvent = dynamic Function(String event);

// 对外统一使用Video_controller
// 外部需要进行dispose,
// 设置了监听,需要手动remove
class AiVideoController extends ChangeNotifier implements ValueListenable<AiVideoValue> {
  AiVideoValue _value;

  // 播放器 - 进度条管理
  final AiVideoProgress _progressValue = AiVideoProgress();
  final StreamController<AiVideoProgress> _progressController =  StreamController<AiVideoProgress>.broadcast();
  final StreamController<AiVideoState> _videoStateController = StreamController<AiVideoState>.broadcast();

  /// 播放器 - 进度条变化油管
  /// 外部使用方式
  /// StreamSubscription _progressSubs = AiVideoController.onVideoProgress.listen((event));
  /// 记得释放监听: _progressSubs.cancel()
  Stream<AiVideoProgress> get onVideoProgress => _progressController.stream;


  Stream<AiVideoState> get onVideoState => _videoStateController.stream;


  //修復了狀態callback接收不到。原因可能有些地方new了多個 AiVideoController
  static ValueChangedListener<AiVideoState> gOnVideoState = ValueChangedListener<AiVideoState>();


  UserOptionEvent _option;

  /// 注意uploadProgress
  /// 禁止再播放器外使用,因为类不在同一文件下,私有不了方法
  void uploadProgress({Duration total,Duration bufferPos,Duration currentPos}){
    if(total != null) _progressValue.totalPos = total;
    if(bufferPos != null) _progressValue.bufferPos = bufferPos;
    if(currentPos != null) _progressValue.currentPos = currentPos;
    if(_progressController != null && !_progressController.isClosed){
      _progressController.add(_progressValue);
    }
  }

  // 提供播放器,事件处理使用
  set optionEventChanged(UserOptionEvent optionEvent) => this._option = optionEvent;

  set value(dynamic value) {
    if (value is AiVideoValue) {
      this._value = value;
    } else if (value is FijkValue) {
      this._value = AiVideoValue.fijkValue(value);
    } else if (value is AiWebPlayerValue) {
      this._value = AiVideoValue.webViewValue(value);
    }

    if(_value.isError){
      _videoStateController.add(AiVideoState.error);
    }else{
      _videoStateController.add(_value.state);
    }
    gOnVideoState.fire(_value.state);
    notifyListeners();
  }

  bool get isPlaying => _value?.state == AiVideoState.started;

  bool get isPaused => _value?.state == AiVideoState.paused;

  bool get isError => _value?.state == AiVideoState.error || _value?.state == AiVideoState.completed;

  bool get isOk => !isError;

  AiVideoState get state => _value?.state ?? AiVideoState.idle;

  Future<dynamic> start() async => await _option?.call('start');

  Future<dynamic> pause() async => await _option?.call('pause');

  Future<dynamic> release() async => await _option?.call('release');

  Future<dynamic> replay() async => await _option?.call('replay');

  Future<dynamic> pauseOthers() async => await _option?.call('pauseOthers');

  /// 静音
  Future<dynamic> mute() async => await _option?.call('mute');

  /// 50%音量
  Future<dynamic> open() async => await _option?.call('open');

  Future<dynamic> startOrPause() async {
    if(isPlaying){
      await _option?.call('pause');
    }else{
      await _option?.call('start');
    }
  }

  @override
  AiVideoValue get value => _value;

  bool _debugDisposed = false;

  @override
  void dispose() {
    print('dispose-AiVideoController');
    if(_debugDisposed) return;
    _progressController?.close();
    _videoStateController?.close();
    _debugDisposed = true;
    super.dispose();
  }
}
