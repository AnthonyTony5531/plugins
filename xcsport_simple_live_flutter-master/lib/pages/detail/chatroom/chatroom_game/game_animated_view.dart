import 'dart:async';
import 'dart:math';

import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/pages/new_user_course/new_user_course_page.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sdk_games/config/game_sdk_config.dart';
import 'package:flutter_sdk_games/page/game_main.dart';

class GameAnimatedView extends StatefulWidget {

  final bool isUseWaterWaveAnimated;   // 是否显示水波动画
  final Offset circleCenter;  // 水波动画中心位置
  final double height;  // 游戏的高
  final AiGameCellModel gameModel;
  final ValueChanged<bool> onAnimatedStatus;
  final double topMargin;
  GameAnimatedView({
    Key key,
    this.isUseWaterWaveAnimated = false,
    this.circleCenter,
    this.height = 480.0,
    this.topMargin = 0.0,
    this.gameModel,
    this.onAnimatedStatus,
  }): super(key: key);

  @override
  GameAnimatedViewState createState() => GameAnimatedViewState();
}

class GameAnimatedViewState extends State<GameAnimatedView> with TickerProviderStateMixin{

  AnimationController _controller;
  AnimationController _gamePanController;
  Animation<double> _animation;
  Animation<double> _gamePanAnimation;


  AiGameCellModel gameModel;
  bool isSdkDownload;
  String gameUrl;
  String downloadGame;
  bool isShowGameBgView = true;   // 关闭窗口用
  bool isShowGamePan = true;
  bool isUpdateGame = false;
  Offset gameClickOffset = Offset.zero;
  double gameHeight;
  double gamePanTopMargin = 0.0;
  int time = 0;
  StreamController<double> _gameDragNotifyStream = StreamController<double>.broadcast();

  bool _isDownload = false;


  @override
  void initState() {
    gamePanTopMargin = widget.topMargin;
    gameHeight = widget.height;
    gameClickOffset = widget.circleCenter;
    gameModel = widget.gameModel ?? AiGameCellModel();
    if(widget.isUseWaterWaveAnimated) {
      // 平移动画
      _gamePanController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
      _gamePanAnimation = Tween<double>(begin: 0.0, end: gamePanTopMargin).animate(_gamePanController);
      _gamePanController.addListener(gamePanListener);
      _gamePanController.addStatusListener(animationStatusListener);
      // 水波动画
      _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    }
    WidgetsBinding.instance.addPostFrameCallback((_)=>initData());
    super.initState();
  }

  void initData({bool isNeedSetState = false}) async {
    if(_isDownload)return;
    _isDownload = true;
    try{
      isSdkDownload = ModuleSwitch.getInstance().gameYxsdkxz();
      final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...', cancel: true);
      loading.show(context);
      await sleep(250); // 延迟150,避免没网络的请求快过弹窗
      var result = await GameURlNewReqProtocol(supplierId: gameModel.supplierId, gameKey: gameModel.gameKey).request();
      loading.dismiss();
      await sleep(250);

      if (result.isError) {
        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//      callBack?.call(false);
        return;
      }
      else {
        gameUrl = '${result.url}&roomNo=${gameModel.roomNo}&anchorId=${gameModel.anchorId}&game=${gameModel.gameKey}';
        if (gameModel.tableId != null && gameModel.tableId.isNotEmpty) {
          gameUrl = '$gameUrl&tableId=${gameModel.tableId}';
        }
        if (!isStrNullOrEmpty(gameModel.supplierId) && gameModel.supplierId == 'aigame' && isSdkDownload) {
          downloadGame = await GameSDkConfig.ins.checkGameToDownload(context,
              gameUrl: gameUrl,
              downloadApi: result.downloadApi,
              sha256Api: result.sha256Api,
              httpSha256: result.sha256Code);
          if(downloadGame == 'download cancel'){
            Event.eventBus.fire(ShowGameEvent(isShowGame: false));
          }
        }
        isUpdateGame = false;
        if(mounted)setState(() {});
      }
    }catch(e){
      Event.eventBus.fire(ShowGameEvent(isShowGame: false));
    } finally {
      _isDownload = false;
    }
  }

