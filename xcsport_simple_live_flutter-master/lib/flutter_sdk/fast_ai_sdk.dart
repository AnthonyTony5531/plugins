import 'dart:async';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/common/update_merchant_type.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk_callback.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
//import 'package:fast_ai/module/live188/package/flutter_live188_package.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/module/wallet/service/flutter_wallet_centerservice.dart';
import 'package:fast_ai/package/fastai_package.dart';
import 'package:fast_ai/pages/guide/guide_view_helper.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'fast_ai_sdk_params.dart';
import 'package:fast_ai/utils/ai_json.dart';

class FastAiSdk {
  static FastAiSdk ins = FastAiSdk();
  static FastAiSdkCallback sdkCallback;

  /// 不调用、不传值、themeStyleKey传0-使用后台配置，传1使用传入值
  // themeUpdate(theme: {
  // ThemeColor188.themeStyleKey : 1,
  // ThemeColor188.themeColorKey : '#FF00FF',//'#FF8446',
  // ThemeColor188.auxiliaryColorKey : '#00FF00',//'#505050',
  // ThemeColor188.fontColorKey : '#0000FF',//'#FFCC00',
  // });
  void themeUpdate({bool fromServer=false, Map<String, dynamic>theme}) {
    ThemeColor188.update(theme: theme);
  }

  bool _isInit = false;
  Future init(Map<String, dynamic> params,
      {ValueChanged<bool> onInitFinish,
      ValueChanged<Map<String, dynamic>> callback}) async {
    SysService.ins.initSdkInfo();
    await ccPackage.init();
    await aiPackage.init();
    Config.ccPackage = 'fast_ai'; // sdk 插件页面
    config.fastAiSdkParams = FastAiSdkParams.parse(params);
//    if(config.isGbet) {
//      await Future.wait([l188Package.init(),walletCenterService.init(),walletCenterConfig.init()]);
//    }
    if (!_isInit) {
      sdkCallback = FastAiSdkCallback();
      _isInit = true;
      _fastAiSdkEvent?.cancel();
      if (isStrNullOrEmpty(config.userInfo.token)) {
        config.enableAnonymous = true;
        config.userInfo.isAnonymousToken = true;
      }
      config.isFastAiSdk = true;

      //sdk回调处理(放在SysService.ins.init()之前，503维护时还没有初始化导致接收不了时间)
      _fastAiSdkEvent = Event.eventBus.on<FastAiSdkEvent>().listen((event) {
        callback(event.data);
      });

      await SysService.ins.init();

      if (isStrNullOrEmpty(config.userInfo.token)) {
        await Net.loginAnonymous();
      }

      //初始化完成
      onInitFinish(true);

      //HOOK处理
      hookProc();
    }
//    await SysService.ins.initThemeStyle();
  }

  void playVideo() {
    print('播放视频----111');
    Event.eventBus.fire(ChangeBottomBarEvent(isPlayVideo: true));
  }

  void stopVideo() {
    print('播放视频----222');
    Event.eventBus.fire(ChangeBottomBarEvent(isPlayVideo: false));
  }

  StreamSubscription<FastAiSdkEvent> _fastAiSdkEvent;

  //更新用户token信息
  Future updateUserToken(String token) async {
    Net.request.loginShow = false;
    print('00-updateUserToken-is188=${config.isGbet}');
    config.userInfo.token = token;
    if (config.isGbet) {
      config.userInfo.isAnonymousToken = isEmpty(token);
      config.fastAiSdkParams.userInfoChanged.fire(); // 通知188首页更新昵称和余额
      cmPackageConfig.live188tokenConfig.saveToken(token);
    }
    Event.eventBus.fire(HooksSdkEvent(loginSuccess: true));
    if (!isStrNullOrEmpty(token)) {
      await SysService.ins.initUserInfo(isInitBaseInfo: false);
    }
  }

  //是否为匿名账号在工作
  bool get _isAnonymousToken {
    return config.userInfo.isAnonymousToken;
  }

  //是否用户账已经的工作
  bool get isLogined {
    if (_isAnonymousToken) return false;
    return !config.userInfo.isLogout();
  }

  //注销用户
  Future logout() async {
    await Net.loginAnonymous(true);
  }

  //刷新余额
  Future refreshBalance() async {
    var balance = await Net.getBalance(walletId: config.userInfo.walletId);
    if (balance.isSuccess) {
      config.userInfo.balance = balance;
      Event.eventBus.fire(RefreshBalanceEvent());
    }
    if(config.isGbet) {
      config.fastAiSdkParams.userInfoChanged.fire();
    }
  }

  ///
  /// 新体育(188)事件
  /// method 事件名
  /// params 参数
  ///
  void notifySDK({@required String method, Map<String, dynamic>params}) {
    switch(method) {
      case 'betRecord': { // 投注记录
        ccRoute.push(routeName: Live188RouteTableName.AccountRecordPage,);
        break;
      }
      default: {
        break;
      }
    }
  }

