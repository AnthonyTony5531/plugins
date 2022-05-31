import 'dart:async';
import 'dart:io';
import 'package:common_component/component/route/route.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/pages/detail/live_player/views/video_player/video_player.dart';
//import 'package:fast_ai/sdk_api/vs_adapter.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
//import 'package:fast_ai/widgets/float_widget.dart';
import 'package:flutter/services.dart';

import '../router.dart';

class XcSdkApi {
  StreamSubscription _streamSubscription;

  // TABSDK Gbet(188)视频播放暂停控制
  ValueListener _videoController;
  ValueListener get videoController {
    if(_videoController == null) _videoController = ValueListener();
    return _videoController;
  }

  ValueListener _videoStateChanged;
  ValueListener get videoStateChanged {
    if(_videoStateChanged == null) _videoStateChanged = ValueListener();
    return _videoStateChanged;
  }

  /// tab sdk 当前展示页面(mainPage/memberBettingPage)
  // String get currentPage => _currentPage;
  String _currentPage;

  XcSdkApi() {
    _initEvent();
  }

  void _initEvent() {
    if(config.isTabSDK) videoStateChanged.addListener(_videoPlayStatus);
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _streamSubscription = config.eventChannel.receiveBroadcastStream().listen(eventListener);
  }

  void cancleStreamSubscription() {
    if(config.isTabSDK) videoStateChanged.removeListener(_videoPlayStatus);
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }

  // ------------------ native invoke dart ------------------
  void eventListener(dynamic obj)async {
    final Map<dynamic, dynamic> map = obj;
    print('eventListener app to flutter map=$map');
    switch (map['event']) {
      case 'bottomBarIndex':
        {
          // native tabbar 索引点击事件
          Future.delayed(Duration(milliseconds: 5000), () {
            String selectIndex = map['params']['index'] ?? '2';
            int index = int.parse(selectIndex);
            if (index != 3) return;
            Event.eventBus.fire(TabSDKBetRefreshEvent());
          });
          break;
        }
      case 'updateSDKToken':
        {
          // native通知flutter更新token
          print('native invoke flutter --- updateSDKToken $map');
          bool isAnonymousToken = config.userInfo.isAnonymousToken;
          var token = map['params']['token'];
          await FastAiSdk.ins.updateUserToken(token);
          //如果時匿名登陸，那麼就重新加載
          if(isAnonymousToken){
            if(config.isGbet){
              await ccRoute.pop(popMethod: PopMethod.PopUntil,
                  routePredicate: (route){
                    return route.settings?.name == '/' || route.settings?.name ==  Live188RouteTableName.HomePage;
                  });
              await ccRoute.push(routeName:Live188RouteTableName.HomePage, pushMethod: PushMethod.PushReplacement, pushAnim: PushAnim.None, maintainState: true);
            }else if(config.isAi){
              await ccRoute.pop(popMethod: PopMethod.PopUntil,
                  routePredicate: (route){
                    return route.settings?.name == '/' || route.settings?.name ==  FastAiRouteTableName.SportAiPage;
                  });
              if(config.sdkParams.needShowDetailPage){
//                AiRouter.pushToDetailPage(ccRoute.navigator.overlay.context, params: config.sdkParams.detailParams);
              }
              else if(config.isTabSDK){
                if(config.sdkParams.page == TabSdkPage.betList){
                    await ccRoute.push(routeName: TabSdkPage.betList, pushMethod: PushMethod.PushReplacement, pushAnim: PushAnim.None,maintainState: true);

                  }else{
                    await ccRoute.push(routeName: FastAiRouteTableName.SportAiPage, pushMethod: PushMethod.PushReplacement, pushAnim: PushAnim.None,maintainState: true);
                  }
              }else{
                await ccRoute.push(routeName: FastAiRouteTableName.MainPage, pushMethod: PushMethod.PushReplacement, pushAnim: PushAnim.None,maintainState: true);
              }
            }
          }
          break;
        }
      case 'onLangChanged':/// 语言切换
        {
          //如果当前是注单引擎页面
          print('注单onLangChanged config.sdkParams.page====${config.sdkParams.page},map==${map.toString()}');
          if(TabSdkPage.betList == config.sdkParams.page){
            var lang = map['params']['lang'];
            print('语言lang === $lang=====');
            if(lang != null){
              Translations.setLang(lang);
              await ccRoute.pop(popMethod: PopMethod.PopUntil, routePredicate: (route){
                return route?.settings?.name == '/' || route?.settings?.name == TabSdkPage.betList;
              });
              ccRoute.push(routeName: TabSdkPage.betList, pushMethod: PushMethod.PushReplacement);
            }
          }
          break;
        }
      case 'iconEngineWillDestroy':
        {
          // flutter引擎即将被释放
          break;
        }
      case 'pauseVideo': { // 暂停视频
        _currentPage = TabSdkPage.betList;
        print('切Tab 暂停视频 isGbet=${config.isGbet}, page=${config.sdkParams.page}');
        if(config.isAi) {
          print('切Tab 暂停视频 AI');
          // 关闭小视频
          Event.eventBus.fire(VlogCloseEvent());
          // 关闭详情视频
          Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
          // 移除浮窗
          Future.delayed(Duration(milliseconds: 350), () async {
            try {
//              await gCloseFloat();
            } catch (e) {
              print('移除浮窗移除e=$e');
            }
          });
        }
        else if(config.isGbet) {
          print('切Tab 暂停视频 188');
          videoController.fire(false);
        }
        else if(config.isVs) {
//          VSAdapter.setPlayerStatus(false);
        }
        break;
      }
      case 'startVideo': { // 播放视频
        _currentPage = TabSdkPage.main;

        print('切Tab 播放视频 isGbet=${config.isGbet}, page=${config.sdkParams.page}');
        if(config.isAi) {
          print('切Tab 播放视频 AI');
          Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
        }
        else if(config.isGbet) {
          print('切Tab 播放视频  188');
          videoController.fire(true);
        }
        else if(config.isVs) {
//          VSAdapter.setPlayerStatus(true);
        }
        break;
      }
      default:
        print('native invoke flutter error, error method name is =${map['event']}');
        break;
    }
  }

