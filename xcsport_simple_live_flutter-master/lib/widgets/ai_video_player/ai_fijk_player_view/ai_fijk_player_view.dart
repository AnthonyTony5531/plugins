import 'dart:async';
import 'dart:io';

import 'package:fast_ai/widgets/ai_video_player/ai_fijk_player_view/ai_fijk_player_controller_view.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_player_view.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AiFIJKPlayerView extends StatefulWidget {
  final AiVideoController controller;
  final bool showController;
  final String path;
  final double width;
  final double height;
  final Color videoBgCol;
  final bool isAutoPlay;
  final bool isOpenBufferLoad; // 是否显示 - 缓存loading
  final AiVideoFit fit;
  final int loopCount; // 循环播放次数>=0，0为无限循环
  final double volume; // 播放音量
  final FijkStateBuilder errorBuilder; // 自定义错误view
  final FijkStateBuilder pauseBuilder; // 自定义暂停view
  final FijkStateBuilder completeBuilder; // 自定义播放完成view
  final VoidCallback onRefresh; // 通知外部刷新

  AiFIJKPlayerView({
    Key key,
    @required this.path,
    showController,
    this.controller,
    this.width,
    this.height,
    this.videoBgCol,
    this.fit,
    this.errorBuilder,
    this.pauseBuilder,
    this.completeBuilder,
    this.onRefresh,
    isAutoPlay,
    isOpenBufferLoad,
    loopCount,
    volume,
  })  : isAutoPlay = isAutoPlay ?? true,
        isOpenBufferLoad = isOpenBufferLoad ?? true,
        loopCount = loopCount ?? 1,
        volume = volume ?? 0.5,
        showController = showController ?? true,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AiFIJKPlayerState();
}

final List<FijkPlayer> _playerList = [];

