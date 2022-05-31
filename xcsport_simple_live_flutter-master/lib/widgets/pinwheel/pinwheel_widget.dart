import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/radial_list/metadata.dart';
import 'package:fast_ai/widgets/radial_list/radial_list.dart';
import 'package:fast_ai/widgets/radial_list/scroll_controller.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'pinwheel_helper.dart';
import 'left_right_rotation_transition.dart';
import 'scale_factor_transition.dart';

/// 风车滚动列表部件
class PinwheelWidget extends StatefulWidget {
  final IndexItemBuilder builder;
  final int itemCount;
  final PinwheelController controller;
  final bool isShowBlurBg; // 显示模糊背景
  final AnimationMode animationMode;

  ///
  const PinwheelWidget({
    Key key,
    @required this.builder,
    @required this.itemCount,
    @required this.controller,
    this.isShowBlurBg = false,
    this.animationMode = AnimationMode.mainScaleItemCircleRotation,
  })  : assert(itemCount >= 0 && itemCount <= 7, "itemCount必须满足: 0<=itemCount<=7"),
        super(key: key);

  @override
  _PinwheelWidgetState createState() => _PinwheelWidgetState();
}

class _PinwheelWidgetState extends State<PinwheelWidget> with TickerProviderStateMixin {
  int get itemCount => widget.itemCount ?? 0;

  double get initAngle {
    if (itemCount == 1) {
      return 0;
    } else if (itemCount == 2) {
      return 45;
    } else if (itemCount == 3) {
      return 60;
    } else if (itemCount == 4) {
      return 77;
    } else {
      return 77;
    }
  }

  int get maxItemCount {
    if (itemCount == 1) {
      return 7;
    } else if (itemCount == 2) {
      return 4;
    } else if (itemCount == 3) {
      return 6;
    } else if (itemCount == 4) {
      return 7;
    } else {
      return 7;
    }
  }

  double viewPortFactor = 0.65;
  double width = 224;

  double get pinwheelWidth => 224 * (viewPortFactor - 0.5);

  AnimationController itemAnimationController;
  AnimationController itemGroupAnimationController;
  AnimationController mainAnimationController;
  int scale2Count = 0;

  @override
  void initState() {
    super.initState();
    itemAnimationController = AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    itemAnimationController.addStatusListener(itemAnimationStatusListen);

    itemGroupAnimationController = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    itemGroupAnimationController.addStatusListener(itemGroupAnimationStatusListen);

    mainAnimationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    mainAnimationController.addStatusListener(mainAnimationStatusListen);
    startAnimation();

    PinwheelHelper.pinwheelStatusListener.fire(PinwheelStatus.open);
  }

  @override
  void dispose() {
    PinwheelHelper.pinwheelStatusListener.fire(PinwheelStatus.close);
    itemAnimationController?.removeStatusListener(itemAnimationStatusListen);
    itemAnimationController?.dispose();
    itemGroupAnimationController?.removeStatusListener(itemGroupAnimationStatusListen);
    itemGroupAnimationController?.dispose();
    mainAnimationController?.removeStatusListener(mainAnimationStatusListen);
    mainAnimationController?.dispose();
    super.dispose();
  }

