import 'dart:async';

/// @author king
/// @date 2021/8/12
///

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/util/log.dart';
import 'package:flutter/material.dart';
import 'loadmore_view_style.dart';

//网络请求分页实现方法，请求完毕后，调用update方法
typedef OnPageLoad<T extends IViewModel> = Future<void> Function(
    int page, int size, LoadMoreViewModel<T> viewModel, bool isDataFromTimer);

//定时刷新新数据对比方法
//如果对比，是同一条数据(用唯一标识判断，比如gidm等)，那么需要返回接受哪个viewmodel.你可以选择更新旧的viewmodel,返回,或者返回新的替换。
typedef OnCompare = IViewModel Function(IViewModel oldData, IViewModel newData);

//定时刷新时候，有新增数据时候可以用这个处理。可以不实现
typedef OnFoundNewDataListener = IViewModel Function(List<IViewModel> newData);

class LoadMoreViewModel<T extends IViewModel>
    extends StatefulViewModel<LoadMoreViewStyle> {
  LoadMoreViewModel();
  OnPageLoad _loader;
  OnCompare _compare;
  OnFoundNewDataListener _onFoundNewDataListener;
  int _size;
  int _currentPage;
  int _total = 0;
  bool startTimer = false; //是否开启定时刷新
  Duration timerDuration;
  LoadMoreViewModel.create({
    @required OnPageLoad<T> onPageLoad,
    int page = 1,
    int size = 10,
    this.startTimer = false,
    Duration timerDuration,
    OnFoundNewDataListener onFoundNewDataListener,
    OnCompare compare,
  }) {
    assert(page > 0);
    _size = size;
    _currentPage = page;
    assert(onPageLoad != null, '分页加载需要实现onPageLoad方法');
    _loader = onPageLoad;
    _onFoundNewDataListener = onFoundNewDataListener;
    if (startTimer) {
      assert(compare != null, '开启定时器需要实现OnCompare方法');
      _compare = compare;
      this.timerDuration = timerDuration ?? Duration(seconds: 60);
    }
  }

  List<T> get itemViewModels => _itemViewModels ?? [];
  int get page => _currentPage;
  int get size => _size;
  int get total => _total;

  //默认当前定时刷新的页码，如果子view支持可见区域刷新，请重写
  int get timerRequestPage => _currentPage;

  //默认当前定时刷新的条数，如果子view支持可见区域刷新，请重写
  int get timerRequestSize => _size;

  List<T> _itemViewModels = [];

  void clearItemViewModel() {
    _itemViewModels = [];
  }

  //更新当前页数据
  void updateCurrentVisibleData() {
    _loader.call(this.timerRequestPage, this.timerRequestSize, this, true);
  }

  bool _isStopTimer = false;

  bool stopTimer() {
    _isStopTimer = true;
  }

  bool resumeTimer() {
    _isStopTimer = false;
  }

  @mustCallSuper
  @override
  void onAttach() {
    super.onAttach();
    if (startTimer) {
      _timer = new Timer.periodic(timerDuration, (timer) async {
        if (_isStopTimer) {
          return;
        }
        if (timer.isActive &&
            itemViewModels.isNotEmpty &&
            this.timerRequestSize > 0) {
          _loader.call(
              this.timerRequestPage, this.timerRequestSize, this, true);
        }
      });
    }
  }

  void _l() {}

  @override
  Future<bool> onInit() async {
    return false;
  }

  @mustCallSuper
  @override
  void onDispose() {
    _timer?.cancel();
  }

  Timer _timer;

  @override
  Future refresh([Map<String, dynamic> args]) async {
    makeRefreshingStatus();
    if (args != null) {
      _currentPage = args['page'] ?? 1;
      _size = args['size'] ?? this.size;
    } else {
      _currentPage = 1;
    }
    await loadMore();
    return super.refresh(args);
  }

  int loadErrorTime = 0;
  Future<void> loadMore() async {
    // if (loadErrorTime > 5) return;
    if (!isRefreshing()) {
      this.makeRefreshingStatus();
      this.notifyStateChanged();
    }
    try {
      await _loader.call(this.page, this.size, this, false);
      loadErrorTime = 0;
      if (this.isSuccess() || this.isNoneStatus()) {
        _currentPage++;
      }
    } catch (e, s) {
      this.makeErrorStatus();
      logger.error('${this} onPageLoad', e, s);
    }
    // if (this.isError()) {
    //   loadErrorTime++;
    // }
    this.notifyStateChanged();
  }

  void update({
    @required List<T> newData,
    @required int total,
    @required bool isNetError,
    bool isDataFromTimer = false, //是不是定时器的数据
  }) {
    if (newData != null) {
      //如果数据源是来自于定时器
      if (!isDataFromTimer) {
        if (this.page == 1) {
          _itemViewModels =
              List.generate(newData.length, (index) => newData[index]);
        } else {
          _itemViewModels.addAll(newData);
        }
      } else {
        List<T> newItemViewModels = [];
        for (var item in newData) {
          int count = _itemViewModels.length;
          IViewModel viewModel;
          for (var i = 0; i < count; i++) {
            viewModel = _compare.call(_itemViewModels[i], item);
            if (viewModel != null) {
              _itemViewModels[i] = viewModel;
              break;
            }
          }
          if (null == viewModel) {
            newItemViewModels.add(item);
          }
        }
        _onFoundNewDataListener?.call(newItemViewModels);
      }
    }
    if (!isDataFromTimer) {
      if (isNetError) {
        makeErrorStatus();
      } else {
        _total = total;
        makeSuccessStatus();
      }
    }
  }

  @override
  List<LoadMoreViewStyle> get styleList => [LoadMoreViewStyle()];
}
