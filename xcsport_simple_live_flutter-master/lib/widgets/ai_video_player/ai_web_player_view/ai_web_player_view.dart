import 'dart:async';

import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_web_player_view/ai_web_player_value.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AiWebPlayerView extends StatefulWidget {
  final AiVideoController controller;
  final String url;
  final VoidCallback onRefresh; // 通知外部刷新

  AiWebPlayerView({
    Key key,
    @required this.url,
    this.controller,
    this.onRefresh,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AiWebPlayerState();
}

class _AiWebPlayerState extends State<AiWebPlayerView> {
  final _defaultUrl = 'about:blank';

  WebViewController _webController;
  String _playUrl = '';
  AiWebPlayerValue _webPlayValue = AiWebPlayerValue();
  Timer _checkWebIsCanPlayTimer;

  AiVideoController get _controller => widget.controller;

  String get playUrl {
    if (_playUrl != null && _playUrl.length != 0) return _playUrl;
    return _defaultUrl;
  }

  void updateState(AiWebPlayState state, {int code, String msg, Map<String, dynamic> params}) {
    _webPlayValue = AiWebPlayerValue.state(state, code: code, msg: msg, params: params);
    if (_controller != null) _controller.value = _webPlayValue;
    widget.onRefresh?.call();
  }

  @override
  void initState() {
    super.initState();
    _playUrl = widget.url;
    _initController();
  }

  @override
  void dispose() {
    print('dispose-AiWebPlayerView');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AiWebPlayerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.url != oldWidget.url) {
      _playUrl = widget.url;
      _webController.loadUrl(playUrl);
    }

    // 判断外部是否更新了controller
    if (widget.controller != oldWidget.controller) {
      // TODO 尝试看看会不会报错
      if (oldWidget.controller != null) {
        oldWidget.controller.optionEventChanged = null;
        oldWidget.controller.dispose();
      }
      _initController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      initialUrl: playUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        this._webController = controller;
        updateState(AiWebPlayState.asyncPreparing);
      },
      onPageStarted: (url) {
        updateState(AiWebPlayState.prepared, params: {'url' : url});
      },
      onPageFinished: (url) async {
        print('onPageFinished : $url');
        bool isLoadSuccess = await _checkPlayWebViewSuccessful();
        print('onPageFinished loadSuccessfull : $isLoadSuccess');
        //如果播放失败
        if (!isLoadSuccess) {
          updateState(AiWebPlayState.error, code: -1, msg: '资源加载失败...', params: {'url' : url});
          return;
        }
        _webController.evaluateJavascript('function iconPlay(){\$(".icon-play3").click();}');
        _webController.evaluateJavascript('function iconPause(){\$(".icon-pause2").click();}');
        _webController.evaluateJavascript('function iconMute2(){\$(".icon-volume-mute2").click();}');
        _webController.evaluateJavascript('function iconMute(){\$(".live-control-bar-icon-play3-area").click();}');
        _webController.evaluateJavascript('function isPlaying(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-playing") != -1;}');
        _webController.evaluateJavascript('function isPaused(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-paused") != -1;}');
        _webController.evaluateJavascript('function isLoading(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-loading") != -1;}');

        //$("#video-main-dplayer").attr("class").indexOf("dplayer-playing") != -1
        //$("#video-main-dplayer").attr("class").indexOf("dplayer-paused") != -1
        //$("#video-main-dplayer").attr("class").indexOf("dplayer-loading") != -1
        _start(url);
      },
    );
  }

  void _initController() {
    if (_controller != null) {
      _controller.optionEventChanged = _onVideoControllerOption;
      _controller.value = _webPlayValue;
    }
  }

  Future<void> _start([String url]) async {
    _webController?.evaluateJavascript('iconPlay();');
    updateState(AiWebPlayState.started, params: {'url' : url});
  }

  Future<void> _pause() async {
    _webController?.evaluateJavascript('iconPause();');
    updateState(AiWebPlayState.paused);
  }

  Future<void> _stop() async {
    await _pause();
  }

  Future<void> _release() async {
  }

  Future<void> _resetPlay() async {
    if (_webPlayValue.isError) {
      _webController.loadUrl(playUrl);
    } else {
      _webController?.evaluateJavascript('iconPlay();');
      updateState(AiWebPlayState.started);
    }
  }


  Future<void> _mute() async {
    _webController?.evaluateJavascript('iconMute2();');
    _webController?.evaluateJavascript('iconMute();');

  }

  Future<void> _open() async {
    _webController?.evaluateJavascript('iconMute();');
  }

  dynamic _onVideoControllerOption(String event) async {
    switch (event) {
      case 'start':
        return await _start();
      case 'pause':
        return await _pause();
      case 'stop':
        return await _stop();
      case 'release':
        return await _release();
      case 'replay':
        return await _resetPlay();
      case 'pauseOthers':
        break;
      case 'mute':
        await _mute();
        break;
      case 'open':
        await _open();
        break;
    }
  }

  //检测是否播放成功
  Future<bool> _checkPlayWebViewSuccessful() async {
    String sourceType;
    try {
      sourceType = await _webController?.evaluateJavascript('source_type');
    } catch (e) {
      sourceType = null;
    }
    print(' source_type is null-string : ${'null' == sourceType}');
    return null != sourceType && "null" != sourceType;
  }

  Future<bool> _isLoading() async {
    try {
      var ret = await _webController?.evaluateJavascript('isLoading();');
      return ret == 'true';
    } catch (e) {
      return false;
    }
  }

  int _downCount = 0;

  void startCheckLoading() async {
    _checkWebIsCanPlayTimer?.cancel();
    _checkWebIsCanPlayTimer = Timer(const Duration(milliseconds: 3000), () async {
      bool isLoading = await _isLoading();

      if (!isLoading) {
        _downCount = 0;
        // 继续检查
        startCheckLoading();
      } else {
        _downCount++;
        // 30s 还在loading 抛异常
        if (_downCount >= 10) {
          _checkWebIsCanPlayTimer?.cancel();
          _webController.loadUrl(_defaultUrl);
        }
      }
    });
  }
}
