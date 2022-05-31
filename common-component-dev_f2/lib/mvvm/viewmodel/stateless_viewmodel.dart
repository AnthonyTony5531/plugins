

import 'package:common_component/mvvm/viewmodel/style_viewmodel.dart';
import 'package:common_component/theme/view_style.dart';

///无状态视图模型
///注意：
///1:get 方法不能进行查询和遍历操作，比如for循环，数据量多的map取值
///2:set 方法耗时任务不允许同步操作，耗时任务要异步
abstract class StatelessViewModel<S extends ViewStyle>  extends StyleViewModel<S>{


  StatelessViewModel() {
    init();
  }

  void init(){
    try {
      onInit();
      onStyleInit();
    } catch (e, s) {
      throw 'onInit error:$s';
    }
  }

  //创建ViewModel实例的时候，一定要确保调用这个方法初始化
  void onInit(){

  }

  void onStyleInit() {
    if (null != styleList && styleList.isNotEmpty) {
      this.style = styleList[0];
    }
  }
}

