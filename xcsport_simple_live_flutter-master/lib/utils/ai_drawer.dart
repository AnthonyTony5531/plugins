/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-1
 * 添加Drawer的滑动拉出
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/




// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:fast_ai/config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;


/// The possible alignments of a [AiDrawer].
enum AiDrawerAlignment {
  /// Denotes that the [AiDrawer] is at the start side of the [Scaffold].
  ///
  /// This corresponds to the left side when the text direction is left-to-right
  /// and the right side when the text direction is right-to-left.
  start,

  /// Denotes that the [AiDrawer] is at the end side of the [Scaffold].
  ///
  /// This corresponds to the right side when the text direction is left-to-right
  /// and the left side when the text direction is right-to-left.
  end,
}

// TODO(eseidel): Draw width should vary based on device size:
// https://material.io/design/components/navigation-drawer.html#specs

// Mobile:
// Width = Screen width − 56 dp
// Maximum width: 320dp
// Maximum width applies only when using a left nav. When using a right nav,
// the panel can cover the full width of the screen.

// Desktop/Tablet:
// Maximum width for a left nav is 400dp.
// The right nav can vary depending on content.

const double _kWidth = 304.0;
const double _kEdgeDragWidth = 20.0;
const double _kMinFlingVelocity = 365.0;
const Duration _kBaseSettleDuration = Duration(milliseconds: 246);

/// A material design panel that slides in horizontally from the edge of a
/// [Scaffold] to show navigation links in an application.
///
/// AiDrawers are typically used with the [Scaffold.drawer] property. The child of
/// the drawer is usually a [ListView] whose first child is a [AiDrawerHeader]
/// that displays status information about the current user. The remaining
/// drawer children are often constructed with [ListTile]s, often concluding
/// with an [AboutListTile].
///
/// An open drawer can be closed by calling [Navigator.pop]. For example
/// a drawer item might close the drawer when tapped:
///
/// ```dart
/// ListTile(
///   leading: Icon(Icons.change_history),
///   title: Text('Change history'),
///   onTap: () {
///     // change app state...
///     AiRouter.pop(context); // close the drawer
///   },
/// );
/// ```
///
/// The [AppBar] automatically displays an appropriate [IconButton] to show the
/// [AiDrawer] when a [AiDrawer] is available in the [Scaffold]. The [Scaffold]
/// automatically handles the edge-swipe gesture to show the drawer.
///
/// See also:
///
///  * [Scaffold.drawer], where one specifies a [AiDrawer] so that it can be
///    shown.
///  * [Scaffold.of], to obtain the current [ScaffoldState], which manages the
///    display and animation of the drawer.
///  * [ScaffoldState.openAiDrawer], which displays its [AiDrawer], if any.
///  * <https://material.io/design/components/navigation-drawer.html>
class AiDrawer extends StatelessWidget {
  /// Creates a material design drawer.
  ///
  /// Typically used in the [Scaffold.drawer] property.
  ///
  /// The [elevation] must be non-negative.
  const AiDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.fullScreen = false
  }) : assert(elevation != null && elevation >= 0.0),
       super(key: key);


  final bool fullScreen;
  /// The z-coordinate at which to place this drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  ///
  /// Defaults to 16, the appropriate elevation for drawers. The value is
  /// always non-negative.
  final double elevation;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [SliverList].
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  ///
  /// If this label is not provided, it will default to
  /// [MaterialLocalizations.drawerLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = semanticLabel;
    double drawerWidth = this.fullScreen ? MediaQuery.of(context).size.width : _kWidth;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
        break;
      default :
        label = semanticLabel;
    }
    return  Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        // constraints: BoxConstraints.expand(width: deviceWidth),
        constraints: BoxConstraints.expand(width: drawerWidth), // 19-12-25 modified by eric add new feature
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}

/// Signature for the callback that's called when a [AiDrawerController] is
/// opened or closed.
typedef AiDrawerCallback = void Function(bool isOpened);

