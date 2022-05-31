import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnchorContributionTitle extends StatelessWidget {

  final Function userInfoClick;
  final String rightInfo;
  AnchorContributionTitle({this.userInfoClick,this.rightInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      color: Color(0xFFF2F2F2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _configUserInfoWidget(),
          Container(
            margin: EdgeInsets.only(right: 70.0),
            child: Text(rightInfo,style: titleStyle(),),
          )
        ],
      ),
    );
  }

  Widget _configUserInfoWidget(){
    var userInfoW = Container(
      margin: EdgeInsets.only(left: 38.0),
      child: Text(config.langMap['baseLang']['detail']['userInfo'],style: titleStyle(),),
    );
    return userInfoClick == null ? userInfoW : Row(
      children: [
        userInfoW,
        InkWell(
          onTap: () async {
            userInfoClick();
          },
          child: Container(
            height: 24.0,
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 4.0,right: 4.0),
            child: AiSvgPicture.asset('assets/images/rank/icon_detail_rank_i.svg',width: 10.0,height: 10.0),
          ),
        ),
      ],
    );
  }

  TextStyle titleStyle(){
    return AiTextStyle(
        color: Color(0xFF838EB8),
        fontWeight: config.skin.fontWeight.regular,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontSize: config.skin.fontSize.h6
    );
  }
}