  void _videoPlayStatus(s) {
    print('00-_videoPlayStatus：$s, currentPage=$_currentPage');
    if(_currentPage != null && _currentPage != TabSdkPage.main && s == AiVideoState.started) {
      if(config.isAi) {
        print('11-_videoPlayStatus 切Tab 暂停视频 AI');
        // 关闭小视频
        Event.eventBus.fire(VlogCloseEvent());
        // 关闭详情视频
        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        // 移除浮窗
        Future.delayed(Duration(milliseconds: 350), () async {
          try {
//            await gCloseFloat();
          } catch (e) {
            print('移除浮窗移除e=$e');
          }
        });
        print('33-_videoPlayStatus 切Tab 暂停视频 AI');
      }
      else if(config.isGbet) {
        print('22-_videoPlayStatus 切Tab 暂停视频 188');
        videoController.fire(false);
      }
      else if(config.isVs) {
//        VSAdapter.setPlayerStatus(false);
      }
    }
  }

  void errorListener(dynamic obj) {
    final PlatformException e = obj;
    throw e;
  }

  // ------------------ dart invoke native ------------------

  /// 转账-通知商户展示自己的转账页面
  static Future<dynamic> showTransfer() async {
    if(config.isApp) return null;
    dynamic resp;
    try {
      resp = await config.methodChannel.invokeMethod('transfer', {});
    } catch (e) {
      print('showTransfer error=$e');
    }
    return resp;
  }

  static Future<dynamic> needlogin() async {
    if(config.isApp) return null;
    String token;
    try {
      token = await config.methodChannel.invokeMethod('needLogin', {"isAnonymous":config.userInfo.isAnonymousToken});
    } catch (e) {
      print('showTransfer error=$e');
    }
    return token;
  }



