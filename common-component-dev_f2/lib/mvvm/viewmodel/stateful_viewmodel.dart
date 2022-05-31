// @author king
// @date 2021-05-21

import 'package:common_component/mvvm/view/view_observer.dart';
import 'package:common_component/mvvm/viewmodel/state_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/status/fresh_status_mixin.dart';
import 'package:common_component/theme/view_style.dart';
import 'package:common_component/util/disposable_reference.dart';

///处理动态业务的视图模型，即将是有状态的视图模型
///1:get 方法不能进行查询和遍历操作，比如for循环，数据量多的map取值
///2:set 方法耗时任务不允许同步操作，耗时任务要异步
abstract class StatefulViewModel<S extends ViewStyle> extends StateViewModel<S>
    with FreshStatusMixin {
  DisposableReference<ViewObserver> _observerReference;

  //样式初始化,返回true代表需要刷新页面
  Future<bool> onStyleInit() => Future.value(false);

  //通知状态发生变化
  @override
  Future<void> notifyStateChanged() async {
    _observerReference?.ins?.updateState();
  }

  bool _isActive = false;

  bool get isActive => _isActive;

  void onAttach() {}

  void onDetach() {}

  void didModelUpdate(StatefulViewModel oldModel, StatefulViewModel newModel) {}

  //绑定视图
  void attach(ViewObserver observer, {bool shouldDoUpdated = false}) {
    _isActive = true;
    _observerReference = new DisposableReference(observer);
    if (null != styleList && styleList.isNotEmpty) {
      this.style ??= styleList[0];
    }
    onAttach();
    _init().then((changed) {
      if (changed || shouldDoUpdated) {
        notifyStateChanged();
      }
    });
  }

  Future<bool> _init() async {
    bool changed = false;
    try {
      changed = await onInit();
    } catch (e, s) {
      throw '${this.runtimeType} onInit error:$s';
    }
    try {
      changed = await onStyleInit() || changed;
    } catch (e, s) {
      throw '${this.runtimeType} onStyleInit error:$s';
    }
    return changed;
  }

  //非托管资源初始化入口，如果返回true,那么初始化完后，会刷新页面
  Future<bool> onInit() => Future.value(false);

  //非托管资源重写该方法释放资源
  void onDispose() {}

  void detach() {
    onDetach();
    _isActive = false;
    _observerReference?.dispose();
    _observerReference = null;
    onDispose();
  }

  Future<dynamic> refresh([Map<String, dynamic> args]) => Future.value(null);
}
