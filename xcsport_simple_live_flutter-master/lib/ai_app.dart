import 'dart:async';
import 'dart:ui';

import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/ai_module/ai_apge_sport.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/sdk_asset_download_page.dart';
import 'package:fast_ai/sdk_api/sdk_assets.dart';
import 'package:fast_ai/sdk_api/sdk_launch_title_view.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/utils/change_localizations.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/styles.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/common_page_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AiApp extends StatelessWidget {
  static BuildContext appContext;

  @override
  Widget build(BuildContext context) {
    print('did enter Ai App');
    appContext = context;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
      child: Consumer<CurrentLocale>(
        builder: (context, local, child) {
          return MaterialApp(
            initialRoute: '',
//            onGenerateRoute: (setting) {
//              if ("TokenOverduePage" == setting.name) {
//                return PageRouteBuilder(
//                  opaque: false,
//                  pageBuilder: (context, anmation, secondaryA) {
//                    if (!config.isApp) XcSdkApi.tokenTimeout();
//                    if (config.sdkParams.handledTimeout || config.isTabSDK) { // 商户外部处理Token失效 TAB版展示toast不弹框
//                      return LoginToast();
//                    }
//                    return TokenOverduePage();
//                  }
//                );
//              }
//              return null;
//            },
            debugShowCheckedModeBanner: false,
            theme: Styles.aiTheme,
            onGenerateTitle: config.isApp ? (context) => '${Config.appName}' : null,
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              //const Locale('en', 'US'),
              const Locale('zh', 'CN'),
              const Locale('zh', 'TW'),
            ],
            home: LauncherPage(),
            navigatorKey: ccRoute.navigatorStateKey,
            navigatorObservers: [AiNavigatorObserver.getInstance(),ccRoute],
            routes: AiRouter.routes,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },
          );
        },
      ),
    );
  }
}

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    print("_LauncherPageState initSttate");
    super.initState();

    // 初始化获取asset文件路径
    config.assetService.initAssent();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    print('11-LauncherPage-dispose');
    controller?.dispose();
    print('22-LauncherPage-dispose');
    controller = null;
    print('LauncherPage-dispose now=${DateTime.now()}');
  }

  /// 用于刷新CommonPageLoadingWidget
  PageLoadingController controller = PageLoadingController();

  /// 是否展示主页面
  bool didShowMainPage = false;

  /// 是否展示登录页面
  bool didShowLogin = false;

  /// 数据初始化
  bool didInit = false;

  /// ICON版-启动动画是否完成
  bool launchTitleComplete = false;

  /// 打开展示测试页面
  bool test = false;

  /// 初始化完成
  bool initCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CommonPageLoadingWidget(
          controller: controller,
          builder: LoadingBuilder(
            onLoad: () async {
              await AiCache.init();
              if (mounted) {
                setState(() {});
              }
              print('000-onLoad isApp=${config.isApp}');
              if (!didInit) {
                didInit = true;
                print('111-onLoad isApp=${config.isApp}');
                config.devicePadding = MediaQuery.of(context).padding;
                config.deviceSize = MediaQuery.of(context).size;

                try {
                  await SysService.ins.init();
                } catch (e, s) {
                  print('intttt----> $s, $e');
                }

                initCompleted = true;
              }
              print('222-onLoad isApp=${config.isApp}');
              return getPageType();
            },
            onCompleted: (type) {
              print('000-type=$type, now=${DateTime.now().toString()}');
              var pageType = type;
              if (pageType == null) {
                pageType = getPageType();
              }
              switch (pageType) {
                case PageType.sdk_page: { // TAB_SDK
                  print('000-enter TAB_SDK');
                  if (!config.userInfo.showSystemRepairPage && !didShowMainPage) {
                    didShowMainPage = true;
                    Future(() {
                      print('111-enter TAB_SDK-page=${config.sdkParams.page}');
                        AiRouter.pushReplacement(
                          PageRouteBuilder(pageBuilder: (context, _, __) => SportAiPage(), fullscreenDialog: true, settings: RouteSettings(name: FastAiRouteTableName.SportAiPage)),
                          ModalRoute.withName(FastAiRouteTableName.SportAiPage)
                        );
                    });
                  }
                  break;
                }
                case PageType.sdk_assets_download: {
                  print('00-enter sdk_assets_download');
                  // SDK资源下载
                  return SDKAssetDownloadPage(
                    complete: () {
                      print('11-enter sdk_assets_download sdk 资源下载完成 展示主页面');
                      config.sdkParams.showTabBarOnLoading =
                      false; // 启动/资源下载页面加载完后复位
                      launchTitleComplete = true;

                      controller.notifyRefreshAll();

                      // 先移除flutter页面后再通知原生页面移除
                      XcSdkApi.downloadAssets(progress: '1.0', isDownloadEnd: 'true');
                      print('22-enter sdk_assets_download sdk 资源下载完成 展示主页面');
                      XcSdkApi.didEnterSDK();
                      print('33-enter sdk_assets_download sdk 资源下载完成 展示主页面');
                    },
                  );
                }
                case PageType.login:{
                  print('000-enter login');
                  if (!config.userInfo.showSystemRepairPage && !didShowLogin) {
                    didShowLogin = true;
                    Future(() {
                      print('111-enter login');
                      AiRouter.pushReplacementNamed(AiRouter.AiLoginPage);
                    });
                  }
                  break;
                }
              }
              print('000-PageType_error_will_enter_buildLoadingWidget');
              return buildLoadingWidget(context, idx: 1);
            },
            loadingWidget: buildLoadingWidget(context, idx: 2)
          ),
        ),
      ),
    );
  }

  Widget buildLoadingWidget(BuildContext context, {int idx}) {
    print('00-idx=$idx-buildLoadingWidget-${window.defaultRouteName}');
    if (config.isTabSDK) {
      print('11-buildLoadingWidget-TAB版-隐藏启动页');
      return Container();
    } else if (config.isIconSDK) {
      print('11-buildLoadingWidget-ICON版');
      return SdkLaunchTitleView(
        onComplete: () async {
          print('22-buildLoadingWidget-ICON版-onComplete');
          config.sdkParams.showTabBarOnLoading = false; // 启动/资源下载页面加载完后复位
          launchTitleComplete = true;

          // 初始化 资源没下载完前不要刷新
          if (config.sdkAssetsModel.sdkAssetsQuery || !initCompleted) return;

          await sleep(200); // 动画太快延时结束页面

          print('33-buildLoadingWidget-ICON版-onComplete');
          controller.notifyRefreshAll();
          print('44-buildLoadingWidget-ICON版-onComplete');
          XcSdkApi.didEnterSDK();
          print('55-buildLoadingWidget-ICON版-onComplete');
        },
      );
    }

    print('11-buildLoadingWidget-APP');
    return gLaunchImage(context, false);
  }

  PageType getPageType() {
    print('getPageType isApp=${config.isApp}');
    // test
    if (test) {
      print('getPageType-PageType.test');
      return PageType.test;
    }

    // SDK
    if (!config.isApp) {
      if (config.sdkAssetsModel.sdkAssetsQuery) {
        print('getPageType-PageType.sdk_assets_download');
        return PageType.sdk_assets_download; // SDK资源包下载
      }

      if (config.sdkParams.needShowDetailPage) {
        print('00-getPageType-PageType.sdk_detail');
        if (!launchTitleComplete) return PageType.sdk_icon_launch_animate;
        print('11-getPageType-PageType.sdk_detail');
        return PageType.sdk_detail; // ICON_详情
      }

      if (isNotEmpty(config.sdkParams.page)) {
        print('getPageType-PageType.sdk_page');
        return PageType.sdk_page; // TAB_SDK
      }

      print('00-getPageType-PageType.sdk_main');
      if (!launchTitleComplete) return PageType.sdk_icon_launch_animate;
      print('11-getPageType-PageType.sdk_main');
      return PageType.sdk_main; // ICON_SDK
    }

    // App
    if (!config.userInfo.isLogout()) {
      print('getPageType-PageType.main');
      return PageType.sdk_page; // TAB_SDK
    }
    print('getPageType-PageType.login');
    return PageType.login;
  }
}

enum PageType {
  /// 临时测试
  test,

  /// 引导页
  splash,

  /// 登录页
  login,

  /// App主页
  main,

  /// ICON_SDK主页
  sdk_main,

  /// SDK资源下载页
  sdk_assets_download,

  /// TAB_SDK指定页面
  sdk_page,

  /// 直接进入详情页
  sdk_detail,

  /// 启动动画页面
  sdk_icon_launch_animate,
}