  /// 充值-通知商户展示自己的充值页面
  static Future<dynamic> showRechargePage() async {
    if(config.isApp) return null;
    dynamic resp;
    try {
      resp = await await config.methodChannel.invokeMethod('recharge', {});
    } catch (e) {
      print('showTransfer error=$e');
    }
    return resp;
  }

  /// 提现-通知商户展示自己的提现页面
  static Future<dynamic> showcashPage() async {
    if(config.isApp) return null;
    dynamic resp;
    try {
      resp = await config.methodChannel.invokeMethod('cash_out', {});
    } catch (e) {
      print('showTransfer error=$e');
    }
    return resp;
  }

  /// 注单-切换语言
  static Future<dynamic> notifyLangChanged() async {
    if(config.isApp) return null;
    dynamic resp;
    print('notifyLangChanged === lang ==${Translations.langCode}');
    try {
      resp = await config.methodChannel.invokeMethod('langChanged', {
        'lang': Translations.langCode
      });
      print('注单-切换语言langChanged resp=$resp');
    } catch (e) {
      print('注单-切换语言langChanged error=$e');
    }
    return resp;
  }

  /// TAB版-显示底部TabBar
  static Future<dynamic> showBottomBar() async {
    print('00-showBottomBar');
    if (config.sdkParams.showTabBarOnLoading || config.isApp) return null;

    dynamic resp;
    try {
      print('11-showBottomBar');
      config.currentBottomBarStatus = true;
      resp = await config.methodChannel.invokeMethod('showBottomBar', {});
    } catch (e) {
      print('22-showBottomBar error=$e');
    }
    return resp;
  }

  /// TAB版-隐藏底部TabBar
  static Future<dynamic> hideBottomBar() async {
    print('00-hideBottomBar');
    if (config.sdkParams.showTabBarOnLoading || config.isApp) return null;

    dynamic resp;
    try {
      print('11-hideBottomBar');
      config.currentBottomBarStatus = false;
      resp = await config.methodChannel.invokeMethod('hideBottomBar', {});
    } catch (e) {
      print('22-hideBottomBar error=$e');
    }
    return resp;
  }

  /// TAB版-资源下载进度
  static Future<dynamic> downloadAssets(
      {String progress = '0.0',
      String isDownloadEnd = 'false',
      int total = 0,
      int count = 0,
      String tag = ""}) async {
    if(config.isApp) return null;

    print('000-downloadAssets');
    if (config.isIconSDK) return null;
    dynamic resp;
    try {
      print('111-downloadAssets');
      resp = await config.methodChannel.invokeMethod('downloadProgress', {
        'progress': progress,
        'isDownloadEnd': isDownloadEnd,
        'total': '$total',
        'count': '$count',
        'tag': '$tag'
      });
      print('222-downloadAssets');
    } catch (e) {
      print('showTransfer error=$e');
    }
    return resp;
  }

  /// 余额变化
  static Future<dynamic> onBalanceChanged(String balance) async {
    if(config.isApp) return null;

    dynamic resp;
    try {
      resp = await config.methodChannel.invokeMethod('onBalanceChanged', {
        "value": balance,
      });
    } catch (e) {
      print('showTransfer error=$e');
    }
    return resp;
  }

  /// 通知native展示资源下载失败弹框
  static Future<dynamic> downloadAssetsError(
      {String desc = '网络异常请检查网络', bool show = true}) async {
    if(config.isApp) return null;

    print('00-downloadAssetsError');
    if (config.isIconSDK) return null;
    print('11-downloadAssetsError');
    dynamic resp;
    try {
      print('22-downloadAssetsError');
      resp = await config.methodChannel.invokeMethod(
          'load_assets_error', {'desc': desc ?? '', 'show': show ?? true});
      print('33-downloadAssetsError-resp=$resp');
      if (resp is Map && "retry_load_assets_alert" == resp["event"]) {
        print('44-downloadAssetsError-resp=$resp'); // 收到native给flutter的回调
        Event.eventBus.fire(RetryLoadAssetsEvent());
        print('55-downloadAssetsError');
      }
    } catch (e) {
      print('downloadAssetsError-load_assets_error e=$e');
    }
    return resp;
  }

