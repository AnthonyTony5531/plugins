import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/model/page_result_model.dart';
import 'package:fast_ai/module/common/widget/behavior/hide_scroll_behavior.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_sliver/ai_sliver_list.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_first_load_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_load_error_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_loading_more_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_net_error_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_no_data_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/list_default_view/refresh_no_more_view.dart';

typedef OnPageLoad = Future<PageResultModel<dynamic>> Function(
    int page, int pageSize);

typedef OnCellBuild = Widget Function(
    BuildContext ctx, int index, dynamic cellData);

class AutoRefreshListView extends StatefulWidget {
  final RefreshListController controller;

  // 设置一页加载的大小
  final int pageSize;

  // 分页加载函数，请求
  // 如果model设置了onPageLoad,view重复设置无效
  final OnPageLoad onPageLoad;

  // 创建Item的Widget
  final OnCellBuild onCellBuild;

  // 是否启用下拉刷新
  final bool enableRefresh;

  //头 部widget
  final List<Widget> topWidgets;

  // 是否- 硬性添加头部内容
  final bool isTopForce;

  // 初始化界面
  final Widget initWidget;

  // 空数据widget
  final Widget noDataWidget;

  // 请求失败widget - 下拉刷新
  final Widget refreshErrorWidget;

  // 请求失败widget - 上拉加载
  final Widget loadMoreErrorWidget;

  // 上拉请求 - loading widget
  final Widget loadingMoreWidget;

  // 底部widget - 没有更多数据
  final Widget noMoreLoadWidget;

  // 多少条数据内不显示底部
  final int noDisplayBottomWidgetCount;

  // 列表展示方向
  final Axis scrollDirection;

  // 下拉刷新 - 回调
  final RefreshCallback onRefresh;

  // 滑动方式
  final ScrollPhysics physics;

  AutoRefreshListView({
    @required this.controller,
    this.pageSize,
    this.onPageLoad,
    this.onCellBuild,
    this.topWidgets,
    this.initWidget,
    this.noMoreLoadWidget,
    this.noDataWidget,
    this.refreshErrorWidget,
    this.loadMoreErrorWidget,
    this.loadingMoreWidget,
    this.scrollDirection,
    this.onRefresh,
    this.physics,
    isTopForce,
    noDisplayBottomWidgetCount,
    enableRefresh,
    Key key,
  })  : isTopForce = isTopForce ?? true,
        noDisplayBottomWidgetCount = noDisplayBottomWidgetCount ?? 5,
        enableRefresh = enableRefresh ?? false,
        super(key: key);

  @override
  _AutoRefreshListState createState() => _AutoRefreshListState();
}

class _AutoRefreshListState extends State<AutoRefreshListView> {
  RefreshListController get model => widget.controller;

  int get pageSize => widget.pageSize ?? 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model._isFirstRefresh = true;
      _doRefreshPage();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget listView = _buildListView(context);

    if (widget.enableRefresh) {
      listView = RefreshIndicator(
        onRefresh: () async {
          await _doRefreshPage();
          widget.onRefresh?.call();
        },
        child: listView,
      );
    }

