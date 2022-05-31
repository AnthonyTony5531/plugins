// @author king
// @date 2021-05-21


import 'package:common_component/theme/theme.dart';

//皮肤的样式
abstract class ViewStyle implements ITheme{
  //皮肤的名字，用了来作为皮肤的名字，切换时候根据这个名字去使用
  String get name=>null;
}