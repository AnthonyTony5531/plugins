/*
 * @Author: King 
 * @Date: 2021-08-13 00:38:16 
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

///[fisrtItemIndex]可见区域第一个视图位置
///[lastItemIndex] 可见区域最后一个位置
///[scrollOffset] 当前滚动位置
typedef OnGridItemScrollListener = void Function(
  int fisrtItemIndex,
  int lastItemIndex,
  double scrollOffset,
);

//返回第一个可见和最后一个可见的视图索引
class XcRenderSliverGrid extends RenderSliverGrid {
  final OnGridItemScrollListener onItemScrollListener;
   final RenderSliverBoxChildManager childManager;
  final SliverGridDelegate gridDelegate;
  XcRenderSliverGrid(
     {@required  this.childManager, @required this.gridDelegate, @required this.onItemScrollListener})
      : super(childManager: childManager, gridDelegate:gridDelegate );

  @override
  void performLayout() {
    super.performLayout();
    if (firstChild != null) {
      double scrollOffset = constraints.scrollOffset + constraints.cacheOrigin;
      scrollOffset = scrollOffset.clamp(0, scrollOffset.abs());
      double remainingExtent = constraints.remainingCacheExtent;
      remainingExtent =
          scrollOffset.clamp(remainingExtent, remainingExtent.abs());
      double targetEndScrollOffset = scrollOffset + remainingExtent;
      targetEndScrollOffset = scrollOffset.clamp(
          targetEndScrollOffset, targetEndScrollOffset.abs());

      final firstParentData =
          firstChild.parentData as SliverGridParentData;
      final lastParentData =
          lastChild.parentData as SliverGridParentData;
      final int fistIndex = firstParentData.index;
      final int lastIndex = lastParentData.index;
      onItemScrollListener?.call(
        fistIndex,
        lastIndex,
        scrollOffset,
      );
    }
  }
}
