import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page_view_model.dart';
import 'package:fast_ai/pages/guide/guide_view_helper.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

//体育-主页面
class SportAiPage extends StatefulWidget {
  final ValueChanged<double> scrollerOffsetCallback;
  final ValueChanged<double> headHeightCallback;
  final ValueChanged<int> onPageChanged;
  final bool isShowAttention; // 是否显示关注
  final int initialIndex; // 指定显示位置
  SportAiPage(
      {Key key,
      this.headHeightCallback,
      this.scrollerOffsetCallback,
      this.onPageChanged,
      this.isShowAttention = true,
      this.initialIndex = 1})
      : super(key: key);

  @override
  SportAiPageState createState() => SportAiPageState();
}

class SportAiPageState extends State<SportAiPage>
    with
        AutomaticKeepAliveClientMixin,
        TickerProviderStateMixin,
        WidgetsBindingObserver {

  @override
  void initState() {
    print('00-SportAiPage-initState');
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((cb) {
      FloatGuideViewHelper.init(context);
    });
    config.userInfo.isFirstTimeEntryApp = false;
    // 翻翻乐
    FloatActivityDrawCarHelper.init();
    print('11-SportAiPage-initState');
    //启动推送连接
    XCStompClient.ins.startConnect();
    super.initState();
  }

  @override
  void dispose() {
    print('00-SportAiPage-dispose');
    FloatActivityDrawCarHelper.hideActivityDraw();
    print('11-SportAiPage-dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('00-SportAiPage-build');
    return FreeAnchorMatchPage(freeAnchorPosition: FreeAnchorPosition.sport);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    //前台
    if (AppLifecycleState.resumed == state) {
      XCStompClient.ins.startConnect();
      Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
    }
    //后台
    else if (AppLifecycleState.paused == state) {
      XCStompClient.ins.stop();
      Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
