/// * ClassName: model_state
/// * Description: model 状态扩展类

/// 页面状态类型
enum ViewState {
  idle,
  loading,
  empty,
  error,
  data,
}

mixin ModelDataState {

  ViewState _viewState = ViewState.loading;

  bool get loading => _viewState == ViewState.loading;

  bool get idle => _viewState == ViewState.idle;

  bool get empty => _viewState == ViewState.empty;

  bool get error => _viewState == ViewState.error;

  bool get data => _viewState == ViewState.data;

  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewState = viewState;
  }

}