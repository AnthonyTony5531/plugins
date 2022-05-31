import 'dart:async';

import 'package:fast_ai/widgets/ai_video_player/ai_fijk_player_view/ai_fijk_player_controller_view.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_fijk_player_view/ai_fijk_player_view.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_web_player_view/ai_web_player_view.dart';
import 'package:flutter/material.dart';

// 使用什么播放器
enum AiVideoType {
  unknown, // 未知,提示无法播放
  video, // FIJK播放器(本地视频、flv、rtmp、m3u8等)
  web, // 浏览器播放
}

// 播放器BoxFit
enum AiVideoFit {
  contain,
  fill,
  cover,
}

// 使用Fijk属性构造器
class AiFijkPlayerBuilder {
  /// 是否展示FIJK播放器内部控制面板
  bool showController;
  Color videoBgCol;
  bool isAutoPlay;
  bool isOpenBufferLoad; // 是否显示 - 自动的buffer缓存loading
  AiVideoFit fit;
  int loopCount; // 循环播放次数>=0，0为无限循环
  double volume; // 播放音量
  FijkStateBuilder errorBuilder; // 自定义错误view
  FijkStateBuilder pauseBuilder; // 自定义暂停view
  FijkStateBuilder completeBuilder; // 自定义播放完成view

  AiFijkPlayerBuilder({
    this.showController,
    this.videoBgCol,
    this.isAutoPlay,
    this.isOpenBufferLoad,
    this.fit,
    this.loopCount,
    this.volume,
    this.errorBuilder,
    this.pauseBuilder,
    this.completeBuilder,
  });
}

// 提供某些依赖播放器状态,展示不动界面的build
typedef AiVideoPlayerStateWidgetBuild = Widget Function(BuildContext context, AiVideoController controller, AiVideoState state);

class AiVideoPlayerView extends StatefulWidget {
  final AiVideoType type;
  final AiVideoController controller;
  final String url;
  final double width;
  final double height;
  final AiFijkPlayerBuilder fijkBuilder;
  /// 自定义控制面板
  final AiVideoPlayerStateWidgetBuild panelBuilder;

  AiVideoPlayerView({
    Key key,
    @required this.type,
    @required this.url,
    @required this.controller,
    this.panelBuilder,
    this.width,
    this.height,
    this.fijkBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AiVideoPlayerState();
}

class _AiVideoPlayerState extends State<AiVideoPlayerView> {
  AiVideoController _defaultController;

  AiVideoController get _controller => widget.controller ?? (_defaultController ??= AiVideoController());

  final StreamController<int> _refreshStream = StreamController<int>.broadcast();

  @override
  void dispose() {
    print('dispose-AiVideoPlayerView');
    _controller?.pause();
    _refreshStream?.close();
    _defaultController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget player = const SizedBox.shrink();
    if (widget.type == AiVideoType.video) {
      player = AiFIJKPlayerView(
        controller: _controller,
        path: widget.url,
        width: widget.width,
        height: widget.height,
        showController: widget.fijkBuilder?.showController,
        videoBgCol: widget.fijkBuilder?.videoBgCol,
        fit: widget.fijkBuilder?.fit,
        errorBuilder: widget.fijkBuilder?.errorBuilder,
        pauseBuilder: widget.fijkBuilder?.pauseBuilder,
        completeBuilder: widget.fijkBuilder?.completeBuilder,
        isAutoPlay: widget.fijkBuilder?.isAutoPlay,
        isOpenBufferLoad: widget.fijkBuilder?.isOpenBufferLoad,
        loopCount: widget.fijkBuilder?.loopCount,
        volume: widget.fijkBuilder?.volume,
        onRefresh: _onRefreshEvent,
      );
    }

    if (widget.type == AiVideoType.web) {
      player = AiWebPlayerView(
        url: widget.url,
        controller: _controller,
        onRefresh: _onRefreshEvent,
      );
    }

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: player),
          Positioned.fill(
            child: StreamBuilder<int>(
              initialData: null,
              stream: _refreshStream.stream,
              builder: (cxt, span) {
                return widget.panelBuilder?.call(context, _controller, _controller.state) ?? const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onRefreshEvent() {
    if (!_refreshStream.isClosed) {
      _refreshStream.sink.add(DateTime.now().millisecondsSinceEpoch);
    }
  }
}
