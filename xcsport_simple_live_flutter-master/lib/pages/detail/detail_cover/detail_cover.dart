import 'package:auto_size_text/auto_size_text.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/refined_match.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailCover extends StatelessWidget {
  final String showType;
  final String isFinishGame;
  final MatchesDetailModel matchesDetailModel;

  DetailCover({this.showType = '', this.isFinishGame = '', this.matchesDetailModel});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = AiTextStyle(
        color: Colors.white,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h3);

    bool isFinish = (!isStrNullOrEmpty(isFinishGame) && isFinishGame == 'Y');
//    bool isShowBetTitle = (showType == 'RB' || showType == 'FU');
    String betText = baseLang['detail']['chatroom']['betTitleHit'];
    String finishText = baseLang['detail']['chatroom']['finishTitleHit'];
    // 精选取配置的颜色
//    String refinedBg = matchesDetailModel?.data?.leagueBackgroundImage;
//    String leagueColorStr = matchesDetailModel?.data?.leagueColor;
//    Color leagueColor = RefinedMatch?.leagueNameColor(leagueColorStr, defaultColor: config.customStyle.refinedBgColor);
    Color marginColor = config.customStyle.refinedBgColor;
    List<Color> gradientColors = [
      config.customStyle.refinedBgColor.withOpacity(0.0),
      config.customStyle.refinedBgColor,
    ];
//    if(!isStrNullOrEmpty(refinedBg) && !isStrNullOrEmpty(leagueColorStr)){
//      gradientColors = [
//        leagueColor.withOpacity(0.0),
//        leagueColor
//      ];
//      marginColor = leagueColor;
//    }

    return Stack(
      children: [
        Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                    height: 110.0,
                    alignment: Alignment(0.0, 0.5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: gradientColors)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0),
                        Container(width: 82.0, height: 1.0, color: Colors.white.withOpacity(0.5)),
                        SizedBox(width: 10.0),
                        isFinish
                            ? AiImage.svgLogo('assets/images/square/icon_list_euro_end.svg', color: Colors.white, width: 16.0, height: 16.0)
                            : AiImage.asset('assets/images/square/icon_live.gif', width: 16.0, height: 16.0),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: Center(
                            child: AutoSizeText(
                              isFinish ? finishText : betText,
                              style: titleStyle,
                              minFontSize: 10.0,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(width: 82.0, height: 1.0, color: Colors.white.withOpacity(0.5)),
                        SizedBox(width: 10.0),
                      ],
                    )),
                Container(
                  height: config.isTabSDK ? 50.0 : 20,
                  color: marginColor,
                )
              ],
            ))
      ],
    );
  }
}
