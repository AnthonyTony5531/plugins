/*
 * @Author: King 
 * @Date: 2021-08-16 14:58:29 
 * @Last Modified by: King
 * @Last Modified time: 2021-08-16 15:11:09
 */
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../xcrender_slivergrid.dart';
import 'loadmore_view/loadmore_view.dart';
import 'loadmore_view/loadmore_view_model.dart';
import 'xcsliver_grid.dart';

typedef OnGridItemViewBuilder<T extends IViewModel> = Widget Function(
    T itemViewModel, int itemViewIndex);
typedef RefreshGridListBuilder = Widget Function(
    BuildContext context, Widget listView);

class LoadMoreGridView<T extends IViewModel> extends StatelessWidget {
  final LoadMoreViewModel model;
  final List<Widget> headers;
  final OnGridItemViewBuilder<T> builder;
  final Widget loadingFootView;
  final Widget loadingView;
  final Widget emptyView;
  final Widget errorView;
  final SliverGridDelegate sliverGridDelegate;
  final Widget bottomWidget;
  final int showBottomCount;
  final Axis scrollDirection;
  final RefreshGridListBuilder refreshViewBuilder;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final String restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final OnGridItemScrollListener onItemScrollListener;
  const LoadMoreGridView({
    Key key,
    @required this.model,
    @required this.builder,
    @required this.refreshViewBuilder,
    @required this.sliverGridDelegate,
    this.onItemScrollListener,
    this.loadingView,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollDirection = Axis.vertical,
    this.headers,
    this.reverse = false,
    this.loadingFootView,
    this.emptyView,
    this.errorView,
    this.bottomWidget,
    this.controller,
    this.primary,
    this.physics,
    this.cacheExtent,
    this.showBottomCount,
    this.semanticChildCount,
    this.restorationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return refreshViewBuilder(
      context,
      LoadMoreView<T>(
          model: model,
          scrollViewChildBuilder:
              (BuildContext context, LoadMoreViewModel<T> model) {
            final List<Widget> slivers = [];
            final vmLen = model.itemViewModels.length;
            if (headers != null) {
              slivers
                  .add(SliverList(delegate: SliverChildListDelegate(headers)));
            }
            if (model.itemViewModels.isEmpty) {
              if (model.isRefreshing()) {
                if (loadingView != null) {
                  slivers.add(SliverToBoxAdapter(
                    child: loadingView,
                  ));
                }
              } else if (errorView != null && model.isError()) {
                slivers.add(SliverToBoxAdapter(
                  child: errorView,
                ));
              } else if (emptyView != null) {
                slivers.add(SliverToBoxAdapter(
                  child: emptyView,
                ));
              }
            } else {
              slivers.add(XcSliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return builder(model.itemViewModels[index], index);
                  },
                  childCount: model.itemViewModels.length,
                ),
                gridDelegate: sliverGridDelegate,
                onItemScrollListener: onItemScrollListener,
              ));
              if (model.isRefreshing()) {
                if (loadingFootView != null) {
                  slivers.add(SliverToBoxAdapter(
                    child: loadingFootView,
                  ));
                }
              } else {
                if (null != bottomWidget &&
                    model.itemViewModels.isNotEmpty &&
                    vmLen >= showBottomCount &&
                    model.page * model.size >= model.total) {
                  slivers.add(SliverToBoxAdapter(
                    child: bottomWidget,
                  ));
                }
              }
            }
            return CustomScrollView(
              controller: controller,
              scrollDirection: scrollDirection,
              reverse: reverse,
              primary: primary,
              //兼容监听不到滚动问题a
              physics: physics ??
                  (null != controller ? AlwaysScrollableScrollPhysics() : null),
              cacheExtent: cacheExtent,
              semanticChildCount: semanticChildCount,
              dragStartBehavior: dragStartBehavior,
              restorationId: restorationId,
              clipBehavior: clipBehavior,
              slivers: slivers,
            );
          }),
    );
  }
}
