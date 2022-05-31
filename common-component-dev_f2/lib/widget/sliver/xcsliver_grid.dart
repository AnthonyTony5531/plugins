

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart';

import '../xcrender_slivergrid.dart';

class XcSliverGrid extends SliverMultiBoxAdaptorWidget {
  final OnGridItemScrollListener onItemScrollListener;

  const XcSliverGrid({
    Key key,
    @required SliverChildDelegate delegate,
    @required this.gridDelegate,
    this.onItemScrollListener, 
  }) : super(key: key, delegate: delegate);
  final SliverGridDelegate gridDelegate;

  @override
  XcRenderSliverGrid createRenderObject(BuildContext context) {
    final SliverMultiBoxAdaptorElement element = context as SliverMultiBoxAdaptorElement;
    return XcRenderSliverGrid(childManager: element, gridDelegate: gridDelegate, onItemScrollListener: onItemScrollListener);
  }


}