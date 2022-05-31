import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_game.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_live.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_match.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FunctionType {
  functionNone,
  functionRecharge, // 充值
  functionWithdraw, // 提现
  functionTransferAccount, // 转账
  functionCollectGame, // 收藏比赛
  functionData, // 数据
  functionAttentionHome, // 关注主队
  functionAttentionAway, // 关注客队
  functionUninterested, // 不感兴趣
  functionVideoLive, // 视频直播
  functionAnimationLive, // 动画直播
  functionScoreLive1, // 比分直播
  functionAnchorLive, // 主播直播
  functionGame, // 游戏
}

class MoreFunction extends StatefulWidget {
  final VoidCallback closeCallBack;
  final VoidCallback onShowMatchInfo;
  final ValueChanged<FunctionType> onSelectVideoSource;
  final String roomNo;
  final String anchorId;
//  MatchesDetailModel matchesDetailModel;

  // 切换比赛和直播
  NewHeadAnchorModel newHeadAnchorModel;
  CommonVideoPlayerController playerController;
//  ExtendModel extendModel;
  DetailSet detailSet;
  final bool isLandscape;
  final bool isFreeAnchor;

  MoreFunction({
    Key key,
//    this.matchesDetailModel,
    this.newHeadAnchorModel,
    this.playerController,
//    this.extendModel,
    this.detailSet,
    this.onShowMatchInfo,
    this.closeCallBack,
    this.isLandscape = false,
    this.isFreeAnchor = false,
    this.onSelectVideoSource,
    this.roomNo,
    this.anchorId
  }) : super(key: key);

  @override
  _MoreFunctionState createState() => _MoreFunctionState();
}

class _MoreFunctionState extends State<MoreFunction> {
  GlobalKey<MoreFunctionMatchState> matchGlobalKey = GlobalKey();
  final defaultModel = MatchesDetailModel();
  var baseLang = config.langMap['baseLang'];
  List<String> gameTitles = [];

//  MatchesDetailModel get matchesDetailModel => widget?.matchesDetailModel ?? defaultModel;
  bool isCollectRequest = false;

