//**********************************************************************
//* author:Sam
//* date:2020-03-06
//**********************************************************************

import 'dart:io';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

//视频锁
class LiveLock extends StatefulWidget {

  final ToolPanelController toolPanelController;

  LiveLock({this.toolPanelController});

  @override
  _LiveLockState createState() => _LiveLockState();
}

class _LiveLockState extends State<LiveLock> {
  bool isLock = false;

  static const SvgPictureWidth = 36.0;

  @override
  Widget build(BuildContext context) {
    if (widget.toolPanelController.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: IgnorePointer(
              ignoring: !isLock,
              child: GestureDetector(
                onTap: () => widget.toolPanelController.dismiss(),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
          Positioned(
            left: 80.0,
            top: MediaQuery.of(context).size.height / 2 - SvgPictureWidth / 2,
            child: createLockButton(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  Widget createLockButton() {
    return InkWell(
      onTap: () async {
        isLock = !isLock;
        widget.toolPanelController.hide();

        if (isLock) {
          // SystemChrome.setPreferredOrientations([
          //   DeviceOrientation.landscapeRight,
          //   DeviceOrientation.landscapeLeft,
          // ]);
        } else {
          if (Platform.isAndroid) {
            // final autoRotateOn = await config.platformChannel.invokeMethod("autoRotateOn");
            // bool isAndroidAuto = (autoRotateOn ?? 0) == 1;
            // // 如果是自动旋转模式下
            // if (isAndroidAuto) {
            //   SystemChrome.setPreferredOrientations([
            //     DeviceOrientation.portraitUp,
            //     DeviceOrientation.portraitDown,
            //     DeviceOrientation.landscapeRight,
            //     DeviceOrientation.landscapeLeft,
            //   ]);
            // }
          } else {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ]);
          }
        }
        setState(() {});
      },
      child: Container(
        child: AiSvgPicture.asset(
          !isLock ? 'assets/images/liveplayer/icon_live_lock_open.svg' : 'assets/images/liveplayer/icon_live_lock_close.svg',
          width: SvgPictureWidth,
          height: SvgPictureWidth,
        ),
      ),
    );
  }
}
