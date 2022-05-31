import 'dart:async';

import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/api/protocols/aigames/ai_gamelist_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_game_service.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/pages/new_user_course/new_user_course_page.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeAnchorGame extends StatefulWidget {

//  final String gameName;
  final DetailSet detailSet;
  final MatchDetailController swiperController;
  final String roomNo;
  final String anchorId;
  FreeAnchorGame({Key key, this.swiperController, this.roomNo, this.anchorId, this.detailSet}): super(key: key);

  @override
  _FreeAnchorGameState createState() => _FreeAnchorGameState();
}

class _FreeAnchorGameState extends State<FreeAnchorGame> with AutomaticKeepAliveClientMixin {

  List<AiGameCellModel> models = [];
  StreamSubscription _openGame;
  String url = '';
  String gameKey = '';
  bool isNeedUpdateGame = false;

  @override
  void initState() {
    gameKey = widget.detailSet?.detailParams?.gameKey;
    loadData();
    _openGame = Event.eventBus.on<OpenGameEvent>().listen(openGameEvent);
    widget.swiperController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _openGame?.cancel();
    widget?.swiperController?.removeListener(listener);
    super.dispose();
  }

  void listener(){
    double offset = widget.swiperController?.offset;
    if(widget.swiperController.index == 0 && (config.userInfo.isClickGameFloat || (offset <= 0.1 && (isStrNullOrEmpty(url) || isNeedUpdateGame)))){
      url = '';
      isNeedUpdateGame = false;
      config.userInfo.isClickGameFloat = false;
      loadData();
    }
  }

  void openGameEvent(e) {
    if(e is OpenGameEvent){
      if(widget.swiperController?.index != 0){
        url = '';
        if(mounted)setState(() {});
      }
      // 更新游戏Key值
      Future.delayed(Duration(milliseconds: 20),(){
        if(e.isUpdateGame){
          isNeedUpdateGame = false;
          config.userInfo.gameModels.forEach((element) {
            AiGameCellModel gameMessage = AnchorGameService.ins.anchorGameMessage;
            String liveGame = isStrNullOrEmpty(gameMessage?.liveGame) ? gameKey : gameMessage?.liveGame;
            if(!isStrNullOrEmpty(liveGame) && element.gameKey == liveGame){
              if(!isStrNullOrEmpty(gameKey) && gameKey != element.gameKey){
                isNeedUpdateGame = true;
              }
              gameKey = element.gameKey;
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('游戏url----11:$url');
    return Scaffold(
      backgroundColor: Color(0xFF0A2536),
      body: Container(
        color: Color(0xFF0A2536),
        child: Show(
          isShow: !isStrNullOrEmpty(url),
          child:  NewUserCoursePage(
              isShowGameBgColor: true,
              isSystemRepair: true,
              isJointLang: false,
              url: url,
              title: config.langMap['baseLang']['detail']['gameBanner'],
              usesGameWeb: true,
              isEnableRefreshTap: true,
              onRefresh: (){
                openGameEvent(null);
                Future.delayed(Duration(milliseconds: 100),(){
                  loadData();
                });
              },
          )
        ),
      ),
    );
  }

  // 龙虎榜小游戏测试
  Future<void> loadData() async {
    if(!ModuleSwitch.getInstance().game()) return;
    try{
      AiGameListNewReqProtocol().request().then((req){
        if (req.isSuccess) {
          models = req.models;
          bool isSelect = false;
          AiGameCellModel model;
          for(AiGameCellModel cellModel in models){
            if(!isStrNullOrEmpty(gameKey) && cellModel.gameKey == gameKey){
              isSelect = true;
              model = cellModel;
              if(!isStrNullOrEmpty(cellModel.url)){
                url = '${cellModel.url}&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
              }
              break;
            }
          };
          if(isStrNullOrEmpty(url) && isSelect){
            Future.delayed(Duration(milliseconds: 500),(){
              reloadGameData(model);
            });
          }
          if(mounted)setState(() {});
        } else {
          throw req.msg;
        }
      });
    }
    catch(e){
      print('游戏报错');
    }

  }

  void reloadGameData(AiGameCellModel cellModel) async{
    final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
    loading.show(context);
    var result = await GameURlNewReqProtocol(supplierId: cellModel.supplierId, gameKey: cellModel.gameKey).request();
    loading.dismiss();
    await sleep(500);
    url = '${result.url}&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
    if(result.isError){
      showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
      return;
    }
    if(mounted)setState(() {});
  }

//  void showGame(AiGameCellModel cellModel) async{
////    String url = 'http://dev.m.yc365d.com/ai/mobile/game/url?supplierId=aigame&gameKey=LHD';
//    if(isStrNullOrEmpty(cellModel?.supplierId) || isStrNullOrEmpty(cellModel?.gameKey)) return;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChatRoomGame);
//    String url = cellModel?.url;
//    if(isStrNullOrEmpty(url)){
//      final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
//      loading.show(context);
//      var result = await AiGameURlRequestProtocol(supplierId: cellModel.supplierId, gameKey: cellModel.gameKey).request();
//      await loading.dismiss();
//      await sleep(500);
//      url = result.url;
//      if(result.isError){
//        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//        return;
//      }
//    }
//    String screen = cellModel.screen;
//    if(isStrNullOrEmpty(cellModel?.screen)){
//      screen = '1';
//    }
//    if(screen == '1'){
//      showMaterialPageRoute(
//          context,
//          NewUserCoursePage(
//            url: url,
//            title:
//            '${cellModel.gameName}',
//          ));
//      return;
//    }
//
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp]
//    );
//    //640 * 810适配(w*h)
//    double screenW = MediaQuery.of(context).size.width;
//    double height = 810.0 * screenW / 640.0;
//    PopupShareService.ins.pause('_showGame');
//    showModalBottomSheetRoute(context,
//        enableDrag: false,
//        height: height + 50,
//        child: NewUserCoursePage(
//            isJointLang: false,
//            url: url,
//            title: config.langMap['baseLang']['detail']['gameBanner']
//        ),
//        barrierColor: Colors.transparent)
//        .then((v) {
//      SystemChrome.setPreferredOrientations([
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//        DeviceOrientation.landscapeLeft,
//        DeviceOrientation.landscapeRight,
//      ]);
//      PopupShareService.ins.resume('_showGame');
//    });
//  }

  @override
  bool get wantKeepAlive => true;
}
