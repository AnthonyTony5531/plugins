/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-19
 * 说明：视频加载
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:async';
import 'dart:math';

import 'package:fast_ai/config/config.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/material.dart';

class LiveLoading extends StatefulWidget {
  final AiVideoController player;
  LiveLoading({Key key, @required this.player}) : super(key: key);

  @override
  _LiveLoadingState createState() => _LiveLoadingState();
}

class _LiveLoadingState extends State<LiveLoading>
    with TickerProviderStateMixin {
  AnimationController _controller;
  StreamSubscription<AiVideoState> _playerStatusListener;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _controller.addStatusListener((AnimationStatus state) {
      if (state == AnimationStatus.completed) {
        _controller.reset();
      } else if (state == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
    //_playerStatusListener = widget.player.onVideoState.listen(playStateChanged);
    AiVideoController.gOnVideoState.addListener(playStateChanged);
    print('LiveLoading-initState');
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    AiVideoController.gOnVideoState.removeListener(playStateChanged);
    //_playerStatusListener.cancel();
    super.dispose();
  }

  void playStateChanged(AiVideoState state) async {
    await sleep(50);
    if (mounted) setState(() {});
    print('LiveLoading-playStateChanged mounted=$mounted state=$state');
    await sleep(500);
  }

  @override
  Widget build(BuildContext context) {
    var state = widget.player.state;

    var bgColor = Color(0xFF222222);
    LoadingPanel loadingPanel = LoadingPanel.None;
    switch (state) {
      case AiVideoState.stopped:
      case AiVideoState.completed:
      case AiVideoState.end:
      case AiVideoState.idle:
        loadingPanel = LoadingPanel.None;
        break;
      /*
        enum AiWebVideoPlayerState {
          None,
          Stop,
          PageLoading,
          Loading,
          Playing,
          completed,
          Error
        }
       */
      case AiVideoState
          .idle: // TODO: 之前的AiWebVideoPlayerState.PageLoading先用现在的idle代替
        loadingPanel = LoadingPanel.FullLoading;
        break;
      case AiVideoState.initialized:
      case AiVideoState.asyncPreparing:
      case AiVideoState.prepared:
        loadingPanel = LoadingPanel.MiniLoading;
        break;
      case AiVideoState.started:
        loadingPanel = LoadingPanel.None;
        break;
      case AiVideoState.error:
        loadingPanel = LoadingPanel.Error;
        break;
      default:
        loadingPanel = LoadingPanel.None;
    }

    switch (loadingPanel) {
      case LoadingPanel.None:
        return Container();
      case LoadingPanel.FullLoading:
        bgColor = Color(0xFF222222);
        return buildLoading(bgColor);
      case LoadingPanel.MiniLoading:
        bgColor = Colors.transparent;
        return buildLoading(bgColor);
      case LoadingPanel.Error:
      default:
        return buildError();
    }
  }

  Widget buildError() {
    return Container(
      alignment: Alignment(0, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF222222),
    );
  }

  Widget buildLoading(Color bgColor) {
    return Container(
      alignment: Alignment(0, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: bgColor,
      // color: Colors.blue,
      child: TitleText(
        position: TitlePosition.Top,
        title: Container(
            width: 35,
            height: 35,
            child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return CustomPaint(
                    painter: LoadingPainter(_controller.value),
                  );
                })),
        text: Text(
          config.langMap['baseLang']['message']['loading'],
          style: AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontSize: 12,
            color: Color(0xFF4B72FF),
          ),
        ),
      ),
    );
  }
}

enum LoadingPanel {
  //不显示
  None,
  //满屏
  FullLoading,
  //最小
  MiniLoading,
  //出错
  Error
}

class LoadingPainter extends CustomPainter {
  final double value;
  LoadingPainter(this.value);
  @override
  void paint(Canvas canvas, Size size) {
    var r = min(size.width, size.height) / 2;
    var center = Offset(size.width / 2, size.height / 2);
    var count = 8;
    var offset = value * 2 * pi;

    for (var i = 0; i < count; i++) {
      var radians = (2 * pi / count * i + offset) % (2 * pi);
      var dy = r * sin(radians) * pi / 4 + center.dx;
      var dx = r * cos(radians) * pi / 4 + center.dy;

      var smallPoint = Offset(dx, dy);
      var smallRadiusMax = 4.0;
      var smallRadiusMin = 1.5;
      var smallRadius =
          (smallRadiusMax - smallRadiusMin) / count * i + smallRadiusMin;

      Paint paint = Paint();
      paint.color = Color(0xFFFFFFFF)
          .withAlpha((255 * 0.1 + 255 * 0.3 * (i / count)).toInt());
      canvas.drawCircle(smallPoint, smallRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
