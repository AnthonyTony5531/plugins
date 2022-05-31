import 'dart:async';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/common_jscontroller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/route_jscontroller.dart';
import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';
//import 'package:fast_ai/pages/betting_2p0/float_shop_car.dart';
//import 'package:fast_ai/pages/collect/match_collection_selected_overlay.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/forum_deal.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/widgets/rotate_animated.dart';
import 'package:fast_ai/utils/ai_measure.dart';

class AiWebView extends StatefulWidget {
  final String url;
  final String title;
  AiWebView({Key key, this.url, this.title = ""}) : super(key: key);

  @override
  _AiWebViewState createState() => _AiWebViewState();
}

class _AiWebViewState extends State<AiWebView> {
  XCJSControllerManager xcNavigationDelegateManager;
  StreamSubscription<WebViewEvent> webViewEvent;
  Timer timeoutTimer;
  Timer listenerTimer;


  String url = '';
  String title = '';
  bool isAnimationEnd = false;
  bool isLoadFinished = false;
  bool isLoadFailed = false;
  bool isGoBack = false;
  bool isGoForward = false;
  //是否论坛
  bool isForum = false;
  bool isRequestForumUrl = false;
  //是否是公众号
  bool isOfficial = false;
  bool isOfficialWebUrl = false;
  //平台活动
  bool isPlatform = false;
  bool isPlatformWebUrl = false;

  StateSetter goBackState;
  StateSetter goForwardState;
  WebView webView = WebView();

  @override
  void initState() {
    xcNavigationDelegateManager = XCJSControllerManager();
    url = widget.url;
    title = widget.title;
    // url = 'http://cn2.m.aisports.io/dataview/newsDetail/606fb1ef2412d5e296f40a17?theme=3&head=0&memu=0&active=6&leagueId=&groupId=1&lang=zh-cn';
    //论坛
    isForum = url.toLowerCase().contains('dataview/forum');
    //公共号
    isOfficial = url.toLowerCase().contains('dataview/official');
    //平台活动
    isPlatform = url.contains('dataview/activityPlatform');

    if (isForum) {
      Event.eventBus.fire(EntryWebEvent(isShow: false));
      if(config.isTabSDK){
//        FloatShopCarHelper?.setLocalShoppingCarStatus(true);
//        FloatShopCarHelper?.shoppingCarStatus(false);
      }
      //论坛需要登录
      //if (Hooks.ins.isBlocked(HookName.ForumPage, {})) return;
    }
    webViewEvent = Event.eventBus.on<WebViewEvent>().listen((event) {
      setState(() {
        title = event.title;
      });
    });
    Future.delayed(Duration(milliseconds: 500), () {
      isAnimationEnd = true;
      if (mounted) setState(() {});
    });
    //
    if(isForum && url.contains('detail')){
      forumNewData();
    }
    startTimeoutTimer();
    super.initState();
  }

