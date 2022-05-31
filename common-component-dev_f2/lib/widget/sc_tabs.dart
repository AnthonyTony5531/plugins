import 'dart:async';
import 'dart:ui' show lerpDouble;
import 'dart:ui' as ui;

import 'package:common_component/package/common_component_package.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const double _kTabHeight = 35.0;
const double _kTextAndIconTabHeight = 72.0;

enum ScTabType {
  none,
  line,
  line_start_line,
  top_arrow,
  top_arrow_bottom,
  half_circle,
}

class ScTabbarIndicatorPainterFactory {
  static ScTabbarIndicatorPainter create(ScTabType type) {
    switch (type) {
      case ScTabType.none:
        return NoneIndicatorPainter();
      case ScTabType.line:
        return LineIndicatorPainter();
      case ScTabType.line_start_line:
        return LineStartLineIndicatorPainter();
      case ScTabType.top_arrow:
        return TopArrowIndicatorPainter();
      case ScTabType.top_arrow_bottom:
        return TopArrowIndicatorPainterByBottom();
      case ScTabType.half_circle:
        return HalfCircleIndicatorPainter();
    }
    return NoneIndicatorPainter();
  }
}

abstract class ScTabbarIndicatorPainter {
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  );
}

class NoneIndicatorPainter extends ScTabbarIndicatorPainter {
  @override
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  ) {}
}

class HalfCircleIndicatorPainter extends ScTabbarIndicatorPainter {
  double pi = 3.1415926535897932;

  @override
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  ) {
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;
    if (null != decoration.colors) {
      LinearGradient linearGradient = new LinearGradient(colors: decoration.colors);
      paint.shader = linearGradient.createShader(Rect.fromCenter(center: indicator.center, width: borderSide.width, height: borderSide.width));
    }
    canvas.drawArc(Rect.fromCenter(center: indicator.center, width: borderSide.width, height: borderSide.width), 0, pi, false, paint);
  }
}

class LineIndicatorPainter extends ScTabbarIndicatorPainter {
  @override
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  ) {
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    if (null != decoration.colors) {
      LinearGradient linearGradient = new LinearGradient(colors: decoration.colors);
      paint.shader = linearGradient.createShader(
        Rect.fromLTRB(indicator.bottomLeft.dx, indicator.topLeft.dy, indicator.bottomRight.dx,
            indicator.bottomRight.dy - borderSide.width / 2 + insets.vertical / 2),
      );
    }
    canvas.drawLine(Offset(indicator.bottomLeft.dx, indicator.bottomRight.dy - borderSide.width / 2 + insets.vertical / 2),
        Offset(indicator.bottomRight.dx, indicator.bottomRight.dy - borderSide.width / 2 + insets.vertical / 2), paint);
  }
}

class TopArrowIndicatorPainter extends ScTabbarIndicatorPainter {
  @override
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  ) {
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    if (null != decoration.colors) {
      LinearGradient linearGradient = new LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: decoration.colors);
      paint.shader = linearGradient.createShader(Rect.fromLTWH(
        indicator.topCenter.dx,
        indicator.topCenter.dy,
        borderSide.width,
        borderSide.width + insets.vertical / 2,
      ));
    }

    var path = Path();
    path.moveTo(indicator.bottomCenter.dx - borderSide.width, indicator.bottomCenter.dy - borderSide.width / 2 + insets.vertical);
    path.lineTo(indicator.bottomCenter.dx, indicator.bottomCenter.dy - borderSide.width - borderSide.width / 2 + insets.vertical);
    path.lineTo(indicator.bottomCenter.dx + borderSide.width, indicator.center.dy - borderSide.width / 2 + insets.vertical);

    path.close();
    canvas.drawPath(path, paint);
  }
}

class TopArrowIndicatorPainterByBottom extends ScTabbarIndicatorPainter {
  @override
  void paint(
      Rect rect,
      Offset offset,
      Canvas canvas,
      TextDirection textDirection,
      Rect indicator,
      BorderSide borderSide,
      EdgeInsetsGeometry insets,
      UnderScTabIndicator decoration,
      ImageConfiguration configuration,
      ) {
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    if (null != decoration.colors) {
      LinearGradient linearGradient = new LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: decoration.colors);
      paint.shader = linearGradient.createShader(Rect.fromLTWH(
        indicator.topCenter.dx,
        indicator.topCenter.dy,
        borderSide.width,
        borderSide.width + insets.vertical / 2,
      ));
    }

    var path = Path();
    path.moveTo(indicator.bottomCenter.dx - borderSide.width, indicator.bottom + 5);
    path.lineTo(indicator.bottomCenter.dx, indicator.bottomCenter.dy - 4.0);
    path.lineTo(indicator.bottomCenter.dx + borderSide.width, indicator.bottom + 5);

    path.close();
    canvas.drawPath(path, paint);
  }
}

