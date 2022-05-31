import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
//import 'package:fast_ai/pages/detail/head/rbInfo/rbTeamSectionLoading.dart';
import 'package:fast_ai/pages/detail/head/supportSectionLoading.dart';
import 'package:fast_ai/pages/detail/head/team_circle/team_circle_loading.dart';
import 'package:fast_ai/pages/detail/head/titleSectionLoading.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HeadDetailLoading extends StatefulWidget {
  final   double headHeight;

  HeadDetailLoading({
    Key key,
    this.headHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeadDetailLoading();
  }
}

class _HeadDetailLoading extends State<HeadDetailLoading> with WidgetsBindingObserver {
  double get headHeight {
    return widget.headHeight;
  }

  DetailSet detailSet;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String showtype, gameType, homeTeam, awayTeam, homeLogo, awayLogo, leagueName;
  int gameDate;

  //初始值为动画样式
  @override
  Widget build(BuildContext context) {
    detailSet = config.userInfo.detailSet;

    showtype = detailSet.detailParams?.showtype ?? 'FT';
    gameType = detailSet.detailParams?.gameType ?? 'FT';
    gameDate = detailSet.detailParams?.gameDate ?? 000;
    homeTeam = detailSet.detailParams?.homeTeam ?? '';
    awayTeam = detailSet.detailParams?.awayTeam ?? '';
    homeLogo = detailSet.detailParams?.homeLogo ?? '';
    awayLogo = detailSet.detailParams?.awayLogo ?? '';
    leagueName = detailSet.detailParams?.leagueName ?? '';

    EdgeInsets headPadding = EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
    double positionedTop = 65;
    EdgeInsets positionedChildPadding = const EdgeInsets.fromLTRB(20, 12, 20, 0);

    //非滚球时间显示
    Widget fuftTime = Container();
    if (showtype != 'RB') {
      fuftTime = Positioned(
        top: 65,
        child: Container(
          //color: Colors.red,
          width: MediaQuery.of(context).size.width,
          child: Text(
            MM_dd_HH_mm(gameDate),
            textAlign: TextAlign.center,
            style: AiTextStyle(color: Color.fromRGBO(210, 228, 255, 0.5), fontSize: 12, fontFamily: config.skin.fontFimaly.liGothicMed),
          ),
        ),
      );
    }

    return Container(
      padding: headPadding,
      height: headHeight,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: positionedTop,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: positionedChildPadding,
              child: Column(
                children: getHead(context),
              ),
            ),
          ),
          fuftTime,
          TitleSectionLoading(
            leagueName: this.leagueName,
          ),
        ],
      ),
    );
  }

  List<Widget> getHead(BuildContext context) {
    var head = defaultHead();
    return head;
  }

  List<Widget> defaultHead() {
    var head = <Widget>[];
    if (showtype != 'RB') {
      head = <Widget>[
        TeamCircleLoading(
          gameType: this.gameType,
          homeTeam: this.homeTeam,
          awayTeam: this.awayTeam,
          homeLogo: this.homeLogo,
          awayLogo: this.awayLogo,
        ),
        SupportSectionLoading(
          gameType: this.gameType,
        )
      ];
    } else {
      // var scoreDetail;
      // if (gameType == 'FT') {
      //   scoreDetail = FTScoreDetail(matchesDetailModel: matchesDetailModel);
      // } else if (matchesDetailModel.data.gameType == 'BK') {
      //   scoreDetail = BKScoreDetail(matchesDetailModel: matchesDetailModel);
      // } else if (matchesDetailModel.data.gameType == 'TN') {
      //   scoreDetail = TNScoreDetail(matchesDetailModel: matchesDetailModel);
      // }

      head = <Widget>[
//        RbTeamSectionLoading(
//          gameType: this.gameType,
//          homeTeam: this.homeTeam,
//          awayTeam: this.awayTeam,
//          homeLogo: this.homeLogo,
//          awayLogo: this.awayLogo,
//        ),
      ];
      // if (scoreDetail != null) {
      //   head.add(scoreDetail);
      // }
    }

    return head;
  }
}
