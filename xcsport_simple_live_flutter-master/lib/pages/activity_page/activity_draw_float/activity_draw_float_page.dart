import 'dart:async';
import 'dart:typed_data';
import 'package:common_component/component/route/route.dart';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_animal/activity_draw_animal_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_progress/activity_draw_progress_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_common_util.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 活动-翻牌-悬浮按钮
class ActivityDrawFloatStatefulView
    extends StatefulView<ActivityDrawFloatStyle, ActivityDrawFloatViewModel> {
  final ActivityDrawFloatViewModel model;
  final double windowWidth;
  final double windowHeight;

  const ActivityDrawFloatStatefulView({
    Key key,
    this.model,
    this.windowWidth,
    this.windowHeight,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawFloatStatefulViewState createState() =>
      _ActivityDrawFloatStatefulViewState();
}

class _ActivityDrawFloatStatefulViewState extends ViewState<
        ActivityDrawFloatStyle,
        ActivityDrawFloatViewModel,
        ActivityDrawFloatStatefulView>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  ActivityDrawFloatViewModel _model;

  @override
  ActivityDrawFloatViewModel get defaultModel =>
      _model ??= ActivityDrawFloatViewModel();

  ScrollController _scrollController;

  Offset offset;

  double _leftOffset = 0.0;
  double _rightOffset = 74.0;
  double _topOffset = 60.0;
  double _bottomOffset = 74.0;

  double _defaultXOffset = 74.0;
  double _defaultYOffset = 250.0;

  // 是否开启活动通知
  StreamSubscription<ActivityDrawStatusEvent> _activityDrawStatusEvent;

  // 用户中奖推送
  StreamSubscription<ActivityDrawWinPrizeEvent> _activityDrawWinPrizeEvent;

  // 网络检测
  StreamSubscription<NetworkStateEvent> _networkStateEvent;


  AnimationController _controller;
  Animation<double> _animation;
  SVGAAnimationController animationController;
  XcCacheFileImage _cacheFileImage = XcCacheFileImage();

  XCNetworkState _networkState;

  @override
  void initState() {
    super.initState();
    _networkState = config.netConnectStatus;
    _scrollController = ScrollController();
    listenHitOptionEvent();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
    _controller.addStatusListener(statusChange);
    _controller.addListener(configListener);

    animationController = SVGAAnimationController(vsync: this);

    offset = Offset(widget.windowWidth - _defaultXOffset,
        widget.windowHeight - _defaultYOffset);

    WidgetsBinding.instance.addPostFrameCallback(configPostFrame);
  }

  void configPostFrame(value) {
    RenderBox rb = context.findRenderObject();
    var disOffset = rb.localToGlobal(Offset.zero);
    floatActivityDrawCarX = disOffset.dx;
    floatActivityDrawCarY = disOffset.dy;
  }

  void configListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void onDataUpdatedAfter() {
    super.onDataUpdatedAfter();
    if (animationController.videoItem == null &&
        isNotEmpty(model.floatingImg) &&
        model.floatingImg.contains('.svga')) {
      loadAnimation(path: model.floatingImg);
    }
  }

  void loadAnimation({String path}) async {
    if (isEmpty(path)) {
      return;
    }
    var videoItem;
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(path);
    if (cacheBytes != null) {
      videoItem = await SVGAParser.shared.decodeFromBuffer(cacheBytes.toList());
    } else {
      videoItem = await SVGAParser.shared.decodeFromURL(path);
    }

    this.animationController.videoItem = videoItem;
    this.animationController.repeat();
  }

  statusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (mounted) {
        setState(() {
          offset = Offset(_animation.value, offset.dy);
        });
      }
    } else if (status == AnimationStatus.dismissed) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  void listenHitOptionEvent() {
    // 活动开关推送
    _activityDrawStatusEvent =
        Event.eventBus.on<ActivityDrawStatusEvent>().listen(_configSwitchEvent);

    // 用户中奖通知
    _activityDrawWinPrizeEvent = Event.eventBus
        .on<ActivityDrawWinPrizeEvent>()
        .listen(_configLotteryEvent);

    // 网络监测
    _networkStateEvent =
        Event.eventBus.on<NetworkStateEvent>().listen(_configNetworkEvent);
  }

  void _configNetworkEvent(NetworkStateEvent event) {
    if (_networkState != event.state) {
      _networkState = event.state;
      if (FloatActivityDrawCarHelper.activityDrawCarIsShow()) { // 没有进入了翻牌页面
        _configRefresh();
      }
    }
  }

  void _configSwitchEvent(ActivityDrawStatusEvent event) {
    if (activityConfig.showFloatActivityDraw == false) {
      FloatActivityDrawCarHelper.switchActivityDrawStatus(false);
      FloatActivityDrawCarHelper.hideActivityDraw();
    } else {
      if (event.isDetail == true) {
        // 进入了二级页面
        FloatActivityDrawCarHelper.switchActivityDrawStatus(event.show);
        model.notifyStateChanged();
      } else {
//        if (model.winPrizeModelList.isEmpty) {
//          if (FloatActivityDrawCarHelper.activityDrawCarIsShow()) {
//            _configRefresh();
//          }
//        } else {}
        if (FloatActivityDrawCarHelper.activityDrawCarIsShow()) { // 没有进入了翻牌页面
          _configRefresh();
        }
      }
    }
  }

  void _configLotteryEvent(ActivityDrawWinPrizeEvent event) {
    model.configAddWinPrizeList(event.winPrizeUserModel);
  }

  @override
  void dispose() {
    _controller.removeListener(configListener);
    _controller.removeStatusListener(statusChange);
    _scrollController?.dispose();
    _activityDrawStatusEvent?.cancel();
    _activityDrawWinPrizeEvent?.cancel();
    _controller?.dispose();
    animationController?.stop();
    animationController?.dispose();
    _networkStateEvent?.cancel();
    _controller = null;
    animationController = null;
    super.dispose();
  }

  Offset _calOffset(Size size, Offset offset, Offset newOffset) {
    double dx = 0;
    if (offset.dx + newOffset.dx <= _leftOffset) {
      dx = _leftOffset;
    } else if (offset.dx + newOffset.dx >= (size.width - _rightOffset)) {
      dx = size.width - _rightOffset;
    } else {
      dx = offset.dx + newOffset.dx;
    }
    double dy = 0;
    if (offset.dy + newOffset.dy >= (size.height - _bottomOffset)) {
      dy = size.height - _bottomOffset;
    } else if (offset.dy + newOffset.dy <= _topOffset) {
      dy = _topOffset;
    } else {
      dy = offset.dy + newOffset.dy;
    }

    RenderBox rb = context.findRenderObject();
    var disOffset = rb.localToGlobal(Offset.zero);
    floatActivityDrawCarX = disOffset.dx;
    floatActivityDrawCarY = disOffset.dy;

    return Offset(dx, dy);
  }

  @override
  Widget render(BuildContext context) {
    bool isShow = FloatActivityDrawCarHelper.activityDrawCarIsShow();
    return Theme(
      data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          appBarTheme:
          AppBarTheme.of(context).copyWith(brightness: Brightness.dark)),
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (detail) {
            offset =
                _calOffset(MediaQuery.of(context).size, offset, detail.delta);
            model.notifyStateChanged();
          },
          onTap: debounce((){
            showActivityDrawDetail();
          },300),
          onPanEnd: (DragEndDetails detail) {
            double w = widget.windowWidth - _defaultXOffset * 2;
            double dx;
            if ((offset.dx - _defaultXOffset + _rightOffset / 2) > w / 2) {
              //吸咐到右边
              dx = MediaQuery.of(context).size.width - _rightOffset;
            } else {
              //吸咐到左边
              dx = _leftOffset;
            }
            _animation =
                Tween<double>(begin: offset.dx, end: dx).animate(_controller);
            _controller.reset();
            _controller.forward();
          },
          child: Offstage(
            offstage: !isShow,
            child: _configActivityDraw(),
          ),
        ),
      ),
    );
  }

  // 按钮样式
  Widget _configActivityDraw() {
    return Column(
      children: [
        _configStackWidget(),
        SizedBox(
          height: 2.0,
        ),
        (model.progressViewModel == null || model.winPrizeModelList.isEmpty || _networkState == XCNetworkState.none)
            ? SizedBox()
            : ActivityDrawProgressStatefulView(
                model: model.progressViewModel,
                timeClick: () async {
                  // 定时器结束
                  _configRefresh();
                },
              ),
      ],
    );
  }

  Widget _configStackWidget() {
    Widget w;
    if (model.floatingImg.contains('.svga')) {
      w = SVGAImage(
        this.animationController,
        fit: BoxFit.fill,
      );
    } else {
      w = AiImage.fromUrl(
          model.floatingImg, style.errorImg, BoxFit.contain,72.0,72.0);
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 72.0,
          height: 72.0,
          child: w,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            model.titleS,
            style: style.textStyle,
          ),
        ),
      ],
    );
  }

  void showActivityDrawDetail() async {
    if (!model.isTap) return;
    model.isTap = !model.isTap;

    if (config.userInfo.isLogout()) {
      model.isTap = true;
      return;
    }

    if (_networkState == XCNetworkState.none) { // 无网络情况下，提示窗
      Fluttertoast.showToast(
          msg: model.noNetHint,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF000000).withOpacity(0.7),
          fontSize: 14.0,
          textColor: Color(0xFFFFFFFF));
      model.isTap = true;
    } else {
      FloatActivityDrawCarHelper.switchActivityDrawStatus(false);
      model.notifyStateChanged();

      if (model.winPrizeModelList.isEmpty) {
        ActivityDrawResultViewModel resultViewModel = ActivityDrawResultViewModel(
          title: model.noDataTitle,
          describe: model.noDataHint,
          state: 0,
        );
        ccRoute.push(
            routeName: FastAiRouteTableName.ActivityDrawResult,
            routeParams: resultViewModel,
            pushType: PushType.Dialog,
            onBack: _configMaybePop);
      } else {
        ActivityDrawAnimalViewModel animalViewModel =
        ActivityDrawAnimalViewModel.create(
          prizePoolList: model.prizePoolList,
          activityImg: model.activityImg,
          awardType: model.awardType,
          id: model.id,
          imageList: model.imageList,
          lotteryId: model.lotteryId,
          cardImg: model.cardImg,
          popupImg: model.popupImg,
        );

        ccRoute.push(
            routeName: FastAiRouteTableName.ActivityAnimal,
            routeParams: animalViewModel,
            pushType: PushType.Dialog,
            onBack: _configMaybePop);
      }
    }
  }

  Function debounce(Function fn, [int t = 30]) {
    Timer _debounce;
    return () {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(Duration(milliseconds: t), () {
        fn();
      });
    };
  }

  void _configMaybePop(value) async {
    if (_networkState == XCNetworkState.none) {
      FloatActivityDrawCarHelper.switchActivityDrawStatus(true);
      model.notifyStateChanged();
      model.isTap = true;
    } else {
      _configRefresh();
    }
  }

  void _configRefresh() async {
    if (activityConfig.showFloatActivityDraw) {
      await model.loadQueryWinPrizeUserData();
      FloatActivityDrawCarHelper.switchActivityDrawStatus(true);
      model.isTap = true;
    } else {
      FloatActivityDrawCarHelper.switchActivityDrawStatus(false);
      FloatActivityDrawCarHelper.hideActivityDraw();
    }
  }
}
