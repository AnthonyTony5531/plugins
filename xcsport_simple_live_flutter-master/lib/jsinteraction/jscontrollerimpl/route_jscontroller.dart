import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/jsinteraction/controller/js_controller.dart';
import 'package:fast_ai/pages/bet/game/member_game_betting_page.dart';
import 'package:fast_ai/pages/bet/game/member_game_betting_tab_page.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/white_web_view_page.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/styles.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router.dart';
import '../../utils/string_util.dart';

//路由跳转
class RouteJSController extends JsController {
  BuildContext context;
  RouteJSController({this.context});

  @override
  String get name => "flutter_route";

  @override
  Future<JsResponseData> process(
      String method, Map<String, dynamic> params) async {
    print('RouteJSController-method=$method, params=${params.toString()}');

    switch (method) {
      case "matches_detail":
        {
          //跳转详情页
          final String gidm = params['gidm'];
          DetailPage.show(
              context,
              DetailPage(
                  params: DetailParams(
                gidm: gidm,
              )));
          return JsResponseData();
        }
      case "matches_finish":
        {
          return JsResponseData();
        }
      case "webview":
        {
          //跳转赛果
          showMaterialPageRoute(
              context,
              WhiteWebViewPage(
                url: params['url'],
                title: config.langMap['baseLang']['browser'],
              ));
          return JsResponseData();
        }
      case "userinfo":
        {
          Map<String, dynamic> data = {'token': config.userInfo.token};
          return JsResponseData(data: data);
        }
      case "home":
        {
//          AiNavigatorObserver.getInstance().navigator.popUntil((route) => route.settings?.name == '/');
          AiRouter.pop(context);
          return JsResponseData();
        }
      case "league_detail":
        {
          if (isEmpty(params['leagueIds']) || isEmpty(params['gameType'])) {
            return JsResponseData();
          }
          return JsResponseData();
        }
      case 'PersonalPage':
        {
          print('PersonalPage-params=${params.toString()}');
          var playerId = params['playerId'];
          var playerName = params['playerName'];
          if (isEmpty(playerId)) JsResponseData();

          var parameters = {
            "playerId": playerId,
            "playerName": playerName ?? ''
          };
          return JsResponseData();
        }
      case 'GameBetRecordPage':
        {
          var gameKey;
          if(params == null){
            params = {};
          }
          gameKey = AiJson(params).getString('gameKey',defaultValue: '');
          showMaterialPageRoute(context, Theme(data: Styles.aiTheme, child: MemberGameBettingPage()));
          return JsResponseData();
        }
    }
    return null;
  }
}