class LineStartLineIndicatorPainter implements ScTabbarIndicatorPainter {
  void paint(
    Rect rect,
    Offset offset,
    Canvas canvas,
    TextDirection textDirection,
    Rect indicator,
    BorderSide borderSide,
    EdgeInsetsGeometry insets,
    UnderScTabIndicator decoration,
    ImageConfiguration configuration,
  ) {
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    /// 左线
//    final Paint leftLinePaint = borderSide.toPaint()
//      ..strokeCap = StrokeCap.butt
//      ..style = PaintingStyle.fill;
//    if (null != decoration.colors) {
//      LinearGradient linearGradient =
//          new LinearGradient(colors: decoration.colors);
//      leftLinePaint.shader = linearGradient.createShader(Rect.fromCenter(
//          center: Offset(
//              indicator.topCenter.dx - 18,
//              indicator.topCenter.dy -
//                  borderSide.width / 2 +
//                  insets.vertical / 2),
//          width: 25,
//          height: borderSide.width));
//    }
//
//    canvas.drawLine(
//        Offset(
//            indicator.topCenter.dx - 18,
//            indicator.topCenter.dy -
//                borderSide.width / 2 +
//                insets.vertical / 2),
//        Offset(
//            indicator.topCenter.dx - 5,
//            indicator.topCenter.dy -
//                borderSide.width / 2 +
//                insets.vertical / 2),
//        leftLinePaint);

    final lineW = 16;

    /// 左或右线宽
    final lineH = 3;

    /// 左或右线高
    final xOffset = 2.5;

    /// 上边线和下边线x轴偏移量
    /// 左平行四边形
    var leftPath = Path();
    leftPath.moveTo(
      indicator.topCenter.dx - borderSide.width * 1,
      indicator.bottomCenter.dy + insets.vertical / 2,
    );
    leftPath.lineTo(
      indicator.topCenter.dx - borderSide.width * 1 - lineW,
      indicator.bottomCenter.dy + insets.vertical / 2,
    );
    leftPath.lineTo(
      indicator.topCenter.dx - borderSide.width * 1 - lineW - xOffset,
      indicator.bottomCenter.dy + insets.vertical / 2 - lineH,
    );
    leftPath.lineTo(indicator.topCenter.dx - borderSide.width * 1 - xOffset, indicator.bottomCenter.dy + insets.vertical / 2 - lineH);
    leftPath.close();
    canvas.drawPath(leftPath, paint);

    /// 中间菱形
    var path = Path();
    path.moveTo(indicator.topCenter.dx - borderSide.width * 1.5, indicator.topCenter.dy - borderSide.width / 2 + insets.vertical / 2 - 2);
    path.lineTo(indicator.topCenter.dx, indicator.topCenter.dy - borderSide.width * 1.5 - borderSide.width / 2 + insets.vertical / 2 - 2);
    path.lineTo(indicator.topCenter.dx + borderSide.width * 1.5, indicator.topCenter.dy - borderSide.width / 2 + insets.vertical / 2 - 2);
    path.lineTo(indicator.topCenter.dx, indicator.topCenter.dy + borderSide.width * 1.5 - borderSide.width / 2 + insets.vertical / 2 - 2);
    path.close();
    canvas.drawPath(path, paint);

    /// 右平行四边形
    var rightPath = Path();
    rightPath.moveTo(
      indicator.topCenter.dx + borderSide.width * 1,
      indicator.bottomCenter.dy + insets.vertical / 2,
    );
    rightPath.lineTo(
      indicator.topCenter.dx + borderSide.width * 1 + lineW,
      indicator.bottomCenter.dy + insets.vertical / 2,
    );
    rightPath.lineTo(
      indicator.topCenter.dx + borderSide.width * 1 + lineW + xOffset,
      indicator.bottomCenter.dy + insets.vertical / 2 - lineH,
    );
    rightPath.lineTo(indicator.topCenter.dx + borderSide.width * 1 + xOffset, indicator.bottomCenter.dy + insets.vertical / 2 - lineH);
    rightPath.close();
    canvas.drawPath(rightPath, paint);

    /// 右线
//    final Paint rightLinePaint = borderSide.toPaint()
//      ..strokeCap = StrokeCap.butt
//      ..style = PaintingStyle.fill;
//    if (null != decoration.colors) {
//      LinearGradient linearGradient = new LinearGradient(
//          begin: Alignment.centerRight,
//          end: Alignment.centerLeft,
//          colors: decoration.colors);
//      rightLinePaint.shader = linearGradient.createShader(Rect.fromCenter(
//          center: Offset(
//              indicator.topCenter.dx  + 18,
//              indicator.topCenter.dy -
//                  borderSide.width / 2 +
//                  insets.vertical / 2),
//          width: 25,
//          height: borderSide.width));
//    }
//
//    canvas.drawLine(
//        Offset(
//            indicator.topCenter.dx + 5,
//            indicator.topCenter.dy -
//                borderSide.width / 2 +
//                insets.vertical / 2),
//        Offset(
//            indicator.topCenter.dx  + 18,
//            indicator.topCenter.dy -
//                borderSide.width / 2 +
//                insets.vertical / 2),
//        rightLinePaint);
  }
}

/// A material design [TabBar] tab.
///
/// If both [icon] and [text] are provided, the text is displayed below
/// the icon.
///
/// See also:
///
///  * [TabBar], which displays a row of tabs.
///  * [TabBarView], which displays a widget for the currently selected tab.
///  * [TabController], which coordinates tab selection between a [TabBar] and a [TabBarView].
///  * <https://material.io/design/components/tabs.html>
class ScTab extends StatelessWidget {
  /// Creates a material design [TabBar] tab.
  ///
  /// At least one of [text], [icon], and [child] must be non-null. The [text]
  /// and [child] arguments must not be used at the same time.
  const ScTab({
    Key key,
    this.text,
    this.icon,
    this.child,
    this.count,
    this.countBackgroundColor = Colors.transparent,
    this.countBottomOffset = 3,
    this.isHideIndicator = false,
    this.countContainerSize,
    this.countMargin,
    this.args,
    this.countStyle,
  })  : assert(text != null || child != null || icon != null),
        assert(!(text != null && null != child)),
        // TODO(goderbauer): https://github.com/dart-lang/sdk/issues/34180
        super(key: key);

  final bool isHideIndicator;

  final Color countBackgroundColor;
  final double countBottomOffset;
  final Size countContainerSize;
  final String count;
  final EdgeInsetsGeometry countMargin;
  final TextStyle countStyle;
  final dynamic args;

  /// The text to display as the tab's label.
  ///
  /// Must not be used in combination with [child].
  final String text;

  /// The widget to be used as the tab's label.
  ///
  /// Usually a [Text] widget, possibly wrapped in a [Semantics] widget.
  ///
  /// Must not be used in combination with [text].
  final Widget child;

  /// An icon to display as the tab's label.
  final Widget icon;

  Widget _buildLabelText() {
    return child ?? Text(text, softWrap: false, overflow: TextOverflow.fade);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height;
    Widget label;
    if (icon == null) {
      height = _kTabHeight;
      label = _buildLabelText();
    } else if (text == null && child == null) {
      height = _kTabHeight;
      label = icon;
    } else {
      height = _kTextAndIconTabHeight;
      label = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: icon,
            margin: isHideIndicator ? EdgeInsets.zero : const EdgeInsets.only(bottom: 10.0),
          ),
          _buildLabelText(),
        ],
      );
    }

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text, defaultValue: null));
    properties.add(DiagnosticsProperty<Widget>('icon', icon, defaultValue: null));
  }
}

class _TabStyle extends AnimatedWidget {
  const _TabStyle({
    Key key,
    Animation<double> animation,
    this.selected,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.countColor,
    this.unselectedCountColor,
    @required this.child,
  }) : super(key: key, listenable: animation);

  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final bool selected;
  final Color labelColor;
  final Color unselectedLabelColor;
  final Color countColor;
  final Color unselectedCountColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TabBarTheme tabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable;

