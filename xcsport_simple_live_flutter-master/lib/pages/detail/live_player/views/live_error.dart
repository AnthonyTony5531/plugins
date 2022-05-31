import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/shape_button.dart';
import 'package:fast_ai/widgets/ui_helper.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import '../live_player_config.dart';
import 'live_bottombar/live_bottombar_model.dart';

class LiveError extends StatefulWidget {
  final CommonVideoPlayerController player;
  final bool isVlogLive; //小视频里面直播
  final bool isFreeAnchor;
  final VoidCallback onEntryGameDetail; // 小视频回调进比赛详情
  LiveError({Key key, @required this.player, this.isFreeAnchor = false ,this.isVlogLive = false,this.onEntryGameDetail}) : super(key: key);

  @override
  _LiveErrorState createState() => _LiveErrorState();
}

class _LiveErrorState extends State<LiveError> with TickerProviderStateMixin {

  String animationLiveText = '';
  String scoreLiveText = '';

  AiVideoController get videoPlayer => widget?.player?.player;
  StreamSubscription<AiVideoState> _videoStateListener;
  @override
  void initState() {
    animationLiveText = baseLang['detail']['animationLive'];
    scoreLiveText = baseLang['detail']['scoreLive1'];
    _videoStateListener = videoPlayer.onVideoState.listen(playStateChanged);
    super.initState();
  }

  @override
  void dispose() {
    _videoStateListener.cancel();
    _videoStateListener = null;
    super.dispose();
  }

  playStateChanged(AiVideoState state) async {
    await sleep(10);
    if (mounted) setState(() {});
  }

  var baseLang = config.langMap['baseLang'];

  @override
  Widget build(BuildContext context) {
    if(videoPlayer?.isError ?? false) return buildError();

    return Container();
  }

  Widget buildError() {
    String title = (widget.player?.hasAnimateLive ?? false) ? animationLiveText : scoreLiveText;
    return widget.isVlogLive
      ? GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: Color(0xFF071C29),
            child: Align(
              child: TextHelper.buildNormal(baseLang['detail']['errorloadingOnLive'], textColor: Colors.white.value),
            ),
          ),
          onTap: (){
                if(widget.onEntryGameDetail != null){
                  widget.onEntryGameDetail();
                }
          },
      )
      : Container(
      color: Color(0xFF071C29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextHelper.buildNormal(baseLang['detail']['errorloadingOnLive'],
              textColor: Colors.white.value),
          InterValHelper.h(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  videoPlayer?.replay();
                },
                child: shapeButton(
                    child: TextHelper.buildNormal(baseLang['detail']['reload'],
                        textColor:
                            config.customStyle.themeIncludeFontColor.value),
                    padding: EdgeInsets.only(
                        left: 13, top: 5, right: 13, bottom: 5)),
              ),
//              InkWell(
//                onTap: () {
//                  config.userInfo.detailSet.selectViewType = "default";
//                  widget.player.toolPanel.bottombar
//                      .setVideoType(VideoType.Score);
//                },
//                child: Container(
//                  margin: EdgeInsets.only(left: 10),
//                  child: UiHelper.circularRectangleContainer(
//                      child: TextHelper.buildNormal(
//                          baseLang['detail']['scoreLive1'],
//                          textColor: Colors.white.withOpacity(0.4).value),
//                      color: Colors.transparent,
//                      borderRadius: BorderRadius.circular(15),
//                      bolderWidth: 1,
//                      bolderColor: Colors.white.withOpacity(0.4),
//                      padding: EdgeInsets.only(
//                          left: 13, top: 5, right: 13, bottom: 5)),
//                ),
//              ),
              Show(
                isShow:!widget.isFreeAnchor,
                child: InkWell(
                  onTap: () {

                    Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: true));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: UiHelper.circularRectangleContainer(
                        child: TextHelper.buildNormal(
                            baseLang['detail']['changeLive'],
                            textColor: Colors.white.withOpacity(0.4).value),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        bolderWidth: 1,
                        bolderColor: Colors.white.withOpacity(0.4),
                        padding: EdgeInsets.only(
                            left: 13, top: 5, right: 13, bottom: 5)),
                  ),
                ),
              ),
//              !widget.player?.hasAnimateLive??false
//                  ? Container()
//                  :
              Offstage(
                offstage: config.isNotCnTwLang,
                child: Show(
                  isShow:!widget.isFreeAnchor,
                  child: InkWell(
                          onTap: () {
                            String selectLiveType = SelectViewTypeScore;
                            Event.eventBus.fire(WifiEvent(AiFluxMode.ArrowMobile));
                            VideoType videoType = VideoType.Score;
                            if(widget.player?.hasAnimateLive ?? false){
                              selectLiveType = SelectViewTypeAnimation;
                              videoType = VideoType.Animation;
                            }
                            config.userInfo.detailSet.selectViewType = selectLiveType;
                            widget.player.toolPanel.bottomBar.setVideoType(videoType);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: UiHelper.circularRectangleContainer(
                                child: TextHelper.buildNormal(
                                    title,
                                    textColor: Colors.white.withOpacity(0.4).value),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                bolderWidth: 1,
                                bolderColor: Colors.white.withOpacity(0.4),
                                padding: EdgeInsets.only(
                                    left: 13, top: 5, right: 13, bottom: 5)),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget oldUi() {
    Widget reloadWidget = InkWell(
      onTap: () {
        videoPlayer?.replay();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            config.langMap['baseLang']['detail']['livePlayer']['loadFailed'],
            style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontSize: 12,
                color: Colors.white),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                  "${config.langMap['baseLang']['detail']['livePlayer']['youCanTry']}  ",
                  style: AiTextStyle(
                      fontFamily: config.skin.fontFimaly.pingFang,
                      fontSize: 10,
                      color: Colors.white54)),
              Text(baseLang['detail']['reload'],
                  style: AiTextStyle(
                      fontFamily: config.skin.fontFimaly.pingFang,
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.secondary)),
            ],
          )
        ],
      ),
    );

    var animationDisable = !widget.player?.hasAnimateLive??false;
    var color = Color(0x55FFFFFF);
    Border boxBorder = Border.all(width: 1, color: color); // 边框
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        reloadWidget,
        Container(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: boxBorder,
          ),
          padding: EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              animationDisable
                  ? Container()
                  : InkWell(
                      onTap: () {
                        config.userInfo.detailSet.selectViewType = "animation";
                        Event.eventBus.fire(WifiEvent(AiFluxMode.ArrowMobile));
                        widget.player.toolPanel.bottomBar
                            .setVideoType(VideoType.Animation);
                      },
                      child: Text(baseLang['detail']['animationLive'],
                          style: AiTextStyle(
                              fontFamily: config.skin.fontFimaly.pingFang,
                              fontSize: 12,
                              color: color)),
                    ),
              animationDisable
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: 1,
                        height: 15,
                        color: color,
                      ),
                    ),
              InkWell(
                onTap: () {
                  config.userInfo.detailSet.selectViewType = "default";
                  widget.player.toolPanel.bottomBar
                      .setVideoType(VideoType.Score);
                },
                child: Text(baseLang['detail']['scoreLive1'],
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: 12,
                        color: color)),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