  @override
  Widget build(BuildContext context) {
    double containWidth = widget.isLandscape ? 300 : MediaQuery.of(context).size.width;
    Color backgroundColor = widget.isLandscape ? null : Color(0xFF19191E);
    int axisCount = 6; // 每列個數
    double itemWidth = 54;
    double itemPadding = (containWidth - (itemWidth * axisCount - itemWidth / 2)) / (axisCount * 2 - 1);


    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            columnCell(
              child: MoreFunctionMatch(
                key: matchGlobalKey,
//                matchesDetailModel: matchesDetailModel,
                onClickItem: onClickMatchItem,
                itemWidth: itemWidth,
                isFreeAnchor: widget.isFreeAnchor,
                itemPadding: itemPadding,
              ),
            ),
            Offstage(
//              offstage: !(matchesDetailModel.data.showtype == 'RB') && !ModuleSwitch.getInstance().game(),
              child: splitLine(),
            ),
//            columnCell(
////              offstage: !(matchesDetailModel.data.showtype == 'RB'),
//              child: Offstage(
////                offstage: !(matchesDetailModel.data.showtype == 'RB'),
//                child: MoreFunctionLive(
//                  newHeadAnchorModel: widget?.newHeadAnchorModel,
//                  playerController: widget?.playerController,
////                  extendModel: widget?.extendModel,
//                  detailSet: widget?.detailSet,
//                  onClickItem: onClickLiveItem,
//                  itemWidth: itemWidth,
//                  itemPadding: itemPadding,
//                ),
//              ),
//            ),
//            Offstage(
//              offstage: !ModuleSwitch.getInstance().game(),
//              child: splitLine(),
//            ),
            columnCell(
              offstage: !ModuleSwitch.getInstance().game(),
              child: Offstage(
                offstage: !ModuleSwitch.getInstance().game(),
                child: MoreFunctionGame(
//                  onClickItem: onClickGameItem,
                  onGameValueChanged: onGameValueChanged,
                  itemWidth: itemWidth,
                  itemPadding: itemPadding,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnCell({Widget child, bool offstage = false}) {
    return widget.isLandscape && !offstage ? Expanded(child: child) : Container(child: child);
  }

  Widget splitLine() {
    return Container(
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      height: 0.5,
      color: Colors.white.withOpacity(0.15),
    );
  }

  void onClickLiveItem(FunctionType type) {
    if (widget?.closeCallBack != null) {
      widget?.closeCallBack();
    }
    if (widget?.onSelectVideoSource != null) {
      widget?.onSelectVideoSource(type);
    }
  }

//  void onClickGameItem(FunctionType type, AiGameCellModel cellModel) async {
////    if(widget?.closeCallBack != null){
////      widget?.closeCallBack();
////    }
////    await sleep(500);
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailBottomMoreGame);
//    Event.eventBus.fire(OpenGameEvent());
//    Future.delayed(Duration(milliseconds: 100),(){
//      gameAction(cellModel);
//    });
//  }

  bool _isGameValueDoing = false;
  void onGameValueChanged(FunctionType type, List<AiGameCellModel> games, int index, Offset offset) async {
    if(_isGameValueDoing)return;
    _isGameValueDoing = true;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailBottomMoreGame);
    Event.eventBus.fire(OpenGameEvent());
    await Future.delayed(const Duration(milliseconds: 100));
    gameAction(games, index, offset);
    _isGameValueDoing = false;
  }

  void onClickMatchItem(FunctionType type, String teamId) {
    if (widget?.closeCallBack != null) {
      widget?.closeCallBack();
    }
    if (type != FunctionType.functionData) {
      if (Hooks.ins.isBlocked(HookName.MatchDetailMoreItem, {})) return;
    }

    /// 充值
    if (type == FunctionType.functionRecharge) {
      FastAiSdk.sdkCallback.onRecharge();
//      if (config.isFastAiSdk) {
//        FastAiSdk.sdkCallback.onEnterPage('recharge');
//        return;
//      }
//
//      if (config.isApp) {
//        String name = baseLang['page']['wallet']['deposit'];
//        showMessageToas(name);
//        return;
//      }
//      XcSdkApi.showRechargePage();
    }

    /// 提现
    else if (type == FunctionType.functionWithdraw) {
      FastAiSdk.sdkCallback.onCashOut();
//      if (config.isFastAiSdk) {
//        FastAiSdk.sdkCallback.onEnterPage('withdraw');
//        return;
//      }
//      if (config.isApp) {
//        String name = baseLang['page']['wallet']['withDraw'];
//        showMessageToas(name);
//        return;
//      }
//      XcSdkApi.showcashPage();
    }

    /// 转账
    else if (type == FunctionType.functionTransferAccount) {
      FastAiSdk.sdkCallback.onTransfer();
//      if (config.isFastAiSdk) {
//        FastAiSdk.sdkCallback.onEnterPage('transfer');
//        return;
//      }
//      if (config.isApp) {
//        String name = baseLang['page']['wallet']['transfer'];
//        showMessageToas(name);
//        return;
//      }
//      XcSdkApi.showTransfer();
    }

    /// 收藏比赛
    else if (type == FunctionType.functionCollectGame) {
//      ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailBottomMoreCollect);
//      collectMatch();
    }

    /// 关注主队/客队
    else if (type == FunctionType.functionAttentionHome || type == FunctionType.functionAttentionAway) {
//      attentionTeam(teamId);
    }

    /// 不感兴趣
    else if (type == FunctionType.functionUninterested) {
      uninterestedAction();
    }

    /// 数据
    else if (type == FunctionType.functionData) {
//      ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailBottomMoreData);
      if (widget?.onShowMatchInfo != null) {
        widget?.onShowMatchInfo();
      }
    }
  }

  void showMessageToas(String text) {
    String name =
        '${config.langMap['baseLang']['msgBar']['notConfigured']['contentFirstHalf']}$text${config.langMap['baseLang']['msgBar']['notConfigured']['contentSecondHalf']}';
    showToas(name);
  }

//  /// 收藏比赛
//  void collectMatch() {
//    if (isCollectRequest) {
//      return;
//    }
//    isCollectRequest = true;
//    Future.delayed(Duration(milliseconds: 500), () {
//      isCollectRequest = false;
//    });
//    String gidm = '';
//    List<String> collectGames = config.userInfo.followGames;
//    bool isCollect = collectGames.contains(gidm);
//    if (!isCollect && collectGames.length >= config.teamCollectMaxCount) {
//      showToas(baseLang['detail']['maxCollectGameCount']);
//      return;
//    }
//    Map paramMap = {
//      'gidm': gidm,
//      'follow': isCollect ? 2 : 1, // 1:收藏，2:取消收藏
//    };
//    List gameList = config?.userInfo?.followGames ?? [];
//    Net.gameCollect(paramMap).then((rst) async {
//      if (rst.isSuccess) {
//        String text = '';
//        if (isCollect) {
//          gameList.remove(gidm);
//          text = baseLang['square']['collectCancel'];
//        } else {
//          gameList.add(gidm);
//          text = baseLang['square']['collectSuccess'];
//        }
//        showToas(text);
//        if (mounted && matchGlobalKey != null) {
//          matchGlobalKey?.currentState?.updateMatchUI();
//        }
//      }
//      Event.eventBus.fire(MatchAttentionEvent());
//      Event.eventBus.fire(CollectGameEvent(isCollect: !isCollect, gidm: gidm));
//    });
//  }

//  // 关注球队
//  void attentionTeam(String teamId) {
//    if (teamId == null || teamId.isEmpty) return;
//    List favTeamList = config?.userInfo?.followTeams ?? [];
//    List favLeague = config?.userInfo?.followLeagues ?? [];
//    if (favTeamList.isNotEmpty && favTeamList.length >= config.teamCollectMaxCount) {
//      showToas(config.langMap['baseLang']['widgets']['favoriteTeamReachedLimit']);
//      return;
//    }
//    bool isAttentionTeam = favTeamList.contains(teamId);
//    if (isAttentionTeam) {
//      favTeamList.remove(teamId);
//    } else {
//      if (!favTeamList.contains(teamId)) {
//        favTeamList.add(teamId);
//      }
//    }
//    Map<String, dynamic> paramMap = {
//      'favLeague': favLeague,
//      'favTeam': favTeamList,
//      'favouriteTeamId': '${config?.userInfo?.hobbyList?.favouriteTeam?.teamId ?? ''}',
//    };
//    Net.updateHobby(paramMap).then((rst) {
//      if (rst.isSuccess) {
//        String text = '';
//        if (isAttentionTeam) {
//          text = baseLang['square']['attentionCancle'];
//        } else {
//          text = baseLang['square']['attentionSuccess'];
//        }
//        showToas(text);
//        if (mounted && matchGlobalKey != null) {
//          matchGlobalKey?.currentState?.updateMatchUI();
//        }
//      } else {
//        // 取消收藏
//        if (isAttentionTeam) {
//          favTeamList.add(teamId);
//        }
//        // 收藏
//        if (!isAttentionTeam) {
//          favTeamList.remove(teamId);
//        }
//      }
//    });
//  }

  // 不感兴趣
  void uninterestedAction() {
    String title = baseLang['detail']['uninterestedHit'];
    String confirm = baseLang['detail']['confirm'];
    String content = baseLang['detail']['uninterestedContent'];
    String cancel = baseLang['detail']['uninterestedcancle'];
    showCupertinoDialog(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            title: Container(
              margin: EdgeInsets.only(bottom: 5.0),
              child: Text(
                title,
                style: titleStyle(),
              ),
            ),
            content: Text(
              content,
              style: contentStyle(),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  confirm,
                  style: confirmStyle(),
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName(TabSdkPage.main));
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  cancel,
                  style: cancelStyle(),
                ),
                onPressed: () {
                  AiRouter.pop(context);
                },
              ),
            ],
          );
        });
  }

  void gameAction(List<AiGameCellModel> games, int index, Offset offset) async {
    if(index >= games.length || games.isEmpty) return;
    AiGameCellModel gameModel = games[index];
    Event.eventBus.fire(ShowGameEvent(isShowGame: true));
    AiRouter.pop(context).then((value) {
      Future.delayed(Duration(milliseconds: 300),(){
        Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: gameModel));
      });
    });