  void startAnimation(){
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      mainAnimationController.forward();
    } else if (widget.animationMode == AnimationMode.itemBreathingLight) {
      scale2Count = 1;
      itemAnimationController.forward();
    } else if(widget.animationMode == AnimationMode.mainScaleItemBreathingLight){
      mainAnimationController.forward();
    } else if(widget.animationMode == AnimationMode.mainScaleItemCircleRotation){
      mainAnimationController.forward();
    }
  }

  void itemAnimationStatusListen(status) {
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      if (status == AnimationStatus.dismissed) {
        mainAnimationController?.reverse();
      }
    } else if (widget.animationMode == AnimationMode.itemBreathingLight)  {
      if (status == AnimationStatus.completed && (scale2Count == 1 || scale2Count == 2)) {
        itemAnimationController?.reverse();
      } else if(status == AnimationStatus.dismissed && (scale2Count == 1 || scale2Count == 2)){
        scale2Count += 1;
        itemAnimationController.forward();
      }
    } else if(widget.animationMode == AnimationMode.mainScaleItemBreathingLight) {
      if (status == AnimationStatus.completed && (scale2Count == 1 || scale2Count == 2)) {
        itemAnimationController?.reverse();
      } else if(status == AnimationStatus.dismissed && (scale2Count == 1 || scale2Count == 2)){
        scale2Count += 1;
        itemAnimationController.forward();
      }
    }
  }

  void itemGroupAnimationStatusListen(status) {
    if(widget.animationMode == AnimationMode.mainScaleItemCircleRotation) {

    }
  }

  void mainAnimationStatusListen(status) {
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      if (status == AnimationStatus.dismissed) {
        PinwheelHelper.hide();
      } else if (status == AnimationStatus.completed) {
        itemAnimationController?.forward();
      }
    } else if (widget.animationMode == AnimationMode.itemBreathingLight)  {

    } else if(widget.animationMode == AnimationMode.mainScaleItemBreathingLight) {
      if (status == AnimationStatus.dismissed) {
        PinwheelHelper.hide();
      } else if (status == AnimationStatus.completed) {
        scale2Count = 1;
        itemAnimationController?.forward();
      }
    } else if(widget.animationMode == AnimationMode.mainScaleItemCircleRotation) {
      if (status == AnimationStatus.dismissed) {
        PinwheelHelper.hide();
      } else if (status == AnimationStatus.completed) {
        itemGroupAnimationController?.forward();
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        child: ClipRect(
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: viewPortFactor, //viewPortFactor
            child: mainAnimation(
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: width,
                  height: width,
                  child: Stack(
                    children: [
                      radialRotationAnimation(RadialListView(
                        itemCount: itemCount,
                        builder: ({BuildContext context, int index, double itemWidth}) {
                          return itemChildAnimation(this.widget.builder.call(context: context, index: index, itemWidth: itemWidth));
                        },
                        radius: width / 2,
                        initAngle: initAngle,
                        layoutDirection: ClockDirection.antiClockwise,
                        itemPadding: 1.2,
                        padding: 10,
                        backgroundColor: Color(0xFFFFFFFF).withOpacity(0.03),
                        controller: itemCount >= 5 ? CycleRadiaScrollController() : NeverRadialScrollController(),
                        itemWidth: 56.0,
                        maxItemCount: maxItemCount,
                        isShowBlurBg: widget.isShowBlurBg,
                        viewPortFactor: ViewPortFactor(
                          startAngle: 180,
                          endAngle: -180,
                        ),
                      )),
                      Positioned(
                        top: 224 / 2 - 15,
                        left: 224 / 2 - 15,
                        child: GestureDetector(
                          onTap: exitOnTap,
                          child: AiSvgPicture.asset('assets/images/detail/icon_details_games_close.svg', width: 30, height: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mainAnimation({Widget child}) {
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      return ScaleTransition(
        alignment: Alignment.center,
        scale: mainAnimationController,
        child: child,
      );
    } else if (widget.animationMode == AnimationMode.itemBreathingLight)  {

    } else if(widget.animationMode == AnimationMode.mainScaleItemBreathingLight){
      return ScaleTransition(
        alignment: Alignment.center,
        scale: mainAnimationController,
        child: child,
      );
    } else if(widget.animationMode == AnimationMode.mainScaleItemCircleRotation){
      return ScaleTransition(
        alignment: Alignment.center,
        scale: mainAnimationController,
        child: child,
      );
    }
    return child;
  }

  Widget itemChildAnimation(Widget child) {
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(itemAnimationController),
        child: child,
      );
    } else if (widget.animationMode == AnimationMode.itemBreathingLight)  {
      return ScaleFactorTransition(
        factor: 0.8,
        alignment: Alignment.center,
        scale: itemAnimationController,
        child: child,
      );
    } else if (widget.animationMode == AnimationMode.mainScaleItemBreathingLight)  {
      return ScaleFactorTransition(
        factor: 0.8,
        alignment: Alignment.center,
        scale: itemAnimationController,
        child: child,
      );
    }
    return child;
  }

  Widget radialRotationAnimation(Widget child) {
    if (widget.animationMode == AnimationMode.mainScaleItemCircleRotation)  {
      return LeftRightRotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(itemGroupAnimationController),
        child: child,
        radianAngle: math.pi/6,
      );
    }
    return child;
  }



  void exitOnTap(){
    if (widget.animationMode == AnimationMode.mainScaleItemRotation) {
      itemAnimationController?.reverse();
    } else if (widget.animationMode == AnimationMode.itemBreathingLight)  {
      PinwheelHelper.hide();
    } else if (widget.animationMode == AnimationMode.mainScaleItemBreathingLight)  {
      itemAnimationController?.stop();
      mainAnimationController?.reverse();
    }  else if (widget.animationMode == AnimationMode.mainScaleItemCircleRotation)  {
      itemAnimationController?.stop();
      mainAnimationController?.reverse();
    } else {
      PinwheelHelper.hide();
    }
  }
}

enum PinwheelStatus { open, close }

class PinwheelController {
  PinwheelStatus status;
  Duration openDuration;
  VoidCallback open;
  VoidCallback close;

  PinwheelController({
    PinwheelStatus initStatus,
  }) : status = initStatus ?? PinwheelStatus.close;
}

///
enum AnimationMode {
  none,//无动画
  mainScaleItemRotation,//整体缩放动画，子项旋转动画
  itemBreathingLight,//整体弹出无动画，子项呼吸灯效果动画
  mainScaleItemBreathingLight,//整体缩放动画，子项呼吸灯效果动画
  mainScaleItemCircleRotation,//整体缩放动画，圆环旋转
}
