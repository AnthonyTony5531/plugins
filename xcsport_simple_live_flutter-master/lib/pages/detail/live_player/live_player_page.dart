

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_view.dart';
import 'package:fast_ai/pages/detail/video_live/video_live_page.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';

import 'video_player_view/common_video_player_view_model.dart';
import 'views/live_bottombar/live_bottombar_model.dart';


class LivePlayerPage extends StatefulWidget {
  final Widget body;
  final Widget header;
  final Widget nav;
  final CommonVideoPlayerController controller;
  final bool isExpanded;
  // 视频直播
  final double headHeight;
  const LivePlayerPage({Key key,  
    @required this.body, 
    @required this.header,  
    @required this.nav, 
    @required this.controller, 
    @required this.isExpanded,
    this.headHeight = 230,
  }) : super(key: key);

  @override
  LivePlayerPageState createState() => LivePlayerPageState();
}

class LivePlayerPageState extends State<LivePlayerPage> with TickerProviderStateMixin{

  CommonVideoPlayerController get controller{ return widget.controller; }
  AnimationController _animationController;
  Animation _animation; 
  bool isHiddenLiveList = true;
  bool isBet = false;
  @override
  void initState() {
    //非WIFI下自动播放
    // if (config.netConnectStatus == XCNetworkState.mobile) {
    //   config.userInfo.isNetworkVideoPalying = AiCache.get().getBool('selectWIFI') ?? false;
    // } else {
    //   config.userInfo.isNetworkVideoPalying = true;
    // }
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    _animationController.addStatusListener((AnimationStatus status){
      if(AnimationStatus.dismissed == status){
        isHiddenLiveList = true;
        _animationController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void showLiveList(){
    if(!isHiddenLiveList){
      return;
    }
    setState(() {
    });
    isHiddenLiveList = false;
    Future.delayed(Duration(milliseconds: 50),(){
      _animationController.forward();
    });
  }

  void hiddenLiveList(){
    _animationController.reverse();
  }

  Orientation _oldOrientation;
  @override
  Widget build(BuildContext context) {
    // return MediaQuery.removePadding(
    //   context: context,
    //   removeTop: true,
    //   child: Column(
    //     children: <Widget>[
    //       widget.header,
    //       widget.nav,
    //       Expanded(
    //         child: widget.body,
    //       )
    //     ],
    //   ),
    // );
    // 底部显示投注栏
    int count = 0;
//    config.userInfo.hitMap.values.forEach((f){
//      count += f.length;
//    });
    isBet = count > 0;
    double bottomBetHeight = isBet ? 72.0 : 0;
    double topOffset = AiMeasure.topOffset(context);
    double screenHeight = MediaQuery.of(context).size.height;
    Animation curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animation = Tween(begin: -(screenHeight - (topOffset + widget?.headHeight + bottomBetHeight)) * 1.0,end: 0.0).animate(curve);

    var padding = MediaQuery.of(context).padding;
    var body = OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if(_oldOrientation != orientation){
          var direction = (orientation == Orientation.landscape) ? ScreenDirection.LeftRight : ScreenDirection.TopDown;
          _oldOrientation = orientation;
          //发送消息通知详情页【显示/隐藏】投注栏
          Event.eventBus.fire(DetailOrientationEvent(orientation));

          print('00-live_player_page-direction0=${controller.toolPanel.bottomBar.model.screenDirection}, direction1=$direction');
          controller.toolPanel.bottomBar.model.screenDirection = direction;
          controller.toolPanel.bottomBar.update();
        }
        var offstateBody = orientation == Orientation.landscape;
        if(offstateBody){
          _animationController.reset();
        }
        var videoPlayerVM = CommonVideoPlayerViewModel.create(
          padding: padding,
          defaultHeader: widget.header,
          canRotate: widget.isExpanded
        );
        return Column(
          children: <Widget>[
            CommonVideoPlayerView(
              model: videoPlayerVM,
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                      Column(
                        children: <Widget>[
                          Offstage(
                            offstage: offstateBody,
                            child: widget.nav,
                          ),
                          Expanded(
                            child: Offstage(
                              offstage: offstateBody,
                              child: widget.body,
                            ),
                          )
                        ],
                      ),
                      Offstage(
                        offstage: offstateBody || isHiddenLiveList,
                        child: AnimatedBuilder(
                          animation: _animation, 
                          builder: (BuildContext context, Widget child){
                            return Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: _animation.value * 1.0,
                                  height: screenHeight - (topOffset + widget?.headHeight + bottomBetHeight),
                                  child: VideoLivePage(
                                    currentLiveVideoInfo: controller.toolPanel.anchorSelectorFull.model.currentAnchor,
                                    onClose: (){
                                      hiddenLiveList();
                                  },)
                                ),
                              ],
                            );
                          }
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    return MediaQuery.removePadding(
      removeLeft: true,
      removeBottom: true,
      removeTop: true,
      removeRight: true,
      context: context,
      child: body,
    );
  }
}

