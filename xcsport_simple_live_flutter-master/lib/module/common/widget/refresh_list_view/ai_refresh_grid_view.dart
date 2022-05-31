/*
 * @Author: King 
 * @Date: 2021-08-16 17:22:35 
 * @Last Modified by: King
 * @Last Modified time: 2021-08-16 21:19:25
 */

import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:common_component/widget/sliver/loadmore_grid_view.dart';
import 'package:common_component/widget/sliver/loadmore_view/loadmore_view_model.dart';
import 'package:common_component/widget/xcrender_slivergrid.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_refresh_view.dart';
import 'package:fast_ai/widgets/ai_refresh.dart';
import 'package:fast_ai/widgets/bottom_widget.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


//gid view 下拉刷新，列表加载更多
class AiRefreshGideView<T extends IViewModel> extends StatelessWidget {
  final FreshGridListViewModel<T> model;
  final List<Widget> headers;
  final OnGridItemViewBuilder<T> builder;
  final Widget loadingFootView;
  final Widget loadingView;
  final Widget emptyView;
  final Widget errorView;
  final Widget bottomWidget;
  final Axis scrollDirection;
  final int showBottomCount;

  final RefreshGridListBuilder refreshViewBuilder;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final double cacheExtent;
  final int semanticChildCount;
  final SliverGridDelegate sliverGridDelegate;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final OnGridItemScrollListener onItemScrollListener;
  final ScRefreshViewController refreshViewController; //用来做自动下拉刷新，或者拦截下拉处理

  const AiRefreshGideView({
    Key key,
    @required this.model,
    @required this.builder,
    @required this.sliverGridDelegate,
    this.refreshViewController,
    this.headers,
    this.loadingFootView,
    this.loadingView,
    this.emptyView,
    this.errorView,
    this.showBottomCount = 20,
    this.bottomWidget,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.refreshViewBuilder,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.cacheExtent,
    this.semanticChildCount,
    this.onItemScrollListener,
    this.restorationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget loading = loadingView ?? MatchLoading(isListView: true, count: 10,);
    // loading = Container(
    //   width: AiMeasure.screenWidth(context),
    //   height:100,
    //   child: loadingView ??
    //       Center(
    //         child: Text(''),
    //       ),
    // );
    // loading = Container(
    //   width: AiMeasure.screenWidth(context),
    //   height:100,
    //   child: loadingView ??
    //       Center(
    //         child: Text(''),
    //       ),
    // );

    Widget loadingFoot;
    loadingFoot = Container(
      height: 30,
      child: loadingFootView ??
          Center(
            child: Text('正在加载更多'),
          ),
    );
    Widget bottomWidget;
    bottomWidget = this.bottomWidget ??BottomWidget();
    model.headerCount = headers?.length ?? 0;
    return LoadMoreGridView<T>(
      model: model,
      headers: headers,
      builder: builder,
      loadingFootView: loadingFoot,
      loadingView: loading,
      emptyView: emptyView,
      errorView: errorView,
      bottomWidget: bottomWidget,
      scrollDirection: scrollDirection,
      reverse: reverse,
      sliverGridDelegate: sliverGridDelegate,
      controller: controller,
      primary: primary,
      physics: physics,
      cacheExtent: cacheExtent,
      showBottomCount: showBottomCount,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      restorationId: restorationId,
      onItemScrollListener: onItemScrollListener ??
          (fisrtVisibleItemIndex, lastVisibleItemIndex, position) {
            this.model.visibleChildFirstIndex = fisrtVisibleItemIndex;
            this.model.visibleChildLastIndex = lastVisibleItemIndex;
          },
      refreshViewBuilder: (_, listview) {
        return AiRefreshView(
            child: listview,
            refreshViewController: refreshViewController,
            onRefresh: () async {
              await model.refresh();
            });
      },
    );
  }
}

//暂时不取可见项定时 刷新，因为存在分组，会导致index不是真正的index,按具体的页数来刷新

class FreshGridListViewModel<T extends IViewModel>
    extends LoadMoreViewModel<T> {
  FreshGridListViewModel.create({
    @required OnPageLoad<T> onPageLoad, //网络请求分页实现方法，请求完毕后，调用update方法
    int page = 1,
    int size = 10,
    bool startTimer = false, //是否开启定时刷新
    Duration timerDuration,
    //定时刷新新数据对比方法
    //如果对比，是同一条数据(用唯一标识判断，比如gidm等)，那么需要返回接受哪个viewmodel.你可以选择更新旧的viewmodel,返回,或者返回新的替换。
    OnCompare compare,
    //定时刷新时候，有新增数据时候可以用这个处理。可以不实现
    OnFoundNewDataListener onFoundNewDataListener,
  }) : super.create(
            onPageLoad: onPageLoad,
            page: page,
            size: size,
            startTimer: startTimer,
            compare: compare,
            onFoundNewDataListener: onFoundNewDataListener,
            timerDuration: timerDuration) {
    visibleChildFirstIndex = page;
    visibleChildLastIndex = size;
  }

  int visibleChildFirstIndex;
  int visibleChildLastIndex;
  int headerCount = 0;

  @override
  int get timerRequestPage =>
      (visibleChildFirstIndex + 1) ~/ super.timerRequestSize + 1;

  //如果最后一项大于一页。那么需要刷新2页数据，避免部分刷不全
  @override
  int get timerRequestSize =>
      (timerRequestPage + super.timerRequestSize) < visibleChildLastIndex
          ? super.timerRequestSize
          : super.timerRequestSize * 2;
}