//    LiveGame.openGamePan(
//        context: context,
//        supplierId: gameModel.supplierId,
//        gameKey: gameModel.gameKey,
//        roomNo: widget.roomNo,
//        anchorId: widget.anchorId,
//        callBack: (isSuccess){
//          Event.eventBus.fire(ShowGameEvent(isShowGame: false));
//        }
//    );
//    config.userInfo.isClickGameFloat = true;
//    AiGameCellModel cellModel = games[index];
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp]
//    );
//    //640 * 960适配(w*h)
//    double screenW = MediaQuery.of(context).size.width;
//    double height = 960.0 * screenW / 640.0;
//    PopupShareService.ins.pause('_showGame');
//    showModalBottomSheetRoute(context,
//        enableDrag: false,
//        height: height + 40,
//        child: ChatroomGamePage(
//          anchorId: widget.anchorId,
//          roomNo: widget.roomNo,
//          games: games,
//          selectGameKey: cellModel.gameKey,
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

//    String url = model?.url;
//    if(isStrNullOrEmpty(url)){
//      final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
//      loading.show(context);
//      var protocol = await AiGameURlRequestProtocol(supplierId: model.supplierId, gameKey: model.gameKey).request();
//      await loading.dismiss();
//      await sleep(500);
//      url = protocol.url;
//      if(protocol.isError){
//        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//        return;
//      }
//    }
//    url = '$url&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
//    print('游戏url----:$url');
//    AiRouter.pop(context).then((value){
//      String screen = model?.screen ?? '';
//      if(isStrNullOrEmpty(screen)){
//        screen = '1';
//      }
//      config.userInfo.isClickGameFloat = true;
//      if(screen == '1'){
//        showMaterialPageRoute(
//            context,
//            GameWebView(
//              initialUrl: url,
//            ),settings: RouteSettings(name: AiRouter.AiWebViewPage)).then((f) {
//          print(
//              '00-gameAction-screenDirection=${widget?.playerController?.toolPanel?.topbar?.player?.toolPanel?.bottombar?.defaultModel?.screenDirection}');
//          widget.playerController.toolPanel.topbar.player.toolPanel.bottombar.defaultModel.screenDirection = ScreenDirection.TopDown;
//          widget.playerController.toolPanel.topbar.player.toolPanel.bottombar.screenDirectionChanged.fire(ScreenDirection.TopDown);
//          print(
//              '11-gameAction-screenDirection=${widget?.playerController?.toolPanel?.topbar?.player?.toolPanel?.bottombar?.defaultModel?.screenDirection}');
//          SystemChrome.setPreferredOrientations([
//            DeviceOrientation.portraitDown,
//            DeviceOrientation.portraitUp,
//          ]).whenComplete(() {
//            SystemChrome.setPreferredOrientations([
//              DeviceOrientation.portraitUp,
//              DeviceOrientation.portraitDown,
//              DeviceOrientation.landscapeLeft,
//              DeviceOrientation.landscapeRight,
//            ]);
//          });
//        });
//        return;
//      }
//      //640 * 960适配(w*h)
//      SystemChrome.setPreferredOrientations(
//          [DeviceOrientation.portraitUp]
//      );
//      double screenW = MediaQuery.of(context).size.width;
//      double height = 960.0 * screenW / 640.0;
//      PopupShareService.ins.pause('_showGame');
//      showModalBottomSheetRoute(context,
//          height: height + 50.0,
//          enableDrag: false,
//          child: NewUserCoursePage(
//              isJointLang: false,
//              url: url,
//              title: config.langMap['baseLang']['detail']['gameBanner']
//          ),
//          barrierColor: Colors.transparent)
//          .then((v) {
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown,
//          DeviceOrientation.landscapeLeft,
//          DeviceOrientation.landscapeRight,
//        ]);
//        PopupShareService.ins.resume('_showGame');
//      });
//
//    });

