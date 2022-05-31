/// @author king
/// @date 2020-12-06
/// 居于Refresh改的下拉刷新
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'sc_refresh_container_renderobject.dart';

typedef ScRefreshHeadViewBuilder = Widget Function(
    BuildContext context, double value, RefreshIndicatorMode freshStatus);

// The over-scroll distance that moves the indicator to its maximum
// displacement, as a percentage of the scrollable's container extent.
const double _kDragContainerExtentPercentage = 0.11;

// How much the scroll's drag gesture can overshoot the RefreshIndicator's
// displacement; max displacement = _kDragSizeFactorLimit * disp`lacement.
const double _kDragSizeFactorLimit = 1;

// When the scroll ends, the duration of the refresh indicator's animation
// to the RefreshIndicator's displacement.
const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);

// The duration of the ScaleTransition that starts when the refresh action
// has completed.
const Duration _kIndicatorScaleDuration = Duration(milliseconds: 300);

/// The signature for a function that's called when the user has dragged a
/// [AiNestedScrollViewRefreshIndicator] far enough to demonstrate that they want the app to
/// refresh. The returned [Future] must complete when the refresh operation is
/// finished.
///
/// Used by [AiNestedScrollViewRefreshIndicator.onRefresh].
typedef ScRefreshViewRefreshCallback = Future<void> Function();

// The state machine moves through these modes only when the scrollable
// identified by scrollableKey has been scrolled to its min or max limit.
enum RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
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
/// always scrollable and, therefore, can trigger the [AiNestedScrollViewRefreshIndicator].
///
/// A [AiNestedScrollViewRefreshIndicator] can only be used with a vertical scroll view.
///
/// See also:
///
///  * <https://material.google.com/patterns/swipe-to-refresh.html>
///  * [AiNestedScrollViewRefreshIndicatorState], can be used to programmatically show the refresh indicator.
///  * [RefreshProgressIndicator], widget used by [AiNestedScrollViewRefreshIndicator] to show
///    the inner circular progress spinner during refreshes.
///  * [CupertinoSliverRefreshControl], an iOS equivalent of the pull-to-refresh pattern.
///    Must be used as a sliver inside a [CustomScrollView] instead of wrapping
///    around a [ScrollView] because it's a part of the scrollable instead of
///    being overlaid on top of it.
class ScRefreshView extends StatefulWidget {
  /// Creates a refresh indicator.
  ///
  /// The [onRefresh], [child], and [notificationPredicate] arguments must be
  /// non-null. The default
  /// [displacement] is 40.0 logical pixels.
  const ScRefreshView({
    Key key,
    @required this.child,
    this.displacement = 40.0,
    @required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = ScRefreshViewPredicate,
    this.semanticsLabel,
    this.freshHeaderBuilder,
    this.semanticsValue,
    this.loadingWidget,
    this.controller,
    this.onPullDown,
    this.maxWaitTime, //刷新最大等待时间
    this.isStack = false,
  })  : assert(child != null),
        assert(onRefresh != null),
        assert(notificationPredicate != null),
        super(key: key);

  final ScRefreshHeadViewBuilder freshHeaderBuilder;
  final ScRefreshViewController controller;
  final bool isStack;
  final int maxWaitTime;
  final VoidCallback onPullDown;

  /// The widget below this widget in the tree.
  ///
  /// The refresh indicator will be stacked on top of this child. The indicator
  /// will appear when child's Scrollable descendant is over-scrolled.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;
  final Widget loadingWidget;

  /// The distance from the child's top or bottom edge to where the refresh
  /// indicator will settle. During the drag that exposes the refresh indicator,
  /// its actual displacement may significantly exceed this value.
  final double displacement;

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh. The returned
  /// [Future] must complete when the refresh operation is finished.
  final ScRefreshViewRefreshCallback onRefresh;

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

  @override
  ScRefreshViewState createState() => ScRefreshViewState();
}

class ScRefreshViewController {
  ScRefreshViewState _state;

  //是否被父节点拦截了
  bool isParentIntercept = false;

  void bind(ScRefreshViewState state) {
    _state = state;
  }

  void unbind() {
    _state = null;
  }

  Future autoRefresh() {
    if (_state?.mounted ?? false) {
      return _state?.show();
    }
    return null;
  }
}

