import 'package:common_component/component/route/route.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/basehttp/http_request.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/ihttp_intercept.dart';
import 'package:common_component/util/sleep.dart';
import 'package:common_component/util/toast_window.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/utils/ai_date.dart';

///@autho king
///@date 8/9/21
///系统维护拦截
class SystemRepairedIntercept implements IHttpIntercept {
  HttpRequest httpRequest;
  @override
  Future onError(HttpResponse httpResponse) {}

  DateTime dateTime;

  @override
  Future onRequest(HttpRequest httpRequest) {
    this.httpRequest = httpRequest;
  }

  @override
  Future onResponse(HttpResponse response) async {
    if (ccRoute.currentRouteName == FastAiRouteTableName.LoginPage ||
        cmPackageConfig.live188tokenConfig.token == null) {
      return null;
    }
    if (ccRoute.currentRouteName == Live188RouteTableName.SystemRepairedPage) {
      return null;
    }
    if (200 == response.statusCode ||
        503 == response.statusCode ||
        403 == response.statusCode) {
      if (response.body.data is Map) {
        var serverCode = response.body.data['code'];
        var msg =
            response.body.data['msg'] ?? response.body.data['message'] ?? '';
        List<String> params = msg.split(',');

        if (503 == serverCode || 403 == serverCode) {
          String startTime;
          String endTime;
          if (params.length >= 4) {
            startTime = AiDate.getFormatDate(params[1], format: 'HH:mm');
            endTime = AiDate.getFormatDate(params[2], format: 'HH:mm');
          }
          ccRoute.pop(
              popMethod: PopMethod.PopUntilAndReplacement,
              pushAnim: PushAnim.None,
              routeName: Live188RouteTableName.SystemRepairedPage,
              routeParams: {
                'startTime': startTime,
                'endTime': endTime,
              },
              routePredicate: (route) {
                return route.settings?.name == '/';
              });
        }
      }
    }
  }
}
