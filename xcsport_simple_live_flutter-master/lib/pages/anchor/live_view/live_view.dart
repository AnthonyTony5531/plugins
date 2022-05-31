
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-22
 * 说明：比赛走地状态图标
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'live_view_model.dart';
import 'live_view_style.dart';

class LiveView extends StatelessWidget {
  final LiveViewStyle style;
  final LiveViewModel model;
  LiveView({Key key, LiveViewModel model, LiveViewStyle style}) : 
  this.style = style ?? LiveViewStyle(),
  this.model = model ?? LiveViewModel(),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    //空的
    var nodisplay = Container(width: 0,height: 0,color: Color(0x0));
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
    //开赛-有直播-无主播
    var videoColor = AiImage.asset("assets/images/matchStatus/video_color.gif");
    // var videoColor = AiImage.asset("assets/images/matchStatus/com_video_live_sel_gold@3x.png");
    //未开赛-有视频-有主播
    //var anchor = AiImage.asset("assets/images/matchStatus/com_video_live_anchor_nor@3x.png");
    var anchor = AiImage.userLogo(model.anchorLogo, defaultLogo: "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png");
    //开赛-有主播-有主播
    var anchorColor = AiImage.asset("assets/images/matchStatus/anchor_color.gif", userInternational: true);
    // var anchorColor = AiImage.userLogo(model.anchorLogo, defaultLogo: "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png");
    //数据动态
    var dynamicData = AiImage.asset("assets/images/matchStatus/com_video_live_anchor_nor1.gif");

    //显示动态图
    bool isShowDynamic = false;
    Widget widget;
    switch (model.liveType) {
      // case LiveType.live:
      //   widget = live;
      //   break;
      // case LiveType.liveColor:
      //   widget =  liveColor;
      //   break;
      // case LiveType.amishow:
      //   widget =  amishow;
      //   break;
      // case LiveType.amishowColor:
      //   widget =  amishowColor;
      //   break;
      // case LiveType.video:
      //   widget =  video;
      //   break;
      case LiveType.videoColor:
        widget =  videoColor;
        break;
      case LiveType.anchorColor:{
        // isShowDynamic = model.isShowDynamic;
        if(!ModuleSwitch.getInstance().videoAndAnchor()){
          widget = SizedBox();
        }
        else{
          if(config.isDeleteInternationalAppointModule){
            if(model.isOnlyAnchorLive()){
              widget = SizedBox();
            }
            else{
              widget = videoColor;
            }
          }
          else{
            widget = anchorColor;
          }
        }
      }
        break;
      // case LiveType.anchor:
      //   isShowDynamic = false;
      //   widget =  anchor;
      //   break;
      default:
        return nodisplay;
        break;
    }

    if (model?.showType != 'RB') {
      return Container();
    }
    return Container(
      height: 13,
      // width: 12,
      child: widget,
    );

    // isShowDynamic = false;

    // Widget showDynamicWidget = Container();
    // if (isShowDynamic) {
    //   showDynamicWidget = ClipRRect(
    //     borderRadius: BorderRadius.circular(6.0),
    //     child: Container(
    //       width: 30,
    //       height: 12,
    //       color: config.skin.colors.attentionColor1,
    //       child: Stack(
    //         children: <Widget>[
    //           Positioned(
    //             left: 3,
    //             width: 12,
    //             height: 12,
    //             child: ClipOval(child: widget),
    //           ) ,             
    //           Positioned(
    //             left: 16,
    //             width: 12,
    //             height: 12,
    //             child: dynamicData,
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    // else{
    //   showDynamicWidget = Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       (model.liveType == LiveType.anchorColor || model.liveType == LiveType.anchor)
    //       ? ClipOval(
    //           child: Container(
    //             width: 12,
    //             height: 12,
    //             child: widget,
    //           ),
    //         )
    //       : widget,
    //       isShowDynamic?dynamicData:Container()
    //     ],
    //   );
    // }
      
    // if(model.liveType == LiveType.anchor){
    //   return Container(
    //     height: 14,
    //     child: showDynamicWidget,
    //   );
    // }else{
    //   return Container(
    //     height: 12,
    //     child: showDynamicWidget,
    //   );
    // }
  }
}
