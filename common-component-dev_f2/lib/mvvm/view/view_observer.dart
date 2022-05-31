// @author king
// @date 2021-05-21

//视图刷新的接口。禁止直接持有这个类的引用。需要用DisposableReference来持有
import 'dart:ui';

abstract class ViewObserver{
  //刷新视图
  void updateState([VoidCallback fn]);

  //在数据变化后，刷新视图刷新之前执行，一般用来做ViewModel属性变换View使用
  void onDataUpdatedAfter();

}

