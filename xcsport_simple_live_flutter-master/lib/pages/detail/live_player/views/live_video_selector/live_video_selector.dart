import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/material.dart';

class LiveVideoSelector extends StatefulWidget {
  final VideoSelectorController controller;
  LiveVideoSelector({Key key, @required this.controller,}) : assert(controller != null), super(key: key);

  @override
  LiveVideoSelectorState createState() => LiveVideoSelectorState();
}

class LiveVideoSelectorState extends State<LiveVideoSelector> {
  var baseLang = config.langMap['baseLang'];
  @override
  void initState() {
    widget.controller.onPanel = onPanel;
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.onPanel = null;
    super.dispose();
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.show : {
        show();
        break;
      }
      case PanelActionType.hide : {
        hide();
        break;
      }
      default : {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.controller.isShow){
      return Container();
    }
    var selectedStyle = AiTextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.medium
    );
    var unSelectedStyle = AiTextStyle(
      color: Colors.white, 
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.medium
    );

    var animationDisable = !(widget.controller?.videoPlayer?.hasAnimateLive ?? false);
    var videoDisable = !(widget.controller?.videoPlayer?.hasVideLive ?? false);

    var scoreStyle = unSelectedStyle;
    var animationStyle = unSelectedStyle;
    var videoStyle = unSelectedStyle;

    var scoreImg = 'assets/images/liveplayer/icon_live_score_normal.svg';
    var animationImg = 'assets/images/liveplayer/icon_live_animation_normal.svg';
    var videoImg = 'assets/images/liveplayer/icon_live_video_normal.svg';

    var videoType = widget.controller.toolPanel.bottomBar.model.videoType;
    switch(videoType){
      case VideoType.Score:
        scoreImg = 'assets/images/liveplayer/icon_live_score_selected.svg';
        scoreStyle = selectedStyle;
        break;
      case VideoType.Animation:
        animationImg = 'assets/images/liveplayer/icon_live_animation_selected.svg';
        animationStyle = selectedStyle;
        break;
      case VideoType.Video:
        videoImg = 'assets/images/liveplayer/icon_live_video_selected.svg';
        videoStyle = selectedStyle;
        break;
    }

    const double pading = 10;
    var body = ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Color(0xD0000000),
        padding: EdgeInsets.only(left:10,right:10),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                config.userInfo.detailSet.selectViewType="default";
                widget.controller.toolPanel.bottomBar.setVideoType(VideoType.Score);
                widget.controller.hide();
              },
              child: Container(
                padding: EdgeInsets.only(bottom: pading, top:pading),
                child: TitleText(
                  title: AiSvgPicture.asset(scoreImg,height: 15,),
                  text: Text(baseLang['detail']['scoreLive1'],style:scoreStyle),
                ),
              ),
            ),
            animationDisable ? Container() : InkWell(
              onTap: (){
                config.userInfo.detailSet.selectViewType="animation";
                widget.controller.toolPanel.bottomBar.setVideoType(VideoType.Animation);
                widget.controller.hide();
              },
              child: Container(
                padding: EdgeInsets.only(bottom: pading, top:pading),
                child: TitleText(
                  title: AiSvgPicture.asset(animationImg,height: 15),
                  text: Text(baseLang['detail']['animationLive'],style:animationStyle),
                ),
              ),
            ),
            videoDisable ? Container() : InkWell(
              onTap: (){
                config.userInfo.detailSet.selectViewType="video";
                widget.controller.toolPanel.bottomBar.setVideoType(VideoType.Video);
                widget.controller.hide();
              },
              child: Container(
                padding: EdgeInsets.only(bottom: pading, top:pading),
                child: TitleText(
                  title: AiSvgPicture.asset(videoImg,height: 15),
                  text: Text(baseLang['detail']['videoLive'],style:videoStyle),
                ),
              ),
            )
          ],
        )
      ),
    );

    return Column(
      children: <Widget>[
        body,
        AiSvgPicture.asset("assets/images/liveplayer/icon_tag_down_black.svg")
      ],
    );
  }

  void show() {
    if(mounted){
      setState(() {
        widget.controller.isShow = true;
      });
    }
  }
  void hide() {
    if(mounted){
      setState(() {
        widget.controller.isShow = false;
      });
    }
  }
}

