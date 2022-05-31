import 'dart:math';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_common_util.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_draw_item_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_view_draw_item_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

/// 活动-翻牌-item
class ActivityDrawItemStatefulView
    extends StatefulView<ActivityDrawItemStyle, ActivityDrawItemViewModel> {
  final ActivityDrawItemViewModel model;
  final Function(String imageLevel) onOverTurnTap;

  const ActivityDrawItemStatefulView({
    Key key,
    this.model,
    this.onOverTurnTap,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawItemStatefulViewState createState() =>
      _ActivityDrawItemStatefulViewState();
}

class _ActivityDrawItemStatefulViewState extends ViewState<
    ActivityDrawItemStyle,
    ActivityDrawItemViewModel,
    ActivityDrawItemStatefulView> with TickerProviderStateMixin {
  ActivityDrawItemViewModel _model;

  //动画控制器
  //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值，
  // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
  AnimationController controller;
  Animation<double> animation;

  @override
  ActivityDrawItemViewModel get defaultModel =>
      _model ??= ActivityDrawItemViewModel();
  double angle = 0;

  @override
  void initState() {
    super.initState();
    configAnimation();
  }

  void configAnimation(){
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 milliseconds: 500 为500毫秒，当然也可以设置毫秒

    controller =
        AnimationController(duration: Duration(milliseconds: activityConfig.animalDuration), vsync: this);

    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener(_configControllerStatusListener);
    animation = Tween(begin: pi, end: 0.0).animate(controller)..addListener(_configAnimationListener);

  }

  @override
  void onDataUpdatedAfter() {
    super.onDataUpdatedAfter();

    if (model.sendSuccess && !model.isFront) {
      controller.forward();
    }
  }

  void _configControllerStatusListener(status) async {
    if (status == AnimationStatus.completed) {
      //动画从 controller.reverse() 反向执行 结束时会回调此方法
      // controller.reset(); 将动画重置到开始前的状态
      if (model.sendSuccess) {
        model.isFront = true;
        await model.upSuccessData();
      } else {
        await model.upModelData();
        if (model.urlImg.contains(style.thanksImg)) {
          widget.onOverTurnTap('X');
        } else {
          widget.onOverTurnTap(model.imageLevel);
        }
      }
      //开始执行
      //controller.forward();
    } else if (status == AnimationStatus.dismissed) {
      //动画从 controller.forward() 正向执行 结束时会回调此方法
      //controller.forward();
    } else if (status == AnimationStatus.forward) {
      //执行 controller.forward() 会回调此状态
    } else if (status == AnimationStatus.reverse) {
      //执行 controller.reverse() 会回调此状态
    }
  }

  void _configAnimationListener(){
    if (mounted) {
      setState(() {
        angle = animation.value;
      });
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(_configControllerStatusListener);
    animation.removeListener(_configAnimationListener);
    controller?.dispose();
    animation = null;
    controller = null;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap:_configOnTap,
          child: Transform(
              transform: Matrix4.rotationY(angle),
              child: _configImg(),
              alignment: Alignment.center)
          ),
    );
  }

  void _configOnTap() async {
    if (model.isFront) return;
    if (activityConfig.acNumber >= 12) return;
    if (activityConfig.isTrue) return;
    if (activityConfig.isTurn == false) return;
    if (model.sendSuccess) return;
    activityConfig.isTurn = !activityConfig.isTurn;

    // 第九张单独处理  需要先请求发奖接口 失败不翻牌 成功之后再翻牌
//    if (activityConfig.acNumber >= 8) {
//      widget.onOverTurnTap(model.imageLevel);
//    } else {
      activityConfig.acNumber += 1;
      model.isFront = !model.isFront;
      controller.forward();
//    }

  }

  Widget _configImg(){
    Widget w;
    if (model.cacheBytes != null) {
      w = Image.memory(model.cacheBytes,width: model.width,height: model.height,);
    } else {
      if (model.urlImg.contains(style.thanksImg)) {
        w = AiImage.asset(model.urlImg,width: model.width,height: model.height);
      } else {
        w = AiImage.fromUrl(model.urlImg, '', BoxFit.fill, model.width, model.height);
      }
    }
    return w;
  }
}
