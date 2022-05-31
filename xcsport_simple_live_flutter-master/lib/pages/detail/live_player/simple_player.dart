//**********************************************************************
//* author:Sam
//* date:2020-05-13
//**********************************************************************

import 'dart:io';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/config/config.dart';
import 'package:video_player/video_player.dart';

class SimplePlayer extends StatefulWidget {
  final String source;
  final bool autoPlay;

  SimplePlayer({Key key, this.source, this.autoPlay = true}) : super(key: key);

  @override
  _SimplePlayerState createState() => _SimplePlayerState();
}

class _SimplePlayerState extends State<SimplePlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    print('_SimplePlayerState>> start initState ');
    if (isStrNullOrEmpty(config?.sdkAssetsModel?.sdkAssetsDir)) {
      print('_SimplePlayerState>> 1');
      _controller = VideoPlayerController.asset(widget.source);
    } else {
      print('_SimplePlayerState>>  2');
      _controller = VideoPlayerController.file(File(widget.source));
    }
    print('_SimplePlayerState>>  3');
    _controller.setLooping(true);
    _controller.initialize().then((value) => setState(() {
      print('_SimplePlayerState>>  setState');
    })).whenComplete(() {});
    if (widget.autoPlay) _controller.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SimplePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
      print('_SimplePlayerState>>  didUpdateWidget >> 1');
    if (oldWidget.source != widget.source  && widget.source != null) {
      print('_SimplePlayerState>>  didUpdateWidget >> 2');
      _controller?.dispose();
      if (isStrNullOrEmpty(config?.sdkAssetsModel?.sdkAssetsDir)) {
      _controller = VideoPlayerController.asset(widget.source);
      } else {
      _controller = VideoPlayerController.file(File(widget.source));
      }
      _controller.setLooping(true);
      _controller.initialize().then((value) => setState(() {}));
      _controller.play();
    }
    if (widget.autoPlay) _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && _controller.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
