


// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_nested_scroll_view.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// The over-scroll distance that moves the indicator to its maximum
// displacement, as a percentage of the scrollable's container extent.
const double _kDragContainerExtentPercentage = 0.11;

// How much the scroll's drag gesture can overshoot the AiRefreshIndicator's
// displacement; max displacement = _kDragSizeFactorLimit * displacement.
const double _kDragSizeFactorLimit = 1.5;

// When the scroll ends, the duration of the refresh indicator's animation
// to the AiRefreshIndicator's displacement.
const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);

// The duration of the ScaleTransition that starts when the refresh action
// has completed.
const Duration _kIndicatorScaleDuration = Duration(milliseconds: 300);

// The state machine moves through these modes only when the scrollable
// identified by scrollableKey has been scrolled to its min or max limit.
enum _RefreshIndicatorMode {
  drag,     // Pointer is down.
  armed,    // Dragged far enough that an up event will run the onRefresh callback.
  snap,     // Animating to the indicator's final "displacement".
  refresh,  // Running the refresh callback.
  done,     // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
}

/// A widget that supports the Material "swipe to refresh" idiom.
///
/// When the child's [Scrollable] descendant overscrolls, an animated circular
/// progress indicator is faded into view. When the scroll ends, if the
/// indicator has been dragged far enough for it to become completely opaque,
/// the [onRefresh] callback is called. The callback is expected to update the
/// scrollable's contents and then complete the [Future] it returns. The refresh
/// indicator disappears after the callback's [Future] has completed.
///
/// If the [Scrollable] might not have enough content to overscroll, consider
/// settings its `physics` property to [AlwaysScrollableScrollPhysics]:
///
/// ```dart
/// ListView(
///   physics: const AlwaysScrollableScrollPhysics(),
///   children: ...
//  )
/// ```
///
/// Using [AlwaysScrollableScrollPhysics] will ensure that the scroll view is
/// always scrollable and, therefore, can trigger the [AiRefreshIndicator].
///
/// A [AiRefreshIndicator] can only be used with a vertical scroll view.
///
/// See also:
///
///  * <https://material.io/design/platform-guidance/android-swipe-to-refresh.html>
///  * [AiRefreshIndicatorState], can be used to programmatically show the refresh indicator.
///  * [RefreshProgressIndicator], widget used by [AiRefreshIndicator] to show
///    the inner circular progress spinner during refreshes.
///  * [CupertinoSliverRefreshControl], an iOS equivalent of the pull-to-refresh pattern.
///    Must be used as a sliver inside a [CustomScrollView] instead of wrapping
///    around a [ScrollView] because it's a part of the scrollable instead of
///    being overlaid on top of it.
///
/// 这个过期了，兄弟，用[AiRefresh]代替 吧
@deprecated
class AiRefreshIndicator extends StatefulWidget {
  /// Creates a refresh indicator.
  ///
  /// The [onRefresh], [child], and [notificationPredicate] arguments must be
  /// non-null. The default
  /// [displacement] is 40.0 logical pixels.
  ///
  /// The [semanticsLabel] is used to specify an accessibility label for this widget.
  /// If it is null, it will be defaulted to [MaterialLocalizations.refreshIndicatorSemanticLabel].
  /// An empty string may be passed to avoid having anything read by screen reading software.
  /// The [semanticsValue] may be used to specify progress on the widget.
  const AiRefreshIndicator({
    Key key,
    @required this.child,
    this.displacement = 40.0,
    @required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.showHeader = true,
    this.waitingTime,
    this.isHideIndicator = false,
    this.isAlwayScroller = false,
  }) : assert(child != null),
       assert(onRefresh != null),
       assert(notificationPredicate != null),
       super(key: key);

  final bool isAlwayScroller;

  /// The widget below this widget in the tree.
  ///
  /// The refresh indicator will be stacked on top of this child. The indicator
  /// will appear when child's Scrollable descendant is over-scrolled.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;

  /// The distance from the child's top or bottom edge to where the refresh
  /// indicator will settle. During the drag that exposes the refresh indicator,
  /// its actual displacement may significantly exceed this value.
  final double displacement;

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh. The returned
  /// [Future] must complete when the refresh operation is finished.
  final RefreshCallback onRefresh;

  /// The progress indicator's foreground color. The current theme's
  /// [ThemeData.accentColor] by default.
  final Color color;

  /// The progress indicator's background color. The current theme's
  /// [ThemeData.canvasColor] by default.
  final Color backgroundColor;

  /// A check that specifies whether a [ScrollNotification] should be
  /// handled by this widget.
  ///
  /// By default, checks whether `notification.depth == 0`. Set it to something
  /// else for more complicated layouts.
  final ScrollNotificationPredicate notificationPredicate;

  /// {@macro flutter.material.progressIndicator.semanticsLabel}
  ///
  /// This will be defaulted to [MaterialLocalizations.refreshIndicatorSemanticLabel]
  /// if it is null.
  final String semanticsLabel;

