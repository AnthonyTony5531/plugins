// @author king
// @date 2021-05-21


import 'package:flutter/widgets.dart';

///需要进行初始化，全局使用的基础工具类，用这个实现。这个实现需要在CONFIG,service等之前初始化
///。这个IComponent实现类, 只在本工程实现，其它不予实现.
abstract class IComponent  {
  Future<void> init();
}

