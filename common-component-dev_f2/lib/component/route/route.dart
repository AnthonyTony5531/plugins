/*
 * @Author: King 
 * @Date: 2021-08-30 17:28:49 
 * @Last Modified by: King
 * @Last Modified time: 2021-08-30 18:11:06
 */
import 'dart:async';
import 'dart:collection';
import 'package:common_component/component/conponent.dart';
import 'package:common_component/component/route/anim/none_page_anim.dart';
import 'package:common_component/component/route/anim/slide_in_left_out_right_page_anim.dart';
import 'package:common_component/component/route/anim/slide_in_left_out_right_with_fade_page_anim.dart';
import 'package:common_component/component/route/anim/slide_in_up_out_bottom_page_anim.dart';
import 'package:common_component/component/route/anim/slide_in_up_out_bottom_with_fade_dialog_anim.dart';
import 'package:common_component/component/route/anim/slide_in_up_out_bottom_with_fade_page_anim.dart';
import 'package:common_component/component/route/route_table.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/ai_measure.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:common_component/util/sleep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

import 'anim/curper_popup_anim.dart';
import 'anim/slide_in_left_out_right_popup_anim.dart';
import 'anim/slide_in_left_out_right_with_fade_popup_anim.dart';
import 'anim/slide_in_up_out_bottom_dialog_anim.dart';
import 'anim/slide_in_up_out_bottom_popup_anim.dart';
import 'anim/slide_in_up_out_bottom_with_fade_popup_anim.dart';

//路由表构建器
typedef RouteTableBuilder = Widget Function(
    BuildContext context, dynamic routeParams);
typedef RouteViewBuilder = Widget Function( dynamic routeParams, IViewModel viewModel);
typedef PageBuilder = Widget Function(BuildContext context);
//动画构建器
typedef AnimBuilder = ModalRoute Function(RouteTableBuilder tableBuilder,
    dynamic routeParams, bool maintainState, bool fullscreenDialog);

//Push拦截器，如果返回true，不跳转.主要是做项目的业务监听
typedef PushIntercepter = bool Function(String routeName, dynamic routeParams,
    bool maintainState, bool fullscreenDialog);

// 页面变化监听 operatorMehtod: 0 pop, 1 push
typedef RouteChangedListener = void Function(
    Route route, Route previousRoute, OperatorMethod operatorMehtod);

/// 项目路由管理类,主要用来统一跳转，关闭管理
/// 若有Push页面监听业务，用 [PushIntercepter]
/// 若Push动画不支持，用 [AnimBuilder]自定义
class XcRoute extends NavigatorObserver implements IComponent {
  final _overlayEntryMap = LinkedHashMap<String, _OverlayEntryData>();

  //是否已经显示过某个路由的Overlay
  bool hasShowOverlay(String routeName) {
    return _overlayEntryMap.containsKey(routeName);
  }

  String _currentRouteName;
  int _pageCount = 0;

  //获取当前的页面数目
  int get pageCount => _pageCount;

  //当前路由页面路径
  String get currentRouteName => _currentRouteName;

  @override
  void didPush(Route route, Route previousRoute) {
    var name = route.settings?.name;
    if (null != name) {
      _currentRouteName = name;
    }
    _pageCount++;
    super.didPush(route, previousRoute);
    _routeChangedListener.forEach((element) {
      element(route, previousRoute, OperatorMethod.Push);
    });
  }

  // @override
  // void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
  //   print('didRemove, route=${route.settings?.name}, previousRoute=${route.settings?.name}');
  //   super.didRemove(route, previousRoute);
  // }