  @override
  void didUpdateWidget(covariant GameAnimatedView oldWidget) {
    super.didUpdateWidget(oldWidget);
    gamePanTopMargin = widget.topMargin;
    gameHeight = widget.height;
    gameClickOffset = widget.circleCenter;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _gamePanController?.removeStatusListener(animationStatusListener);
    _gamePanController?.removeListener(gamePanListener);
    _gameDragNotifyStream?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(isUpdateGame || isStrNullOrEmpty(gameUrl)) {
      return Container(
        margin: EdgeInsets.only(top: AiMeasure.screenHeight(context) - gameHeight),
        color: Color(0xFF0A2536),);
    }

    Widget gameChild = Container();
    if (!isStrNullOrEmpty(gameModel.supplierId) && gameModel.supplierId == 'aigame' && isSdkDownload) {
      if (downloadGame == 'hasGame') {
        gameChild = GameMainPage(showFullScreen: false, builder: GameSDKBuilder(gameUrl: gameUrl));
      } else if (downloadGame == 'goToWeb') {
        gameChild = NewUserCoursePage(
          isShowGameBgColor: true,
          isJointLang: false,
          url: gameUrl,
          isSystemRepair: true,
          usesGameWeb: true,
        );
      }
    } else {
      gameChild = NewUserCoursePage(
        isShowGameBgColor: true,
        isJointLang: false,
        url: gameUrl,
        isSystemRepair: true,
        usesGameWeb: true,
      );
    }
    double screenHeight = AiMeasure.screenHeight(context);
    return StreamBuilder(
        initialData: gamePanTopMargin,
        stream: _gameDragNotifyStream.stream,
        builder: (ctx, span) {
          if(!span.hasData || isUpdateGame || isStrNullOrEmpty(gameUrl)) {
            return  Container(
              margin: EdgeInsets.only(top: AiMeasure.screenHeight(context) - gameHeight),
              color: Color(0xFF0A2536),);
          }
          double topMargin = span.data;
          return Container(
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Show(
                          isShow: isShowGameBgView,
                          child: GestureDetector(
                            onVerticalDragStart: (details){
                              resetData();
                            },
                            onVerticalDragEnd: (details){
                              onHorizontalDragEnd(details, context);
                            },
                            onVerticalDragUpdate: (details){
                              onHorizontalDragUpdate(details,context);
                            },
                            onTap: () {
                              int curTime = DateTime.now().millisecondsSinceEpoch;
                              if(curTime - time < 1000) {
                                return;
                              }
                              time = curTime;
                              if(_controller.isAnimating) return;
                              reverseAnimated();
                              isShowGameBgView = false;
                              Event.eventBus.fire(ShowGameEvent(isShowGame: false));
                              Future.delayed(Duration(milliseconds: 350),(){
                                refreshWallet();
                                isShowGamePan = false;
                                widget.onAnimatedStatus?.call(true);
                                if(mounted)setState(() {});
                              });
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              color: Colors.white.withOpacity(0.01),
                            ),
                          )
                      )
                  ),
                  Transform.translate(
                      offset: Offset(0, topMargin),
                      child: Container(
                        height: isShowGamePan ? gameHeight : 0.0,
                        child: Show(
                            isShow: widget.isUseWaterWaveAnimated,
                            replacement: gameChild,
                            child: gameAnimatedWidget(gameChild)
                        ),
                      )
                  ),
                ],
              )
          );
        }
    );
  }


  void forwardAnimated({AiGameCellModel cellModel, Offset offset, double gamePanHeight, double topMargin}) {
    if(gamePanHeight != null) {
      gameHeight = gamePanHeight;
    }
    _gamePanController?.reset();
    _gamePanAnimation = Tween<double>(begin: 0.0, end: topMargin).animate(_gamePanController);
    _gamePanController.forward();
    Timer(Duration(milliseconds: 200), (){
      if(_controller.isAnimating){
        _controller.reset();
      }
      resetData();
      if(offset != null){
        gameClickOffset = offset;
      }
      if(mounted)setState(() {});
      if((downloadGame == 'hasGame' || downloadGame == 'goToWeb') || !isSdkDownload){
        // 判断是否同一个游戏
        if(cellModel != null) {
          String supplierId = cellModel.supplierId;
          String gameKey = cellModel.gameKey;
          if(!isStrNullOrEmpty(supplierId) && supplierId != gameModel.supplierId ||
              !isStrNullOrEmpty(gameKey) && gameKey != gameModel.gameKey
          ) {
            updateGame(cellModel);
          }
        }
      }else{
        updateGame(cellModel);
      }
      Future.delayed(Duration(milliseconds: 20),(){
        _controller.forward();
      });
    });
  }

  void updateGame(AiGameCellModel cellModel) {
    isUpdateGame = true;
    if(mounted)setState(() {});
    if(cellModel != null) {
      gameModel = cellModel;
    }
    initData(isNeedSetState: true);
  }

  void reverseAnimated() {
    isShowGameBgView = false;
    if(mounted)setState(() {});
    Future.delayed(Duration(milliseconds: 20),(){
      _controller.reverse();
    });
  }

  Widget gameAnimatedWidget(Widget gameChild) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ClipPath(
              clipper: CirclePath(_animation.value, gameClickOffset),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: gameChild
              )
          );
        }
    );
  }

  void clickGamePanBg() {
    reverseAnimated();
    isShowGameBgView = false;
    Event.eventBus.fire(ShowGameEvent(isShowGame: false));
    Future.delayed(Duration(milliseconds: 350),(){
      isShowGamePan = false;
      widget.onAnimatedStatus?.call(true);
      if(mounted)setState(() {});
    });
  }

  void resetData() {
    isDragEnd = false;
    bufferOffsetY = 0.0;
    offsetY = 0.0;
    isShowGameBgView = true;
    isShowGamePan = true;
  }

  void gamePanListener() {
    _gameDragNotifyStream.add(_gamePanAnimation.value);
  }

  void animationStatusListener(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      Size size = MediaQuery.of(context).size;
      if(isDragEnd && offsetY >= size.height) {
        isShowGameBgView = false;
        isShowGamePan = false;
        _gameDragNotifyStream.add(offsetY);
        Event.eventBus.fire(ShowGameEvent(isShowGame: false));
//        refreshWallet();
      }
    }
  }

  void refreshWallet() {
    try {
      // 刷新钱包余额
//      config.userInfo.walletModel.getWalletList();
      config.userInfo.tryLoadBalance(isUpdate: true);
    }
    catch(e) {
      print('刷新钱包余额------>>');
    }
  }

  double bufferOffsetY = 0;
  double offsetY = 0;
  bool isDragEnd = false;
  void onHorizontalDragUpdate(details,context){

    if(isDragEnd) return;
    Size size = MediaQuery.of(context).size;
    if(details is DragUpdateDetails){
      bufferOffsetY += details.delta.dy;
    }else if(details is PointerMoveEvent){
      bufferOffsetY += details.delta.dy;
    }

    double topMargin = size.height - gameHeight;
    double distance = topMargin + bufferOffsetY;
    // 顶部边界
    if(distance <= topMargin){
      distance = topMargin;
    }
    // 底部边界
    if(distance >= size.height){
      distance = size.height;
    }
    offsetY = distance;
    _gameDragNotifyStream.add(offsetY);
  }

  void onHorizontalDragEnd(details,context){

    Size size = MediaQuery.of(context).size;
    double topMargin = size.height - gameHeight;
    double tempOffsetY = offsetY;
    if(offsetY < topMargin + 200.0){
      offsetY = topMargin;
    }
    else{
      offsetY = size.height;
    }
    isDragEnd = true;
    _gamePanController?.reset();
    _gamePanAnimation = Tween<double>(begin: tempOffsetY, end: offsetY).animate(_gamePanController);
    _gamePanController.forward();
  }
}


class CirclePath extends CustomClipper<Path> {
  CirclePath(this.value, this.offset);

  final double value;
  final Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = value * sqrt(size.height * size.height + size.width * size.width);
    path
      ..addArc(Rect.fromCircle(center: offset, radius: radius), 0,  2 * pi)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

