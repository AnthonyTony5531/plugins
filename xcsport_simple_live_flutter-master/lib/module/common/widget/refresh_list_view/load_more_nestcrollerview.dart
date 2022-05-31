/*
 * @Author: King 
 * @Date: 2021-08-16 14:58:29 
 * @Last Modified by: King
 * @Last Modified time: 2021-08-16 15:11:09
 */
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/widget/sliver/loadmore_view/loadmore_view.dart';
import 'package:common_component/widget/sliver/loadmore_view/loadmore_view_model.dart';
import 'package:common_component/widget/sliver/xcrender_sliverlist.dart';
import 'package:common_component/widget/sliver/xcsliver_list.dart';
import 'package:fast_ai/widgets/ai_nested_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef OnNestScrollerBuilder<T extends IViewModel> = Widget Function(
    T itemViewModel, int itemViewIndex);

typedef RefreshNestScrollerBuilder = Widget Function(
    BuildContext context, Widget listView);

typedef LoadMoreNestedScrollViewHeaderSliversBuilder =  List<Widget> Function(
    BuildContext context, bool innerBoxIsScrolled);

class LoadMoreNestedScrollView<T extends IViewModel> extends StatelessWidget {
  final LoadMoreViewModel model;
  final LoadMoreNestedScrollViewHeaderSliversBuilder headerSliverBuilder;

  final OnNestScrollerBuilder<T> builder;
  final Widget loadingFootView;
  final Widget loadingView;
  final Widget emptyView;
  final Widget errorView;
  final Widget bottomWidget;
  final int showBottomCount;
  final Axis scrollDirection;
  final RefreshNestScrollerBuilder refreshViewBuilder;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final String restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final OnItemScrollListener onItemScrollListener;

  const LoadMoreNestedScrollView({
    Key key,
    @required this.model,
    @required this.builder,
    @required this.refreshViewBuilder,
    @required this.headerSliverBuilder,
    this.onItemScrollListener,
    this.loadingView,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollDirection = Axis.vertical,
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
              slivers.add(XcSliverList(
                onItemScrollListener: onItemScrollListener,
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return builder(model.itemViewModels[index], index);
                  },
                  childCount: model.itemViewModels.length,
                ),
              ));
              if (model.isRefreshing()&& model.page > 1) {
                if (loadingFootView != null) {
                  slivers.add(SliverToBoxAdapter(
                    child: loadingFootView ?? SizedBox.shrink(),
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

            return AiNestedScrollView(
              controller: controller,
              //兼容监听不到滚动问题a
              physics: physics??ClampingScrollPhysics() ,
              dragStartBehavior: dragStartBehavior,
              body: CustomScrollView(
                scrollDirection: scrollDirection,
                reverse: reverse,
                primary: primary,
                physics: ClampingScrollPhysics() ,
                cacheExtent: cacheExtent,
                semanticChildCount: semanticChildCount,
                restorationId: restorationId,
                clipBehavior: clipBehavior,
                slivers: slivers,
              ),
              headerSliverBuilder: this.headerSliverBuilder??(context, __){

                return [
                 SliverToBoxAdapter(child:  SizedBox(height: 0.01,),)
                ];

              },
            );
          }),
    );
  }
}
