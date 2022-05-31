import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_player_view.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/float_widget.dart';
//import 'package:fast_ai/widgets/float_widget.dart';
import 'package:flutter/material.dart';


class BaseVideoPlayerView extends StatefulWidget {
  final AiVideoType type;
  final AiVideoController controller;
  final String url;
  final double width;
  final double height;
  final AiFijkPlayerBuilder fijkBuilder;
  /// 自定义控制面板
  final AiVideoPlayerStateWidgetBuild panelBuilder;
  const BaseVideoPlayerView({
    Key key,
    @required this.type,
    @required this.controller,
    @required this.url,
    this.width,
    this.height,
    this.fijkBuilder,
    this.panelBuilder,
  }) : super(key: key);

  @override
  _BaseVideoPlayerViewState createState() => _BaseVideoPlayerViewState();
}

class _BaseVideoPlayerViewState extends State<BaseVideoPlayerView> {
  @override
  Widget build(BuildContext context) {
    return AiVideoPlayerView(
      type: widget.type,
      controller: widget.controller,
      url: widget.url,
      width: widget.width,
      height: widget.height,
      fijkBuilder: widget.fijkBuilder ?? AiFijkPlayerBuilder(
        showController: false,
        isAutoPlay: true,
        isOpenBufferLoad: false,
        loopCount: 0,
        volume: 0.5,
      ),
      panelBuilder: widget.panelBuilder,
    );
  }

  @override
  void initState() {
    _statusSubscription = widget.controller.onVideoState.listen(_playerStatusChanged);
    super.initState();
  }


  @override
  void dispose() {
    print('dispose-BaseVideoPlayerView');
    _statusSubscription.cancel();
    super.dispose();
  }

  AiVideoState _status;
  StreamSubscription<AiVideoState> _statusSubscription;
  void _playerStatusChanged(AiVideoState status) {
    if(_status == status) return;
    _status = status;

    updateIjkStatus(status);
    print('00-VideoPlayerViewState-$status, type=${widget.type}');
    if(config.isTabSDK) config.sdkApi.videoStateChanged.fire(status);
  }
}

