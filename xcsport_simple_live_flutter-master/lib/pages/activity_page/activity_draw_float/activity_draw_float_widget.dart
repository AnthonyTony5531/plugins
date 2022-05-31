// 活动-翻牌-浮点按钮
import 'package:common_component/component/route/route.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_model.dart';
import 'dart:async';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_user_win_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_lottery_status_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_common_util.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';

double floatActivityDrawCarX = 0;
double floatActivityDrawCarY = 0;
final String kGlobalActivityDrawTopic = '/topic/lottery/activity/';
final String kGlobalLotteryMsgTopic = '/topic/lottery/pushWinPrizeUser/';
final String isOpenKey = 'isActivityShow';

class FloatActivityDrawCarHelper{
  static bool _activityDrawsShow = false;
  static bool _showLocalActivityDraw = false; //当前是正显示本地页面内的购物车，如详情页内的购物车
  static String pushUrl; // 推送开关推送
  static String lotteryPushUrl; // 用户中奖推送
  static XCNetworkState _networkState = config.netConnectStatus;

  // 网络监测
  static StreamSubscription<NetworkStateEvent> _networkStateEvent;


  /// 只初始化一次
  static void init() async {
    if ((config.isAi || config.isTabSDK || config.isNSports) && config.isCnLang) {
      if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
        hideActivityDraw();
      }
      bool status = await getLotteryStatus();
      activityConfig.showFloatActivityDraw = status;
      _activityDrawsShow = status;
      if (status) { // 活动开启
        if (config.userInfo.account != null) {
          // 活动开关推送和用户中奖推送
          activityDrawSubscribe();
          showActivityDraw();
        } else {
          var accountModel = await Net.playAccount();
          if (accountModel != null) {
            config.userInfo.account = accountModel;
            // 活动开关推送和用户中奖推送
            activityDrawSubscribe();
            showActivityDraw();
          }
        }
      } else { // 活动未开启

      }
    }
  }

  // 获取抽送活动状态:1正常、2禁用 0老版本
  static Future<bool> getLotteryStatus() async {
    LotteryStatusRspProtocol statusRspProtocol = await LotteryStatusRepProtocol().request();
    if (statusRspProtocol.isSuccess) {
      return (statusRspProtocol.status == 1 ? true : false);
    } else {
      return false;
    }
  }

  // 订阅
  static activityDrawSubscribe() async {
    String merId = await config.userInfo.loadMerchantId();
    String walletId = config.userInfo.walletId;
    String playerId = config.userInfo.playerId;

    pushUrl = '$kGlobalActivityDrawTopic$merId/$walletId';
    lotteryPushUrl = '$kGlobalLotteryMsgTopic$merId/$walletId/$playerId';
    XCStompClient.ins.subscribe(XCStompAction.AnchorBetShare, pushUrl, _globalActivityDrawPushMsgCallback);
    XCStompClient.ins.subscribe(XCStompAction.AnchorOffline, lotteryPushUrl, _activityDrawLotteryMsgCallback);
    _networkStateEvent = Event.eventBus.on<NetworkStateEvent>().listen(_configNetworkEvent);
  }

  // 取消订阅
  static void activityDrawUnregister() {
    XCStompClient.ins.unsubscribe(XCStompAction.AnchorBetShare, pushUrl);
    XCStompClient.ins.unsubscribe(XCStompAction.AnchorOffline, lotteryPushUrl);
  }

  // 活动开关订阅成功返回的信息
  static void _globalActivityDrawPushMsgCallback(Map<String,dynamic> msg) {
    AiJson aiJson = AiJson(msg);
    List list = aiJson.getArray('data');
    var map = list.first;
    AiJson aiJson1 = AiJson(map);
    bool isOpen = aiJson1.getNum('isOpen') == 1 ? true : false;
    activityConfig.showFloatActivityDraw = isOpen;
    if (isOpen == true) {
      init();
    }
    activityDrawStatus(isOpen);
  }

  // 用户中奖推送订阅成功返回的信息a
  static void _activityDrawLotteryMsgCallback(Map<String,dynamic> msg) {
    if (msg != null) {
      if (!ccRoute.hasShowOverlay( FastAiRouteTableName.ActivityDrawFloat)) {
        init();
      } else {
        List dataList = msg['data'];
        WinPrizeUserModel winPrizeUserModel = WinPrizeUserModel.fromJson(dataList.first);
        Event.eventBus.fire(ActivityDrawWinPrizeEvent(winPrizeUserModel: winPrizeUserModel));
      }
    }
  }

  static void _configNetworkEvent(NetworkStateEvent event){
    if (_networkState != event.state) {
      _networkState = event.state;
      if (!ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat) && activityConfig.showFloatActivityDraw) {
        init();
      }
    }
  }

  /// show
  static void showActivityDraw() {
    ccRoute.push(routeName: FastAiRouteTableName.ActivityDrawFloat, routeParams: ActivityDrawFloatViewModel(), pushType: PushType.Overlay);
  }

  /// hide
  static void hideActivityDraw() {
    print('移除翻翻乐----,${ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)}');
    if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
      ccRoute.pop(routeName: FastAiRouteTableName.ActivityDrawFloat, popType: PopType.Overlay);
      print('移除翻翻乐==sssss,${ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)}');
    }
    _networkStateEvent?.cancel();
    _activityDrawsShow = false;
  }

  static bool activityDrawCarIsShow() {
    return _activityDrawsShow;
  }

  static void activityDrawStatus(bool show,{bool isDetail = false}) {
    Event.eventBus.fire(ActivityDrawStatusEvent(show: show,isDetail: isDetail));
  }

  static void switchActivityDrawStatus(bool show) {
    _activityDrawsShow = show;
  }

  static bool showLocalActivityDraw() {
    return _showLocalActivityDraw;
  }

}
