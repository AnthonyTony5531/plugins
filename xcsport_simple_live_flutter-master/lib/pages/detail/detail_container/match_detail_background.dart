import 'dart:ui';

import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';

import '../detail_page_model.dart';

//比赛背景
class MatchDetailBackGround extends StatelessWidget {
  final DPageModel dPageModel;
  final DetailSet detailSet;
  final bool isListDetail;
  final bool isBlur;

  const MatchDetailBackGround({
    Key key,
    @required this.isListDetail,
    @required this.dPageModel,
    @required this.isBlur,
    this.detailSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (detailSet?.detailParams?.isFreeLiveGameAnchor == true){
      return Container(
        color: Color(0xFF19191E)
      );
    }
    if (isListDetail) {
      return SizedBox();
    }
    return Stack(
      fit: StackFit.expand,
      children: [
//        Positioned.fill(
//            child: Visibility(
////              visible: isBlur,
//              child: BackdropFilter(
//                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                child: background(context),
//              ),
//              replacement:background(context),
//            )),

        background(context),
      ],
    );
  }

  Widget background(BuildContext context) {
    if (isListDetail) {
      return Container();
    }
    String bg = dPageModel?.matchBgImage();
    if (bg == null || bg == 'bg_detail_other.png') {
      num liveStatus = detailSet.detailParams?.liveStatus;
      if (liveStatus != null && (liveStatus == 0 || liveStatus == 1)) {
        bg = 'bg_detail_football.png';
      }
    }
    if (null == bg) {
      return Container();
    }
    return dPageModel?.isShowLeagueBg() ?? false
        ? AiImage.fromUrl(
      dPageModel?.matchesDetailModel?.data?.leagueBackgroundImage,
      'assets/images/detail/$bg',
      BoxFit.cover,
      AiMeasure.screenWidth(context),
      AiMeasure.screenHeight(context),
    )
        : AiImage.asset('assets/images/detail/$bg',
        fit: BoxFit.cover,
        width: AiMeasure.screenWidth(context),
        height: AiMeasure.screenHeight(context));
  }
}