class _AiFIJKPlayerState extends State<AiFIJKPlayerView>
    with WidgetsBindingObserver {
  final FijkPlayer player = FijkPlayer();

  AiVideoController get _controller => widget.controller;
  FijkFit _fijkFit = const FijkFit(
      sizeFactor: 1.0, aspectRatio: -1.0, alignment: Alignment.center);

  StreamSubscription _currentPosSubs;
  StreamSubscription _bufferPosSubs;

  bool _savePlayState = false; // 保存播放状态
  double _volume;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (_savePlayState) {
          player.start();
          _savePlayState = false;
        }
        break;
      case AppLifecycleState.paused:
        _savePlayState = player.state == FijkState.started;
        if (_savePlayState) {
          player.pause();
        }
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _volume = widget.volume;
    // 保存Fijk,控制器以为相互暂停播放
    _playerList.add(player);
    player.addListener(_playerValueChanged);
    _initFijkFit();
    _prepareVideo();
    // 初始化外部操作的controller
    _initController();
  }

  @override
  void dispose() {
    print('dispose-AiFIJKPlayerView');
    _currentPosSubs?.cancel();
    _bufferPosSubs?.cancel();
    _playerList.remove(player);
    WidgetsBinding.instance.removeObserver(this);
    player.removeListener(_playerValueChanged);
    player.release();
    print('AiFIJKPlayerView =======> 销毁了');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AiFIJKPlayerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.fit != oldWidget.fit) {
      _initFijkFit();
    }

    if (widget.path != oldWidget.path) {
      _resetPlay();
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
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: FijkView(
              player: player,
              fit: _fijkFit,
              color: widget.videoBgCol ?? const Color(0xff000000),
              panelBuilder: fijkControllerBuilder(
                autoPlay: widget.isAutoPlay,
                showController: widget.showController,
                errorBuilder: widget.errorBuilder,
                pauseBuilder: widget.pauseBuilder,
                completeBuilder: widget.completeBuilder,
              ),
            ),
          ),
          if (widget.isOpenBufferLoad)
            Positioned.fill(
              child: StreamBuilder<bool>(
                initialData: false,
                stream: player.onBufferStateUpdate,
                builder: (cxt, span) {
                  if (span.data) {
                    return Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                      ),
                    );
                  }
                  return const SizedBox.shrink(); 
                },
              ),
            ),
        ],
      ),
    );
  }

  void _initController() {
    if (_controller != null) {
      _controller.optionEventChanged = _onVideoControllerOption;
      _controller.value = player.value;
    }
  }

  void _initFijkFit() {
    if (widget.fit == null) return;
    switch (widget.fit) {
      case AiVideoFit.contain:
        _fijkFit = FijkFit.contain;
        break;
      case AiVideoFit.fill:
        _fijkFit = FijkFit.fill;
        break;
      case AiVideoFit.cover:
        _fijkFit = FijkFit.cover;
        break;
    }
  }

  Future _prepareVideo() async {
    var list = [
      player.setOption(FijkOption.hostCategory, "request-screen-on", 1),
      //解决m3u8文件拖动问题 比如:一个3个多少小时的音频文件，开始播放几秒中，然后拖动到2小时左右的时间，要loading 10分钟
      player.setOption(FijkOption.formatCategory, "fflags", "fastseek"),
      //跳帧处理,放CPU处理较慢时，进行跳帧处理，保证播放流程，画面和声音同步
      player.setOption(FijkOption.playerCategory, "framedrop", 5),
      //播放重连次数
      player.setOption(FijkOption.playerCategory, "reconnect", 0),
      //是否开启预缓冲，一般直播项目会开启，达到秒开的效果，不过带来了播放丢帧卡顿的体验
      player.setOption(FijkOption.playerCategory, "packet-buffering", 1),
      //设置之后，高码率m3u8的播放卡顿，声音画面不同步，或者只有画面，没有声音，或者声音画面不同步
      player.setOption(FijkOption.playerCategory, "enable-accurate-seek", 1),
      //播放前的探测Size，默认是1M, 改小一点会出画面更快 1024 * 10
      player.setOption(FijkOption.playerCategory, "probesize", 1024 * 3),
      //设置播放前的探测时间 1,达到首屏秒开效果
      player.setOption(FijkOption.playerCategory, "analyzeduration", 1),

      player.setOption(FijkOption.formatCategory, "format", 1),
      // 设置播放循坏状态
      player.setLoop(widget.loopCount),
      // 设置播放音量
      player.setVolume(widget.volume),
      // 设置播放资源
    ];

    if (Platform.isIOS) {
      player.setOption(FijkOption.formatCategory, "videotoolbox", 1);
    }
    if (widget.isAutoPlay) {
      // 自动播放
      list.add(player.setDataSource(widget.path, autoPlay: widget.isAutoPlay));
    } else {
      list.add(player.setDataSource(widget.path, autoPlay: widget.isAutoPlay));
      list.add(player.prepareAsync());
    }
    // 设置屏幕保持常亮
    await Future.wait(list);
  }

  void _playerValueChanged() {
    FijkValue value = player.value;
    _controller?.value = value;
    widget.onRefresh?.call();

    // 根据value.duration 判断是否视频
    // 直播不对外提供播放进度
    if (value != null && value.duration != null) {
      _controller?.uploadProgress(total: value.duration);
      if (_currentPosSubs == null) {
        _currentPosSubs = player.onCurrentPosUpdate
            .listen((event) => _controller?.uploadProgress(currentPos: event));
      }
      if (_bufferPosSubs == null) {
        _bufferPosSubs = player.onBufferPosUpdate
            .listen((event) => _controller?.uploadProgress(bufferPos: event));
      }
    }
  }

  void _resetPlay() async {
    await player.reset();
    await player.setDataSource(widget.path, autoPlay: widget.isAutoPlay);
  }

  dynamic _onVideoControllerOption(String event) async {
    switch (event) {
      case 'start':
        return await player.start();
      case 'pause':
        return await player.pause();
      case 'stop':
        return await player.stop();
      case 'release':
        return await player.release();
      case 'replay':
        _resetPlay();
        return;
      case 'pauseOthers':
        _playerList.forEach((element) {
          if (element.state == FijkState.started && element != player) {
            element.pause();
          }
        });
        break;
      case 'mute':
        _volume = 0;
        await player.setVolume(_volume);
        break;
      case 'open':
        _volume = 0.5;
        await player.setVolume(_volume);
        break;
    }
  }
}
