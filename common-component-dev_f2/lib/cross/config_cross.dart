// @author king
// @date 2021-05-21

import 'package:common_component/mvvm/model/config/config.dart';
import 'cross.dart';

//夸组件访问配置声明接口
abstract class IConfigCross  extends ICross{
  dynamic ins ;
  T  load<T extends OpenCross>() => ins as T;
  String get name;
  @override
  void init(){
    ins = IConfig.configs[name];
  }
}