import 'dart:collection';
import 'dart:io';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:flutter/widgets.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';

typedef PageCountChangeListener = void Function(int pageCount,Route route , Route previousRoute, PageMethod method);

class AiNavigatorObserver extends NavigatorObserver{

   final _pageChangeList = HashSet<PageCountChangeListener>();


  AiNavigatorObserver() {
    AiNavigatorObserver._instance = this;
  }
  static AiNavigatorObserver _instance;

  static AiNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = AiNavigatorObserver();
    }
    return _instance;
  }

  int _currentStackLen = 0;

  String currentRouteName;

   //获取当前的页面数目
  int get pageCount => _currentStackLen;

  @override
  void didPush(Route route, Route previousRoute) {
    _currentStackLen ++;
    // print('pushRoute进入名字----_currentStackLen=:${_currentStackLen}');
    // print('pushRoute进入名字----:${route?.settings?.name ?? ''}');
    // print('pushpreviousRoute进入名字----:${previousRoute?.settings?.name ?? ''}');
    dispatchPageCountChangeListener(pageCount, route, previousRoute, PageMethod.Push);
    currentRouteName = route?.settings?.name;
    super.didPush(route, previousRoute);
//    if (config.userInfo.currentMenuKey == AppMenuKey.LiveGame && !PopupShareService.ins.hasPausesPoint()) {
//      Event.eventBus.fire(LiveGameVideoEvent(state: 'pause'));
//    }
  }


  //分发页面数目变化事件
  // ignore: missing_return
  Future<void> dispatchPageCountChangeListener(int pageCount,Route route , Route previousRoute, PageMethod pageMethod){
    _pageChangeList.forEach((element) {
      element(pageCount, route, previousRoute, pageMethod);
    });
  }


  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    currentRouteName = previousRoute?.settings?.name;
    _currentStackLen --;
    // print('popRoute出来名字----_currentStackLen=:${_currentStackLen}');
    // print('popRoute出来名字----:${route?.settings?.name ?? ''}');
    // print('poppreviousRoute出来名字----:${previousRoute?.settings?.name ?? ''}');
    if(previousRoute.settings.name == AiRouter.AiDetailPage){
      try{
        if(previousRoute.settings.arguments != null && previousRoute.settings.arguments is Map){
          int hashCode = (previousRoute.settings.arguments as Map)['pageHashCode'];
          DetailPageRefreshManager.instance.recoverShowPage = hashCode;
        }
      }catch(e){}
    }
    dispatchPageCountChangeListener(pageCount, route, previousRoute, PageMethod.Pop);
    PopupShareService.ins.hasPausesPoint();
//    if (previousRoute.settings.name == TabSdkPage.main && config.currentSeletedItem == SeletedItem.sport && config.userInfo.currentMenuKey == AppMenuKey.LiveGame) {
//      Event.eventBus.fire(LiveGameVideoEvent(state: 'play'));
//    }
  }


  //添加页面数目监听器
  void addPageCountChangeListener(PageCountChangeListener listener){
    _pageChangeList.add(listener);
  }

  //移除页面数目监听器
  void removePageCountChangeListener(PageCountChangeListener listener){
    _pageChangeList.remove(listener);
  }

}

enum PageMethod{
  Pop,
  Push,

}