    return listView;
  }

  Widget _buildListView(BuildContext context) {
    List<Widget> list = [];

    // 添加头部view
    if (widget.isTopForce &&
        widget.topWidgets != null &&
        widget.topWidgets.length != 0) {
      list.addAll(widget.topWidgets);
    }

    // 是否第一次加载界面
    if (model.isFirstRefresh) {
      return widget.initWidget ?? RefreshFirstLoadView();
    } else {
      // 请求异常
      if (model.isFirstRefreshError) {
        // 判断是否添加了头部widget
        if (list.length == 0) return _buildRefreshErrorWidget();
        list.add(SliverToBoxAdapter(child: _buildRefreshErrorWidget()));
        return CustomScrollView(physics: widget.physics, slivers: list);
      } else if (model.isDataEmpty) {
        // 空数据状态
        // 判断是否添加了头部widget
        if (list.length == 0) return _buildNoDataWidget();
        list.add(SliverToBoxAdapter(child: _buildNoDataWidget()));
        return CustomScrollView(physics: widget.physics, slivers: list);
      }
    }

    list.add(_buildSliverList());
    return ScrollConfiguration(
      behavior: HideScrollBehavior(),
      child: CustomScrollView(
        slivers: list,
        physics: widget.physics,
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
      ),
    );
  }

  // 自定义列表
  Widget _buildSliverList() {
    return AiSliverList(
      delegate: SliverChildBuilderDelegate(
        (cxt, index) {
          if (index >= model.dataSize) {
            if (model.isLoadComplete) return _buildNoMoreLoadWidget();
            if (model.isLoadError) return _buildLoadErrorWidget();
            return _buildLoadingMoreWidget();
          } else {
            return widget.onCellBuild(
                cxt, index, model.getItemDataByIndex(index));
          }
        },
        childCount: model.dataSize + model.moreSize,
      ),
      onIndexChanged:
          (firstIndex, lastIndex, firstObj, lastObj, firstOffset, lastOffset) {
        // model._showFirstIndex = firstIndex;
        // model._showLastIndex = lastIndex;
      },
    );
  }

  /// 空视图
  Widget _buildNoDataWidget() {
    if (widget.noDataWidget != null) return widget.noDataWidget;
    return RefreshNoDataView(
      onTapCallBack: () {
        model._isFirstRefresh = true;
        _doRefreshPage();
      },
    );
  }

  /// 请求异常视图
  Widget _buildRefreshErrorWidget() {
    if (widget.refreshErrorWidget != null) return widget.refreshErrorWidget;
    return RefreshErrorView(
      onTapCallBack: () {
        model._isFirstRefresh = true;
        _doRefreshPage();
      },
    );
  }

  /// 请求失败 - widget
  Widget _buildLoadErrorWidget() {
    WidgetsBinding.instance.addPostFrameCallback((d) => _doLoadPage());
    if (widget.loadMoreErrorWidget != null) return widget.loadMoreErrorWidget;

    return RefreshLoadErrorView(
      errorCount: model._loadErrorCount,
      isReconnectFail: model.reconnectFail,
      onTapCallBack: () {
        if (model.reconnectFail) {
          model._loadErrorCount = 0;
          model._isLoadError = false;
          _updateState();
          _doLoadPage();
        }
      },
    );
  }

  /// 上拉加载 - 动画
  Widget _buildLoadingMoreWidget() {
    WidgetsBinding.instance.addPostFrameCallback((d) => _doLoadPage());
    if (widget.loadingMoreWidget != null) return widget.loadingMoreWidget;
    return RefreshLoadingMoreView();
  }

  /// 上拉加载 - 没有更多数据
  Widget _buildNoMoreLoadWidget() {
    if (model.dataSize > widget.noDisplayBottomWidgetCount) {
      if (widget.noMoreLoadWidget != null) return widget.noMoreLoadWidget;
      return RefreshNoMoreView();
    }
    return SizedBox();
  }

  /// 下拉刷新 - 请求
  Future<void> _doRefreshPage() async {
    if (widget.onPageLoad == null) {
      model._isFirstRefresh = false;
      _updateState();
      return;
    }
    if (model._isRefresh) return;
    model._isRefreshError = false;
    model._isRefresh = true;
    try {
      model._curPage = 1;
      int page = model._curPage;
      var res = await widget.onPageLoad(page, pageSize);
      model._isFirstRefresh = false;
      if (!res.isError) {
        model.updatePage(page, res);
        model._curPage++;
        model._isLoadError = false;
        model._loadErrorCount = 0;
      } else {
        model._isRefreshError = true;
      }
    } catch (e) {
      print(e.toString());
      model._isRefreshError = true;
    }
    model._isRefresh = false;
    _updateState();
  }

  // 上拉加载 - 请求
  Future<void> _doLoadPage() async {
    if (widget.onPageLoad == null) return;
    if (model._loadErrorCount > model._maxErrorCount) return;
    if (model._isLoadMore) return;
    model._isLoadMore = true;
    if (model._loadErrorCount != 0) {
      //如果出过错，间隔3秒再去请求
      await Future.delayed(Duration(seconds: 3));
      if (!mounted) {
        model._isLoadError = true;
        model._loadErrorCount = model._maxErrorCount + 1;
        return;
      }
    }
    try {
      int page = model._curPage;
      var ret = await widget.onPageLoad(page, pageSize ?? 10);
      if (ret.state != PageState.Error) {
        model.updatePage(page, ret);
        model._curPage++;
        model._isLoadError = false;
        model._loadErrorCount = 0;
      } else {
        model._isLoadError = true;
        model._loadErrorCount++;
      }
    } catch (e) {
      print(e.toString());
      model._isLoadError = true;
      model._loadErrorCount++;
    }
    model._isLoadMore = false;
    _updateState();
  }

  void _updateState() {
    if (mounted) setState(() {});
  }
}

class RefreshListController<T> extends ChangeNotifier {
  final List<PageResultModel<T>> _pages = [];
  final List<T> _currentList = [];

  // 可选操作
  bool _refreshCleanData = true; // 刷新清空pages数据

  set refreshCleanData(bool isCanClean) {
    _refreshCleanData = isCanClean ?? true;
  }

  // 状态参数,非外部操作
  int _curPage = 1;
  bool _isFirstRefresh = true;
  bool _isRefresh = false;
  bool _isRefreshError = false;
  bool _isLoadMore = false;
  bool _isLoadError = false;

  // load error
  int _loadErrorCount = 0;
  int _maxErrorCount = 5;

  bool get isFirstRefreshError => _isRefreshError;

  bool get isFirstRefresh => _isFirstRefresh;

  bool get isRefresh => _isRefresh;

  bool get isLoadMore => _isLoadMore;

  bool get isLoadError => _isLoadError;

  List<T> get items => _currentList;

  bool get isDataEmpty => _currentList.length == 0;

  int get dataSize => _currentList.length;

  int get moreSize => !isDataEmpty && !isFirstRefreshError ? 1 : 0;

  int get pageSize => _pages.length;

  // 重新请求失败
  bool get reconnectFail => _loadErrorCount > _maxErrorCount;

  T getItemDataByIndex(int index) {
    if (index > dataSize) return null;
    return _currentList[index];
  }

  // 没有更多数据状态
  bool get isLoadComplete {
    try {
      return _pages.last.isComplete;
    } catch (e) {
      return false;
    }
  }

  void updatePage(page, PageResultModel<T> pageModel) {
    // page 不可能从0开始，避免异常处理
    if (page <= 0) return;
    if (page == 1 && _refreshCleanData) {
      _pages.clear();
    }
    if (page > pageSize) {
      _pages.add(pageModel);
    } else {
      _pages[page - 1] = pageModel;
    }

    _currentList.clear();
    _currentList.addAll(_pages.expand((f) => f.items).toList());
    notifyListeners();
  }
}
