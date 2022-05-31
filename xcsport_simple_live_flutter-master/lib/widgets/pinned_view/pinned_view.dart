import 'package:fast_ai/widgets/pinned_view/pinned_renderobject_widget.dart';
import 'package:flutter/material.dart';

//滑动时候,不回滚出外面.顶多贴在0偏移量
class PinnedView extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  const PinnedView({Key key, @required this.child, @required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(scrollController != null, 'scrollController is null');
    return PinnedRenderObjectWidget(
      scrollController: scrollController,
      child: this.child,
    );
  }
}