/// Provides interactive behavior for [AiDrawer] widgets.
///
/// Rarely used directly. AiDrawer controllers are typically created automatically
/// by [Scaffold] widgets.
///
/// The draw controller provides the ability to open and close a drawer, either
/// via an animation or via user interaction. When closed, the drawer collapses
/// to a translucent gesture detector that can be used to listen for edge
/// swipes.
///
/// See also:
///
///  * [AiDrawer], a container with the default width of a drawer.
///  * [Scaffold.drawer], the [Scaffold] slot for showing a drawer.
class AiDrawerController extends StatefulWidget {
  /// Creates a controller for a [AiDrawer].
  ///
  /// Rarely used directly.
  ///
  /// The [child] argument must not be null and is typically a [AiDrawer].
  const AiDrawerController({
    GlobalKey key,
    @required this.child,
    @required this.alignment,
    this.drawerCallback,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrimColor,
    this.edgeDragWidth,
  }) : assert(child != null),
       assert(dragStartBehavior != null),
       assert(alignment != null),
       super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// Typically a [AiDrawer].
  final Widget child;

  /// The alignment of the [AiDrawer].
  ///
  /// This controls the direction in which the user should swipe to open and
  /// close the drawer.
  final AiDrawerAlignment alignment;

  /// Optional callback that is called when a [AiDrawer] is opened or closed.
  final AiDrawerCallback drawerCallback;

