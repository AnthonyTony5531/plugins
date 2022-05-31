import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//信息板，用来展示数据页面，带动画
class LiveFrame extends StatefulWidget {
  final Widget child;
  final double width;

  final LiveFrameController liveFrameController;

  LiveFrame({this.child, this.width = 300, this.liveFrameController}) : super(key: liveFrameController._globalKey);

  @override
  _LiveFrameState createState() => _LiveFrameState();
}

class LiveFrameController {
  final GlobalKey<_LiveFrameState> _globalKey = new GlobalKey();

  void show() {
    _globalKey.currentState?.show();
  }

  void dismiss() {
    _globalKey.currentState?.dismiss();
  }
}

class _LiveFrameState extends State<LiveFrame> with TickerProviderStateMixin {

  double right;

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        if (isShow)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => dismiss(),
              child: Container(color: Colors.transparent),
            ),
          ),
        AnimatedPositioned(
          right: isShow ? 0 : -widget.width,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 4),
              color:  Colors.black.withOpacity(0.8),
              width: widget.width,
              height: MediaQuery.of(context).size.height - (Platform.isAndroid ? 24 : 20),
              child: InkWell(onTap: () {}, child: widget.child),
            ),
          ),
          duration: Duration(milliseconds: 300),
        ),
      ],
    );
  }

  void show() {
    if (mounted) {
      isShow = true;
      setState(() {});
    }
  }

  void dismiss() async {
    if (mounted && isShow) {
      isShow = false;
      setState(() {});
    }
  }
}
