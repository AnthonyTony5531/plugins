/// @author king
/// @date 2021/8/12
///

import 'package:common_component/widget/sliver/xcrender_sliverlist.dart';
import 'package:common_component/widget/sliver/xcsliver_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

//在listview上派生一个可见列表项的第一个索引和最后一个索引
class XcListView extends BoxScrollView {
  final OnItemScrollListener onItemScrollListener;
  final IndexedWidgetBuilder builder;
  final int childCount;
  XcListView(
      {Key key,
      @required this.builder,
      @required this.childCount,
      Axis scrollDirection = Axis.vertical,
      bool reverse = false,
      ScrollController controller,
      bool primary,
      ScrollPhysics physics,
      bool shrinkWrap = false,
      EdgeInsetsGeometry padding,
      double cacheExtent,
      int semanticChildCount,
      DragStartBehavior dragStartBehavior = DragStartBehavior.start,
      ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
          ScrollViewKeyboardDismissBehavior.manual,
      String restorationId,
      Clip clipBehavior = Clip.hardEdge,
      this.onItemScrollListener})
      : super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          //兼容监听不到滚动问题a
          physics: physics ??
              (null != controller ? AlwaysScrollableScrollPhysics() : null),
          shrinkWrap: shrinkWrap,
          padding: padding,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );
  @override
  Widget buildChildLayout(BuildContext context) {
    return XcSliverList(
      onItemScrollListener: onItemScrollListener,
      delegate: SliverChildBuilderDelegate(
        builder,
        childCount: childCount,
      ),
    );
  }
}
