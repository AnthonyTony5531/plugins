import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/detail/gift_query_protocol.dart';
import 'package:fast_ai/api/protocols/detail/player_gift_limit_protocol.dart';
import 'package:fast_ai/api/protocols/detail/wish_gift_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/pages/detail/free_anchor/free_anchor_model/wish_gift_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_bottom_menu.dart';
import 'package:fast_ai/pages/detail/gift/gift_box_list.dart';
import 'package:fast_ai/pages/detail/gift/gift_loading_page.dart';
import 'package:fast_ai/pages/detail/gift/gift_charge_input_view.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_num_list.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/keyboard_input_view.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/tips_alter.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' as _convert;
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';

typedef ValueChangedGift<T, S> = void Function(T value1, S value2);

class GiftPanPage extends StatefulWidget {
  final String gidm;
  final String roomNo;
  final String anchorId;
  final GiftModel giftModel;
//  final bool isFreeAnchor;
  final ValueChangedGift<GiftInfoModel, int> onSendGift;
  final DetailSet detailSet;
  GiftPanPage({
    Key key,
    this.giftModel,
    this.gidm,
    this.roomNo,
    this.anchorId,
    this.onSendGift,
//    this.isFreeAnchor = false,
    this.detailSet,
  }) : super(key: key);

  @override
  _GiftPanPageState createState() => _GiftPanPageState();
}

