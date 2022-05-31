/*
 * @Author: King 
 * @Date: 2021-08-13 00:38:16 
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

///[fisrtItemIndex]可见区域第一个视图位置
///[lastItemIndex] 可见区域最后一个位置
///[scrollOffset] 当前滚动位置
typedef OnItemScrollListener = void Function(
  int fisrtItemIndex,
  int lastItemIndex,
  double scrollOffset,
);

//返回第一个可见和最后一个可见的视图索引
class XcRenderSliverList extends RenderSliverList {
  final OnItemScrollListener onItemScrollListener;

  XcRenderSliverList(
      SliverMultiBoxAdaptorElement manager, this.onItemScrollListener)
      : super(childManager: manager);

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
          firstChild.parentData as SliverMultiBoxAdaptorParentData;
      final lastParentData =
          lastChild.parentData as SliverMultiBoxAdaptorParentData;
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