  void forumNewData() async{
    try{
      isRequestForumUrl = true;
      int index = url.indexOf('detail');
      String page = url.substring(index,);
      ForumBbsLoginReqProtocol req = ForumBbsLoginReqProtocol();
      req.toPage = page;
      var result = await req.request();
      if(result.isSuccess){
        url = result.url;
      }
    }catch(e) {}
    finally{
      isRequestForumUrl = false;
      if(mounted)setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(isForum){
      Event.eventBus.fire(EntryWebEvent(isShow: true));
      if(config.isTabSDK){
//        FloatShopCarHelper?.setLocalShoppingCarStatus(false);
//        FloatShopCarHelper?.shoppingCarStatus(true);
      }
    }
    webViewEvent?.cancel();
    listenerTimer?.cancel();
    timeoutTimer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    xcNavigationDelegateManager.addJsControllers([
      CommonJsController(context: context),
      RouteJSController(context: context)
    ]);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
//        appBar: !isForum
        appBar: isShowAppBar()
            ? appbar()
            : PreferredSize(
                preferredSize: Size(0, 0),
                child: Container(
                  color: Color(0xFF222222),
                  width: MediaQuery.of(context).size.width,
                  height: AiMeasure.topOffset(context),
                ),
              ),
        bottomNavigationBar: isForum ? bottomPanel() : SafeArea(child: Container(height: 0)),
        body: WillPopScope(
            onWillPop: () async{
              return true;
            },
            child: isAnimationEnd && !isRequestForumUrl
                ? Container(
              child: Stack(
                children: <Widget>[
                  WebView(
                    //userAgent:'ai_sdk',
                    initialUrl: getWebUrl(url),
                    initialMediaPlaybackPolicy:
                    AutoMediaPlaybackPolicy.always_allow,
                    javascriptMode: JavascriptMode.unrestricted,
                    javascriptChannels:
                    [xcNavigationDelegateManager.buildChannel()].toSet(),
                    onWebViewCreated: (controller) {
                      xcNavigationDelegateManager.webViewController =
                          controller;
                    },
                    onPageStarted: (url){
                      if(isOfficial || isPlatform){
                        // 公众号，进入论坛详情隐藏标题
                        isOfficialWebUrl = url.indexOf("dataview/official") > -1;
                        // 平台活动，进入二级页隐藏标题
                        isPlatformWebUrl = url.indexOf("dataview/activityPlatform") > -1;
                        if(mounted)setState(() {});
                      }
                    },
                    onPageFinished: (url) {
                      isLoadFinished = true;
                      isLoadFailed = false;
                      timeoutTimer.cancel();
                      bool currentIsForum = url.indexOf("bbs-web") > -1 || url.indexOf("dataview/forum") > -1;

                      if (currentIsForum != isForum) {
                        setState(() {
                          isForum = currentIsForum;
                        });
                      }
                      if (currentIsForum) {
                        setBackOrForwardState();
                      }
                      if(isForum){
                        addListenerTimer();
                      }
                      if (mounted) setState(() {});
                    },
                  ),
                  Offstage(
                    offstage: isLoadFinished || isLoadFailed,
                    child: Container(
                        color: Colors.white,
                        child: Align(
                          child: LoadingCircular(),
                        )),
                  ),
                  Offstage(
                    offstage: !isLoadFailed,
                    child: Container(
                      child: LoadFail(
                        onRefresh: onRefresh,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
                : Container(
              color: Colors.white,
            ),
        )
    );
  }

  bool isShowAppBar(){
    if(isOfficial || isPlatform || isForum){
      if(isForum){
        return false;
      }
      // 公众号，进入论坛详情隐藏标题
      return isOfficialWebUrl || isPlatformWebUrl;
    }
    else{
      return true;
    }
  }

  PreferredSizeWidget appbar() {
    return AiAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.subtitle1),
      flexibleSpace: Positioned(
        left: 0,
        bottom: 0,
        right: 0,
        child: Container(
          height: 0.5,
          color: Color(0xFFEAEAEA),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.maybePop(context);
          //返回网页的上一页，最后退出webview
          // if (xcNavigationDelegateManager.webViewController != null) {
          //   xcNavigationDelegateManager.webViewController
          //       .canGoBack()
          //       .then((value) {
          //     if (value) {
          //       xcNavigationDelegateManager.webViewController.goBack();
          //     } else {
          //       Navigator.maybePop(context);
          //     }
          //   });
          // } else {
          //   Navigator.maybePop(context);
          // }
        },
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Color(0xFFEAEAEA),
                width: 0.5,
              )),
          child: Row(
            children: [
              //更多
              InkWell(
                onTap: () {
                  PopupShareService.ins.pause('appbarMore');
                  showPopup(context, morePanel());
                  PopupShareService.ins.resume('appbarMore');
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
                    child: AiImage.asset(
                        'assets/images/public/icon_h5_top_more.png',
                        width: 25,
                        height: 25)),
              ),
              Container(
                margin: EdgeInsets.only(right: 5, left: 5),
                color: Color(0xFFEAEAEA),
                width: 0.5,
                height: 18,
              ),
              //关闭
              InkWell(
                onTap: () {
                  Navigator.maybePop(context);
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
                    child: AiImage.asset(
                        'assets/images/public/icon_h5_top_close.png',
                        width: 25,
                        height: 25)),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget bottomPanel() {
    bool hasNotch = MediaQuery.of(context).padding.bottom != null && (MediaQuery.of(context).padding?.bottom ?? 0) > 0;
    return Container(
      height: hasNotch ? 80 : 48,
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, right: 30),
      color: Color(0xFFF7F7F7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter) {
                    goBackState = stateSetter;
                    return Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.black.withOpacity(isGoBack ? 1 : 0.3),
                    );
                  }),
                onPressed: () {
                  if (!isGoBack) return;
                  //返回网页的上一页，最后退出webview
                  xcNavigationDelegateManager.webViewController
                    .canGoBack()
                    .then((value) async {
                    if (value) {
                      await xcNavigationDelegateManager.webViewController
                        .goBack()
                        .then((v) {
                        setBackOrForwardState();

                        // xcNavigationDelegateManager.webViewController
                        //     .canGoBack()
                        //     .then((value) {
                        //   isGoBack = value;
                        //   if (mounted) {
                        //     goBackState(() {});
                        //   }
                        // });
                      });
                      // setGoForwardState();
                    }
                  });
                },
              ),
              IconButton(
                icon: StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter) {
                    goForwardState = stateSetter;
                    return Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black.withOpacity(isGoForward ? 1 : 0.3),
                    );
                  }),
                onPressed: () async {
                  if (!isGoForward) return;
                  xcNavigationDelegateManager.webViewController
                    .goForward()
                    .then((v) {
                    setBackOrForwardState();

                    // xcNavigationDelegateManager.webViewController
                    //     .canGoForward()
                    //     .then((value) {
                    //   isGoForward = value;
                    //   if (mounted) {
                    //     goForwardState(() {});
                    //   }
                    // });
                    // setGoBackState();
                  });
                },
              ),
              RotationWidget(
                durationMs: 500,
                child: Container(
                  padding: EdgeInsets.all(19 / 2),
                  child: AiImage.asset('assets/images/public/icon_h5_refresh.png',
                    width: 25, height: 25),
                ),
                onTap: (c) {
                  c.forward(from: 0.0);
                  xcNavigationDelegateManager.webViewController.reload();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 22,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
            ],
          ),
          hasNotch ? Container(height: 30,) : Container(height: 0,),
        ],
      ),
    );
  }

  void setBackOrForwardState() {
    xcNavigationDelegateManager.webViewController.canGoBack().then((value) {
      isGoBack = value;
      Future.delayed(Duration(milliseconds: 400), () {
        xcNavigationDelegateManager.webViewController
            .currentUrl()
            .then((currUrl) {
          //论坛首页
          if (isForumHomePage(currUrl)) {
            isGoBack = false;
          }
          if (mounted) goBackState(() {});
        });
      });
    });

    xcNavigationDelegateManager.webViewController.canGoForward().then((value) {
      isGoForward = value;
      if (mounted) goForwardState(() {});
    });
  }

  bool isForumHomePage(String currUrl) {
    bool flag = false;
    if (currUrl.contains('/forum')) {
      flag = true;
    }
    return flag;
  }

  //更多面板
  Widget morePanel() {
    return Container(
      height: 211,
      width: double.infinity,
      padding: EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Color(0xFFEBEBEB),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  xcNavigationDelegateManager.webViewController.reload();
                  AiRouter.pop(context);
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        padding: EdgeInsets.all(9),
                        margin: EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AiImage.asset(
                            'assets/images/public/icon_h5_refresh.png',
                            width: 25,
                            height: 25),
                      ),
                      Text('${config.baseLang['refresh']}',
                          style: AiTextStyle(
                              fontSize: 12,
                              fontFamily: config.skin.fontFimaly.pingFang,
                              fontWeight: config.skin.fontWeight.regular,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25),
              width: double.infinity,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('${config.baseLang['cancel']}',
                  style: AiTextStyle(
                      fontSize: 14,
                      fontFamily: config.skin.fontFimaly.pingFang,
                      fontWeight: config.skin.fontWeight.regular,
                      color: Colors.black.withOpacity(0.7))),
            ),
          ),
        ],
      ),
    );
  }

  void addListenerTimer(){
    listenerTimer?.cancel();
    listenerTimer = Timer.periodic(Duration(milliseconds: 600), (timer) {
      setBackOrForwardState();
    });
  }

  void startTimeoutTimer() {
    timeoutTimer =
        Timer(Duration(seconds: config.fiexd.webViewTimeoutTime), () {
      if (mounted) {
        setState(() {
          isLoadFailed = true;
        });
      }
    });
  }

  Future<void> onRefresh() async {
//    xcNavigationDelegateManager.webViewController?.reload();
    startTimeoutTimer();
    if (mounted) {
      setState(() {
        isLoadFinished = false;
        isLoadFailed = false;
      });
    }
  }
}