class _GiftPanPageState extends State<GiftPanPage>
    with TickerProviderStateMixin {
  var baseLang = config.langMap['baseLang'];
  final defaultModel = GiftModel();
  GiftModel get model => widget?.giftModel ?? defaultModel;
  SwiperController swiperController = SwiperController();
  AnimationController animationController;
  AnimationController keyboardController;
  Animation tween;
  Animation keyboardTween;
  StateSetter indicatorSetter;
  GiftInfoModel selectGiftModel;
  int selectGiftNum = 1; // 礼物数量
  bool isAlreadySendGift = false;
  bool isHideGiftMenu = true;
  bool isInit = false;
  bool isHideInputView = false;
  bool isRequestGiftFailure = false;
  bool isLoading = true;
  bool _giftPlayModeConfig;
  bool hasCacheData = false;
  PlayerGiftLimitRsqProtocol giftLimitData;

  double keyboardHeight = 0.0;
  StateSetter giftSetter;
  StateSetter headerSetter;
  GlobalKey<GiftBottomMenuState> bottomMenuKey = GlobalKey();
  GlobalKey<GiftChargeInputViewState> chargeInputViewKey = GlobalKey();
  bool isAlreadyHideKeyboard = false;
  int get wishGiftSwitch => widget.detailSet?.detailParams?.wishGiftSwitch ?? 0;
  String get liveId => widget.detailSet?.detailParams?.liveId ?? '';
  bool get isFreeAnchor => widget.detailSet?.detailParams?.isFreeAnchor ?? false;
  List<WishGiftModel> wishGiftModels = [];

  @override
  void initState() {
    var giftReqData = AiCache.get().getString(AiCache.GIFT_REQ_DATA);
    if (giftReqData != null) {
      var cacheQueryRsp =
          GiftQueryRspProtocol.fromList(_convert.jsonDecode(giftReqData));
      if (cacheQueryRsp?.code == 200) {
        isLoading = false;
        hasCacheData = true;
        model.fromGiftRspProtocol(cacheQueryRsp);
      }
    }
    loadData();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    keyboardController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    Animation curve =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    Animation keyboardCurve =
        CurvedAnimation(parent: keyboardController, curve: Curves.linear);
    tween = Tween(begin: 0, end: 1).animate(curve);
    keyboardTween = Tween(begin: 0.0, end: -55.0).animate(keyboardCurve);
//    animationController.forward();
    _giftPlayModeConfig =
        AiCache.get().getBool(AiCache.gift_play_mode_config) ?? false;
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    cancelToken?.cancel();
    timer?.cancel();
    sendReqCancelToken?.cancel();
    sendReqCancelTokenTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: _body(),
    );
  }

  ///
  Widget _body() {
    return Container(
        child: Stack(
      clipBehavior: Clip.none, children: [
        // 从下往上布局(为了键盘输入确定事件接收)
        Column(
          verticalDirection: VerticalDirection.up,
          children: [
            _bottomMenu(),
            isRequestGiftFailure ? SizedBox() : _indicator(),
            _gift(),
            _line(),
            _header(),
            _space(),
          ],
        ),
        _giftNumMenu(),
//        _inputMoney(),
      ],
    ));
  }

  Widget _space() {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: Container(
          color: Colors.white.withOpacity(0.001),
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
        color: Color(0xFF19191E),
        padding: EdgeInsets.only(bottom: 9.0),
        child: Divider(
          height: 1,
          color: Color(0xFF203543),
        ));
  }

  Widget _gift() {
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF19191E),
      child: isRequestGiftFailure
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AiImage.asset('assets/images/gift/img_gift_lose.png',
                    width: 200),
                SizedBox(
                  width: 10,
                ),
                Text(
                  //giftLoadFail
                  baseLang['detail']['chatGift']['giftLoadFail'],
                  style: AiTextStyle(
                    fontFamily: config.skin.fontFimaly.pingFang,
                    fontWeight: config.skin.fontWeight.regular,
                    fontSize: config.skin.fontSize.h5,
                    color: config.skin.colors.fontColorWhite.withOpacity(0.2),
                  ),
                )
              ],
            )
          : Swiper(
              onIndexChanged: (index) {
                if (index >= model.indicatorModels.length) return;
                model.indicatorModels
                    .forEach((element) => element.isSelect = false);
                IndicatorModel indicatorModel = model.indicatorModels[index];
                indicatorModel.isSelect = true;
                if (indicatorSetter != null) {
                  indicatorSetter(() {});
                }
              },
              controller: swiperController,
              scrollDirection: Axis.horizontal,
              containerWidth: MediaQuery.of(context).size.width,
              itemWidth: MediaQuery.of(context).size.width,
              autoplay: false,
              loop: false,
              itemCount: isLoading ? 1 : model.sectionGifts.length,
              itemBuilder: (BuildContext ctx, int index) {
                if (isLoading) {
                  return GiftLoadingPage();
                }
                if (index >= model.sectionGifts.length) return Container();
                List<GiftInfoModel> list = model.sectionGifts[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: GiftBoxList(
                    gifts: list,
                    onSelectItem: onSelectItem,
                  ),
                );
              }),
    );
  }

  Widget _indicator() {
    return Container(
        color: Color(0xFF19191E),
        height: 16.0,
        alignment: Alignment.bottomCenter,
        child: StatefulBuilder(
            builder: (BuildContext ctx, StateSetter stateSetter) {
          indicatorSetter = stateSetter;
          List list = model.indicatorModels.map((e) {
            return Container(
              margin: EdgeInsets.only(left: 3.0, right: 3.0),
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: e.isSelect ? e.selectColor : e.normalColor,
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
            );
          }).toList();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          );
        }));
  }

  ///
  Widget _header() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF19191E),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
        ),
        width: MediaQuery.of(context).size.width,
        height: 40,
        alignment: Alignment.center,
        child: StatefulBuilder(builder: (BuildContext ctx, StateSetter setter) {
          headerSetter = setter;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Text(
                baseLang['detail']['chatGift']['sendGift'],
                style: titleStyle(),
              ),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40.0,
                        margin: EdgeInsets.only(right: 3, top: 0),
                        child: AiSvgPicture.asset(
                          'assets/images/liveplayer/${_giftPlayModeConfig ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc'}.svg',
                          width: 12,
                          height: 12,
                        ),
                      ),
                      Text(
                        baseLang['detail']['chatGift']['hideEffects'],
                        style: effectsStyle().copyWith(
                            color: _giftPlayModeConfig
                                ? Color(0xFF5078FF)
                                : Colors.white),
                      ),
                      SizedBox(
                        width: 12.0,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  _giftPlayModeConfig = !_giftPlayModeConfig;
                  AiCache.get().setBool(
                      AiCache.gift_play_mode_config, _giftPlayModeConfig);
                  if (headerSetter != null) {
                    headerSetter(() {});
                  }
                },
              )),
            ],
          );
        }));
  }

  Widget _bottomMenu() {
    return Container(
      color: Color(0xFF19191E),
      child: GiftBottomMenu(
        key: bottomMenuKey,
        onRecharge: onRecharge,
        onSendGift: sendGift,
        onSelectGiftNum: onSelectGiftNumMenu,
        giftNum: selectGiftNum ?? 1,
        giftLimitData: giftLimitData,
      ),
    );
  }

