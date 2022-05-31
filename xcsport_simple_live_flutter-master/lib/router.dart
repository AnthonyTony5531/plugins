import 'dart:io';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/pages/detail/data_view/data_view_page.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/login/login_page.dart';
import 'package:fast_ai/pages/white_web_view_page.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:flutter/material.dart';

class AiRouter {
  static const String AiLoginPage = 'Ai_loginPage';
  static const String BettingContainer2P0 = 'BettingContainer2P0';
  static const String AiMemberBetSettingPage = 'MemberBetSettingPage';
  static const String AiPersonalPage = 'personalPage';
  static const String AiSportsTypePage = 'SportsTypePage';
  static const String AiActivityDrawPage = 'AiActivityDrawPage';
  static const String AiWebViewPage = 'AiWebView';
  static const String AiDetailPage = 'detailPage';
  static const String AiMainPage = TabSdkPage.main;
  static const String AiMoreFunction = 'moreFunction';

  static var scaffoldKey = GlobalKey<ScaffoldState>();
  static Map<String, WidgetBuilder> routes = {
    'Ai_loginPage': (BuildContext context) => LoginPage(),
    'detailPage': (BuildContext context) => DetailPage(),
    'dataViewPage': (BuildContext context) => DataViewPage(),
  };

  // static Future<dynamic> _push(BuildContext context, String routeName, {dynamic params}) {
  // if (routeName.startsWith('https://') || routeName.startsWith('http://')) {
  //   return Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return WhiteWebViewPage(url: routeName, title: params['title']??'',);
  //     //return WebViewPage(routeName, params: params);
  //   }));
  // } else {
  //   return Navigator.pushNamed(context, routeName, arguments: params);
  // }
  // }

  static Future<bool> pop<T extends Object>(BuildContext context,
      [T result]) async {
    bool flag = Navigator.of(context).canPop();
    if (flag) {
      Navigator.of(context).pop(result);
    }
    print('00-router-flag=$flag');
    updateEdgePopGestureStatus(context);
    return flag;
  }

  static Future<dynamic> _push(
      {BuildContext context,
      Route<dynamic> route,
      String routeName,
      bool pop = false,
      bool replace = false,
      RoutePredicate predicate,
      dynamic params}) {
    Future<dynamic> page;
    //不给重复跳转
    if( AiNavigatorObserver.getInstance().currentRouteName != null && AiNavigatorObserver.getInstance().currentRouteName == routeName){
       return Future.value();
    }
    if (route != null && context != null) {
      page = Navigator.of(context).push(route);
    } else if (context != null) {
      if (routeName.startsWith('https://') || routeName.startsWith('http://')) {
        page = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WhiteWebViewPage(
            url: routeName,
            title: params['title'] ?? '',
          );
        }));
      } else {
        page = Navigator.pushNamed(context, routeName, arguments: params);
      }
    } else {
      if (pop) {
        page = AiNavigatorObserver.getInstance()
            .navigator
            .popAndPushNamed(routeName, arguments: params);
      } else if (replace) {
        page = AiNavigatorObserver.getInstance()
            .navigator
            .pushReplacementNamed(routeName, arguments: params);
      } else if (predicate != null) {
        // remove
        page = AiNavigatorObserver.getInstance()
            .navigator
            .pushNamedAndRemoveUntil(routeName, predicate, arguments: params);
      } else {
        page = AiNavigatorObserver.getInstance()
            .navigator
            .pushNamed(routeName, arguments: params);
      }
    }

    updateEdgePopGestureStatus(context);
    return page;
  }

  static Future<dynamic> pushWithRoute(
      BuildContext context, Route<dynamic> route,
      {dynamic params}) {
    return _push(context: context, route: route, params: params);
  }

  static Future<dynamic> pushReplacement(Route<dynamic> route, [result]) async {
    Future<dynamic> page = AiNavigatorObserver.getInstance()
        .navigator
        .pushReplacement(route, result: result);
    updateEdgePopGestureStatus();
    return page;
  }

  static Future<bool> popUntil(
      BuildContext context, RoutePredicate routePredicate) async {
    bool flag = Navigator.of(context).canPop();
    if (flag) {
      Navigator.of(context).popUntil(routePredicate);
    }
    updateEdgePopGestureStatus(context);
    return flag;
  }

  static Future<dynamic> pushAndRemoveUntil(
      Route<dynamic> route, RoutePredicate routePredicate) async {
    Future<dynamic> page = AiNavigatorObserver.getInstance()
        .navigator
        .pushAndRemoveUntil(route, routePredicate);
    updateEdgePopGestureStatus();
    return page;
  }

