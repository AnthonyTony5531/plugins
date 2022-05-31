/// @author king
/// @date 2021/8/12
///

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/util/automatic_keep_alive_statefulview_mixin.dart';
import 'package:flutter/material.dart';
import 'loadmore_view_style.dart';
import 'loadmore_view_model.dart';

typedef LoadMoreScrollViewChildBuilder<T extends IViewModel> = Widget Function(
    BuildContext context, LoadMoreViewModel<T> model);

//加载更多listview
class LoadMoreView<T extends IViewModel>
    extends StatefulView<LoadMoreViewStyle, LoadMoreViewModel<T>> {
  final LoadMoreViewModel<T> model;

  final LoadMoreScrollViewChildBuilder<T> scrollViewChildBuilder;
  LoadMoreView({
    Key key,
    @required this.model,
    @required this.scrollViewChildBuilder,
  }) : super(model: model, key: key);

  @override
  _LoadMoreViewState<T> createState() => _LoadMoreViewState<T>();
}

class _LoadMoreViewState<T extends IViewModel>
    extends ViewState<LoadMoreViewStyle, LoadMoreViewModel<T>, LoadMoreView<T>>
    with AutomaticKeepAliveStatefulViewMixin {
  LoadMoreViewModel<T> _viewModel;
  @override
  LoadMoreViewModel<T> get defaultModel {
    _viewModel ??= LoadMoreViewModel<T>();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    super.render(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // 暂时不需要滑动后刷新数据
          // model.updateCurrentVisibleData();
        } else if (notification is ScrollUpdateNotification) {
          if (notification.metrics.axis == Axis.horizontal) {
            return false;
          }
          if (notification.metrics.pixels >
                  notification.metrics.maxScrollExtent - 100 &&
              model.page * model.size < model.total) {
            if (model.isRefreshing()) {
              return false;
            }
            model.makeRefreshingStatus();
            model.notifyStateChanged();
            model.loadMore();
          }
        }
        return false;
      },
      child: widget.scrollViewChildBuilder(context, model),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  bool get wantKeepAlive => true;
}
