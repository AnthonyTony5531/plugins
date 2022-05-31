import 'package:common_component/component/route/route.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/basehttp/http_request.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/ihttp_intercept.dart';
import 'package:common_component/util/sleep.dart';
import 'package:common_component/util/toast_window.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:flutter/material.dart';

///@autho king
///@date 8/9/21
///
class TokenHttpIntercept implements IHttpIntercept {
  HttpRequest httpRequest;
  @override
  Future onError(HttpResponse httpResponse) {}

  DateTime dateTime;

  @override
  Future onRequest(HttpRequest httpRequest) {
    this.httpRequest = httpRequest;
  }

  static bool hasTipsTimeOut = false;

  @override
  Future onResponse(HttpResponse response) {
    if (ccRoute.currentRouteName == Live188RouteTableName.TokenOverduePage) {
      return null;
    }
    if (200 == response.statusCode) {
      if (response.body.data is Map) {
        var serverCode = response.body.data['code'];
        if (cmPackageConfig.live188tokenConfig.token == null || serverCode == 401 || serverCode == 405 || serverCode == 406) {
          if(config.isTabSDK || config.isNSports) {
          //if(config.isTabSDK && isNotEmpty(cmPackageConfig.live188tokenConfig.token) || config.isNSports) {
            if(!cmPackageConfig.live188tokenConfig.loginShow) {
              cmPackageConfig.live188tokenConfig.loginShow = true;
              ToastWindow.show('登陆有效期已失效');
              if(config.isNSports){
                FastAiSdk.sdkCallback.live188SettingsEvents({'type' : 'onLive188Settings', 'title' : 'token_timeout'});
              }else if(config.userInfo.isAnonymousToken){
                XcSdkApi.needlogin();
              }
            }
          }
          else {
            ccRoute.push(routeName: Live188RouteTableName.TokenOverduePage);
          }
          cmPackageConfig.live188tokenConfig.saveToken(null);
          // if (config.isApp) {
          //   ccRoute.pop(
          //       popMethod: PopMethod.PopUntilAndReplacement,
          //       pushAnim: PushAnim.None,
          //       routeName: FastAiRouteTableName.LoginPage,
          //       routePredicate: (route) {
          //         return route.settings?.name == '/';
          //       });
          // }
        } else if (response.statusCode == 500) {}
      }
    }
  }
}
