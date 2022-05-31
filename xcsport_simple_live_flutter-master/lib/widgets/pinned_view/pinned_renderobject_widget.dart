import 'package:fast_ai/widgets/pinned_view/pinned_renderbox.dart';
import 'package:flutter/material.dart';

class PinnedRenderObjectWidget extends MultiChildRenderObjectWidget {
  final Widget child;
  final ScrollController scrollController;
  PinnedRenderObjectWidget({
    Key key,
    @required this.child,
    @required this.scrollController,
  }) : super(key: key, children: [child]);

  @override
  PinnedRenderBox createRenderObject(BuildContext context) {
    var scrollPosition = scrollController.position;
    return PinnedRenderBox(scrollPosition: scrollPosition);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant PinnedRenderBox pinnedRenderBox) {
    var scrollPosition = scrollController.position;
    pinnedRenderBox.scrollPosition = scrollPosition;
  }
}
