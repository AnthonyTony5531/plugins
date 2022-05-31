import 'dart:ui';

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/util/sleep.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/package/page/ai_home/ai_home_page.dart';
import 'package:fast_ai/pages/launch/app_launchPage.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/sdk_asset_download_page.dart';
import 'package:fast_ai/sdk_api/sdk_assets.dart';
import 'package:fast_ai/sdk_api/sdk_launch_title_view.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/widgets/common_page_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../ai_app.dart';
import '../../../router.dart';
import 'ai_laucher_page_style.dart';
import 'ai_laucher_page_view_model.dart';

///
/// {notes}
///
class AiLauncherPage extends StatefulView<AiLaucherPageStyle, AiLauncherPageViewModel> {
  final AiLauncherPageViewModel model;

  AiLauncherPage({Key key,  this.model }) : super(model: model, key: key);

  @override
  _AiLaucherPageState createState() => _AiLaucherPageState();
}

class _AiLaucherPageState extends ViewState<AiLaucherPageStyle, AiLauncherPageViewModel, AiLauncherPage> {
  AiLauncherPageViewModel _viewModel;
  @override
  AiLauncherPageViewModel get defaultModel {
    _viewModel ??= AiLauncherPageViewModel();
    return _viewModel;
  }

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
    print('11-_LauncherPageState-dispose');
    controller?.dispose();
    print('22-_LauncherPageState-dispose');
    controller = null;
    print('_LauncherPageState-dispose now=${DateTime.now()}');
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
  Widget render(BuildContext context) {
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

                  case PageType.main: { // App
                    print('App-PageType.main=$didShowMainPage, now=${DateTime.now()}');
                    if (!config.userInfo.showSystemRepairPage && !didShowMainPage) {
                      didShowMainPage = true;
                      Future(() {
                        print('111-enter main');
                        if (AiCache.get().getString(AiCache.app_version) == config.appInfo.appVersion || config.isInternational) {
                          AiRouter.pushReplacement(MaterialPageRoute(builder: (context) => AiHomePage(), settings: RouteSettings(name: TabSdkPage.main), fullscreenDialog: true));
                        } else {
                          AiRouter.pushReplacementNamed("guidePage");
                        }
                      });
                    }
                    print('----- show AppLaunchPage -----');
                    return AppLaunchPage(onFinish: () {
                      controller?.notifyRefresh();
                      didShowMainPage = true;
                      print('首页请求结束后-移除启动页');
                    });
                  }

                  case PageType.sdk_main: {  // ICON_SDK
                    print('000-enter ICON_SDK');
                    if (!config.userInfo.showSystemRepairPage && !didShowMainPage) {
                      didShowMainPage = true;
                      print("icon_sdk_main");
                      Future(() {
                        print('111-enter ICON_SDK');
                        if (AiCache.get().getString(AiCache.app_version) == config.appInfo.appVersion || config.isInternational) {
                          AiRouter.pushReplacement(MaterialPageRoute(builder: (context) => AiHomePage(), settings: RouteSettings(name: TabSdkPage.main), fullscreenDialog: true));
                        } else {
                          AiRouter.pushReplacementNamed("guidePage");
                        }
                      });
                    }
                    break;
                  }
//                  case PageType.sdk_detail: { // 直接跳详情
//                    print('000-enter ICON_SDK_DETAIL');
//                    if (!config.userInfo.showSystemRepairPage && !didShowMainPage) {
//                      didShowMainPage = true;
//                      Future(() {
//                        print('111-enter ICON_SDK_DETAIL gidm=${config.sdkParams.gidm}, anchorId=${config.sdkParams.anchorId}');
//                        AiRouter.pushToDetailPage(context, params: config.sdkParams.detailParams);
//                      });
//                    }
//                    break;
//                  }
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
      return PageType.main;
    }
    print('getPageType-PageType.login');
    return PageType.login;
  }


}

