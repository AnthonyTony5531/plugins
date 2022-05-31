import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/member/anchorHomePage/anchor_home_page.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

//主播头像+动态图标，用在详情
class AnchorHead extends StatelessWidget {
  final String url;
  final String anchorId;
  AnchorHead({Key key, this.anchorId, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //开赛-有主播-有主播
    var anchorColor = AiImage.fromUrl(url, "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png");
    //数据动态
    var dynamicData = AiImage.asset("assets/images/matchStatus/com_video_live_anchor_nor1.gif");

    Widget showDynamicWidget = Container();
    showDynamicWidget = ClipRRect(
      //borderRadius: BorderRadius.circular(6.0),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 45,
          //height: 18,
          color: config.skin.colors.attentionColor1,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 4,
                left: 5,
                width: 15,
                height: 15,
                child: anchorColor,
              ),
              Positioned(
                top: 4,
                left: 23,
                width: 15,
                height: 15,
                child: dynamicData,
              ),
            ],
          ),
        ),
      ),
    );

    return Container(
      height: 24,
      child: showDynamicWidget,
    );
  }
}