    // To enable TextStyle.lerp(style1, style2, value), both styles must have
    // the same value of inherit. Force that to be inherit=true here.
    final TextStyle defaultStyle = (labelStyle ?? tabBarTheme.labelStyle ?? themeData.primaryTextTheme.bodyText2).copyWith(inherit: true);
    final TextStyle defaultUnselectedStyle =
        (unselectedLabelStyle ?? tabBarTheme.unselectedLabelStyle ?? labelStyle ?? themeData.primaryTextTheme.bodyText2).copyWith(inherit: true);
    final TextStyle textStyle = selected
        ? TextStyle.lerp(defaultStyle, defaultUnselectedStyle, animation.value)
        : TextStyle.lerp(defaultUnselectedStyle, defaultStyle, animation.value);

    final Color selectedColor = labelColor ?? tabBarTheme.labelColor ?? themeData.primaryTextTheme.bodyText2.color;
    final Color unselectedColor = unselectedLabelColor ?? tabBarTheme.unselectedLabelColor ?? selectedColor.withAlpha(0xB2); // 70% alpha
    final Color color =
        selected ? Color.lerp(selectedColor, unselectedColor, animation.value) : Color.lerp(unselectedColor, selectedColor, animation.value);

    return DefaultTextStyle(
      style: textStyle.copyWith(color: color),
      child: IconTheme.merge(
        data: IconThemeData(
          size: 24.0,
          color: color,
        ),
        child: child,
      ),
    );
  }
}

typedef _LayoutCallback = void Function(List<double> xOffsets, TextDirection textDirection, double width);

class _TabLabelBarRenderer extends RenderFlex {
  _TabLabelBarRenderer({
    List<RenderBox> children,
    @required Axis direction,
    @required MainAxisSize mainAxisSize,
    @required MainAxisAlignment mainAxisAlignment,
    @required CrossAxisAlignment crossAxisAlignment,
    @required TextDirection textDirection,
    @required VerticalDirection verticalDirection,
    @required this.onPerformLayout,
  })  : assert(onPerformLayout != null),
        assert(textDirection != null),
        super(
          children: children,
          direction: direction,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
        );

  _LayoutCallback onPerformLayout;

  @override
  void performLayout() {
    super.performLayout();
    // xOffsets will contain childCount+1 values, giving the offsets of the
    // leading edge of the first tab as the first value, of the leading edge of
    // the each subsequent tab as each subsequent value, and of the trailing
    // edge of the last tab as the last value.
    RenderBox child = firstChild;
    final List<double> xOffsets = <double>[];
    while (child != null) {
      final FlexParentData childParentData = child.parentData;
      xOffsets.add(childParentData.offset.dx);
      assert(child.parentData == childParentData);
      child = childParentData.nextSibling;
    }
    assert(textDirection != null);
    switch (textDirection) {
      case TextDirection.rtl:
        xOffsets.insert(0, size.width);
        break;
      case TextDirection.ltr:
        xOffsets.add(size.width);
        break;
    }
    onPerformLayout(xOffsets, textDirection, size.width);
  }
}

// This class and its renderer class only exist to report the widths of the tabs
// upon layout. The tab widths are only used at paint time (see _IndicatorPainter)
// or in response to input.
class _TabLabelBar extends Flex {
  _TabLabelBar({
    Key key,
    List<Widget> children = const <Widget>[],
    this.onPerformLayout,
  }) : super(
          key: key,
          children: children,
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
        );

  final _LayoutCallback onPerformLayout;

  @override
  RenderFlex createRenderObject(BuildContext context) {
    return _TabLabelBarRenderer(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: getEffectiveTextDirection(context),
      verticalDirection: verticalDirection,
      onPerformLayout: onPerformLayout,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _TabLabelBarRenderer renderObject) {
    super.updateRenderObject(context, renderObject);
    renderObject.onPerformLayout = onPerformLayout;
  }
}

double _indexChangeProgress(TabController controller) {
  try {
    final double controllerValue = controller.animation.value;
    final double previousIndex = controller.previousIndex.toDouble();
    final double currentIndex = controller.index.toDouble();

    // The controller's offset is changing because the user is dragging the
    // TabBarView's PageView to the left or right.
    if (!controller.indexIsChanging) return (currentIndex - controllerValue).abs().clamp(0.0, 1.0);

    // The TabController animation's value is changing from previousIndex to currentIndex.
    return (controllerValue - currentIndex).abs() / (currentIndex - previousIndex).abs();
  } catch (e, s) {
      print("$e, \n $s");
    return 0;
  }
}

class _IndicatorPainter extends CustomPainter {
  _IndicatorPainter({
    @required this.controller,
    @required this.indicator,
    @required this.indicatorWidth,
    @required this.tabKeys,
    _IndicatorPainter old,
  })  : assert(controller != null),
        assert(indicator != null),
        super(repaint: controller.animation) {
    if (old != null) saveTabOffsets(old._currentTabOffsets, old._currentTextDirection);
  }

  final TabController controller;
  final Decoration indicator;
  final double indicatorWidth;

  // final TabBarIndicatorSize indicatorSize;
  final List<GlobalKey> tabKeys;

  List<double> _currentTabOffsets;
  TextDirection _currentTextDirection;
  Rect _currentRect;
  BoxPainter _painter;
  bool _needsPaint = false;

  void markNeedsPaint() {
    _needsPaint = true;
  }

  void dispose() {
    _painter?.dispose();
  }

  void saveTabOffsets(List<double> tabOffsets, TextDirection textDirection) {
    _currentTabOffsets = tabOffsets;
    _currentTextDirection = textDirection;
  }

  // _currentTabOffsets[index] is the offset of the start edge of the tab at index, and
  // _currentTabOffsets[_currentTabOffsets.length] is the end edge of the last tab.
  int get maxTabIndex => _currentTabOffsets.length - 2;

  double centerOf(int tabIndex) {
    assert(_currentTabOffsets != null);
    assert(_currentTabOffsets.isNotEmpty);
    assert(tabIndex >= 0);
    assert(tabIndex <= maxTabIndex);
    return (_currentTabOffsets[tabIndex] + _currentTabOffsets[tabIndex + 1]) / 2.0;
  }

  Rect indicatorRect(Size tabBarSize, int tabIndex) {
    assert(_currentTabOffsets != null);
    assert(_currentTextDirection != null);
    assert(_currentTabOffsets.isNotEmpty);
    assert(tabIndex >= 0);
    assert(tabIndex <= maxTabIndex);
    double tabLeft, tabRight;
    switch (_currentTextDirection) {
      case TextDirection.rtl:
        tabLeft = _currentTabOffsets[tabIndex + 1];
        tabRight = _currentTabOffsets[tabIndex];
        break;
      case TextDirection.ltr:
        tabLeft = _currentTabOffsets[tabIndex];
        tabRight = _currentTabOffsets[tabIndex + 1];
        break;
    }

    final double tabWidth = indicatorWidth ?? 16.0;
    final double delta = ((tabRight - tabLeft) - tabWidth) / 2.0;
    tabLeft += delta;
    tabRight -= delta;

    return Rect.fromLTWH(tabLeft, 0.0, tabRight - tabLeft, tabBarSize.height);
  }

