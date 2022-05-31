import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'dart:async';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:flutter/material.dart';

class VideoLiveMenu extends StatefulWidget {
  VideoLiveMenu({Key key ,this.videoLiveController}) : super(key: key);
  final VideoLiveController videoLiveController;

  @override
  VideoLiveMenuState createState() => VideoLiveMenuState();
}

class VideoLiveMenuState extends State<VideoLiveMenu> with TickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;
  bool isExpand = false;
  VideoLiveController get controller => widget?.videoLiveController;
  Timer timer;
  bool isHidden = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration:Duration(milliseconds: 250));
    Animation curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animation = Tween(begin:55.0, end: 0.0).animate(curve);
    _animationController.addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.dismissed){
        // _animationController.reset();
      }
    });

    Future.delayed(Duration(milliseconds: 2000),(){
      _animationController.forward();
      isExpand = true;
    });
    Future.delayed(Duration(seconds: 5),(){
      _animationController.reverse();
      isExpand = false;
    });
    controller.onPanel = onPanel;
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    controller.onPanel = null;
    super.dispose();
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.show : {
        show();
        break;
      }
      case PanelActionType.hide : {
        dismiss();
        break;
      }
      default : {
        break;
      }
    }
  }

  void show(){
    if(mounted){
      isHidden = false;
      timer?.cancel();
      timer = null;
      _animationController?.reset();
      _animationController?.forward();
      timer = Timer(Duration(seconds: 5), (){
        _animationController?.reverse();
      });
      print('显示按钮------');
    }
  }
   void dismiss(){
     if(mounted){
      isHidden = true;
      _animationController?.reset();
      _animationController?.forward();
      print('隐藏按钮------');
     }
   }

  @override
  Widget build(BuildContext context) {
    if(controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();
    return AnimatedBuilder(
      animation: _animationController, 
      builder: (BuildContext context, Widget child){
        print('视频直播偏移----:${_animation.value}');
        return Transform.translate(
          offset: Offset(_animation.value + (isHidden ? 100.0 : 0.0), 0),
          child: Container(
            width: 86,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
              color: Colors.black.withOpacity(0.9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 28,
                  width: 28,
                  child: IconButton(
                    icon: AiImage.svgLogo('assets/images/liveplayer/icon_detail_more_live.svg',size: 12),
                    iconSize: 12,
                    onPressed: (){
                      sendLiveListEvent();
                    },
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    sendLiveListEvent();
                  },
                  child: Container(
                    // color: Colors.orange,
                    margin: EdgeInsets.only(right: 5),
                    child: Text(config.langMap['baseLang']['detail']['videoLive'],style: AiTextStyle(
                        color: Colors.white,
                        fontSize: config.skin.fontSize.h5,
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontWeight: config.skin.fontWeight.regular
                      )
                    )
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void sendLiveListEvent(){
    Event.eventBus.fire(DetailLiveEvent());
    if(!isExpand){
      _animationController.forward();
      timer?.cancel();
      timer = null;
      timer = Timer(Duration(seconds: 5), (){
        _animationController.reverse();
        isExpand = false;
      });
    }
  }
}