//  Widget _inputMoney() {
//    return Container();
//    return AnimatedBuilder(
//        animation: keyboardTween,
//        builder: (BuildContext ctx, Widget child) {
//          double value = !isInit ? -55.0 : keyboardTween.value;
//          print('键盘值------:$value');
//          return Positioned(
//              left: 0,
//              bottom: value,
//              right: 0,
//              height: 52.0,
//              child: Offstage(
//                offstage: isHideInputView,
//                child: GiftChargeInputView(
//                  key: chargeInputViewKey,
//                  inputFocusStatus: inputFocusStatus,
//                  onChargeMoney: onChargeMoney,
//                ),
//              ));
//        });
//  }

  Widget _giftNumMenu() {
    return Offstage(
      offstage: isHideGiftMenu,
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            print('haha');
            animationReverse();
          },
          child: Stack(
            children: [
              Positioned(
                  right: 34.0,
                  bottom: 70.0,
                  width: 146.0,
                  height: 180.0,
                  child: AnimatedBuilder(
                      animation: tween,
                      builder: (BuildContext ctx, Widget child) {
                        return Opacity(
                          opacity: animationController.value,
                          child: GiftNumList(
                            onSelectGiftNum: onSelectGiftNum,
                          ),
                        );
                      }))
            ],
          )),
    );
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle effectsStyle() {
    return AiTextStyle(
      color: Color(0xFF5078FF),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  // 充值
  void onRecharge() {
    if (config.isFastAiSdk) {
      FastAiSdk.sdkCallback.onEnterPage('recharge');
    } else if (config.isApp) {
      String name = baseLang['page']['wallet']['deposit'];
      showToas(name);
      return;
    } else {
      XcSdkApi.showRechargePage();
    }
  }

  // 选择礼物数量
  void onSelectGiftNum(GiftNumModel model) {
    // 自己输入数量
    if (isStrNullOrEmpty(model.num)) {

//      selectGiftNum = 1;
//      isHideGiftMenu = true;
//      isHideInputView = false;
//      if (mounted) setState(() {});
//      Future.delayed(Duration(milliseconds: 100), () {
//        if (chargeInputViewKey?.currentState != null) {
//          chargeInputViewKey.currentState.requestFocus();
//        }
//      });
      isHideGiftMenu = true;
      isHideInputView = true;
      isAlreadyHideKeyboard = false;
      if (mounted) setState(() {});
      showKeyboardInputView(context,GiftChargeInputView(
        key: chargeInputViewKey,
        onChargeMoney: onChargeMoney,
        defaultGiftNum: selectGiftNum,
        inputFocusStatus: (bool focus){
          if(!focus){
            hideKeyboarder();
          }
        },
      ));
      Future.delayed(Duration(milliseconds: 50), () {
        if (chargeInputViewKey?.currentState != null) {
          chargeInputViewKey.currentState.requestFocus();
        }
      });
    } else {
      animationReverse();
      selectGiftNum = int.tryParse(model.num);
      if (bottomMenuKey?.currentState != null && selectGiftModel != null) {
        bottomMenuKey.currentState.updateSelectGiftMoney(selectGiftNum, selectGiftModel.price);
      }
    }
  }

  // 弹出礼物菜单
  void onSelectGiftNumMenu() {
    animationForward();
    if (bottomMenuKey.currentState != null) {
      bottomMenuKey.currentState.executeAnimation(true);
    }
  }

  void animationForward() {
    isHideGiftMenu = false;
    if (mounted) {
      setState(() {});
    }
    Future.delayed(Duration(milliseconds: 50), () {
      animationController.forward();
    });
  }

  void animationReverse() {
    if (bottomMenuKey.currentState != null) {
      bottomMenuKey.currentState.executeAnimation(false);
    }
    animationController.reverse();
    Future.delayed(Duration(milliseconds: 200), () {
      isHideGiftMenu = true;
      if (mounted) {
        setState(() {});
      }
    });
  }

  // 选中礼物
  void onSelectItem(GiftInfoModel giftModel) {
    selectGiftModel = giftModel;
    model.giftList.forEach((element) {
      element.isSelect = false;
    });
    giftModel.isSelect = true;
    if (bottomMenuKey?.currentState != null && selectGiftModel != null) {
      bottomMenuKey.currentState
          .updateSelectGiftMoney(selectGiftNum, giftModel.price);
    }
    if (mounted) {
      setState(() {});
    }
  }

  CancelToken sendReqCancelToken;
  Timer sendReqCancelTokenTimer;
  // 发送礼物
  void sendGift() async {
    if(isFreeAnchor){
      if (isStrNullOrEmpty(widget?.roomNo) ||
          isStrNullOrEmpty(widget?.anchorId) ||
          isAlreadySendGift) {
        return;
      }
    }
    else{
      if (isStrNullOrEmpty(widget?.roomNo) ||
          isStrNullOrEmpty(widget?.anchorId) ||
          isStrNullOrEmpty(widget?.gidm) ||
          isAlreadySendGift) {
        return;
      }
    }
    if (selectGiftModel == null) {
      showToas(baseLang['detail']['chatGift']['hitSelectGift']);
      return;
    }
    if (isAlreadySendGift) {
      return;
    }
    isAlreadySendGift = true;
    // 判断余额是否充足
    num price = selectGiftModel.price;
    num money = price * selectGiftNum;
    num myBalance = num.tryParse(config.userInfo.myBalance);
    if (money > myBalance) {
      showNoBalanceAlter();
      isAlreadySendGift = false;
      return;
    }
    // 回调发送礼物
    if (widget?.onSendGift != null) {
      widget?.onSendGift(selectGiftModel, selectGiftNum);
    }
    AiRouter.pop(context);
//    try {
//      sendReqCancelToken = CancelToken();
//      sendReqCancelTokenTimer = Timer(Duration(seconds: 15000), () {
//        sendReqCancelTokenTimer?.cancel();
//        sendReqCancelToken?.cancel();
//      });
//
//      GiftBuyGiftReqProtocol req = GiftBuyGiftReqProtocol();
//      req.goodsId = selectGiftModel.giftId;
//      req.buyCounts = selectGiftNum ?? 1;
//      req.roomNo = widget.roomNo;
//      req.anchorId = widget.anchorId;
//      req.gidm = widget.gidm;
//      var rsp = await req.request(cancelToken: sendReqCancelToken);
//      sendReqCancelTokenTimer?.cancel();
//      // 更新余额
//      var result = await queryBalance();
//
//      if (rsp.isTradeSuccess) {
//        ModuleStatistics.ins
//            .statisticsEvent(StatisticsType.StatisticsDetailBottomSendGift);
//        AiRouter.pop(context).then((value) => sendGiftAnimation());
//      } else if ('${rsp.code}' == '602017') {
//        AiRouter.pop(context).then((value) =>
//            showToas(baseLang['detail']['chatGift']['gameFinishSendGiftFail']));
//      } else {
//        // 有扣钱但是未发送成功的情况
//        num newBalance = num.tryParse(config.userInfo.myBalance);
//        if (myBalance > newBalance) {
//          AiRouter.pop(context).then((value) => sendGiftAnimation());
//          return;
//        }
//        AiRouter.pop(context).then((value) => showBuyFailureAlter());
//      }
//    } catch (e) {
//      sendReqCancelTokenTimer?.cancel();
//      AiRouter.pop(context).then((value) => showBuyFailureAlter());
//    } finally {
//      isAlreadySendGift = false;
//    }
  }

  void showNoBalanceAlter() {
    if (config.sdkParams.showRecharge || config.isApp || config.isFastAiSdk) {
      TipsAlter.showCenterTipsAlter(context,
          title: baseLang['detail']['chatGift']['hitTitle'],
          content: baseLang['detail']['chatGift']['hitContentNoBalance'],
          cancel: baseLang['detail']['chatGift']['cancel'],
          confirm: baseLang['detail']['chatGift']['recharge'],
          confirmCallback: () {
        if (config.isFastAiSdk) {
          FastAiSdk.sdkCallback.onEnterPage('recharge');
        } else if (config.isApp) {
          String name = baseLang['page']['wallet']['deposit'];
          showToas(name);
          return;
        } else {
          XcSdkApi.showRechargePage();
        }
      });
    } else {
      TipsAlter.showCenterCancelTipsAlter(
        context,
        title: baseLang['detail']['chatGift']['hitTitle'],
        content: baseLang['detail']['chatGift']['hitContentNoBalance'],
        cancel: baseLang['detail']['chatGift']['cancel'],
      );
    }
  }

  void showBuyFailureAlter() {
    showToas(baseLang['detail']['chatGift']['hitContentBuyFailure']);
    // TipsAlter.showCenterCancelTipsAlter(
    //   context,
    //   title: baseLang['detail']['chatGift']['hitTitle'],
    //   content: baseLang['detail']['chatGift']['hitContentBuyFailure'],
    //   cancel: baseLang['detail']['chatGift']['know'],
    // );
  }

  void sendGiftAnimation() {
    if (selectGiftModel == null) {
      return;
    }
    // gift动画参数
    GiftInfoModel infoModel = GiftInfoModel(
        playerId: config.userInfo.playerId,
        type: GiftType.gif,
        gif: selectGiftModel.giftImage,
        svga: '',
        image: selectGiftModel.pngImage,
        nickName: config.userInfo.nickName,
        giftName: selectGiftModel.giftName,
        count: selectGiftNum,
        msgTime: selectGiftModel.msgTime,
        price: selectGiftModel.price);
    // svga动画参数
    if (selectGiftModel.isGif == 0) {
      infoModel.gif = '';
      infoModel.svga = selectGiftModel.giftImage;
      infoModel.type = GiftType.svga;
    }
    GiftPlayServer.ins.addGift(infoModel);
    Event.eventBus.fire(ChatOwnGiftMessageEvent(selectGiftModel));
  }

  void inputFocusStatus(bool isFocus) {
    Future.delayed(Duration(milliseconds: 100), () {
      double begin = 0.0;
      double end = 0.0;
      isInit = true;
      if (isFocus) {
        keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        print('键盘高度-------:$keyboardHeight');
        // 防止获取键盘高度为0
        Future.delayed(Duration(milliseconds: 800), () {
          if (keyboardHeight <= 1) {
            print('防止获取键盘高度为0-------:$keyboardHeight');
            keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
            begin = -55.0;
            end = keyboardHeight;
            keyboardTween =
                Tween(begin: begin, end: end).animate(keyboardController);
            keyboardController?.reset();
            keyboardController?.forward();
          }
        });
        begin = -55.0;
        end = keyboardHeight;
      } else {
        begin = keyboardHeight;
        end = -55;
      }
      keyboardTween = Tween(begin: begin, end: end).animate(keyboardController);
      keyboardController?.reset();
      keyboardController?.forward();
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  void hideKeyboarder(){
    if(isAlreadyHideKeyboard){
      return;
    }
    isAlreadyHideKeyboard = true;
    AiRouter.pop(context);
  }

  // 手动输入礼物数量
  void onChargeMoney(int num) {
    hideKeyboarder();
    selectGiftNum = num;
    if (num <= 0) {
      selectGiftNum = 1;
    }
    isHideInputView = true;
    if (mounted) setState(() {});
    if (bottomMenuKey?.currentState != null) {
      bottomMenuKey.currentState
          .updateSelectGiftMoney(selectGiftNum, selectGiftModel.price);
    }
  }

  // 更新余额
  Future queryBalance() async {
    try {
      var balance = await Net.getBalance(walletId: config.userInfo.walletId);
      if (balance.isSuccess) {
        config.userInfo.balance = balance;
        if (bottomMenuKey?.currentState != null) {
          bottomMenuKey?.currentState?.refresh();
        }
      }
      return balance;
    } catch (e) {}
  }

  CancelToken cancelToken;
  Timer timer;

  void loadData() async {
    // 获取用户礼物限制状态及额度
    try {
      String merchantId = config?.merchantAppConfig?.merchantId ?? '';
      if(merchantId.isEmpty){
        merchantId = config?.userInfo?.account?.data?.merchantId;
      }
      var req = PlayerGiftLimitReqProtocol(
          walletId: config?.userInfo?.walletId,
          playerId: config?.userInfo?.playerId,
          merchantId: merchantId
      );
      req.request().then((value){
        giftLimitData = value;
        if (bottomMenuKey?.currentState != null) {
          bottomMenuKey.currentState.updateGiftLimit(giftLimitData);
        }
        if (mounted) setState(() {});
      });
    } catch (e){
      print('error:$e');
      if (mounted) setState(() {});
    }
    // 获取礼物列表
    try {
      // 获取主播心愿礼物
      await loadWishGifts();
      // 获取礼物列表
      var result;
      cancelToken = CancelToken();
      GiftQueryReqProtocol req = GiftQueryReqProtocol();
      timer = Timer(Duration(seconds: 5), () {
        cancelToken?.cancel();
        timer?.cancel();
      });
      result = await req.request(cancelToken: cancelToken);

      if (result.code == 200) {
        String json = _convert.jsonEncode(result.giftList);
        AiCache.get().setString(AiCache.GIFT_REQ_DATA, json);
      }
      timer?.cancel();
      model.fromGiftRspProtocol(result, wishGiftModels: wishGiftModels);
      isLoading = false;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('error:$e');
      if (!hasCacheData) {
        isRequestGiftFailure = true;
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  // 主播心愿礼物
  Future<void> loadWishGifts() async {
    if (wishGiftSwitch == 0 || !isFreeAnchor) return;
    wishGiftModels?.clear();
    WishGiftReqProtocol protocol = WishGiftReqProtocol(liveId: liveId);
    var req = await protocol.request();
    if (req.isSuccess) {
      req.giftData.forEach((element) {
        WishGiftModel model = WishGiftModel().fromWishGiftReqProtocol(element);
        wishGiftModels.add(model);
      });
    }
  }
}

class IndicatorModel {
  bool isSelect;
  Color selectColor = Color(0xFF5078FF);
  Color normalColor = Color(0xFFCCCCCC);
  IndicatorModel({
    this.isSelect = false,
  });
}
