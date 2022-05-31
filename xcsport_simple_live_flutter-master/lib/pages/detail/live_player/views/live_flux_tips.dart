//**********************************************************************
//* author:Sam
//* date:2020-02-25
//**********************************************************************

import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/video_player/video_player.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/ui_helper.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../live_player_config.dart';
import '../live_player_controller.dart';
import 'video_player_cache.dart';

//流量
class LiveFluxTips extends StatefulWidget {
  final VoidCallback toContinuePlay; //继续播放
  final VoidCallback actionCallback; // 动画直播
  final VoidCallback onClickBroad;
  final VoidCallback onScoreCallback; // 比分直播(详情底部栏更多切换比分)
  final String actionTitle;

  final bool hasAnimateLive;

  LiveFluxTips(
      {this.onClickBroad,
      this.toContinuePlay,
      this.actionTitle,
      this.hasAnimateLive = false,
      this.onScoreCallback,
      this.actionCallback}); //动画播放

  @override
  _LiveFluxTipsState createState() => _LiveFluxTipsState();
}

Map get baseLang => config.baseLang;

class _LiveFluxTipsState extends State<LiveFluxTips> {
  bool isCheckAutoPlayingWith4g = false;

  StreamSubscription<DetailMoreChangeVideoEvent> changeVideoEvent;


  @override
  void initState() {
    // 详情底部更多切换视频
    changeVideoEvent = Event.eventBus.on<DetailMoreChangeVideoEvent>().listen((event) {
      DetailMoreChangeVideoEvent videoEvent = event;
      // 视频
      if(videoEvent.videoType == VideoType.Video){
        if(widget?.toContinuePlay != null){
          widget?.toContinuePlay();
          VideoPlayerCache.saveFluxTips(true);
        }
      }
      // 动画
      else if(videoEvent.videoType == VideoType.Animation){
        if(widget?.actionCallback != null){
          widget?.actionCallback();
        }
      }
      // 比分
      else if(videoEvent.videoType == VideoType.Score){
        if(widget?.onScoreCallback != null){
          widget?.onScoreCallback();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    changeVideoEvent.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextHelper.buildContentTitle(
              config.langMap['baseLang']['detail']['mobileNetworkPlayText'],
              textColor: Colors.white.value),
          InterValHelper.h(8),
          GestureDetector(
            onTap: () {
              isCheckAutoPlayingWith4g = !isCheckAutoPlayingWith4g;
              setState(() {});
            },
            child: Container(
              color: Colors.transparent,
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AiSvgPicture.asset(
                      !isCheckAutoPlayingWith4g
                          ? "assets/images/default/form_radio_normal.svg"
                          : "assets/images/default/form_radio_selected.svg",
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    InterValHelper.w(6),
                    TextHelper.buildContentTitle(
                        config.langMap['baseLang']['detail']
                            ['videoPlayAutoNotWifiText'],
                        textColor: !isCheckAutoPlayingWith4g
                            ? Colors.white.withOpacity(0.5).value
                            : Colors.white.value),
                  ],
                ),
              ),
            ),
          ),
          InterValHelper.h(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  if(widget?.toContinuePlay != null){
                    widget.toContinuePlay();
                    VideoPlayerCache.saveFluxTips(isCheckAutoPlayingWith4g);
                  }
                },
                child: UiHelper.circularRectangleContainer(
                    child: TextHelper.buildNormal(
                        config.langMap['baseLang']['detail']['continuePlay'],
                        textColor:
                            config.customStyle.themeIncludeFontColor.value),
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.only(
                        left: 13, top: 5, right: 13, bottom: 5)),
              ),
              InterValHelper.w(10),
              InkWell(
                onTap: widget.actionCallback,
                child: UiHelper.circularRectangleContainer(
                    child: TextHelper.buildNormal(widget.actionTitle,
                        textColor: Colors.white.withOpacity(0.4).value),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    bolderWidth: 1,
                    bolderColor: Colors.white.withOpacity(0.4),
                    padding: EdgeInsets.only(
                        left: 13, top: 5, right: 13, bottom: 5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* 单独写个类
class LiveFluxTipsCache {
  //保存移动流量自动播放视频设置
  static void save(bool autoPlayingWithMobile) {
    AiCache.get()
        .setBool("FluxTipsCache_autoPlayingWithMobile", autoPlayingWithMobile);
  }

  static bool isAutoPlayingWithMobile() {
    return true;
    // var value = AiCache.get().get("FluxTipsCache_autoPlayingWithMobile");
    // if (null == value) return true;
    // return value;
  }
}
*/

class LiveFluxTipsLayout extends StatelessWidget {
  final CommonVideoPlayerController player;

  const LiveFluxTipsLayout({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    bool flux_tips_enable = false;
//    if(ModalRoute.of(context).settings.arguments is Map){
//      flux_tips_enable = (ModalRoute.of(context).settings.arguments as Map)['flux_tips_enable']??true;
//    }
    var ret = player.needShowFluxWidget
        ? LiveFluxTips(
            hasAnimateLive: player?.hasAnimateLive??false,
            onClickBroad: () {
              if (player.toolPanel.isHideFinished) {
                player.toolPanel.show();
              } else {
                player.toolPanel.hide();
              }
              player.toolPanel.dismiss();
            },
            toContinuePlay: () {
              player.toolPanel.bottomBar.setVideoType(VideoType.Video);
              player.toolPanel.hide();
              player.cfg.fluxMode = AiFluxMode.ArrowMobile;
            },
            actionCallback: () {
              if (player?.hasAnimateLive??false) {
                //如果是动画直播
                player.cfg.fluxMode = AiFluxMode.ArrowMobile;
                player.toolPanel.bottomBar.setVideoType(VideoType.Animation);
                player.toolPanel.hide();
              } else {
                player.toolPanel.bottomBar.setVideoType(VideoType.Score);
                player.toolPanel.hide();
              }
            },
            onScoreCallback: (){
              player.toolPanel.bottomBar.setVideoType(VideoType.Score);
              player.toolPanel.hide();
            },
            actionTitle: !player?.hasAnimateLive??false
                ? baseLang['detail']['scoreLive']
                : baseLang['detail']['animationLive'],
          )
        : Container();
    return ret;
  }
}

class LiveFluxTipsBackground extends StatelessWidget {
  final CommonVideoPlayerController player;

  const LiveFluxTipsBackground({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool fluxTipsEnable = false;
    if (ModalRoute.of(context).settings.arguments is Map) {
      fluxTipsEnable = (ModalRoute.of(context).settings.arguments
              as Map)['flux_tips_enable'] ??
          true;
    }
    player.shouldShowToastWhenMobileTryPlay();
    return player.needShowFluxWidget && fluxTipsEnable
        ? Container(
//            decoration: BoxDecoration(
//                image: DecorationImage(
//              alignment: Alignment.topCenter,
//              image: AiImage.assetImage(AiImageHelper.gameTypeBg("FT")),
//              fit: BoxFit.cover,
//            )),
            color: Colors.black,
          )
        : Container();
  }
}