/// Contains the state for a [AiNestedScrollViewRefreshIndicator]. This class can be used to
/// programmatically show the refresh indicator, see the [show] method.
class ScRefreshViewState extends State<ScRefreshView>
    with TickerProviderStateMixin<ScRefreshView> {
  AnimationController _positionController;
  AnimationController _scaleController;
  Animation<double> _positionFactor;
  Animation<double> _scaleFactor;
  Animation<double> _value;
  Animation<Color> _valueColor;

  RefreshIndicatorMode _mode;
  Future<void> _pendingRefreshFuture;
  bool _isIndicatorAtTop;
  double _dragOffset;

  static final Animatable<double> _threeQuarterTween =
  Tween<double>(begin: 0.0, end: 0.75);
  static final Animatable<double> _kDragSizeFactorLimitTween =
  Tween<double>(begin: 0.0, end: _kDragSizeFactorLimit);
  static final Animatable<double> _oneToZeroTween =
  Tween<double>(begin: 1.0, end: 0.0);

  @override
  void initState() {
    widget.controller?.bind(this);

    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _value = _positionController.drive(
        _threeQuarterTween); // The "value" of the circular progress indicator during a drag.

    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _valueColor = _positionController.drive(
      ColorTween(
          begin: (widget.color ?? theme.colorScheme.secondary).withOpacity(0.0),
          end: (widget.color ?? theme.colorScheme.secondary).withOpacity(1.0))
          .chain(CurveTween(
          curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit))),
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ScRefreshView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget?.controller != widget?.controller) {
      oldWidget.controller?.unbind();
      widget.controller?.bind(this);
    }
  }

  @override
  void dispose() {
    widget.controller?.unbind();
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  double maxContainerExtent = 0.0;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    maxContainerExtent =
        math.max(notification.metrics.viewportDimension, maxContainerExtent);
    if (notification is ScrollStartNotification &&
        notification.metrics.extentBefore == 0.0 &&
        _mode == null &&
        _start(notification.metrics.axisDirection)) {
      setState(() {
        _mode = RefreshIndicatorMode.drag;
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
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed ||
          isParentIntercept) _dismiss(RefreshIndicatorMode.canceled);
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed) {
        if (notification.metrics.extentBefore > 0.0) {
          _dismiss(RefreshIndicatorMode.canceled);
        } else {
          _dragOffset -= notification.scrollDelta;
          _checkDragOffset(maxContainerExtent);
        }
      }
      if (_mode == RefreshIndicatorMode.armed &&
          notification.dragDetails == null) {
        // On iOS start the refresh when the Scrollable bounces back from the
        // overscroll (ScrollNotification indicating this don't have dragDetails
        // because the scroll activity is not directly triggered by a drag).
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed) {
        _dragOffset -= notification.overscroll / 2.0;
        _checkDragOffset(maxContainerExtent);
      }
    } else if (notification is ScrollEndNotification) {
      if (isParentIntercept) {
        _dismiss(RefreshIndicatorMode.canceled);
        return false;
      }
      switch (_mode) {
        case RefreshIndicatorMode.armed:
          _show();
          break;
        case RefreshIndicatorMode.drag:
          _dismiss(RefreshIndicatorMode.canceled);
          break;
        default:
        // do nothing
          break;
      }
    }
    return false;
  }

  bool get isParentIntercept => widget.controller?.isParentIntercept ?? false;

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading || isParentIntercept) {
      return false;
    }
    if (_mode == RefreshIndicatorMode.drag) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    //父节点拦截后，不允许拖拽
    if (isParentIntercept) {
      return false;
    }
    assert(_mode == null);
    assert(_isIndicatorAtTop == null);
    assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
        _isIndicatorAtTop = true;
        break;
      case AxisDirection.up:
        _isIndicatorAtTop = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        // we do not support horizontal scroll views.
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == RefreshIndicatorMode.drag ||
        _mode == RefreshIndicatorMode.armed);
    double newValue =
        _dragOffset / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == RefreshIndicatorMode.armed)
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    _positionController.value = newValue.clamp(0.0, 1.0) as double;
//    _scaleController.value = 1 - _positionController.value;
//    if (_scaleController.value > 0.7) {
//      _scaleController.value = 0.7;
//    }
    // this triggers various rebuilds
    if (_mode == RefreshIndicatorMode.drag && _valueColor.value.alpha == 0xFF)
      _mode = RefreshIndicatorMode.armed;
  }

  // Stop showing the refresh indicator.
  Future<void> _dismiss(RefreshIndicatorMode newMode) async {
    await Future<void>.value();
    // This can only be called from _show() when refreshing and
    // _handleScrollNotification in response to a ScrollEndNotification or
    // direction change.
    assert(newMode == RefreshIndicatorMode.canceled ||
        newMode == RefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode) {
      case RefreshIndicatorMode.done:
        await _scaleController.animateTo(1.0,
            duration: _kIndicatorScaleDuration);
        await _positionController.animateTo(0.0,
            duration: _kIndicatorSnapDuration);
        break;
      case RefreshIndicatorMode.canceled:
        await _positionController.animateTo(0.0,
            duration: _kIndicatorScaleDuration);
        break;
      default:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      _dragOffset = null;
      _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }

  void _show() async {
    assert(_mode != RefreshIndicatorMode.refresh);
    assert(_mode != RefreshIndicatorMode.snap);
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _mode = RefreshIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
        duration: _kIndicatorSnapDuration)
        .then<void>((void value) async {
      if (mounted && _mode == RefreshIndicatorMode.snap) {
        assert(widget.onRefresh != null);
        setState(() {
          // Show the indeterminate progress indicator.
          _mode = RefreshIndicatorMode.refresh;
        });
        //vibrateImpact();
        widget.onPullDown?.call();
        var onRefreshFuture = widget.onRefresh.call();
        Future refreshResult;
        var minTime = Future.delayed(Duration(seconds: 1));
        if (widget.maxWaitTime != null) {
          var onEndFuture =
          Future.delayed(Duration(seconds: widget.maxWaitTime));

          refreshResult = Future.wait([
            minTime,
            Future.any([onRefreshFuture, onEndFuture])
          ]);
        } else {
          refreshResult = Future.wait([minTime, onRefreshFuture]);
        }
        assert(() {
          if (refreshResult == null)
            FlutterError.reportError(FlutterErrorDetails(
              exception: FlutterError('The onRefresh callback returned null.\n'
                  'The RefreshIndicator onRefresh callback must return a Future.'),
              context: ErrorDescription('when calling onRefresh'),
              library: 'material library',
            ));
          return true;
        }());
        if (refreshResult == null) {
          return;
        }
        refreshResult.whenComplete(() {
          // if (mounted && _mode == RefreshIndicatorMode.refresh) {
          if (mounted) {
            completer.complete();
            _dismiss(RefreshIndicatorMode.done);
          }
        });
      }
    });
  }

  /// Show the refresh indicator and run the refresh callback as if it had
  /// been started interactively. If this method is called while the refresh
  /// callback is running, it quietly does nothing.
  ///
  /// Creating the [AiNestedScrollViewRefreshIndicator] with a [GlobalKey<RefreshIndicatorState>]
  /// makes it possible to refer to the [AiNestedScrollViewRefreshIndicatorState].
  ///
  /// The future returned from this method completes when the
  /// [AiNestedScrollViewRefreshIndicator.onRefresh] callback's future completes.
  ///
  /// If you await the future returned by this function from a [State], you
  /// should check that the state is still [mounted] before calling [setState].
  ///
  /// When initiated in this manner, the refresh indicator is independent of any
  /// actual scroll view. It defaults to showing the indicator at the top. To
  /// show it at the bottom, set `atTop` to false.
  Future<void> show({bool atTop = true}) {
    if (_mode != RefreshIndicatorMode.refresh &&
        _mode != RefreshIndicatorMode.snap) {
      if (_mode == null) {
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      }
      _show();
    }
    return _pendingRefreshFuture;
  }

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      key: _key,
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );
    if (_mode == null) {
      return child;
    }
    assert(_isIndicatorAtTop != null);

    return AnimatedBuilder(
      animation: _positionController,
      builder: (BuildContext context, Widget child1) {
        return ScFreshContainerRenderObject(
          translate: _value.value,
          isStack: widget.isStack,
          children: <Widget>[
            child,
            ScaleTransition(
              scale: _scaleFactor,
              child: widget.freshHeaderBuilder?.call(context, _value.value, _mode) ??
                  Container(),
            ),
          ],
        );
      },
    );
  }
}

//return true so that we can handle inner scroll notification
bool ScRefreshViewPredicate(ScrollNotification notification) {
  return true;
}
