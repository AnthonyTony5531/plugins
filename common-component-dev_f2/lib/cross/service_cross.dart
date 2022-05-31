// @author king
// @date 2021-05-21
import 'package:common_component/cross/cross.dart';
import 'package:common_component/mvvm/model/service/service.dart';

//夸组件service调用声明接口
abstract class IServiceCross  extends ICross{

  dynamic ins;

  String get name;

  IServiceCross();
  @override
  void init() {
    ins = IService.services[name];
  }
}