  @override
  void paint(Canvas canvas, Size size) {
    try {
      _needsPaint = false;
      _painter ??= indicator.createBoxPainter(markNeedsPaint);

      if (controller.indexIsChanging) {
        // The user tapped on a tab, the tab controller's animation is running.
        final Rect targetRect = indicatorRect(size, controller.index);
        _currentRect = Rect.lerp(targetRect, _currentRect ?? targetRect, _indexChangeProgress(controller));
      } else {
        // The user is dragging the TabBarView's PageView left or right.
        final int currentIndex = controller.index;
        final Rect previous = currentIndex > 0 ? indicatorRect(size, currentIndex - 1) : null;
        final Rect middle = indicatorRect(size, currentIndex);
        final Rect next = currentIndex < maxTabIndex ? indicatorRect(size, currentIndex + 1) : null;
        final double index = controller.index.toDouble();
        final double value = controller.animation.value;

        if (value == index - 1.0)
          _currentRect = previous ?? middle;
        else if (value == index + 1.0)
          _currentRect = next ?? middle;
        else if (value == index)
          _currentRect = middle;
        else if (value < index) {
          _currentRect = previous == null ? middle : Rect.lerp(middle, previous, index - value);
          var right = middle.right;
          if (index - value < 0.6)
            right -= (index - value) * (right - middle.left);
          else
            right = _currentRect.right;
          _currentRect = Rect.fromLTRB(_currentRect.left, _currentRect.top, right, _currentRect.bottom);
        } else {
          _currentRect = next == null ? middle : Rect.lerp(middle, next, value - index);
          var left = middle.left;
          if (value - index < 0.6) {
            left += (value - index) * (middle.right - left);
          } else
            left = _currentRect.left;
          _currentRect = Rect.fromLTRB(left, middle.top, _currentRect.right, _currentRect.bottom);
        }
      }
      assert(_currentRect != null);

      final ImageConfiguration configuration = ImageConfiguration(
        size: _currentRect.size,
        textDirection: _currentTextDirection,
      );
      _painter.paint(canvas, _currentRect.topLeft, configuration);
    } catch (e, s) {
      print("$e, \n $s");
    }
  }

  static bool _tabOffsetsEqual(List<double> a, List<double> b) {
    if (a?.length != b?.length) return false;
    for (int i = 0; i < a.length; i += 1) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  bool shouldRepaint(_IndicatorPainter old) {
    return _needsPaint ||
        controller != old.controller ||
        indicator != old.indicator ||
        tabKeys.length != old.tabKeys.length ||
        (!_tabOffsetsEqual(_currentTabOffsets, old._currentTabOffsets)) ||
        _currentTextDirection != old._currentTextDirection;
  }
}

class _ChangeAnimation extends Animation<double> with AnimationWithParentMixin<double> {
  _ChangeAnimation(this.controller);

  final TabController controller;

  @override
  Animation<double> get parent => controller.animation;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (parent != null) super.removeStatusListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    if (parent != null) super.removeListener(listener);
  }

  @override
  double get value => _indexChangeProgress(controller);
}

class _DragAnimation extends Animation<double> with AnimationWithParentMixin<double> {
  _DragAnimation(this.controller, this.index);

  final TabController controller;
  final int index;

  @override
  Animation<double> get parent => controller.animation;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (parent != null) super.removeStatusListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    if (parent != null) super.removeListener(listener);
  }

  @override
  double get value {
    assert(!controller.indexIsChanging);
    try {
      return (controller.animation.value - index.toDouble()).abs().clamp(0.0, 1.0);
    } catch (e, s) {
      print("$e, \n $s");
      return 0;
    }
  }
}

// This class, and TabBarScrollController, only exist to handle the case
// where a scrollable TabBar has a non-zero initialIndex. In that case we can
// only compute the scroll position's initial scroll offset (the "correct"
// pixels value) after the TabBar viewport width and scroll limits are known.
class _TabBarScrollPosition extends ScrollPositionWithSingleContext {
  _TabBarScrollPosition({
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition oldPosition,
    this.tabBar,
  }) : super(
          physics: physics,
          context: context,
          initialPixels: null,
          oldPosition: oldPosition,
        );

  final _ScTabBarState tabBar;

  bool _initialViewportDimensionWasZero;

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    bool result = true;
    if (_initialViewportDimensionWasZero != true) {
      // If the viewport never had a non-zero dimension, we just want to jump
      // to the initial scroll position to avoid strange scrolling effects in
      // release mode: In release mode, the viewport temporarily may have a
      // dimension of zero before the actual dimension is calculated. In that
      // scenario, setting the actual dimension would cause a strange scroll
      // effect without this guard because the super call below would starts a
      // ballistic scroll activity.
      assert(viewportDimension != null);
      _initialViewportDimensionWasZero = viewportDimension != 0.0;
      correctPixels(tabBar._initialScrollOffset(viewportDimension, minScrollExtent, maxScrollExtent));
      result = false;
    }
    return super.applyContentDimensions(minScrollExtent, maxScrollExtent) && result;
  }
}

// This class, and TabBarScrollPosition, only exist to handle the case
// where a scrollable TabBar has a non-zero initialIndex.
class _TabBarScrollController extends ScrollController {
  _TabBarScrollController(this.tabBar);

  final _ScTabBarState tabBar;

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics, ScrollContext context, ScrollPosition oldPosition) {
    return _TabBarScrollPosition(
      physics: physics,
      context: context,
      oldPosition: oldPosition,
      tabBar: tabBar,
    );
  }
}