  /// ICON版-登出
  static Future loginOut({bool expired = false}) async {
    if (config.isTabSDK || config.isApp) return null; // TAB版没有退出SDK

    Net.sdkWillExit();

    // 关闭小视频
    Event.eventBus.fire(VlogCloseEvent());
    // 关闭详情视频
    Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
    config?.sdkApi?.cancleStreamSubscription();
    await sleep(350);
    print('dart-退出>>$expired');
    try {
      XCStompClient.ins.forceClosed(); // 关闭webSocket连接
//      await gCloseFloat();
    } catch (e) {
      print('移除浮窗移除e=$e');
    }

    try {
      try {
        print('00-dart-退出');
        config?.userInfo?.logout();
        print('11-dart-退出');
      } catch (e) {
        print('退出SDK-error=${e.toString()}');
      }
      //安卓端需要退出
      if (Platform.isAndroid) {
        await config.platformChannel.invokeMethod("exit");
      }
      print('22-dart-退出');
      config.methodChannel.invokeMethod('exit_sdk', {'expired': '$expired'});
      print('33-dart-退出');
      Event.eventBus.fire(SDKWillExitEvent);
      print('44-dart-退出');
    } catch (e) {
      print('dart-退出 异常 e=$e');
    }
    return;
  }

  /// 获取SDK版本号，版本不对会导致资源下载错误
  static Future<String> sdkVersion() async {
    if(config.isApp) return '';

    String sdkVersion = '';
    try {
      sdkVersion =
          await config.methodChannel.invokeMethod(AiCache.sdk_version, {});
    } catch (e) {
      print('sdk版本获取异常 e=$e');
    }
    return sdkVersion;
  }

  /// iOS端开是否启边缘侧滑返回
  static Future setEdgePopGesture(bool edgePopGesture) async {
    if (!Platform.isIOS || !config.isIconSDK || config.isApp) return;

    try {
      print('00-setEdgePopGesture-$edgePopGesture');
      // 精选页有视频侧滑退出应用导致APP闪退
      //await config.methodChannel.invokeMethod('edgePopGesture', {'canEdgePopGesture' : edgePopGesture});
    } catch (e) {
      print('setEdgePopGesture invoke error=$e');
    }
    return;
  }

  /// TAB版-token过期
  static Future tokenTimeout() async {
    if(config.isApp) return;

    try {
      await config.methodChannel.invokeMethod('tokenTimeout', {});
    } catch (e) {
      print('tokenTimeout invoke error=$e');
    }
    return;
  }

  /// 系统维护
  static Future systemRepair(String msg, String whTime) async {
    if(config.isApp) return;

    try {
      await config.methodChannel.invokeMethod('operation_maintenance_503',
          {'code': 503, 'msg': msg ?? '', 'whTime': whTime ?? ''});
    } catch (e) {
      print('operation_maintenance_503 invoke error=$e');
    }
    return;
  }

  /// 通知宿主App可选择转屏(支持横竖屏转屏)
  static Future canAutorotate(bool autorotate) async {
    if(config.isApp) return;

    try {
      await config.methodChannel
          .invokeMethod('canAutorotate', {'autorotate': autorotate});
    } catch (e) {
      print('canAutorotate invoke error=$e');
    }
    return;
  }

  /// icon版 已进入SDK
  static Future didEnterSDK() async {
    if(config.isApp) return;

    try {
      await config.methodChannel.invokeMethod('didEnterSDK', {});
    } catch (e) {
      print('didEnterSDK invoke error=$e');
    }
    return;
  }
}
