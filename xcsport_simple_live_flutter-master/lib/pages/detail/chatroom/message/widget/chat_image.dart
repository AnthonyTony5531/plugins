import 'package:fast_ai/pages/detail/chatroom/common/chat_icon_const.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */

//聊天组件的图片视图
class ChatImage{
  static get fit => null;


  static Widget build(String url, {double width, double height, String placeHolder  = placeholder_chat_header,  BoxFit fit=BoxFit.cover}){
//    return new FadeInImage.assetNetwork(
//        placeholder: placeHolder,
//        width: width,
//        height: height,
//        image: url??"http://www.xc.com/test/test.png",
//        fit: fit,
//    );
    return AiImage.userLogo(url,size: 24);
  }

  static Widget levelHeadBuild(int level, { double width, double height }) {
    // 平民不显示段位头像
    if (level == 0 || level == null) {
      return Container();
    }
    String levelImg = "assets/images/match_detail/icon_rank_lv_${level + 1}.png";
    return AiImage.asset(levelImg, width: width, height: height);
  }

  static Widget anchorBuild(String url, {double width, double height, String placeHolder  = placeholder_chat_header,  BoxFit fit=BoxFit.cover}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17.5)),
                border: Border.all(color: Color(0xFFFB3881),width: 0.5),
              ),
              width: 27.0,
              height: 27.0,
            ),
            Container(
              margin: EdgeInsets.all(1.5),
              child: ClipRRect(
                child: Container(
                  width: 24,
                  height: 24,
                  child: ChatImage.build(url),
                  margin: EdgeInsets.only(right: 5),
                ),
              ),
            )
          ],
        ),
        Container(margin: EdgeInsets.only(left: 2.0),),
        Container(
          margin: EdgeInsets.only(bottom: 3.0),
          child: SizedBox(
            width: 37.0,
            height: 15.0,
            child: AiImage.svgLogo('assets/images/message/icon_detail_tag_anchor.svg',width: 37.0,height: 15.0, userInternational: true),
          )
        ),
        Container(margin: EdgeInsets.only(left: 4.0),),
      ],
    );
  }



}