/// A material design widget that displays a horizontal row of tabs.
///
/// Typically created as the [AppBar.bottom] part of an [AppBar] and in
/// conjunction with a [TabBarView].
///
/// If a [TabController] is not provided, then a [DefaultTabController] ancestor
/// must be provided instead. The tab controller's [TabController.length] must
/// equal the length of the [tabs] list and the length of the
/// [TabBarView.children] list.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// Uses values from [TabBarTheme] if it is set in the current context.
///
/// To see a sample implementation, visit the [TabController] documentation.
///
/// See also:
///
///  * [TabBarView], which displays page views that correspond to each tab.
class ScTabBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a material design tab bar.
  ///
  /// The [tabs] argument must not be null and its length must match the [controller]'s
  /// [TabController.length].
  ///
  /// If a [TabController] is not provided, then there must be a
  /// [DefaultTabController] ancestor.
  ///
  /// The [indicatorWeight] parameter defaults to 2, and must not be null.
  ///
  /// The [indicatorPadding] parameter defaults to [EdgeInsets.zero], and must not be null.
  ///
  /// If [indicator] is not null, then [indicatorWeight], [indicatorPadding], and
  /// [indicatorColor] are ignored.
  const ScTabBar({
    Key key,
    @required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.indicatorFlat = false,
    this.indicatorColor,
    this.indicatorWeight = 3.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorWidth,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,
    this.showCount = false,
    this.tabHeight = _kTabHeight,
    this.countColor = Colors.yellow,
    this.type = ScTabType.line,
    this.image,
    this.colors, //渐变
    this.unselectedCountColor = Colors.transparent,
    this.tabAlignment = Alignment.center,
    this.tabIndicatorAlignment = Alignment.center,
  })  : assert(tabs != null),
        assert(isScrollable != null),
        assert(dragStartBehavior != null),
        assert(indicator != null || (indicatorWeight != null && indicatorWeight > 0.0)),
        assert(indicator != null || (indicatorPadding != null)),
        super(key: key);

  /// Typically a list of two or more [AiTab] widgets.
  ///
  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> tabs;
  final List<Color> colors;
  final bool showCount;
  final ScTabType type;
  final Alignment tabAlignment;
  final Alignment tabIndicatorAlignment;
  final double tabHeight;
  final String image;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController controller;

  /// Whether this tab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each tab is as wide as needed for its label
  /// and the entire [TabBar] is scrollable. Otherwise each tab gets an equal
  /// share of the available space.
  final bool isScrollable;

  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified, this property is ignored.
  final Color indicatorColor;

  /// The thickness of the line that appears below the selected tab.
  ///
  /// The value of this parameter must be greater than zero and its default
  /// value is 2.0.
  ///
  /// If [indicator] is specified, this property is ignored.
  final double indicatorWeight;

  /// The horizontal padding for the line that appears below the selected tab.
  ///
  /// For [isScrollable] tab bars, specifying [kTabLabelPadding] will align
  /// the indicator with the tab's text for [AiTab] widgets and all but the
  /// shortest [AiTab.text] values.
  ///
  /// The [EdgeInsets.top] and [EdgeInsets.bottom] values of the
  /// [indicatorPadding] are ignored.
  ///
  /// The default value of [indicatorPadding] is [EdgeInsets.zero].
  ///
  /// If [indicator] is specified, this property is ignored.
  final EdgeInsetsGeometry indicatorPadding;

  /// Defines the appearance of the selected tab indicator.
  ///
  /// If [indicator] is specified, the [indicatorColor], [indicatorWeight],
  /// and [indicatorPadding] properties are ignored.
  ///
  /// The default, underline-style, selected tab indicator can be defined with
  /// [UnderScTabIndicator].
  ///
  /// The indicator's size is based on the tab's bounds. If [indicatorSize]
  /// is [TabBarIndicatorSize.tab] the tab's bounds are as wide as the space
  /// occupied by the tab in the tab bar. If [indicatorSize] is
  /// [TabBarIndicatorSize.label], then the tab's bounds are only as wide as
  /// the tab widget itself.
  final Decoration indicator;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final double indicatorWidth;

  final bool indicatorFlat;

  /// The color of selected tab labels.
  ///
  /// Unselected tab labels are rendered with the same color rendered at 70%
  /// opacity unless [unselectedLabelColor] is non-null.
  ///
  /// If this parameter is null, then the color of the [ThemeData.primaryTextTheme]'s
  /// body2 text color is used.
  final Color labelColor;

  /// The color of unselected tab labels.
  ///
  /// If this property is null, unselected tab labels are rendered with the
  /// [labelColor] with 70% opacity.
  final Color unselectedLabelColor;

  final Color countColor;
  final Color unselectedCountColor;

  /// The text style of the selected tab labels.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for
  /// both selected and unselected label styles.
  ///
  /// If this property is null, then the text style of the
  /// [ThemeData.primaryTextTheme]'s body2 definition is used.
  final TextStyle labelStyle;

  /// The padding added to each of the tab labels.
  ///
  /// If this property is null, then kTabLabelPadding is used.
  final EdgeInsetsGeometry labelPadding;

  /// The text style of the unselected tab labels
  ///
  /// If this property is null, then the [labelStyle] value is used. If [labelStyle]
  /// is null, then the text style of the [ThemeData.primaryTextTheme]'s
  /// body2 definition is used.
  final TextStyle unselectedLabelStyle;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// An optional callback that's called when the [TabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for
  /// applications that want to do a little extra work when a tab is tapped,
  /// even if the tap doesn't change the TabController's index. TabBar [onTap]
  /// callbacks should not make changes to the TabController since that would
  /// interfere with the default tap handler.
  final ValueChanged<int> onTap;

  /// A size whose height depends on if the tabs have both icons and text.
  ///
  /// [AppBar] uses this this size to compute its own preferred size.
  @override
  Size get preferredSize {
    for (Widget item in tabs) {
      if (item is ScTab) {
        final ScTab tab = item;
        if (tab.text != null && tab.icon != null) return Size.fromHeight(_kTextAndIconTabHeight + indicatorWeight);
      }
    }
    return Size.fromHeight(_kTabHeight + indicatorWeight);
  }

  @override
  _ScTabBarState createState() => _ScTabBarState();
}

class MyImageStreamListener extends ImageStreamListener {
  MyImageStreamListener(onImage) : super(onImage);
}

class _ScTabBarState extends State<ScTabBar> {
  ScrollController _scrollController;
  TabController _controller;
  _IndicatorPainter _indicatorPainter;
  int _currentIndex;
  double _tabStripWidth;
  List<GlobalKey> _tabKeys;

  ui.Image image;
  ImageStreamListener streamListener;

  Future<ui.Image> _loadImage(var path) async {
    ImageStream stream = AssetImage(path, bundle: rootBundle, package: ccPackage.name).resolve(ImageConfiguration.empty);

    Completer<ui.Image> completer = Completer<ui.Image>();
    void listener(ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(streamListener);
      streamListener = null;
    }

    streamListener = ImageStreamListener(listener);
    stream.addListener(streamListener);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    // If indicatorSize is TabIndicatorSize.label, _tabKeys[i] is used to find
    // the width of tab widget i. See _IndicatorPainter.indicatorRect().
    _tabKeys = widget.tabs.map((Widget tab) => GlobalKey()).toList();
    if (null != widget.image) {
      _loadImage(widget.image).then((image) {
        if (mounted) {
          this.image = image;
          setState(() {});
        }
      });
    }
  }

