// @author king
// @date 2021-05-21

import 'package:common_component/component/conponent.dart';
import 'package:common_component/component/route/route.dart';

import 'cache.dart';

//本工程所有IComponent都放在这，相当IComponent容器
class Components extends IComponent{
  final cache  =new Cache();
  final route = new XcRoute();
  @override
  Future<void> init() async{
    await cache.init();
  }
}