import 'dart:io';

import 'package:fast_ai/jsinteraction/controller/js_controller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/common_jscontroller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/route_jscontroller.dart';
import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class GameWebViewShow extends StatefulWidget {
  final String type;
  final String url;
  final double height;
  final ValueChanged<bool> onPageFinished;
  final ValueChanged<bool> onPageError;
  final List<JsController> controllers;
  final Color bgColor;

  GameWebViewShow({Key key, this.url, this.type, this.height, this.onPageFinished, this.onPageError, this.controllers, this.bgColor}) : super(key: key);

  @override
  _GameWebViewShow createState() => _GameWebViewShow();
}

class _GameWebViewShow extends State<GameWebViewShow> {

  final XCJSControllerManager manager = XCJSControllerManager();
  WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    manager.addJsController(CommonJsController(context: context));
    manager.addJsController(RouteJSController(context: context));
    manager.addJsControllers(widget.controllers);
    return Container(
      color: widget.bgColor ?? Colors.white,
      height: widget.height,
      child: WebView(
        gestureRecognizers: Platform.isAndroid  ? [Factory(() => VerticalDragGestureRecognizer())].toSet() : null,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        initialUrl: getWebUrl(widget.url, isJointLang: false),
        javascriptChannels: [manager.buildChannel()].toSet(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
        onWebResourceError: (error) {
          widget.onPageError?.call(true);
        },
        onPageFinished: (url) {
          widget.onPageFinished?.call(true);
        },
      ),
    );
  }
}