  @override
  void didReplace({ Route<dynamic> newRoute, Route<dynamic> oldRoute }) {
    if(oldRoute.settings?.name == '/') {
      _currentRouteName = newRoute?.settings?.name;
      _pageCount = 1;
    }
    //print('didReplace, newRoute=${newRoute.settings?.name}, oldRoute=${oldRoute.settings?.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _routeChangedListener.forEach((element) {
      element(newRoute, oldRoute, OperatorMethod.Push);
    });
  }

  final Set<RouteChangedListener> _routeChangedListener = Set();

  void addRouteChangedListener(RouteChangedListener listener) {
    assert(listener != null);
    _routeChangedListener.add(listener);
  }

  void removeRouteChangedListener(RouteChangedListener listener) {
    assert(listener != null);
    _routeChangedListener.remove(listener);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    _currentRouteName = previousRoute?.settings?.name;
    _pageCount--;
    if (_pageCount < 0) {
      _pageCount = 0;
    }
    super.didPop(route, previousRoute);
    _routeChangedListener.forEach((element) {
      element(route, previousRoute, OperatorMethod.Pop);
    });
  }

  final Map<String, RouteTableBuilder> _builderTable = {};
  final Map<String, RouteViewBuilder> _builderView = {};

  final GlobalKey<NavigatorState> navigatorStateKey =
      GlobalKey<NavigatorState>();

  //加入模块路由表
  void addRouteTable({IRouteTable routeTable}) {
    _builderTable.addAll(routeTable.tables);
    _builderView.addAll(routeTable.views);
  }

  PushIntercepter _pushPageIntercepter;

  //设置Push拦截器
  void setPushIntercepter(PushIntercepter intercepter) {
    _pushPageIntercepter = intercepter;
  }

  /// 关闭，如果[popMethod]是[PopMethod.PopUntil  ],是没有返回值的。官方不支持
  /// routePredicate 设置[PopMethod.PopUntil PopUntilAndReplacement ]使用
  /// routeName   设置[PopMethod.PopAndPush PopUntilAndReplacement]的时候使用
  /// routeParams  设置[PopMethod.PopAndPush PopUntilAndReplacement]的时候使用
  /// onBack  设置[PopMethod.PopAndPush PopUntilAndReplacement]的时候使用
  /// pushAnim 设置[PopMethod.PopAndPush PopUntilAndReplacement]的时候使用
  Future<T> pop<T>({
    dynamic data,
    PopMethod popMethod = PopMethod.Pop,
    PopType popType = PopType.Default,
    BuildContext context, //只有在Overlay关闭情况下使用，如果没有当前Context,那么你需要传routeName的值
    final RoutePredicate routePredicate,
    String routeName,
    final dynamic routeParams,
    final ValueChanged<T> onBack,
    PushAnim pushAnim = PushAnim.PageCupertinoPopupAnim,
    final Duration duration,
  }) async {
    return Future.delayed(Duration(milliseconds: 0), () async {
      //一直到app渲染后一针后
      while (navigator == null) {
        await sleep(500);
      }
      if (PopType.Overlay == popType) {
        if (_overlayEntryMap.isEmpty) {
          return null;
        }
        if (routeName == null) {
          if (context != null) {
            routeName = _OverlayLifeParentWidget.of(context).routeName;
          }
          assert(routeName != null, "context 為空 或 獲取不到路由名字去關閉");
        }
        if (_overlayEntryMap.containsKey(routeName)) {
          var odata = _overlayEntryMap[routeName];
          odata.overlayEntry.remove();
          _overlayEntryMap.remove(routeName);
          odata.completer.complete(data);
        }
        return null;
      }
      switch (popMethod) {
        case PopMethod.Pop:
          if (navigator.canPop()) {
            navigator.pop(data);
          }
          break;
        case PopMethod.PopUntil:
          assert(routePredicate != null, 'PopUntil 必须设置routePredicate');
          if (navigator.canPop()) {
            navigator.popUntil(routePredicate);
          }
          break;
        case PopMethod.PopAndPush:
          assert(
              routeName != null && routeName.isNotEmpty, 'PopAndPush 路由名字不能为空');
          if (navigator.canPop()) {
            navigator.pop(data);
          }
          var backData = await this.push<T>(
            routeName: routeName,
            routeParams: routeParams,
            pushAnim: pushAnim,
          );
          onBack?.call(backData);
          return backData;
        case PopMethod.PopUntilAndReplacement:
          if (navigator.canPop()) {
            navigator.popUntil(routePredicate);
          }
          var backData = await push(
            routeName: routeName,
            pushMethod: PushMethod.PushReplacement,
            routeParams: routeParams,
            pushAnim: pushAnim,
          );
          onBack?.call(backData);
          break;
      }
      return null;
    });
  }

  bool canPop() {
    return navigator.canPop();
  }

  // 跳转Page ，Dialog 统一入口
  /// 支持可选动画意外的自定义动画，自行实现 [animBuilder]
  /// 其中[onBack]是关闭后的返回值回调。
  /// [routeParams] 路由传参
  /// [routeName] 路由名字
  /// [pushType] 跳转方式，默认为[PushType.Page]， 可选的有Page
  /// [pushMethod] 跳转的方法, Page  默认为 [PushMethod.Push],Dialog 默认为 [PushMethod.NormalDialog] ,可选的有Push, PushAndRemoveUntil, PushReplacement, NormalDialog, BottomDialog
  /// [duration] 动画时间，默认为500毫秒
  /// [pushAnim] 动画类型
  Future<T> push<T>({
    @required final String routeName,
    final ValueChanged<T> onBack,
    final dynamic routeParams,
    final RoutePredicate routePredicate,
    final AnimBuilder animBuilder,
    final Duration duration,
    bool maintainState = false,
    bool fullscreenDialog = false,
    PushAnim pushAnim = PushAnim.Default,
    PushMethod pushMethod = PushMethod.Push,
    PushType pushType = PushType.Page,

    ///dialog 为[PushMethod.BottomDialog ]属性
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool opaque,

    /// dialog 为[PushMethod.NormalDialog ]属性,支持barrierColor,backgroundColor,isDismissible
    bool barrierDismissible = true,
    ui.ImageFilter filter,
  }) {
    assert(routeName != null && routeName.isNotEmpty, 'push 路由名字不能为空');
    if (_pushPageIntercepter?.call(
            routeName, routeParams, maintainState, fullscreenDialog) ??
        false) {
      return null;
    }
    _currentRouteName = routeName;
    return Future.delayed(
        Duration(
          milliseconds: 0,
        ), () async {
      //一直到app渲染后一针后
      while (navigator == null) {
        await sleep(500);
      }
      dynamic data;
      if (pushType == PushType.Page) {
        data = await processPageRoute(
          routeName: routeName,
          routeParams: routeParams,
          routePredicate: routePredicate,
          animBuilder: animBuilder,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          pushAnim: pushAnim,
          pushMethod: pushMethod,
          pushType: pushType,
        );
      } else if (pushType == PushType.BottomDialog ||
          pushType == PushType.Dialog) {
        data = await processDialogRoute(
          routeName: routeName,
          routeParams: routeParams,
          pushType: pushType,
          clipBehavior: clipBehavior,
          shape: shape,
          pushAnim: pushAnim,
          backgroundColor: backgroundColor,
          duration: duration,
          isScrollControlled: isScrollControlled,
          isDismissible: isDismissible,
          enableDrag: enableDrag,
          barrierDismissible: barrierDismissible,
          filter: filter,
        );
      } else if (pushType == PushType.Overlay) {
        data = await processOverlayRoute(
          routeName: routeName,
          routeParams: routeParams,
          opaque: opaque,
          maintainState: maintainState,
        );
      }
      onBack?.call(data as T);
      return data as T;
    });
  }

  Future<T> processOverlayRoute<T>({
    @required final String routeName,
    final dynamic routeParams,
    final bool opaque,
    final bool maintainState,
  }) {
    try {
      final RouteTableBuilder tableBuilder = _builderTable[routeName];
      assert(tableBuilder != null, "$routeName 没配置路由表或路由表构建时候异常，跳转失败");
      if (_overlayEntryMap.containsKey(routeName)) {
        _overlayEntryMap[routeName]?.overlayEntry?.remove();
        _overlayEntryMap.remove(routeName);
      }
      var odata = _OverlayEntryData<T>(routeName: routeName);
      var widget = _OverlayLifeParentWidget(
        builder: (BuildContext context) {
          return tableBuilder(context, routeParams);
        },
        routeName: routeName,
        data: odata,
      );
      var entry = OverlayEntry(
          opaque: opaque ?? false,
          maintainState: maintainState ?? false,
          builder: (context) => widget);
      odata.overlayEntry = entry;
      _overlayEntryMap[routeName] = odata;
      this.navigator.overlay.insert(entry);
      return odata.completer.future;
    } catch (ex, s) {
      print("processOverlayRoute>ex:$ex");
      print("processOverlayRoute>s:$s");
    }
    return null;
  }

  Future processDialogRoute({
    @required final String routeName,
    final dynamic routeParams,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    final Duration duration,
    PushType pushType = PushType.Dialog,
    Color barrierColor,
    PushAnim pushAnim = PushAnim.Default,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool barrierDismissible = true,
    String barrierLabel,
    ui.ImageFilter filter,
  }) async {
    final RouteTableBuilder tableBuilder = _builderTable[routeName];
    assert(tableBuilder != null, "$routeName 没配置路由表或路由表构建时候异常，跳转失败");
    dynamic data;
    if (pushType == PushType.Dialog) {
      ModalRoute newRoute;
      if (pushAnim == PushAnim.Default ||
          pushAnim == PushAnim.DialogSlideInUp_OutBotom_with_Fade) {
        newRoute = SlideInUpOutBottomWithFadeDialogAnim(
            barrierColor: barrierColor,
            barrierDismissible: barrierDismissible,
            duration: duration,
            backgroundColor: backgroundColor,
            isDismissible: isDismissible,
            barrierLabel: barrierLabel,
            filter: filter,
            settings: _createRouteSetting(routeName, routeParams),
            pageBuilder: (context) => tableBuilder(context, routeParams));
      } else {
        newRoute = SlideInUpOutBottomDialogAnim(
            barrierColor: barrierColor,
            barrierDismissible: barrierDismissible,
            duration: duration,
            backgroundColor: backgroundColor,
            isDismissible: isDismissible,
            barrierLabel: barrierLabel,
            filter: filter,
            settings: _createRouteSetting(routeName, routeParams),
            pageBuilder: (context) => tableBuilder(context, routeParams));
      }
      await navigator.push(newRoute);
    } else {
      data = await showModalBottomSheet(
          context: navigator.context,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          barrierColor: barrierColor,
          isScrollControlled: isScrollControlled,
          isDismissible: isDismissible,
          enableDrag: enableDrag,
          builder: (BuildContext context) => ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: AiMeasure.screenHeight(context) -
                        AiMeasure.topOffset(context) -
                        50),
                child: tableBuilder(context, routeParams),
              ),
          useRootNavigator: true,
          routeSettings: _createRouteSetting(routeName, routeParams));
    }

    return data;
  }

  Future processPageRoute(
      {@required final String routeName,
      final dynamic routeParams,
      final RoutePredicate routePredicate,
      final AnimBuilder animBuilder,
      final Duration duration,
      bool maintainState = false,
      bool fullscreenDialog = false,
      PushAnim pushAnim = PushAnim.Default,
      PushMethod pushMethod = PushMethod.Push,
      PushType pushType = PushType.Page}) async {
    final RouteTableBuilder routeTableBuilder = _builderTable[routeName];
    assert(routeTableBuilder != null, "$routeName 没配置路由表或参数有问题，跳转失败");
    ModalRoute newRoute;
    dynamic data;
    if (animBuilder == null) {
      newRoute = _createPageRoute(
          routeName: routeName,
          routeParams: routeParams,
          pushAnim: pushAnim,
          tableBuilder: routeTableBuilder,
          duration: duration,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState);
    } else {
      newRoute = animBuilder(
          routeTableBuilder, routeParams, maintainState, fullscreenDialog);
    }
    if (pushMethod == PushMethod.Push) {
      data = await navigator.push(newRoute);
    } else if (pushMethod == PushMethod.PushAndRemoveUntil) {
      data = await navigator.pushAndRemoveUntil(newRoute, routePredicate);
    } else if (pushMethod == PushMethod.PushReplacement) {
      if (_pageCount < 1) {
        data = await navigator.push(newRoute);
      } else {
        data = await navigator.pushReplacement(newRoute);
      }
    } else {
      data = await navigator.push(newRoute);
    }
    return data;
  }

  ModalRoute _createPageRoute(
      {@required final String routeName,
      @required final PushAnim pushAnim,
      @required final dynamic routeParams,
      @required final RouteTableBuilder tableBuilder,
      @required final bool maintainState,
      @required final bool fullscreenDialog,
      Duration duration}) {
    duration ??= Duration(milliseconds: 500);
    if (PushAnim.PageCupertinoPopupAnim == pushAnim ||
        PushAnim.Default == pushAnim) {
      return new CupertinoPopupRoute(
          builder: (context) {
            return tableBuilder(context, routeParams);
          },
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageCupertinoPageAnim == pushAnim) {
      return new CupertinoPageRoute(
          builder: (context) {
            return tableBuilder(context, routeParams);
          },
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageMaterialPageAnim == pushAnim) {
      return new MaterialPageRoute(
          builder: (context) {
            return tableBuilder(context, routeParams);
          },
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInLeft_OutRightPageAnim == pushAnim) {
      return new SlideInLeftOutRightPageAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInLeft_OutRightPopupAnim == pushAnim) {
      return new SlideInLeftOutRightPopupAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInLeft_OutRight_with_FadePageAnim ==
        pushAnim) {
      return new SlideInLeftOutRightWithFadePageAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInLeft_OutRight_with_FadePopupAnim ==
        pushAnim) {
      return new SlideInLeftOutRightWithFadePopupAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInUp_OutBotomPageAnim == pushAnim) {
      return new SlideInUpOutBottomPageAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInUp_OutBotomPopupAnim == pushAnim) {
      return new SlideInUpOutBottomPopupAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInUp_OutBotom_with_FadePageAnim == pushAnim) {
      return new SlideInUpOutBottomWithFadePageAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    } else if (PushAnim.PageSlideInUp_OutBotom_with_FadePopupAnim == pushAnim) {
      return new SlideInUpOutBottomWithFadePopupAnim(
          pageBuilder: (context) {
            return tableBuilder(context, routeParams);
          },
          duration: duration,
          settings: _createRouteSetting(routeName, routeParams));
    }
    return NonePageAnim(
      pageBuilder: (BuildContext context) {
        return tableBuilder(context, routeParams);
      },
      settings: _createRouteSetting(routeName, routeParams),
    );
  }

  RouteSettings _createRouteSetting(String routeName, routeParams) {
    return RouteSettings(
      name: routeName,
      arguments: routeParams,
    );
  }

  Widget getView(String routeName, dynamic routeParams, IViewModel viewModel) {
    final RouteViewBuilder viewBuilder = _builderView[routeName];
    assert(viewBuilder != null, "$routeName 没配置路由表或参数有问题，跳转失败");
    return viewBuilder(routeParams, viewModel);
  }

  @override
  Future<void> init() {}
}

enum PushAnim {
  /// --------Page 动画--------
  /// Page默认CupertinoPopupAnim动画, Dialog默认DialogSlideInUp_OutBotom_with_Fade
  Default,
  //原生IOS动画+渐变 Popup路由
  PageCupertinoPopupAnim,
  //原生IOS动画。Page路由
  PageCupertinoPageAnim,
  //不设置动画
  None,
  //原生安卓动画
  PageMaterialPageAnim,
  //从右向左滑进来，退出时候自左向右出去
  PageSlideInLeft_OutRightPageAnim,
  PageSlideInLeft_OutRightPopupAnim,
  //从右向左滑进来，退出时候自左向右出去+渐变
  PageSlideInLeft_OutRight_with_FadePageAnim,
  PageSlideInLeft_OutRight_with_FadePopupAnim,
  //从底部向上滑进来，退出时候自顶向下出去
  PageSlideInUp_OutBotomPageAnim,
  PageSlideInUp_OutBotomPopupAnim,
  //从底部向上滑进来，退出时候自顶向下出去+渐变
  PageSlideInUp_OutBotom_with_FadePageAnim,
  PageSlideInUp_OutBotom_with_FadePopupAnim,

  ///-------------Dialog动画--------------------
  //从底部向上滑进来，退出时候自顶向下出去(无背景颜色)
  DialogSlideInUp_OutBotom,
  //从底部向上滑进来，退出时候自顶向下出去+渐变
  DialogSlideInUp_OutBotom_with_Fade
}

class _OverlayEntryData<T> {
  OverlayEntry overlayEntry;
  final Completer<T> completer = new Completer<T>();
  final String routeName;

  _OverlayEntryData({@required this.routeName});
}

class _OverlayLifeParentWidget extends InheritedWidget {
  final WidgetBuilder builder;
  final String routeName;
  _OverlayEntryData data;

  _OverlayLifeParentWidget({this.data, this.builder, this.routeName})
      : super(
            child: _OverlayLifeWidget(
          builder: builder,
          routeName: routeName,
        ));

  static _OverlayLifeParentWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_OverlayLifeParentWidget>();
  }

  @override
  bool updateShouldNotify(covariant _OverlayLifeParentWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _OverlayLifeWidget extends StatefulWidget {
  WidgetBuilder builder;
  String routeName;

  _OverlayLifeWidget(
      {@required this.routeName, @required this.builder, Key key})
      : super(key: key);

  @override
  _OverlayLifeWidgetState createState() => _OverlayLifeWidgetState();
}

class _OverlayLifeWidgetState extends State<_OverlayLifeWidget> {
  @override
  Widget build(BuildContext context) {
    return this.widget.builder(context);
  }

  @override
  void dispose() {
    super.dispose();
    //如果不是主動調用ccRoute.pop。那麼要手動處理
    if (ccRoute._overlayEntryMap.containsKey(widget.routeName)) {
      var data = ccRoute._overlayEntryMap[widget.routeName];
      ccRoute._overlayEntryMap.remove(widget.routeName);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        data.completer.complete();
      });
    }
  }
}

//Page 页面
//Dialog 弹窗
enum PushType {
  Page,
  //正常页面弹窗
  Dialog,
  //底部弹窗
  BottomDialog,
  //浮窗
  Overlay
}

enum PopType {
  Default,
  Overlay,
}

enum OperatorMethod {
  Push,
  Pop,
}

enum PushMethod { Push, PushAndRemoveUntil, PushReplacement }

enum PopMethod { Pop, PopUntil, PopAndPush, PopUntilAndReplacement }
