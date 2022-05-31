//**********************************************************************
//* author:Sam
//* date:2020-05-18
//**********************************************************************

//返回箭的PaddingLeft
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/app_bar_widget.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

const CommonAppbarLeadingPaddingLeft = 14.0;
const CommonAppbarLeadingPaddingRight = 14.0;
const CommonAppbarLeadingSize = 20.0;
const CommonAppbarTitleSize = 16.0;
const CommonAppbarTitleSmallSize = 14.0;


// ignore: must_be_immutable
//class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
//  Widget leading;
//  Widget title;
//  Widget actions;
//  Color backgroundColor;
//  String text = '';
//
//  CommonAppbar.text(this.text,
//      {Color textColor = Colors.white,
//      Color leadingColor = Colors.black,
//      this.backgroundColor = Colors.black}) {
//    leading = CommonAppbarLeading(
//      color: leadingColor,
//    );
//    title = Container(
//      margin: EdgeInsets.only(
//        left: CommonAppbarLeadingPaddingLeft +
//            CommonAppbarLeadingPaddingRight +
//            CommonAppbarLeadingSize,
//      ),
//      child: Row(
//        children: <Widget>[
//          Flexible(
//            child: TextHelper.buildContentTitle(string(),
//                maxLine: 3,
//                textColor: textColor.value,
//                textAlign: TextAlign.center),
//          ),
//          Row(
//            children: actions ?? [Container()],
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: backgroundColor,
//      child: Stack(
//        children: <Widget>[
//          InkWell(
//            onTap: () {
//              if (null != leading) {
//                AiRouter.pop(context);
//              }
//            },
//            child: leading ?? Container(),
//          ),
//          title,
//          Positioned(
//            right: 0,
//            child: Row(
//              children: actions ?? [Container()],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  @override
//  Size get preferredSize {
//    return Size(double.infinity, kToolbarHeight);
//  }
//}

class CommonAppbarText extends StatelessWidget {

  final Color color;
  final String text;

  const CommonAppbarText(this.text, {Key key, this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextHelper.buildBarTitle(text,
      fontFamily: FontFamily.normal,
      textColor: color.value, maxLine: 1, );
  }
}



class CommonAppbarLeading extends StatelessWidget {

  final Color color;

  const CommonAppbarLeading({Key key, this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // 精选赛事赛果详情返回
        if(config.userInfo.isShowRefinedDetail){
          config.userInfo.isShowRefinedDetail = false;
          config.userInfo.isShowRefinedFinishGameDetail = false;
          if(config.isTabSDK){
            XcSdkApi.showBottomBar();
          }
          Event.eventBus.fire(RefinedFinishGameEvent());
          sleep(50,(){
            Event.eventBus.fire(RefinedDetailEvent(isShowRefinedDetail: false));
          });
          return;
        }
        else{
          AiRouter.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: CommonAppbarLeadingPaddingLeft,
            right: CommonAppbarLeadingPaddingRight),
        child: Icon(
          Icons.arrow_back_ios,
          color: color,
          size: CommonAppbarLeadingSize,
        ),
      ),
    );
  }
}