  void updateAvatar(String url) {
    config.fastAiSdkParams.avatar = url;
    config.fastAiSdkParams.userInfoChanged.fire();
  }

  //更新商户类型（确认是哪个APP过来的）
  void updateMerchantType(String merchantType) {
    UpdateMerchantTypeReqProtocol req =
        UpdateMerchantTypeReqProtocol(merchantType: merchantType);
    var rsp = req.request();
    print(rsp);
  }

  //设置用户头像列表数据
  setHeadList(Map<String, dynamic> data) {
    if (data != null) {
      config.userInfo.headimgs =
          AiJson(data).getArray('response.d.profileImgList') ?? [];
    }
  }

  //玩家个人信息
  Future<Map<String, dynamic>> getPlayerInfo() async {
    await Net.playAccount().then((rst) {
      config.userInfo.account = rst;
    });
    var info = Map<String, dynamic>();
    info["image"] = config.userInfo.headImg;
    info["nickname"] = config.userInfo.nickName;
    return info;
  }

  //获取余额显示状态
  bool getBalanceDisplayStatus() {
    return config.userInfo.isShowBalance;
  }

  // VoidListener _tokenVaildEvent = new VoidListener();
  // //tooken失败处理
  // Future tokenVaildProc(String reqTooken) async {
  //   if (config.userInfo.token != reqTooken) return;
  //   //token无效后，先使用匿名账号先工作
  //   await config.userInfo.logout();
  //   await Net.loginAnonymous(true);
  //   //通知Sdk使用方需要更新用户的token信息
  //   FastAiSdk.sdkCallback.tokenExpire();
  //   _tokenVaildEvent.fire();
  // }

  HookResult _needLoginProc(dynamic params) {
    if (FastAiSdk.ins._isAnonymousToken) {
      FloatGuideViewHelper.kill();
      if (FloatGuideViewHelper.showing()) {
        FloatGuideViewHelper.hideGuideView();
      }
      Event.eventBus.fire(HooksSdkEvent(loginSuccess: false));
      //loadToken();
      //关键操作，告诉宿主需要登录才能操作
      if(config.isNSports){
       FastAiSdk.sdkCallback.needLogin(params);
      }else{
        XcSdkApi.needlogin();
      }
      return new HookResult(true, params);
    } else {
      return new HookResult(false, params);
    }
  }

  //HOOK处理
  void hookProc() {
    //出登录框
    Hooks.ins.hookTail(HookName.SendGift, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartHitOption, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartSendChatMessage, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartVlogCollect, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartVlogAttention, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartLoveLeague, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartShareWager, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartViewRanking, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartBookingLive, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartAttentionAnchor, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartTapBetted, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartTapAttention, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartGameCollect, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartHitGameCollect, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartBookingGame, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartTapSupportTeam, _needLoginProc);
    Hooks.ins.hookTail(HookName.StartShowBookCar, _needLoginProc);
    Hooks.ins.hookTail(HookName.MinePage, _needLoginProc);
    Hooks.ins.hookTail(HookName.PreShowLoveLeague, _needLoginProc);
    Hooks.ins.hookTail(HookName.BetPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.MatchDetailMoreItem, _needLoginProc);
    Hooks.ins.hookTail(HookName.MatchDetailHorizontalMoreItem, _needLoginProc);
    Hooks.ins.hookTail(HookName.MatchDetailShareFilterAttention, _needLoginProc);
    Hooks.ins.hookTail(HookName.FoundAttentionPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.KJConstellationPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.KJRankingListPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.KJBetRecordPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.KJMimePage, _needLoginProc);
    Hooks.ins.hookTail(HookName.MLMacthCollection, _needLoginProc);
    Hooks.ins.hookTail(HookName.MLMacthPreferLeague, _needLoginProc);
    Hooks.ins.hookTail(HookName.MLMacthPreferHomeTeam, _needLoginProc);
    Hooks.ins.hookTail(HookName.MLMacthPreferAwayTeam, _needLoginProc);
    Hooks.ins.hookTail(HookName.AboutAnchor, _needLoginProc);
    Hooks.ins.hookTail(HookName.ClickChatRoomUser, _needLoginProc);
    Hooks.ins.hookTail(HookName.ClickChatRoomInput, _needLoginProc);
    Hooks.ins.hookTail(HookName.HorseRaceInsideMessage, _needLoginProc);
    Hooks.ins.hookTail(HookName.InsideMessage, _needLoginProc);
    Hooks.ins.hookTail(HookName.EnterCq9Game, _needLoginProc);
    Hooks.ins.hookTail(HookName.HotBetPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.FollowBetPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.ForumPage, _needLoginProc);
    Hooks.ins.hookTail(HookName.SendGift, _needLoginProc);
  }
}
