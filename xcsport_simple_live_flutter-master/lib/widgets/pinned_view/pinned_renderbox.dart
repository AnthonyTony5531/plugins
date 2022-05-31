import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PinnedRenderBox extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
  ScrollPosition _scrollPosition;
  PinnedRenderBox({ScrollPosition scrollPosition})
      : _scrollPosition = scrollPosition;

  set scrollPosition(ScrollPosition position) {
    if (_scrollPosition != null && _scrollPosition != position) {
      _scrollPosition?.removeListener(update);
      _scrollPosition = position;
      if (attached) {
        markNeedsLayout();
        _scrollPosition.addListener(update);
      }
    }
  }

  void update() {
    markNeedsLayout();
  }

  RenderBox get body => firstChild;

  @override
  void performLayout() {
    final childConstraints = constraints.loosen();
    body.layout(childConstraints, parentUsesSize: true);
    size = Size(max(constraints.minWidth, body.size.width),
        max(constraints.minHeight, body.size.height));
    final bodyParentData = body.parentData as MultiChildLayoutParentData;
    var sOffset = _getScrollOffset();
    bodyParentData.offset = Offset(0, sOffset >= 0 ? 0 : -sOffset);
    final double maxOffset = size.height;
    bodyParentData.offset = Offset(0.0, max(0.0, min(-sOffset, maxOffset)));
    print('sOffset: $sOffset');
  }

  double currentOffset = 0.0;

  @override
  void setupParentData(RenderObject child) {
    super.setupParentData(child);
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }

  double _getScrollOffset() {
    final scrollBox =
        _scrollPosition?.context?.notificationContext?.findRenderObject();
    if (scrollBox?.attached ?? false) {
      try {
        return localToGlobal(Offset.zero, ancestor: scrollBox).dy;
      } catch (e) {
        // ignore and fall-through and return 0.0
      }
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return body.getMinIntrinsicWidth(height);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return body.getMaxIntrinsicWidth(height);
  }

  @override
  double computeMinIntrinsicHeight(double height) {
    return body.getMaxIntrinsicWidth(height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  double computeMaxIntrinsicHeight(double height) {
    return body.getMaxIntrinsicHeight(height);
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollPosition.addListener(update);
  }

  @override
  void detach() {
    super.detach();
    _scrollPosition.removeListener((update));
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(HitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