  /// {@template flutter.material.drawer.dragStartBehavior}
  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], the drag behavior used for opening
  /// and closing a drawer will begin upon the detection of a drag gesture. If
  /// set to [DragStartBehavior.down] it will begin when a down event is first
  /// detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for
  ///    the different behaviors.
  ///
  /// {@endtemplate}
  final DragStartBehavior dragStartBehavior;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// By default, the color used is [Colors.black54]
  final Color scrimColor;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.of(context).padding` that corresponds to [alignment].
  /// This ensures that the drag area for notched devices is not obscured. For
  /// example, if [alignment] is set to [AiDrawerAlignment.start] and
  /// `TextDirection.of(context)` is set to [TextDirection.ltr],
  /// 20.0 will be added to `MediaQuery.of(context).padding.left`.
  final double edgeDragWidth;

  @override
  AiDrawerControllerState createState() => AiDrawerControllerState();
}

/// State for a [AiDrawerController].
///
/// Typically used by a [Scaffold] to [open] and [close] the drawer.
class AiDrawerControllerState extends State<AiDrawerController> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _scrimColorTween = _buildScrimColorTween();
    _controller = AnimationController(duration: _kBaseSettleDuration, vsync: this)
      ..addListener(_animationChanged)
      ..addStatusListener(_animationStatusChanged);
  }

  @override
  void dispose() {
    _historyEntry?.remove();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AiDrawerController oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrimColor != oldWidget.scrimColor)
      _scrimColorTween = _buildScrimColorTween();
  }

  void _animationChanged() {
    setState(() {
      // The animation controller's state is our build state, and it changed already.
    });
  }

  LocalHistoryEntry _historyEntry;
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  void _ensureHistoryEntry() {
    if (_historyEntry == null) {
      final ModalRoute<dynamic> route = ModalRoute.of(context);
      if (route != null) {
        _historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        route.addLocalHistoryEntry(_historyEntry);
        FocusScope.of(context).setFirstFocus(_focusScopeNode);
      }
    }
  }

  void _animationStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        _ensureHistoryEntry();
        break;
      case AnimationStatus.reverse:
        _historyEntry?.remove();
        _historyEntry = null;
        break;
      case AnimationStatus.dismissed:
        break;
      case AnimationStatus.completed:
        break;
    }
  }

  void _handleHistoryEntryRemoved() {
    _historyEntry = null;
    close();
  }

  AnimationController _controller;
  AnimationController get animationController{
    return _controller;
  }

  void _handleDragDown(DragDownDetails details) {
    _controller.stop();
    _ensureHistoryEntry();
  }

  void _handleDragCancel() {
    if (_controller.isDismissed || _controller.isAnimating)
      return;
    if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  final GlobalKey _drawerKey = GlobalKey();

  double get _width {
    final RenderBox box = _drawerKey.currentContext?.findRenderObject();
    if (box != null)
      return box.size.width;
    // return _kWidth; // drawer not being shown currently
    return config.device.size.width; // // 19-12-25 modified by eric add new feature
  }

  bool _previouslyOpened = false;

  void _move(DragUpdateDetails details) {
    double delta = details.primaryDelta / _width;
    switch (widget.alignment) {
      case AiDrawerAlignment.start:
        break;
      case AiDrawerAlignment.end:
        delta = -delta;
        break;
    }
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        _controller.value -= delta;
        break;
      case TextDirection.ltr:
        _controller.value += delta;
        break;
    }

    final bool opened = _controller.value > 0.5;
    if (opened != _previouslyOpened && widget.drawerCallback != null)
      widget.drawerCallback(opened);
    _previouslyOpened = opened;
  }

  void _settle(DragEndDetails details) {
    if (_controller.isDismissed)
      return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / _width;
      switch (widget.alignment) {
        case AiDrawerAlignment.start:
          break;
        case AiDrawerAlignment.end:
          visualVelocity = -visualVelocity;
          break;
      }
      switch (Directionality.of(context)) {
      case TextDirection.rtl:
        _controller.fling(velocity: -visualVelocity);
        break;
      case TextDirection.ltr:
        _controller.fling(velocity: visualVelocity);
        break;
      }
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  /// Starts an animation to open the drawer.
  ///
  /// Typically called by [ScaffoldState.openAiDrawer].
  void open() {
    _controller.fling(velocity: 1.0);
    if (widget.drawerCallback != null)
      widget.drawerCallback(true);
  }

  /// Starts an animation to close the drawer.
  void close() {
    _controller.fling(velocity: -1.0);
    if (widget.drawerCallback != null)
      widget.drawerCallback(false);
  }

  ColorTween _scrimColorTween;
  final GlobalKey _gestureDetectorKey = GlobalKey();

  ColorTween _buildScrimColorTween() {
    return ColorTween(begin: Colors.transparent, end: widget.scrimColor ?? Colors.black54);
  }

  AlignmentDirectional get _drawerOuterAlignment {
    assert(widget.alignment != null);
    switch (widget.alignment) {
      case AiDrawerAlignment.start:
        return AlignmentDirectional.centerStart;
      case AiDrawerAlignment.end:
        return AlignmentDirectional.centerEnd;
    }
    return null;
  }

  AlignmentDirectional get _drawerInnerAlignment {
    assert(widget.alignment != null);
    switch (widget.alignment) {
      case AiDrawerAlignment.start:
        return AlignmentDirectional.centerEnd;
      case AiDrawerAlignment.end:
        return AlignmentDirectional.centerStart;
    }
    return null;
  }

  Widget _buildAiDrawer(BuildContext context) {
    final bool drawerIsStart = widget.alignment == AiDrawerAlignment.start;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    final TextDirection textDirection = Directionality.of(context);

    double dragAreaWidth = widget.edgeDragWidth;
    if (widget.edgeDragWidth == null) {
      switch (textDirection) {
        case TextDirection.ltr: {
          dragAreaWidth = _kEdgeDragWidth +
            (drawerIsStart ? padding.left : padding.right);
        }
        break;
        case TextDirection.rtl: {
          dragAreaWidth = _kEdgeDragWidth +
            (drawerIsStart ? padding.right : padding.left);
        }
        break;
      }
    }

    if (_controller.status == AnimationStatus.dismissed) {
      return Align(
        alignment: _drawerOuterAlignment,
        child: GestureDetector(
          key: _gestureDetectorKey,
          onHorizontalDragUpdate: _move,
          onHorizontalDragEnd: _settle,
          behavior: HitTestBehavior.translucent,
          excludeFromSemantics: true,
          dragStartBehavior: widget.dragStartBehavior,
          child: Container(width: dragAreaWidth),
        ),
      );
    } else {
      return GestureDetector(
        key: _gestureDetectorKey,
        onHorizontalDragDown: _handleDragDown,
        onHorizontalDragUpdate: _move,
        onHorizontalDragEnd: _settle,
        onHorizontalDragCancel: _handleDragCancel,
        excludeFromSemantics: true,
        dragStartBehavior: widget.dragStartBehavior,
        child: RepaintBoundary(
          child: Stack(
            children: <Widget>[
              BlockSemantics(
                child: GestureDetector(
                  // On Android, the back button is used to dismiss a modal.
                  excludeFromSemantics: defaultTargetPlatform == TargetPlatform.android,
                  onTap: close,
                  child: Semantics(
                    label: MaterialLocalizations.of(context)?.modalBarrierDismissLabel,
                    child: Container( // The drawer's "scrim"
                      color: _scrimColorTween.evaluate(_controller),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: _drawerOuterAlignment,
                child: Align(
                  alignment: _drawerInnerAlignment,
                  widthFactor: _controller.value,
                  child: RepaintBoundary(
                    child: FocusScope(
                      key: _drawerKey,
                      node: _focusScopeNode,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return ListTileTheme(
      style: ListTileStyle.drawer,
      child: _buildAiDrawer(context),
    );
  }
}



const Duration _sheetDuration = Duration(milliseconds: 200);
const double _minFlingVelocity = 100.0;
const double _closeProgressThreshold = 0.5;

class AiDrawerSheet extends StatefulWidget {
  const AiDrawerSheet({
    Key key,
    this.animationController,
    @required this.onClosing,
    @required this.child,
  }) : assert(onClosing != null),
       super(key: key);

  final AnimationController animationController;
  final VoidCallback onClosing;
  final Widget child;
  @override
  _AiDrawerSheetState createState() => _AiDrawerSheetState();
  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _sheetDuration,
      debugLabel: 'AiDrawerSheet',
      vsync: vsync,
    );
  }
}

class _AiDrawerSheetState extends State<AiDrawerSheet> {
  final GlobalKey _childKey = GlobalKey(debugLabel: 'AiDrawerSheet child');
  double get _childWidth {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.width;
  }
  bool get _dismissUnderway => widget.animationController?.status == AnimationStatus.reverse;
  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway)
      return;
    widget.animationController?.value -= details.primaryDelta / (_childWidth ?? details.primaryDelta);
  }
  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway)
      return;
    if (details.velocity.pixelsPerSecond.dx > _minFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dx / _childWidth;
      if ((widget.animationController?.value ?? 0) > 0.0) {
        widget.animationController.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        widget.onClosing();
      }
    } else if ((widget.animationController?.value ?? 0) < _closeProgressThreshold) {
      if ((widget.animationController?.value ?? 0) > 0.0)
        widget.animationController?.fling(velocity: -1.0);
      widget.onClosing();
    } else {
      widget.animationController?.forward();
   }
  }

  double _offsetX = 0;
  double _offsetY = 0;
  bool _isWorking = false;
  int _userCount = 0;
  bool _handleScrollNotification(ScrollNotification notification){
    if(notification.metrics.axisDirection == AxisDirection.right){
      _isWorking = true;
      return false;
    }
    return false;
  }
  bool _onNotification(Notification notification){
    if(widget.animationController == null)return false;

    // print(notification);
    if(notification is ScrollStartNotification){
      _offsetX = notification?.dragDetails?.localPosition?.dx ?? 0;
      _offsetY = notification?.dragDetails?.localPosition?.dy ?? 0;
      _isWorking = false;
      _userCount = 0;
    }else if(notification is UserScrollNotification){
      if(_isWorking && notification.direction == ScrollDirection.reverse){
        if(widget.animationController.value   < 1){
          _userCount ++;
          _isWorking = false;
          widget.animationController.reverse();
        }
      }
    }else if(notification is OverscrollNotification){
      if(_isWorking){
        var dy = notification.dragDetails?.localPosition?.dy ?? 0;
        var dx = notification.dragDetails?.localPosition?.dx ?? 0;
        var offdx = dx - _offsetX;
        var offdy = dy - _offsetY;
        // print("$dx $dy");

        if(offdx > offdy){
           var width = MediaQuery.of(context).size.width;
           var a = (dx - _offsetX) / width;
           widget.animationController.value =  a;
        }
      }
    }else if(notification is ScrollEndNotification){
      if (widget.animationController.value < 0.2) {
          if (widget.animationController.value > 0.0)
            widget.animationController.fling(velocity: -1.0);
          if(_isWorking)
            widget.onClosing();
      } else {
          widget.animationController.forward();
      }
    }
    return false;
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent) {
      widget.onClosing();
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    final ShapeBorder shape = null;

    final Widget bottomSheet = Material(
      key: _childKey,
      color: Colors.transparent,
      elevation: 0,
      shape: shape,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: NotificationListener(
            onNotification: _onNotification,
            child: widget.child,
          ),
        )
      ),
    );
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: bottomSheet,
      excludeFromSemantics: true,
    );
  }
}