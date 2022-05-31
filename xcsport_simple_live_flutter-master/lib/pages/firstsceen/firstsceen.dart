import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/protocols/common/click_statistics_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/game/live_game.dart';
import 'package:fast_ai/pages/white_web_view_page.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import 'first_sceen_viewmodel.dart';


//首屏
class FirstSceen extends StatefulWidget {
  final FirstScreenViewModel model ;

  const FirstSceen({Key key, this.model}) : super(key: key);

  @override
  _FirstSceenState createState() => _FirstSceenState();
}

class _FirstSceenState extends State<FirstSceen> {

  @override
  Widget build(BuildContext context) {
    double picW = 301.0;
    double picH = 450.0;
    double margin = 54.0;
    double screenW = MediaQuery.of(context).size.width;
    double iconH = (screenW - margin * 2) * picH / picW;
    return SafeArea(
      bottom: true,
      child: Container(
        margin: EdgeInsets.only(left: margin, right: margin),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              h(24),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
//                  height: 410,
                  height: iconH,
                  child: InkWell(
                    onTap:(){
                      String url =  widget?.model?.top?.url ?? '';
                      String title =  widget?.model?.top?.name ?? '';
                      num id =  widget?.model?.top?.id ?? 0;
                      int urlType = widget?.model?.top?.urlType ?? ''; // 1比赛、2外部、3联赛、小游戏
                      String gameType = widget?.model?.top?.gameType ?? '';
                      String gidm = widget?.model?.top?.gidm ?? '';
                      String gameKey = widget?.model?.top?.gameKey ?? '';
                      String supplierId = widget?.model?.top?.supplierId ?? '';
                      if(config.isGbet){
                        AiRouter.pop(context);
                      }
                      else{
                        if(!widget.model.pop()){
                          AiRouter.pop(context);
                        }
                        if(mounted && (widget?.model?.activityImages ?? []).isNotEmpty){
                          setState(() {});
                        }
                      }
                      // 比赛
                      if(urlType == 1){
                        if(config.isGbet){
                          ccRoute.push(
                            routeName: Live188RouteTableName.MatchDetail,
                            routeParams: {
                              'gidm': gidm,
                            },
                          );
                        }
                        else{
                          DetailPage.show(context, DetailPage(params: DetailParams(gidm: gidm)));
                        }
                      }
                      // 3联赛
                      else if(urlType == 3){
                        if(config.isGbet){
                          ccRoute.push(
                            routeName: Live188RouteTableName.LeagueMatchList,
                            routeParams: {
                              'gameType': gameType,
                              'leagueIds': url,
                            },
                          );
                        }
                        else{
//                          showMaterialPageRoute(context, LeaguesDetial(params:{"leagueIds" : url}));
                        }
                      }
                      // 2外部
                      else if(urlType == 2){
                        if(url.contains("?")){
                          url = "$url&token=${config.userInfo.token}";
                        }else{
                          url = "$url?token=${config.userInfo.token}";
                        }
                        showMaterialPageRoute(context, WhiteWebViewPage(url:url, title: title,));
                      }
                      // 4小游戏
                      else if(urlType == 4) {
                        LiveGame.openGamePan(
                            context: context,
                            supplierId: supplierId,
                            gameKey: gameKey,
                            isInternalWeb: true,
                            callBack: (isSuccess){
                              try {
                                // 刷新钱包余额
//                                config.userInfo.walletModel.getWalletList();
                              }
                              catch (e) {
                                print('刷新钱包余额----1：${e.toString()}');
                              }
                            }
                        );
                      }
                      ClickStatisticsReqProtocol('2', id.toString(), config.userInfo.playerId).request();/// 点击统计
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AiImage.fromUrl(widget?.model?.top?.image ?? '',  "assets/images/img_start_empty.svg", BoxFit.fill,  double.infinity, 410 )
                    ),
                  ),
                ),
              ),
              h(24),
              GestureDetector(
                  onTap: (){
                    if(config.isGbet){
                      AiRouter.pop(context);
                      return;
                    }
                    if(!widget.model.pop()){
                      AiRouter.pop(context);
                      return;
                    }
                    if(mounted) setState(() {});
                  },
                  child: AiSvgPicture.asset( "assets/images/icon_pop_start_close.svg",width: 24, height: 24)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
