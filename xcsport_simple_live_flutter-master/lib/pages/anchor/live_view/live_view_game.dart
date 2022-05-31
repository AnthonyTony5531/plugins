import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-22
 * 说明：比赛走地状态图标
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'live_view_model.dart';
import 'live_view_style.dart';

class LiveGameView extends StatelessWidget {
  final LiveViewStyle style;
  final LiveViewModel model;
  final ValueChanged<String> onAnchorTap;
  LiveGameView({Key key, LiveViewModel model, LiveViewStyle style, this.onAnchorTap}) : 
  this.style = style ?? LiveViewStyle(),
  this.model = model ?? LiveViewModel(),
  super(key: key);

  double height = 16;

  @override
  Widget build(BuildContext context) {
    //空的
    var nodisplay = Container(width: 1,height: 1,color: Color(0x0));
    //未开赛-有走地
    var live = AiImage.asset("assets/images/matchStatus/com_live_nor_gray.png");
    //开赛-有走地
    var liveColor = AiImage.asset("assets/images/matchStatus/com_live_nor_animation.png");
    //未开赛-有动画直播
    var amishow = AiImage.asset("assets/images/matchStatus/com_animation_live_nor_gray.png",);
    //开赛-有动画直播
    var amishowColor = AiImage.asset("assets/images/matchStatus/com_animation_live_nor_animation.png",);
    //未开赛-有视频-无主播
    var video = AiImage.asset("assets/images/matchStatus/com_video_live_nor_gray@3x.png");
    //开赛-有主播-无主播
    var videoColor = ClipOval(child:AiImage.asset("assets/images/liveplayer/icon_live_video_play.png"));
    //未开赛-有视频-有主播
    //var anchor = AiImage.asset("assets/images/matchStatus/com_video_live_anchor_nor@3x.png");
    // var anchor = AiImage.fromUrl(model.anchorLogo, "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png");
    // //开赛-有主播-有主播
    // var anchorColor = AiImage.fromUrl(model.anchorLogo, "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png");

    //显示动态图
    bool isNodisplay = false;
    String text = "";
    Widget widget;
    switch (model.liveType) {
      case LiveType.live:
        widget = live;
        text = "${config.langMap['baseLang']['widgets']['liveView']['type']['score']}";
        break;
      case LiveType.liveColor:
        widget =  liveColor;
        break;
      case LiveType.amishow:
        widget =  amishow;
        text = "${config.langMap['baseLang']['widgets']['liveView']['type']['animate']}";
        break;
      case LiveType.amishowColor:
        widget =  amishowColor;
        break;
      case LiveType.video:
        // isShowDynamic = model.isShowDynamic;
        widget =  video;
        text = "${config.langMap['baseLang']['widgets']['liveView']['type']['video']}";
        break;
      case LiveType.videoColor:
        // isShowDynamic = model.isShowDynamic;
        widget =  videoColor;
        break;
      case LiveType.anchorColor:
        height = 20;
        widget =  model.anchorLogos.length == 0 ? Container() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: model.anchorLogos.take(3).map((f)=>
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 3,right: 3),
                child: AiImage.userLogo(f.icon, size : 20, defaultLogo : "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png")
              ),
              onTap: (){
                if(onAnchorTap != null){
                  onAnchorTap(f.anchorId);
                }
              },
            )
          ).toList()
        );
        break;
      case LiveType.anchor:
        height = 20;
        widget = model.anchorLogos.length == 0 ? Container() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: model.anchorLogos.take(3).map((f)=>
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 3,right: 3),
                child: AiImage.userLogo(f.icon, size : 20, defaultLogo : "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png")
              ),
              onTap: (){
                if(onAnchorTap != null){
                  onAnchorTap(f.anchorId);
                }
              },
            )
          ).toList()
        );
        text = "${config.langMap['baseLang']['widgets']['liveView']['type']['anchor']}";
        break;
      default:
        nodisplay = Container();
        text = "${config.langMap['baseLang']['widgets']['liveView']['type']['detail']}";
        isNodisplay = true;
        break;
    }

    if(model.liveType == LiveType.anchor){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          isNodisplay ? Container() : Container(
            height: height,
            child: widget,
            margin: EdgeInsets.only(bottom: 5),
          ),
          isNullOrEmpty(text) ?  Container() : Text(text,style:AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontSize: 12,
            color: Color(0xFF000000),
          ))
        ],
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          isNodisplay ? Container() : Container(
            height: height,
            child: widget,
            margin: EdgeInsets.only(bottom: 5),
          ),
          isNullOrEmpty(text) ?  Container() : Text(text,style:AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontSize: 12,
            color: Color(0xFF000000),
          ))
        ],
      );
    }
  }
}
