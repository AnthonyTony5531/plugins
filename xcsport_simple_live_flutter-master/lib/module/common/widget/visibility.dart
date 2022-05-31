import 'package:flutter/widgets.dart';

//用来代替Visibility
Widget Show(
    {@required bool isShow, @required Widget child, Widget replacement}) {
  return isShow ? child : replacement ?? SizedBox.shrink();
}
