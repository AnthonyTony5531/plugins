// @author king
// @date 2020-12-06

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'sc_refresh_container_box_data.dart';

class ScFreshContainer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, ScFreshContainerBoxData>,
        RenderBoxContainerDefaultsMixin<RenderBox, ScFreshContainerBoxData> {
  ScFreshContainer({double translate = 0.0, bool isStack}) : _translate = translate , _isStack = isStack;
  double _translate;
  bool _isStack;

  set translate(double value) {
    if (_translate == value) return;
    _translate = value;
    markNeedsLayout();
  }

  set isStack(bool value) {
    if (_isStack = value) return;
    _isStack = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! ScFreshContainerBoxData)
      child.parentData = ScFreshContainerBoxData();
  }

  void paintRenderBox(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox child = firstChild;
    while (child != null) {
      final ScFreshContainerBoxData childParentData =
          child.parentData as ScFreshContainerBoxData;
      context.pushClipRect(
          needsCompositing, offset, Offset.zero & size, paintRenderBox);
      child = childParentData.nextSibling;
    }
  }

  void defaultPaint(PaintingContext context, Offset offset) {
    RenderBox child = firstChild;
    while (child != null) {
      final ScFreshContainerBoxData childParentData =
          child.parentData as ScFreshContainerBoxData;
      context.paintChild(child, childParentData.offset + offset);
      child = childParentData.nextSibling;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    size = Size(constraints.maxWidth, constraints.maxHeight);
    RenderBox headerBox = lastChild;
    headerBox.layout(BoxConstraints.loose(size), parentUsesSize: true);
    RenderBox bodyBox = firstChild;
    bodyBox.layout(BoxConstraints.loose(size), parentUsesSize: true);
    final ScFreshContainerBoxData headerData =
        headerBox.parentData as ScFreshContainerBoxData;
    final ScFreshContainerBoxData bodyData =
        bodyBox.parentData as ScFreshContainerBoxData;
    if (_isStack) {
      bodyData.offset = Offset(0, 0);
    } else {
      bodyData.offset = Offset(0, _translate * headerBox.size.height);
    }
    headerData.offset =
        Offset(0, -headerBox.size.height + _translate * headerBox.size.height);
  }
}
