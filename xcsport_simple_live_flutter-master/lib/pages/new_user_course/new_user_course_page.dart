import 'dart:async';

import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/pages/detail/head/web_view_show/game_web_view_show.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/loading_widget/page_loading.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/head/web_view_show/web_view_show.dart';
import 'package:fast_ai/utils/ai_appbar.dart';

class NewUserCoursePage extends StatefulWidget {
  final String url;
  final String title;
  final bool isSystemRepair;
  final bool isJointLang; // 小游戏不需要拼接语言lang,否则访问不能成功
  final bool usesGameWeb;
  final bool isShowGameBgColor;
  final bool isEnableRefreshTap;
  final VoidCallback onRefresh;
  NewUserCoursePage({
    Key key,
    this.url,
    this.title,
    this.isSystemRepair = false,
    this.isJointLang = true,
    this.usesGameWeb,
    this.isShowGameBgColor = false,
    this.isEnableRefreshTap = false,
    this.onRefresh,
  }) : super(key: key);

  @override
  _NewUserCoursePageState createState() => _NewUserCoursePageState();
}

class _NewUserCoursePageState extends State<NewUserCoursePage> {
  bool isLoading = true;
  bool isTimeOut = false;
  bool loop = false;
  bool isError = false;

  @override
  void initState() {
    startTimer();
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsCoursePageStayTime, pageDurationBegin: true);
    super.initState();
  }

  @override
  void dispose() {
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsCoursePageStayTime, pageDurationEnd: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget webChild;
    if (widget.usesGameWeb ?? false) {
      webChild = GameWebViewShow(
        bgColor: widget.isShowGameBgColor ? Color(0xFF0A2536) : Colors.white,
        url: widget.url,
        height: MediaQuery.of(context).size.height,
        onPageFinished: onPageFinish,
        onPageError: onPageError,
      );
    } else {
      webChild = WebViewShow(
        isJointLang: widget.isJointLang,
        url: widget.url,
        height: MediaQuery.of(context).size.height,
        onPageFinished: onPageFinish,
        onPageError: onPageError,
      );
    }

    return Scaffold(
      appBar: widget.isSystemRepair
          ? null
          : AiAppBar(
        brightness: Brightness.light,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: Icon(Icons.close, color: Colors.black87, size: 20.0),
            onPressed: () {
              AiRouter.pop(context);
            }),
        title: Text('${widget.title}', style: Theme.of(context).textTheme.subtitle1),
        flexibleSpace: Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            height: 1,
            color: config.skin.colors.bgColorGloabl,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          webChild,
          // 加载图
          !isLoading ? Container() : Container(child: PageLoading(color: widget.isShowGameBgColor ? 0xFF0A2536 : 0x00000000,), color: widget.isShowGameBgColor ? Colors.transparent : Colors.white),
          // 加载超时
          Offstage(
            offstage: !isTimeOut,
            child: Container(
              child: LoadFail(onRefresh: onRefresh),
              color: Colors.white,
            ),
          ),
          Offstage(
            offstage: !isError,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: DefaultView(
                name: 'game_error',
                enableBtn: widget.isEnableRefreshTap,
                backgroundColor: Colors.transparent,
                onTap: (){
                  widget.onRefresh?.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    isTimeOut = false;
    loop = false;
    isError = false;
    startTimer();
    setState(() {});
  }

  void onPageFinish(bool value) {
    isLoading = false;
    isTimeOut = false;
    setState(() {});
  }

  void onPageError(bool value) {
    isLoading = false;
    isTimeOut = false;
    isError = true;
    if (mounted) {
      setState(() {});
    }
  }

  void startTimer() async {
    if (loop) {
      return;
    }
    loop = true;
    while (loop) {
      await Future.delayed(Duration(seconds: config.fiexd.webViewTimeoutTime));
      loop = false;
      if (isLoading) {
        isLoading = false;
        isTimeOut = true;
        if (mounted) {
          setState(() {});
        }
      }
    }
  }
}
