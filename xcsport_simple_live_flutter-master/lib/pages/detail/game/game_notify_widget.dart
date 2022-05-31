import 'dart:async';

import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/widgets/shape_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameNotifyWidget extends StatefulWidget {
  final ValueChanged<bool> onPlayTap;
  final ValueChanged<bool> onDismissTap;
  final String title;
  final String tableInfo;
  final String webUrl;

  GameNotifyWidget({
    Key key,
    this.onPlayTap,
    this.onDismissTap,
    this.title,
    this.tableInfo,
    this.webUrl,
  }) : super(key: key);

  @override
  _GameNotifyState createState() => _GameNotifyState();
}

class _GameNotifyState extends State<GameNotifyWidget> with SingleTickerProviderStateMixin {
  bool _isNotRemind = false;
  final StreamController<bool> _remindStream = StreamController<bool>.broadcast();
  final _htmlHeight = 80.0;
  bool _isShow = false;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(_onFadeChange);
  }

  @override
  void dispose() {
    _remindStream?.close();
    _controller?.removeListener(_onFadeChange);
    _controller?.dispose();
    super.dispose();
  }

  void _onFadeChange() {
    final show = _animation.value >= 0.5;
    if (true == show && show != _isShow) {
      _isShow = true;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: IgnorePointer(
        ignoring: !_isShow,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => widget.onDismissTap?.call(_isNotRemind),
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Text(
                            '${widget.title ?? ''}',
                            style: TextStyle(
                              color: Color(0xff222222),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        StreamBuilder<bool>(
                          initialData: _isNotRemind,
                          stream: _remindStream.stream,
                          builder: (cxt, span) {
                            return GestureDetector(
                              onTap: () {
                                _isNotRemind = !_isNotRemind;
                                _remindStream.add(_isNotRemind);
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 14.0,
                                    height: 14.0,
                                    decoration: BoxDecoration(
                                      color: span.data ? Color(0xff5078FF) : Color(0xffeaeaea),
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Icon(Icons.check, color: span.data ? Color(0xff222222) : Color(0xff222222).withOpacity(0.6), size: 12.0),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    '三天内不再提醒',
                                    style: TextStyle(
                                      color: Color(0xff222222).withOpacity(0.7),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 12.0),
                      ],
                    ),
                    const SizedBox(height: 14.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: _htmlHeight,
                            child: WebView(
                              initialUrl: widget.webUrl,
                              javascriptMode: JavascriptMode.unrestricted,
                              onWebResourceError: (error) {
                                widget.onDismissTap?.call(false);
                                aiLog(tag: LogTag.progress, message: 'webview load : ${widget.webUrl} 失败');
                              },
                              onPageFinished: (url) {
                                _controller.forward();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          width: 94.0,
                          height: _htmlHeight,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '${widget.tableInfo ?? ''}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xff222222),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => widget.onPlayTap?.call(_isNotRemind),
                                child: shapeButton(
                                  width: 94.0,
                                  height: 32.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '立即去玩',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12.0),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