//  static Future<dynamic> pushWithNameWithoutAnimation(String name, {bool isCollectVideo = false}) async {
//    Future<dynamic> page = AiNavigatorObserver.getInstance().navigator.push(PageRouteBuilder(
//              pageBuilder: (_, __, ___) => Vlog(
//                isCollectVideo: isCollectVideo,
//              ),
//              settings: RouteSettings(name: name),
//            ));
//    updateEdgePopGestureStatus();
//    return page;
//  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {dynamic params}) {
    // return _push(context, routeName, params: params);
    return _push(context: context, routeName: routeName, params: params);
  }

  static Future<dynamic> pushWithoutContext(String routeName,
      {dynamic params}) {
    // AiNavigatorObserver.getInstance().navigator.push(MaterialPageRoute(builder: (context){ return LoginPage();}));
    // return AiNavigatorObserver.getInstance().navigator.pushNamed(routeName, arguments: params);
    return _push(routeName: routeName, params: params);
  }

  static Future<dynamic> popAndPushWithoutContext(String routeName,
      {dynamic params}) async {
    Future<dynamic> page = AiNavigatorObserver.getInstance()
        .navigator
        .popAndPushNamed(routeName, arguments: params);
    updateEdgePopGestureStatus();
    return page;
  }

  static Future<dynamic> pushAndRemoveUtilWithoutContext(String routeName,
      {dynamic params, RoutePredicate predicate}) {
    // AiNavigatorObserver.getInstance().navigator.push(MaterialPageRoute(builder: (context){ return LoginPage();}));
    // return AiNavigatorObserver.getInstance().navigator.pushNamedAndRemoveUntil(routeName, predicate, arguments: params);
    if (predicate == null) {
      predicate = (r) => r == null; //返回为false则被pop的页页会调用dispose，否则不会
    }
    return _push(routeName: routeName, params: params, predicate: predicate);
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic params}) {
    // AiNavigatorObserver.getInstance().navigator.push(MaterialPageRoute(builder: (context){ return LoginPage();}));
    // return AiNavigatorObserver.getInstance().navigator.pushReplacementNamed(routeName, arguments: params);
    return _push(routeName: routeName, params: params, replace: true);
  }

//  static Future<dynamic> pushToDetailPage(BuildContext context,
//      {@required DetailParams params}) async {
//    if (config.isApp) return;
//
//    AiRouter.pushReplacement(
//        NoAnimationPageRoute(
//            builder: (BuildContext context) => AiPage(),
//            fullscreenDialog: true,
//            settings: RouteSettings(name: TabSdkPage.main)),
//        ModalRoute.withName(TabSdkPage.main));
//    //AiRouter.pushWithoutContext('detailPage', params: params);
//    DetailPage.show(context, DetailPage(params: params));
//  }

  static void updateEdgePopGestureStatus([BuildContext context]) {
    if (!Platform.isIOS || !config.isIconSDK) return;

    bool flag = AiNavigatorObserver?.getInstance()?.navigator?.canPop() ?? false;
    print('00-updateEdgePopGestureStatus=$flag');
    if (context != null && !flag) {
      print('11-updateEdgePopGestureStatus=$flag');
      flag = Navigator?.of(context)?.canPop() ?? false;
    }
    print('22-updateEdgePopGestureStatus=$flag');
    config.edgePopGesture = flag;
  }

  static void removeRoute({BuildContext context, Route<dynamic> route}) {
    Navigator.removeRoute(context, route);
  }
}

class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  final bool fullscreenDialog;
  final RouteSettings settings;
  NoAnimationPageRoute(
      {WidgetBuilder builder, this.settings, this.fullscreenDialog})
      : super(
            builder: builder,
            fullscreenDialog: fullscreenDialog,
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