  Decoration get _indicator {
    if (widget.indicator != null) return widget.indicator;
    final TabBarTheme tabBarTheme = TabBarTheme.of(context);
    if (tabBarTheme.indicator != null) return tabBarTheme.indicator;

    Color color = widget.indicatorColor ?? Theme.of(context).indicatorColor;
    // ThemeData tries to avoid this by having indicatorColor avoid being the
    // primaryColor. However, it's possible that the tab bar is on a
    // Material that isn't the primaryColor. In that case, if the indicator
    // color ends up matching the material's color, then this overrides it.
    // When that happens, automatic transitions of the theme will likely look
    // ugly as the indicator color suddenly snaps to white at one end, but it's
    // not clear how to avoid that any further.
    //
    // The material's color might be null (if it's a transparency). In that case
    // there's no good way for us to find out what the color is so we don't.
    if (color.value == Material.of(context).color?.value) color = Colors.white;
    return UnderScTabIndicator(
      indicatorFlat: widget.indicatorFlat,
      insets: widget.indicatorPadding,
      type: widget.type,
      colors: widget.colors,
      borderSide: BorderSide(
        width: widget.indicatorWeight,
        color: color,
      ),
    );
  }

  // If the TabBar is rebuilt with a new tab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final TabController newController = widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError('No TabController for ${widget.runtimeType}.\n'
            'When creating a ${widget.runtimeType}, you must either provide an explicit '
            'TabController using the "controller" property, or you must ensure that there '
            'is a DefaultTabController above the ${widget.runtimeType}.\n'
            'In this case, there was neither an explicit controller nor a default controller.');
      }
      return true;
    }());

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller.animation.removeListener(_handleTabControllerAnimationTick);
      _controller.removeListener(_handleTabControllerTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller.animation.addListener(_handleTabControllerAnimationTick);
      _controller.addListener(_handleTabControllerTick);
      _currentIndex = _controller.index;
    }
  }

  void _initIndicatorPainter() {
    _indicatorPainter = !_controllerIsValid
        ? null
        : _IndicatorPainter(
            controller: _controller,
            indicator: _indicator,
            indicatorWidth: widget.indicatorWidth ?? 16.0,
            //  indicatorSize: widget.indicatorSize ?? TabBarTheme.of(context).indicatorSize,
            tabKeys: _tabKeys,
            old: _indicatorPainter,
          );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    _updateTabController();
    _initIndicatorPainter();
  }

  @override
  void didUpdateWidget(ScTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
      _initIndicatorPainter();
    } else if (widget.indicatorColor != oldWidget.indicatorColor ||
        widget.indicatorWeight != oldWidget.indicatorWeight ||
        widget.indicatorWidth != oldWidget.indicatorWidth ||
        widget.indicator != oldWidget.indicator) {
      _initIndicatorPainter();
    }

    if (widget.tabs.length > oldWidget.tabs.length) {
      final int delta = widget.tabs.length - oldWidget.tabs.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < oldWidget.tabs.length) {
      _tabKeys.removeRange(widget.tabs.length, oldWidget.tabs.length);
    }
  }

  @override
  void dispose() {
    _indicatorPainter.dispose();
    if (_controllerIsValid) {
      _controller.animation.removeListener(_handleTabControllerAnimationTick);
      _controller.removeListener(_handleTabControllerTick);
    }
    _controller = null;
    // We don't own the _controller Animation, so it's not disposed here.
    super.dispose();
  }

  int get maxTabIndex => _indicatorPainter.maxTabIndex;

  double _tabScrollOffset(int index, double viewportWidth, double minExtent, double maxExtent) {
    if (!widget.isScrollable) return 0.0;
    double tabCenter = _indicatorPainter.centerOf(index);
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        tabCenter = _tabStripWidth - tabCenter;
        break;
      case TextDirection.ltr:
        break;
    }
    return (tabCenter - viewportWidth / 2.0).clamp(minExtent, maxExtent);
  }

  double _tabCenteredScrollOffset(int index) {
    if (null == _scrollController) return 0.0;
    final ScrollPosition position = _scrollController.position;
    if (null == position) return 0.0;
    return _tabScrollOffset(index, position.viewportDimension, position.minScrollExtent, position.maxScrollExtent);
  }

  double _initialScrollOffset(double viewportWidth, double minExtent, double maxExtent) {
    return _tabScrollOffset(_currentIndex, viewportWidth, minExtent, maxExtent);
  }

  void _scrollToCurrentIndex() {
    final double offset = _tabCenteredScrollOffset(_currentIndex);
    _scrollController.animateTo(offset, duration: kTabScrollDuration, curve: Curves.ease);
  }

  void _scrollToControllerValue() {
    try {
      final double leadingPosition = _currentIndex > 0 ? _tabCenteredScrollOffset(_currentIndex - 1) : null;
      final double middlePosition = _tabCenteredScrollOffset(_currentIndex);
      final double trailingPosition = _currentIndex < maxTabIndex ? _tabCenteredScrollOffset(_currentIndex + 1) : null;

      final double index = _controller.index.toDouble();
      final double value = _controller.animation.value;
      double offset;
      if (value == index - 1.0)
        offset = leadingPosition ?? middlePosition;
      else if (value == index + 1.0)
        offset = trailingPosition ?? middlePosition;
      else if (value == index)
        offset = middlePosition;
      else if (value < index)
        offset = leadingPosition == null ? middlePosition : lerpDouble(middlePosition, leadingPosition, index - value);
      else
        offset = trailingPosition == null ? middlePosition : lerpDouble(middlePosition, trailingPosition, value - index);

      _scrollController.jumpTo(offset);
    } catch (e, s) {
      print("$e, \n $s");
    }
  }

  void _handleTabControllerAnimationTick() {
    assert(mounted);
    if (!_controller.indexIsChanging && widget.isScrollable) {
      // Sync the TabBar's scroll position with the TabBarView's PageView.
      _currentIndex = _controller.index;
      _scrollToControllerValue();
    }
  }

  void _handleTabControllerTick() {
    if (_controller.index != _currentIndex) {
      _currentIndex = _controller.index;
      if (widget.isScrollable) _scrollToCurrentIndex();
    }
    setState(() {
      // Rebuild the tabs after a (potentially animated) index change
      // has completed.
    });
  }

  // Called each time layout completes.
  void _saveTabOffsets(List<double> tabOffsets, TextDirection textDirection, double width) {
    _tabStripWidth = width;
    _indicatorPainter?.saveTabOffsets(tabOffsets, textDirection);
  }

  void _handleTap(int index) {
    assert(index >= 0 && index < widget.tabs.length);
    _controller.animateTo(index);
    if (widget.onTap != null) {
      widget.onTap(index);
    }
  }

  Widget _buildStyledTab(Widget child, bool selected, Animation<double> animation) {
    return _TabStyle(
      animation: animation,
      selected: selected,
      labelColor: widget.labelColor,
      unselectedLabelColor: widget.unselectedLabelColor,
      labelStyle: widget.labelStyle,
      unselectedLabelStyle: widget.unselectedLabelStyle,
      countColor: widget.countColor,
      unselectedCountColor: widget.unselectedCountColor,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (_controller.length != widget.tabs.length) {
        throw FlutterError('Controller\'s length property (${_controller.length}) does not match the \n'
            'number of tabs (${widget.tabs.length}) present in TabBar\'s tabs property.');
      }
      return true;
    }());
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    if (_controller.length == 0) {
      return Container(
        height: _kTabHeight + widget.indicatorWeight + widget.indicatorPadding.vertical,
      );
    }

    final TabBarTheme tabBarTheme = TabBarTheme.of(context);

    final List<Widget> wrappedTabs = List<Widget>(widget.tabs.length);
    for (int i = 0; i < widget.tabs.length; i += 1) {
      if (!widget.showCount) {
        wrappedTabs[i] = Center(
          heightFactor: 1,
          child: Padding(
            padding: widget.labelPadding ?? tabBarTheme.labelPadding ?? kTabLabelPadding,
            child: KeyedSubtree(
              key: _tabKeys[i],
              child: widget.tabs[i],
            ),
          ),
        );
      } else {
        String count;
        ScTab aiTab;
        TextStyle countStyle;
        if (widget.tabs[i] is ScTab) {
          aiTab = widget.tabs[i] as ScTab;
          count = aiTab.count;
          TextStyle style = aiTab.countStyle;
          if (style != null) {
            countStyle = style;
          } else {
            countStyle = TextStyle(fontSize: 12.0);
          }
        }
        wrappedTabs[i] = Container(
          alignment: Alignment(0, 1),
          child: Padding(
            padding: widget.labelPadding ?? tabBarTheme.labelPadding ?? kTabLabelPadding,
            child: KeyedSubtree(
              key: _tabKeys[i],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  widget.tabs[i],
                  count == null
                      ? Container()
                      : Container(
                          margin: aiTab.countMargin??EdgeInsets.only(left: 1 ),
                          child: ClipOval(
                            child: Container(
                              height: aiTab.countContainerSize.height??10,
                              width: aiTab.countContainerSize.width??10,
                              alignment: Alignment(0, 0),
                              color:  aiTab.countBackgroundColor,
                              child: Text(count, style: countStyle),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      }
    }

    // If the controller was provided by DefaultTabController and we're part
    // of a Hero (typically the AppBar), then we will not be able to find the
    // controller during a Hero transition. See https://github.com/flutter/flutter/issues/213.
    if (_controller != null) {
      final int previousIndex = _controller.previousIndex;
      if (_controller.indexIsChanging) {
        // The user tapped on a tab, the tab controller's animation is running.
        assert(_currentIndex != previousIndex);
        final Animation<double> animation = _ChangeAnimation(_controller);
        wrappedTabs[_currentIndex] = _buildStyledTab(wrappedTabs[_currentIndex], true, animation);
        wrappedTabs[previousIndex] = _buildStyledTab(wrappedTabs[previousIndex], false, animation);
      } else {
        // The user is dragging the TabBarView's PageView left or right.
        final int tabIndex = _currentIndex;
        final Animation<double> centerAnimation = _DragAnimation(_controller, tabIndex);
        wrappedTabs[tabIndex] = _buildStyledTab(wrappedTabs[tabIndex], true, centerAnimation);
        if (_currentIndex > 0) {
          final int tabIndex = _currentIndex - 1;
          final Animation<double> previousAnimation = ReverseAnimation(_DragAnimation(_controller, tabIndex));
          wrappedTabs[tabIndex] = _buildStyledTab(wrappedTabs[tabIndex], false, previousAnimation);
        }
        if (_currentIndex < widget.tabs.length - 1) {
          final int tabIndex = _currentIndex + 1;
          final Animation<double> nextAnimation = ReverseAnimation(_DragAnimation(_controller, tabIndex));
          wrappedTabs[tabIndex] = _buildStyledTab(wrappedTabs[tabIndex], false, nextAnimation);
        }
      }
    }

    // Add the tap handler to each tab. If the tab bar is not scrollable,
    // then give all of the tabs equal flexibility so that they each occupy
    // the same share of the tab bar's overall width.
    final int tabCount = widget.tabs.length;
    for (int index = 0; index < tabCount; index += 1) {
      wrappedTabs[index] = GestureDetector(
        onTap: () {
          _handleTap(index);
        },
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: widget.type == ScTabType.none ? EdgeInsets.zero : EdgeInsets.only(bottom: widget.indicatorWeight),
            child: Stack(
              children: <Widget>[
                wrappedTabs[index],
                Semantics(
                  selected: index == _currentIndex,
                  label: localizations.tabLabel(tabIndex: index + 1, tabCount: tabCount),
                ),
              ],
            ),
          ),
        ),
      );
      if (!widget.isScrollable) wrappedTabs[index] = Expanded(child: wrappedTabs[index]);
    }

    Widget tabBar = CustomPaint(
      painter: widget.type == ScTabType.none ? EmptyCustomPainter() : _indicatorPainter,
      child: _TabStyle(
        animation: kAlwaysDismissedAnimation,
        selected: false,
        labelColor: widget.labelColor,
        unselectedLabelColor: widget.unselectedLabelColor,
        labelStyle: widget.labelStyle,
        unselectedLabelStyle: widget.unselectedLabelStyle,
        countColor: widget.countColor,
        unselectedCountColor: widget.unselectedCountColor,
        child: Container(
          height: widget.tabHeight + widget.indicatorWeight,
          child: Align(
            alignment: widget.tabIndicatorAlignment ?? Alignment.center,
            child: _TabLabelBar(
              onPerformLayout: _saveTabOffsets,
              children: wrappedTabs,
            ),
          ),
        ),
      ),
    );

    if (widget.isScrollable) {
      _scrollController ??= _TabBarScrollController(this);
      tabBar = SingleChildScrollView(
        dragStartBehavior: widget.dragStartBehavior,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: tabBar,
      );
    }

    return Container(
      alignment: widget.tabAlignment ?? Alignment.center,
      padding: widget.type == ScTabType.none ? EdgeInsets.zero : widget.indicatorPadding,
      child: tabBar,
    );
  }
}

class EmptyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// Displays a single circle with the specified border and background colors.
///
/// Used by [TabPageSelector] to indicate the selected page.
class TabPageSelectorIndicator extends StatelessWidget {
  /// Creates an indicator used by [TabPageSelector].
  ///
  /// The [backgroundColor], [borderColor], and [size] parameters must not be null.
  const TabPageSelectorIndicator({
    Key key,
    @required this.backgroundColor,
    @required this.borderColor,
    @required this.size,
  })  : assert(backgroundColor != null),
        assert(borderColor != null),
        assert(size != null),
        super(key: key);

  /// The indicator circle's background color.
  final Color backgroundColor;

  /// The indicator circle's border color.
  final Color borderColor;

  /// The indicator circle's diameter.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Displays a row of small circular indicators, one per tab.
///
/// The selected tab's indicator is highlighted. Often used in conjunction with
/// a [TabBarView].
///
/// If a [TabController] is not provided, then there must be a
/// [DefaultTabController] ancestor.
class TabPageSelector extends StatelessWidget {
  /// Creates a compact widget that indicates which tab has been selected.
  const TabPageSelector({
    Key key,
    this.controller,
    this.indicatorSize = 12.0,
    this.color,
    this.selectedColor,
  })  : assert(indicatorSize != null && indicatorSize > 0.0),
        super(key: key);

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of
  /// [DefaultTabController.of] will be used.
  final TabController controller;

  /// The indicator circle's diameter (the default value is 12.0).
  final double indicatorSize;

  /// The indicator circle's fill color for unselected pages.
  ///
  /// If this parameter is null, then the indicator is filled with [Colors.transparent].
  final Color color;

  /// The indicator circle's fill color for selected pages and border color
  /// for all indicator circles.
  ///
  /// If this parameter is null, then the indicator is filled with the theme's
  /// accent color, [ThemeData.accentColor].
  final Color selectedColor;

  Widget _buildTabIndicator(
    int tabIndex,
    TabController tabController,
    ColorTween selectedColorTween,
    ColorTween previousColorTween,
  ) {
    Color background;
    if (tabController.indexIsChanging) {
      // The selection's animation is animating from previousValue to value.
      final double t = 1.0 - _indexChangeProgress(tabController);
      if (tabController.index == tabIndex)
        background = selectedColorTween.lerp(t);
      else if (tabController.previousIndex == tabIndex)
        background = previousColorTween.lerp(t);
      else
        background = selectedColorTween.begin;
    } else {
      // The selection's offset reflects how far the TabBarView has / been dragged
      // to the previous page (-1.0 to 0.0) or the next page (0.0 to 1.0).
      final double offset = tabController.offset;
      if (tabController.index == tabIndex) {
        background = selectedColorTween.lerp(1.0 - offset.abs());
      } else if (tabController.index == tabIndex - 1 && offset > 0.0) {
        background = selectedColorTween.lerp(offset);
      } else if (tabController.index == tabIndex + 1 && offset < 0.0) {
        background = selectedColorTween.lerp(-offset);
      } else {
        background = selectedColorTween.begin;
      }
    }
    return TabPageSelectorIndicator(
      backgroundColor: background,
      borderColor: selectedColorTween.end,
      size: indicatorSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color fixColor = color ?? Colors.transparent;
    final Color fixSelectedColor = selectedColor ?? Color(0xffFED980);
    final ColorTween selectedColorTween = ColorTween(begin: fixColor, end: fixSelectedColor);
    final ColorTween previousColorTween = ColorTween(begin: fixSelectedColor, end: fixColor);
    final TabController tabController = controller ?? DefaultTabController.of(context);
    assert(() {
      if (tabController == null) {
        throw FlutterError('No TabController for $runtimeType.\n'
            'When creating a $runtimeType, you must either provide an explicit TabController '
            'using the "controller" property, or you must ensure that there is a '
            'DefaultTabController above the $runtimeType.\n'
            'In this case, there was neither an explicit controller nor a default controller.');
      }
      return true;
    }());
    final Animation<double> animation = CurvedAnimation(
      parent: tabController.animation,
      curve: Curves.fastOutSlowIn,
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Semantics(
          label: 'Page ${tabController.index + 1} of ${tabController.length}',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(tabController.length, (int tabIndex) {
              return _buildTabIndicator(tabIndex, tabController, selectedColorTween, previousColorTween);
            }).toList(),
          ),
        );
      },
    );
  }
}

/// Used with [TabBar.indicator] to draw a horizontal line below the
/// selected tab.
///
/// The selected tab underline is inset from the tab's boundary by [insets].
/// The [borderSide] defines the line's color and weight.
///
/// The [TabBar.indicatorSize] property can be used to define the indicator's
/// bounds in terms of its (centered) widget with [TabIndicatorSize.label],
/// or the entire tab with [TabIndicatorSize.tab].
class UnderScTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const UnderScTabIndicator(
      {this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
      this.insets = EdgeInsets.zero,
      this.type,
      this.colors,
      this.indicatorFlat})
      : assert(borderSide != null),
        assert(insets != null);
  final ScTabType type;
  final List<Color> colors;

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  final bool indicatorFlat;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is UnderScTabIndicator) {
      return UnderScTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        type: type,
        colors: colors,
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is UnderScTabIndicator) {
      return UnderScTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        type: type,
        colors: colors,
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, type, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, this.type, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final UnderScTabIndicator decoration;
  final ScTabType type;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    double width = 20.0;
    double cw = (indicator.left + indicator.right) / 2.0;
    return Rect.fromLTWH(
      cw - width / 2.0,
      indicator.bottom - borderSide.width,
      width,
      borderSide.width,
    );
    // return Rect.fromLTWH(
    //   indicator.left,
    //   indicator.bottom - borderSide.width,
    //   indicator.width,
    //   borderSide.width,
    // );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator = _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    ScTabbarIndicatorPainterFactory.create(type).paint(rect, offset, canvas, textDirection, indicator, borderSide, insets, decoration, configuration);
  }
}
