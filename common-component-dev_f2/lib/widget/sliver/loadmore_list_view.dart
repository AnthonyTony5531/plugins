/*
 * @Author: King 
 * @Date: 2021-08-16 14:58:29 
 * @Last Modified by: King
 * @Last Modified time: 2021-08-16 15:11:09
 */
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/widget/sliver/xclist_view.dart';
import 'package:common_component/widget/sliver/xcrender_sliverlist.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'loadmore_view/loadmore_view.dart';
import 'loadmore_view/loadmore_view_model.dart';

typedef OnItemViewBuilder<T extends IViewModel> = Widget Function(
    T itemViewModel, int itemViewIndex);
typedef RefreshBuilder = Widget Function(BuildContext context, Widget listView);

class LoadMoreListView<T extends IViewModel> extends StatelessWidget {
  final LoadMoreViewModel model;
  final List<Widget> headers;
  final OnItemViewBuilder<T> builder;
  final Widget loadingFootView;
  final Widget loadingView;
  final Widget emptyView;
  final Widget errorView;
  final Widget bottomWidget;
  final int showBottomCount;
  final Axis scrollDirection;
  final RefreshBuilder refreshViewBuilder;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final OnItemScrollListener onItemScrollListener;
  const LoadMoreListView({
    Key key,
    @required this.model,
    @required this.builder,
    @required this.refreshViewBuilder,
    this.onItemScrollListener,
    this.loadingView,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.headers,
    this.reverse = false,
    this.showBottomCount = 5,
    this.loadingFootView,
    this.emptyView,
    this.errorView,
    this.bottomWidget,
    this.controller,
    this.primary,
    this.physics,
    this.cacheExtent,
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
            final hLen = headers?.length ?? 0;
            final vmLen = model.itemViewModels.length;
            final bottomViewLen = 1;
            int emptyViewCount = vmLen > 0 ? 0 : 1;

            final childCount = hLen + vmLen + emptyViewCount + bottomViewLen;

            return XcListView(
                scrollDirection: scrollDirection,
                reverse: reverse,
                controller: controller,
                primary: primary,
                physics: physics,
                cacheExtent: cacheExtent,
                semanticChildCount: semanticChildCount,
                dragStartBehavior: dragStartBehavior,
                keyboardDismissBehavior: keyboardDismissBehavior,
                restorationId: restorationId,
                clipBehavior: clipBehavior,
                builder: (context, index) {
                  final int headersLen = headers?.length ?? 0;
                  if (headersLen > 0 && index < headersLen) {
                    return headers[index];
                  }
                  if (model.itemViewModels.isEmpty) {
                    if (model.isRefreshing()) {
                      return loadingView ?? SizedBox.shrink();
                    } else {
                      if (index == headersLen) {
                        if (model.isError()) {
                          return errorView ?? SizedBox.shrink();
                        }
                        return emptyView ?? SizedBox.shrink();
                      }
                      return SizedBox.shrink();
                    }
                  } else {
                    int viewModelIndex = index - headersLen;
                    if (viewModelIndex < model.itemViewModels.length) {
                      return builder(
                          model.itemViewModels[viewModelIndex], viewModelIndex);
                    }
                    if (model.isRefreshing() && model.page > 1) {
                      return loadingFootView ?? SizedBox.shrink();
                    }
                    if (model.itemViewModels.isNotEmpty &&
                        index >= (showBottomCount + headersLen) &&
                        model.page * model.size >= model.total) {
                      return bottomWidget ?? SizedBox.shrink();
                    }
                  }

                  return SizedBox.shrink();
                },
                onItemScrollListener: onItemScrollListener,
                childCount: childCount);
          }),
    );
  }
}
