import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'metadata.dart';
import 'radial_position.dart';
import 'radian_util.dart';
import 'scroll_controller.dart';
import 'view_port_clipper.dart';

typedef IndexItemBuilder = Widget Function({BuildContext context, int index, double itemWidth});

/// 径向列表
class RadialListView extends StatefulWidget {
  final int itemCount;
  final double radius;
  final double padding;
  final double initAngle;
  final ClockDirection layoutDirection;
  final int maxItemCount;
  final double itemPadding;
  final IndexItemBuilder builder;
  final Color backgroundColor;
  final double itemWidth;
  final RadialScrollController controller;
  final ViewPortFactor viewPortFactor;
  final bool isShowBlurBg;  // 显示模糊背景

  RadialListView({
    @required this.itemCount,
    @required this.radius,
    @required this.builder,
    this.padding = 16.0,
    this.initAngle = 0,
    this.layoutDirection = ClockDirection.clockwise,
    this.maxItemCount = 8,
    this.itemPadding = 5.0,
    this.backgroundColor = Colors.white,
    this.itemWidth,
    this.isShowBlurBg = false,
    RadialScrollController controller,
    ViewPortFactor viewPortFactor,
  })  : assert(itemCount >= 0, "itemCount 不可小于0"),
        assert(radius > padding, "padding值太大了"),
        assert(padding >= 0, "padding不可小于0"),
        assert(itemPadding >= 0, "itemPadding 必须大于0"),
        this.controller = controller == null ? CycleRadiaScrollController() : controller,
        this.viewPortFactor = viewPortFactor == null ? ViewPortFactor(startAngle: 180,endAngle: -180) : viewPortFactor;

  @override
  RadialListViewState createState() {
    return RadialListViewState();
  }
}

class RadialListViewState extends State<RadialListView> {
  /// 初始基准角度
  double baseAngle = 0;

  /// 子项中心半径
  double childItemRadius;

  /// 缓存值用性能优化
  double _cacheRadius;
  double _cachePadding;

  /// 子项半径
  double _itemRadius;

  /// 子项半径
  double get itemRadius {
    if(widget.itemWidth != null && widget.itemWidth > 0){
      return _itemRadius = widget.itemWidth/2;
    }
    if (_itemRadius == null || widget.radius != _cacheRadius || widget.padding != _cachePadding) {
      double singAngle = sin(pi / widget.maxItemCount);
      _itemRadius = (widget.radius - widget.padding) * singAngle / (1 + singAngle) - widget.itemPadding;
      double itemPadding = widget.itemPadding;
      if (itemPadding > _itemRadius / 2) {
        itemPadding = _itemRadius / 2;
      }
      _itemRadius -= itemPadding;
      _cacheRadius = widget.radius;
      _cachePadding = widget.padding;
    }
    return _itemRadius;
  }

  @override
  void initState() {
    super.initState();
    baseAngle = widget.initAngle;
    childItemRadius = widget.radius - itemRadius - widget.padding;
  }

  void updateAngleFunc(double baseAngle) {
    if (baseAngle != null) {
      this.baseAngle = baseAngle;
      if (mounted) {
        setState(() {});
      }
    }
  }

  /// 径项列表子项列表
  List<Widget> _radialListItems() {
    int len = widget.itemCount ?? 0;
    if (len <= 0) {
      return [];
    }

    final double firstItemAngle = widget.layoutDirection == ClockDirection.clockwise ? pi : -pi;
    final double lastItemAngle = widget.layoutDirection == ClockDirection.clockwise ? pi : -pi;
    final double angleDiff = (firstItemAngle + lastItemAngle) / (widget.maxItemCount);

    double currentAngle = firstItemAngle + RadianUtils.angle2Radian(baseAngle);
    int minLen = min(widget.maxItemCount, len);
    List<Widget> children = [];
    for (int i = 0; i < minLen; i++) {
      Widget child = widget.builder(context: context, index: i, itemWidth: itemRadius * 2);
      if (child != null) {
        children.add(_radialListItem(child, currentAngle));
        currentAngle += angleDiff;
      }
    }
    return children;
  }

  /// 径项列表子项
  Widget _radialListItem(Widget child, double angle) {
    double x = widget.radius;
    double y = x;
    return Transform(
      transform: new Matrix4.translationValues(x, y, 0.0),
      child: RadialPositionWidget(
        radius: widget.radius - widget.padding - itemRadius,
        angle: angle,
        child: Transform(
          transform: new Matrix4.translationValues(-itemRadius, -itemRadius, 0.0),
          child: Container(
            width: itemRadius * 2,
            height: itemRadius * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle),
            foregroundDecoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(itemRadius),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  ///
  String formatDouble(double d) {
    return d.toStringAsPrecision(6).substring(0, 7);
  }

  int oldControllerHashCode;

  @override
  Widget build(BuildContext context) {
    if(oldControllerHashCode == null || oldControllerHashCode != widget.controller.hashCode){
      widget.controller.bindStatus(
        localCenterX: widget.radius,
        localCenterY: widget.radius,
        baseAngle: baseAngle,
        callback: updateAngleFunc,
      );
      oldControllerHashCode = widget.controller.hashCode;
    }

    return widget.controller.scroll(
        widget.isShowBlurBg
        ? ClipPath(
            clipper: BgOvalClipper(radius: widget.radius),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  height: widget.radius * 2,
                  width: widget.radius * 2,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                  child: ClipPath(
                    clipper: ViewPortClipper(viewPortFactor: widget.viewPortFactor),
                    child: Stack(
                      children: [
                        ..._radialListItems(),
                      ],
                    ),
                  ),
                )
            ),
          )
        : Container(
            height: widget.radius * 2,
            width: widget.radius * 2,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: ClipPath(
              clipper: ViewPortClipper(viewPortFactor: widget.viewPortFactor),
              child: Stack(
                children: [
                  ..._radialListItems(),
                ],
              ),
            ),
          )
    );
  }
}

class BgOvalClipper extends CustomClipper<Path> {
  final double radius;

  BgOvalClipper({this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..moveTo(radius, radius)
      ..addArc(Rect.fromCircle(center: Offset(radius, radius), radius: radius), 0,  2 * pi)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
