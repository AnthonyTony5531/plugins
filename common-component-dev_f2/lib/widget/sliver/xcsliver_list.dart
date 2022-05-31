import 'package:common_component/widget/sliver/xcrender_sliverlist.dart';
/// @author king
/// @date 2021/8/12
///

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//当前屏幕可见的第一个item和最后一个item,在这不要做耗时操作，这里是在布局的时候回掉的
class XcSliverList extends SliverMultiBoxAdaptorWidget {
  //监听当前可见第一个位置和最后一个位置
  final OnItemScrollListener onItemScrollListener;

  XcSliverList({
    this.onItemScrollListener,
    @required SliverChildDelegate delegate,
  }) : super(delegate: delegate);

  @override
  RenderSliverMultiBoxAdaptor createRenderObject(BuildContext context) {
    return XcRenderSliverList(context as SliverMultiBoxAdaptorElement, onItemScrollListener);
  }
}