//    if (isNotEmpty(model.url)) {
//      showMaterialPageRoute(
//          context,
//          GameWebView(
//            initialUrl: model.url,
//          ),settings: RouteSettings(name: AiRouter.AiWebViewPage)).then((f) {
//        print(
//            '00-gameAction-screenDirection=${widget?.playerController?.toolPanel?.topBar?.player?.toolPanel?.bottomBar?.defaultModel?.screenDirection}');
//        widget.playerController.toolPanel.topBar.player.toolPanel.bottomBar.defaultModel.screenDirection = ScreenDirection.TopDown;
//        widget.playerController.toolPanel.topBar.player.toolPanel.bottomBar.screenDirectionChanged.fire(ScreenDirection.TopDown);
//        print(
//            '11-gameAction-screenDirection=${widget?.playerController?.toolPanel?.topBar?.player?.toolPanel?.bottomBar?.defaultModel?.screenDirection}');
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitDown,
//          DeviceOrientation.portraitUp,
//        ]).whenComplete(() {
//          SystemChrome.setPreferredOrientations([
//            DeviceOrientation.portraitUp,
//            DeviceOrientation.portraitDown,
//            DeviceOrientation.landscapeLeft,
//            DeviceOrientation.landscapeRight,
//          ]);
//        });
//      });
//    } else {
//      final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
//      loading.show(context);
//      var protocol = await AiGameURlRequestProtocol(supplierId: model.supplierId, gameKey: model.gameKey).request();
//      await loading.dismiss();
//      await sleep(500);
//      if (protocol.isSuccess) {
//        showMaterialPageRoute(
//            context,
//            GameWebView(
//              initialUrl: protocol.url,
//            ),settings: RouteSettings(name: AiRouter.AiWebViewPage)).then((f) {
//          SystemChrome.setPreferredOrientations([
//            DeviceOrientation.portraitDown,
//            DeviceOrientation.portraitUp,
//          ]);
//        });
//      } else {
//        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//      }
//    }
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Colors.black,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h3,
    );
  }

  TextStyle contentStyle() {
    return AiTextStyle(
      color: Colors.black.withOpacity(0.6),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
    );
  }

  TextStyle confirmStyle() {
    return AiTextStyle(
      color: Colors.black,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h3,
    );
  }

  TextStyle cancelStyle() {
    return AiTextStyle(
      color: Color(0xFF0091FF),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h3,
    );
  }
}