  /// {@macro flutter.material.progressIndicator.semanticsValue}
  final String semanticsValue;

  final bool showHeader;
  //下拉刷新释放后等待时间
  final int waitingTime;

  final bool isHideIndicator;

  @override
  AiRefreshIndicatorState createState() => AiRefreshIndicatorState();
}

/// Contains the state for a [AiRefreshIndicator]. This class can be used to
/// programmatically show the refresh indicator, see the [show] method.
class AiRefreshIndicatorState extends State<AiRefreshIndicator> with TickerProviderStateMixin<AiRefreshIndicator> {
  AnimationController _positionController;
  AnimationController _scaleController;
  Animation<double> _positionFactor;
  Animation<double> _scaleFactor;
  Animation<double> _value;
  Animation<Color> _valueColor;

  _RefreshIndicatorMode _mode;
  Future<void> _pendingRefreshFuture;
  bool _isIndicatorAtTop;
  double _dragOffset;

  static final Animatable<double> _threeQuarterTween = Tween<double>(begin: 0.0, end: 0.75);
  static final Animatable<double> _kDragSizeFactorLimitTween = Tween<double>(begin: 0.0, end: _kDragSizeFactorLimit);
  static final Animatable<double> _oneToZeroTween = Tween<double>(begin: 1.0, end: 0.0);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(value:0.0, vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _value = _positionController.drive(_threeQuarterTween); // The "value" of the circular progress indicator during a drag.

    _scaleController = AnimationController(value:1, vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _valueColor = _positionController.drive(
      ColorTween(
        begin: (widget.color ?? theme.colorScheme.secondary).withOpacity(0.0),
        end: (widget.color ?? theme.colorScheme.secondary).withOpacity(1.0),
      ).chain(CurveTween(
        curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit)
      )),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {

    if (!widget.notificationPredicate(notification))
      return false;
    if (notification is ScrollStartNotification && notification.metrics.extentBefore == 0.0 &&
        _mode == null && _start(notification.metrics.axisDirection)) {
      setState(() {
        _mode = _RefreshIndicatorMode.drag;
      });
      return false;
    }
    bool indicatorAtTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
        indicatorAtTopNow = true;
        break;
      case AxisDirection.up:
        indicatorAtTopNow = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        indicatorAtTopNow = null;
        break;
    }
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_mode == _RefreshIndicatorMode.drag || _mode == _RefreshIndicatorMode.armed)
        _dismiss(_RefreshIndicatorMode.canceled);
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == _RefreshIndicatorMode.drag || _mode == _RefreshIndicatorMode.armed) {
        if (notification.metrics.extentBefore > 0.0) {
          _dismiss(_RefreshIndicatorMode.canceled);
        } else {
          _dragOffset -= notification.scrollDelta;
          _checkDragOffset(notification.metrics.viewportDimension);
        }
      }
      if (_mode == _RefreshIndicatorMode.armed && notification.dragDetails == null) {
        // On iOS start the refresh when the Scrollable bounces back from the
        // overscroll (ScrollNotification indicating this don't have dragDetails
        // because the scroll activity is not directly triggered by a drag).
        _show();
        _doVibrate();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == _RefreshIndicatorMode.drag || _mode == _RefreshIndicatorMode.armed) {
        _dragOffset -= notification.overscroll / 2.0;
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_mode) {
        case _RefreshIndicatorMode.armed:
          _show();
          _doVibrate();
          break;
        case _RefreshIndicatorMode.drag:
          _dismiss(_RefreshIndicatorMode.canceled);
          break;
        default:
          // do nothing
          break;
      }
    }
    return false;
  }

  void _doVibrate() {
    if (AiCache.get()?.getBool(AiCache.vibrate_setting) ?? true) {
      vibrateImpact();
    }
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading)
      return false;
    if (_mode == _RefreshIndicatorMode.drag) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_mode == null);
    // assert(_isIndicatorAtTop == null);
    // assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
        _isIndicatorAtTop = true;
        break;
      case AxisDirection.up:
        _isIndicatorAtTop = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        // _isIndicatorAtTop = null;
        // we do not support horizontal scroll views.
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == _RefreshIndicatorMode.drag || _mode == _RefreshIndicatorMode.armed);
    double newValue = _dragOffset / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == _RefreshIndicatorMode.armed)
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    _positionController.value = newValue.clamp(0.0, 1.0);
    _scaleController.value = 1- _positionController.value;
    if(_scaleController.value>0.7){
      _scaleController.value = 0.7;
    }

    // print('${_scaleController.value}');
    // this triggers various rebuilds
    if (_mode == _RefreshIndicatorMode.drag && _valueColor.value.alpha == 0xFF)
      _mode = _RefreshIndicatorMode.armed;
  }

  // Stop showing the refresh indicator.
  Future<void> _dismiss(_RefreshIndicatorMode newMode) async {
    await Future<void>.value();
    // This can only be called from _show() when refreshing and
    // _handleScrollNotification in response to a ScrollEndNotification or
    // direction change.
    assert(newMode == _RefreshIndicatorMode.canceled || newMode == _RefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode) {
      case _RefreshIndicatorMode.done:
        await _scaleController.animateTo(1.0, duration: _kIndicatorScaleDuration,curve: Curves.easeInOut);
        await _positionController.animateTo(0.0, duration: _kIndicatorScaleDuration,curve: Curves.easeInOut);
        break;
      case _RefreshIndicatorMode.canceled:
         _scaleController.animateTo(1.0, duration: _kIndicatorScaleDuration,curve: Curves.easeInOut);
         _positionController.animateTo(0.0, duration: _kIndicatorScaleDuration,curve: Curves.easeInOut);
        break;
      default:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      // _dragOffset = null;
      // _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }


  Future<void> cancel()async {
    if(mounted){
     await _dismiss(_RefreshIndicatorMode.canceled);
    }
  }


  void _show() {
    assert(_mode != _RefreshIndicatorMode.refresh);
    assert(_mode != _RefreshIndicatorMode.snap);
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _mode = _RefreshIndicatorMode.snap;
    _positionController
      .animateTo(1.0 / _kDragSizeFactorLimit, duration: _kIndicatorSnapDuration)
      .then<void>((void value) async{
        if (mounted && _mode == _RefreshIndicatorMode.snap) {
          assert(widget.onRefresh != null);
          setState(() {
            // Show the indeterminate progress indicator.
            _mode = _RefreshIndicatorMode.refresh;
          });
          if (!widget.isHideIndicator) {
            await sleep(widget.waitingTime ?? 1000);
          }

          final Future<void> refreshResult = widget.onRefresh();
          
          assert(() {
            if (refreshResult == null)
              FlutterError.reportError(FlutterErrorDetails(
                exception: FlutterError(
                  'The onRefresh callback returned null.\n'
                  'The AiRefreshIndicator onRefresh callback must return a Future.'
                ),
                context: ErrorDescription('when calling onRefresh'),
                library: 'material library',
              ));
            return true;
          }());
          if (refreshResult == null)
            return;
          final Future timeoutFuture = Future.delayed(Duration(seconds: 10));
          final waitFuture = Future.any([refreshResult,timeoutFuture]);

          waitFuture.whenComplete(() async {
            if (mounted && _mode == _RefreshIndicatorMode.refresh) {
              completer.complete();
              _dismiss(_RefreshIndicatorMode.done);
            }
          });
        }
      });
  }

  /// Show the refresh indicator and run the refresh callback as if it had
  /// been started interactively. If this method is called while the refresh
  /// callback is running, it quietly does nothing.
  ///
  /// Creating the [AiRefreshIndicator] with a [GlobalKey<AiRefreshIndicatorState>]
  /// makes it possible to refer to the [AiRefreshIndicatorState].
  ///
  /// The future returned from this method completes when the
  /// [AiRefreshIndicator.onRefresh] callback's future completes.
  ///
  /// If you await the future returned by this function from a [State], you
  /// should check that the state is still [mounted] before calling [setState].
  ///
  /// When initiated in this manner, the refresh indicator is independent of any
  /// actual scroll view. It defaults to showing the indicator at the top. To
  /// show it at the bottom, set `atTop` to false.
  Future<void> show({ bool atTop = true }) {
    if (_mode != _RefreshIndicatorMode.refresh &&
        _mode != _RefreshIndicatorMode.snap) {
      if (_mode == null)
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      _show();
    }
    return _pendingRefreshFuture;
  }

  bool isFreshing(){
    return _mode == _RefreshIndicatorMode.refresh;
  }


  @override
  Widget build(BuildContext context) {

    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );

    // assert(_dragOffset != null);
    // assert(_isIndicatorAtTop != null);

    final bool showIndeterminateIndicator =
      _mode == _RefreshIndicatorMode.refresh || _mode == _RefreshIndicatorMode.done || _mode == _RefreshIndicatorMode.drag;

    if (widget.isHideIndicator) {
      return child;
    }
    return AiNestedScrollView(
      alwayScroll: widget.isAlwayScroller ?? false,
      headerSliverBuilder: (context, isInnerHeaderScroller){
        return [
          SliverList(
            delegate: SliverChildListDelegate([
             SizeTransition(
               // axisAlignment: _isIndicatorAtTop ? 1.0 : -1.0,
                sizeFactor: _positionFactor, // this is what brings it down
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                   alignment: Alignment.center,
//                  alignment: _isIndicatorAtTop
//                      ? Alignment.topCenter
//                      : Alignment.center,
                  child: ScaleTransition(
                    scale: _scaleFactor,
                    child: AnimatedBuilder(
                      animation: _positionController,
                      builder: (BuildContext context, Widget child) {
                        if(widget.showHeader){
                          return !showIndeterminateIndicator ? SizedBox() : LoadingCircular();
                        } else {
                          return Container(height: 30,child: !showIndeterminateIndicator ? SizedBox() : LoadingCircular(),);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ];
      },
      body: child,
    );
  }



}
