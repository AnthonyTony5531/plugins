//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import "package:fast_ai/utils/ai_image.dart";
/*
 * @Author: your name
 * @Date: 2020-08-25 21:21:02
 * @LastEditTime: 2020-09-01 17:43:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \xcsport-sdk-pcg:\project\xcsports-sdk-flutter\lib\pages\detail\head\new_head\head_right.dart
 */
import 'dart:async';

import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
//import 'package:fast_ai/pages/detail/league_match_selector/league_match_selector.dart';
//import 'package:fast_ai/pages/detail/league_match_selector/league_match_selector_model.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LeagueLeft extends StatefulWidget {
  LeagueLeft({
    this.leagueId,
    this.leagueName,
    this.leagueLogo,
    this.leagueCount,
    Key key,
  }) : super(key: key);

  String leagueId;
  String leagueName;
  String leagueLogo;
  int leagueCount;

  @override
  State<StatefulWidget> createState() {
    return _LeagueLeft();
  }
}

class _LeagueLeft extends State<LeagueLeft> {

  String get leagueId {
    return widget.leagueId;
  }

  String get leagueName {
    return widget.leagueName;
  }

  String get leagueLogo {
    return widget.leagueLogo;
  }

  int get leagueCount {
    return widget.leagueCount;
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle styleFont10 = AiTextStyle(fontSize: 10, color: Color.fromRGBO(255, 255, 255, 0.7), fontFamily: config.skin.fontFimaly.pingFang);
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: leagueCount == null ? null : onLeagueNameTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
        width: 154,
        height: 37,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
//          color: Color(0xFF222226),
//          border: Border.all(
//            //添加边框
//            width: 0, //边框宽度
//            color: Color.fromRGBO(55, 55, 60, 1), //边框颜色
//          ),
          borderRadius: new BorderRadius.all(Radius.circular(18.5)), //设置圆角
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5),
                  child: AiImage.leagueLogo(leagueLogo, size: 20.5),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(
                          leagueName ?? '',
                          style: AiTextStyle(fontSize: 11, color: Colors.white, fontFamily: config.skin.fontFimaly.pingFang),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Text(
                          (leagueCount == null ? '-' : leagueCount.toString()) + config.langMap['baseLang']['detail']['games'],
                          style: styleFont10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: AiSvgPicture.asset(
                'assets/images/detail/head/icon_detail_league_arrow.svg',
              ),
            )
          ],
        ),
      ),
    );
  }

  onLeagueNameTap() async {
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailLeague);
//    var model = LeagueMatchSelectorModel(leagueIds: this.leagueId, leagueName: this.leagueName);
//    await showPopup(
//        context,
//        LeagueMatchSelector(
//          onConfirmChoosed: onConfirmChoosed,
//          model: model,
//        ),
//        true);
  }

//  //选择比赛回调
//  void onConfirmChoosed(LeagueMatchSelectorModel selModel) {
//    var selectedMatchIds = selModel.selectedMatchIds;
//    if (selectedMatchIds != null && selectedMatchIds.length > 0) {
//      Future(() async {
//        var selectedMatchId = selectedMatchIds[0];
//        var loadingDialog = LoadingDialog.create(config.langMap['baseLang']['detail']['waitingForSwitch']);
//        loadingDialog.show(context);
////        var resDetail = await Net.getMatchesDetail(params: {'gidm': selectedMatchId});
//        loadingDialog.dismiss();
////        Event.eventBus.fire(DetailParams(
////          gidm: selectedMatchId,
////          leagueName: resDetail.data.leagueName,
////          homeTeam: resDetail.data.homeTeam,
////          awayTeam: resDetail.data.awayTeam,
////          homeLogo: resDetail.data.homeLogo,
////          awayLogo: resDetail.data.awayLogo,
////          gameType: resDetail.data.gameType,
////          showtype: resDetail.data.showtype,
////        ));
//      });
//    }
//  }
  
}
