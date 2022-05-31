import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_style.dart';
import 'package:fast_ai/widgets/line_border.dart';
import 'package:flutter/material.dart';

class VideoLiveCell extends StatefulWidget {
  VideoLiveCell({Key key, this.cellModel, this.onChangeLive}) : super(key: key);
  final AnchorSubCellModel cellModel;
  final ValueChanged<AnchorSubCellModel> onChangeLive;

  @override
  _VideoLiveCellState createState() => _VideoLiveCellState();
}

class _VideoLiveCellState extends State<VideoLiveCell> {
  AnchorSubCellModel get model => widget?.cellModel ?? AnchorSubCellModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 78,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      child: anchorPhoto(),
                    ),
//                    Expanded(
//                      child: gameInfoWidget(),
//                    ),
                  ],
                ),
              ),
              LineBorder(
                padding: EdgeInsets.only(left: 20, top: 8, right: 20),
                color: Color(0xFFF5F5F5),
              )
            ],
          )),
      onTap: () {
        if (widget?.onChangeLive != null) {
          widget?.onChangeLive(model);
        }
      },
    );
  }

  Widget anchorPhoto() {
    String lookNum = model.watchTotal >= 10000
        ? (model.watchTotal / 10000).toStringAsFixed(1) + 'w'
        : model.watchTotal.toString();
    return Container(
        child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: AiImage.fromUrl(
              model.cover, model.anchorDefaultIcon, BoxFit.cover),
        ),
        Positioned(
            left: 0,
            top: 0,
            width: 24,
            height: 14,
            child: Container(
              padding: EdgeInsets.only(top: 1.5),
              color: Color(0xFFFF4000),
              child: Text(
                'LIVE',
                style: liveStyle(),
                textAlign: TextAlign.center,
              ),
            )),
        Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            height: 18,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Text(
                        model.nickname,
                        style: nickNameStyle(),
                      ),
                    ),
                    Offstage(
                      offstage: model.watchTotal <= 0,
                      child: Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Text(
                          lookNum,
                          style: nickNameStyle(),
                        ),
                      ),
                    ),
                  ],
                ))),
      ],
    ));
  }

//  Widget gameInfoWidget() {
////    TextStyle homeStyle =
////        model.isHomeStrong ? strongTeamStyle() : weakTeamStyle();
//    TextStyle awayStyle =
//        model.isHomeStrong ? weakTeamStyle() : strongTeamStyle();
//    return Container(
//        margin: EdgeInsets.only(left: 15),
//        child: Column(
//          children: <Widget>[
//            leagueWidget(),
//            teamWidget(model.homeLogo, model.homeName, model.homeGoal, true,
//                homeStyle),
//            teamWidget(model.awayLogo, model.awayName, model.awayGoal, false,
//                awayStyle),
//          ],
//        ));
//  }

//  Widget leagueWidget() {
//    return Container(
//      margin: EdgeInsets.only(right: 8, bottom: 8),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Container(
//              child: Row(
//            children: <Widget>[
//              Container(
//                child: AiImage.leagueLogo(model.leagueLogo, size: 16),
//              ),
//              Container(
//                  width: 90,
//                  margin: EdgeInsets.only(left: 5),
//                  child: Text(
//                    model.leagueName,
//                    style: leagueNameStyle(),
//                    overflow: TextOverflow.ellipsis,
//                    maxLines: 1,
//                  ))
//            ],
//          )),
//          Container(
//            child: TimeView(
//                model: TimeViewModel()
//                    .fromCommonMatchsProtocolWithGame(model.rawGame),
//                style: TimeViewStyle(textStyle: timeStyle())),
//          ),
//        ],
//      ),
//    );
//  }

  Widget teamWidget(String teamLogo, String teamName, String score,
      bool isHomeTeam, TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Row(
            children: <Widget>[
              Container(
                child: AiImage.teamLogo(teamLogo,
                    size: 16, isHomeTeam: isHomeTeam),
              ),
              Container(
                  width: 120,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    teamName,
                    style: model.isSelectCurrentLive
                        ? textStyle.copyWith(color: Color(0xFFFF4000))
                        : textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          )),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              score,
              style: scoreStyle(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle scoreStyle() {
    return AiTextStyle(
      color: Color(0xFFFF4000),
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
    );
  }

  TextStyle strongTeamStyle() {
    return AiTextStyle(
      color: Colors.black,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
    );
  }

  TextStyle weakTeamStyle() {
    return AiTextStyle(
      color: Colors.black,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle leagueNameStyle() {
    return AiTextStyle(
      color: Colors.black.withOpacity(0.5),
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle timeStyle() {
    return AiTextStyle(
        color: Colors.black,
        fontSize: config.skin.fontSize.h8,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.medium,
        height: 1.1);
  }

  TextStyle nickNameStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle liveStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontSize: config.skin.fontSize.h8,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.bold,
    );
  }
}
