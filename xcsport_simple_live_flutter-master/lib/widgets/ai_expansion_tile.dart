// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'colors.dart';
// import 'icons.dart';
// import 'list_tile.dart';
// import 'theme.dart';
// import 'theme_data.dart';

const Duration _kExpand = Duration(milliseconds: 200);

/// A single-line [ListTile] with a trailing button that expands or collapses
/// the tile to reveal or hide the [children].
///
/// This widget is typically used with [ListView] to create an
/// "expand / collapse" list entry. When used with scrolling widgets like
/// [ListView], a unique [PageStorageKey] must be specified to enable the
/// [ExpansionTile] to save and restore its expanded state when it is scrolled
/// in and out of view.
///
/// See also:
///
///  * [ListTile], useful for creating expansion tile [children] when the
///    expansion tile represents a sublist.
///  * The "Expand/collapse" section of
///    <https://material.io/guidelines/components/lists-controls.html>.
class AiExpansionTile extends StatefulWidget {
  /// Creates a single-line [ListTile] with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const AiExpansionTile({
    Key key,
    this.leading,
    @required this.title,
    this.backgroundColor,
    this.titleBackgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  }) : assert(initiallyExpanded != null),
       super(key: key);

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool> onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color backgroundColor;

  final Color titleBackgroundColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<AiExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _borderColor;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded)
      _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted)
            return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor = Colors.transparent; //_borderColor.value ?? Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: AiListTile(
              backgroudColor: widget.titleBackgroundColor,
              onTap: _handleTap,
              leading: widget.leading,
              title: widget.title,
              trailing: widget.trailing ?? RotationTransition(
                turns: _iconTurns,
                child: const Icon(Icons.expand_more),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween
      ..end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.colorScheme.secondary;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColorTween
      ..end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );

  }
}

class AiListTile extends StatelessWidget {

  AiListTile({
    this.leading,
    this.leadingWidth,
    this.alignment,
    this.height,
    this.title,
    this.trailing,
    this.onTap,
    this.backgroudColor,
    this.decoration
  });

  final Widget leading;
  final double leadingWidth;
  final CrossAxisAlignment alignment;
  final double height ;
  final Widget title;
  final Widget trailing;
  final Function onTap;
  final Color backgroudColor;
  final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      color: this.backgroudColor ?? Colors.transparent,
      child: Container(
        decoration: this.decoration ?? BoxDecoration(),
        height: this.height == 0 ? null : this.height ?? 56.0,
        child: Row(
          crossAxisAlignment: this.alignment ?? CrossAxisAlignment.center,
          children: <Widget>[
            this.leading == null ?
            SizedBox():
            Container(
              width: this.leadingWidth ?? 40.0,
              child: this.leading,
            ),
            Expanded(
              child: this.title ?? SizedBox(),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: this.trailing ?? SizedBox(),
            )
          ],
        ),
      ),
      onPressed: this.onTap,
    );
  }
}

class AiListTileAndContent extends StatelessWidget {

  AiListTileAndContent({
    this.leading,
    this.leadingWidth,
    this.alignment,
    this.height,
    this.title,
    this.content,
    this.trailing,
    this.onTap,
    this.backgroudColor,
    this.decoration
  });

  final Widget leading;
  final double leadingWidth;
  final CrossAxisAlignment alignment;
  final double height ;
  final Widget title;
  final Widget content;
  final Widget trailing;
  final Function onTap;
  final Color backgroudColor;
  final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      color: this.backgroudColor ?? Colors.transparent,
      child: Container(
        decoration: this.decoration ?? BoxDecoration(),
        height: this.height == 0 ? null : this.height ?? 56.0,
        child: Row(
          crossAxisAlignment: this.alignment ?? CrossAxisAlignment.center,
          children: <Widget>[
            this.leading == null ?
            SizedBox(): 
            Container(
              width: this.leadingWidth ?? 40.0,
              child: this.leading,
            ),
            this.title ?? SizedBox(width: 0,height: 0,),
            SizedBox(width: 10,),
//            Expanded(
//              child: SizedBox(),
//            ),
            this.content != null ? Expanded(child: this.content) : SizedBox(width: 0,height: 0,),
            Container(
              alignment: Alignment.centerRight,
              child: this.trailing ?? SizedBox(),
            )
          ],
        ),
      ),
      onPressed: this.onTap,
    );
  }
}