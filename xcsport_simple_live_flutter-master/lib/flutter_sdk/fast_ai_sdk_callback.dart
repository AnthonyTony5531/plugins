import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/utils/util.dart';

class FastAiSdkCallback {
  Map<String, dynamic> _callbackParams = {};

  //需要登录
  needLogin(dynamic data) {
    stopLivePlayer();
    String value;
    if (data != null && data is Map) {
      value = data['hookName'];
    }
    _callbackParams = {'type': 'needLogin', 'value': value};
    _sdkSendCallBack(_callbackParams);
  }

  //token过期
  tokenExpire() {
    stopLivePlayer();
    _callbackParams = {'type': 'tokenExpire', 'value': null};
    _sdkSendCallBack(_callbackParams);
  }

  //余额变化
  balanceChanged(String balance) {
    _callbackParams = {'type': 'balanceChanged', 'value': balance};
    _sdkSendCallBack(_callbackParams);
  }

  //进入页面
  onEnterPage(String pageName, { data }) {
    //aboutUs:关于我们，securityCenter：安全中心，account：账号与资料，
    //recharge 充值
    //withdraw 体现
    //transfer 转账
    _callbackParams = {'type': 'onEnterPage', 'value': pageName, 'data': data};
    _sdkSendCallBack(_callbackParams);
  }

  //503维护
  onSystemRepair(String time) {
    stopLivePlayer();
    _callbackParams = {'type': 'onSystemRepair', 'value': time};
    _sdkSendCallBack(_callbackParams);
  }

  //403维护
  onSystemRepair403() {
    stopLivePlayer();
    _callbackParams = {'type': 'onSystemRepair403', 'value': ''};
    _sdkSendCallBack(_callbackParams);
  }

  //退出登录
  logout() async {
    stopLivePlayer();
    config.userInfo.isAnonymousToken = true;
    _callbackParams = {'type': 'logout', 'value': null};
    _sdkSendCallBack(_callbackParams);
    await FastAiSdk.ins.logout();
  }

  //余额显示状态
  balanceDisplayStatus() {
    _callbackParams = {
      'type': 'balanceDisplayStatus',
      'value': config.userInfo.isShowBalance
    };
    _sdkSendCallBack(_callbackParams);
  }

  //发送回调
  _sdkSendCallBack(Map<String, dynamic> data) {
    Event.eventBus.fire(FastAiSdkEvent(data: data));
  }

  /// 新体育-188设置页面跳转事件
  void live188SettingsEvents(Map<String, dynamic> data) {
    _sdkSendCallBack(data);
  }

  //更新用户信息回调事件
  //value：nickname，head
  updatePlayerInfo({String value,int pisid = -1}){
    _callbackParams = {
      'type': 'updatePlayerInfo',
      'value': value,
      'pisid':pisid  //mx图片对应的id
    };
    _sdkSendCallBack(_callbackParams);
  }

  void stopLivePlayer(){
    // 关闭小视频播发
    Event.eventBus.fire(VlogCloseEvent());
    // 关闭详情直播
    Event.eventBus.fire(CloseDetailLiveEvent());
  }

  //
  void launchCloudCustomerService() {
    _callbackParams = {
      'type': 'onLaunchCloudCustomerService',
      'value': ''
    };
    _sdkSendCallBack(_callbackParams);
  }

  void onDomainBlocked() {
    _callbackParams = {
      'type': 'onDomainBlocked',
      'value': ''
    };
    _sdkSendCallBack(_callbackParams);
  }

  void onRecharge() {
    _callbackParams = {'type': 'recharge', 'value': ''};
    _sdkSendCallBack(_callbackParams);
  }

  void onCashOut() {
    _callbackParams = {'type': 'cashOut', 'value': ''};
    _sdkSendCallBack(_callbackParams);
  }

  void onTransfer() {
    _callbackParams = {'type': 'transfer', 'value': ''};
    _sdkSendCallBack(_callbackParams);
  }
}
