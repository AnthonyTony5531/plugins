//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/19
//--------------------------------------------------------------------------

import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///红点布局,接受一个child,使他具有红点效果。
///红点有2种样式,如下
///1.如果是[LayoutType.horizontal]类型，那么红点在child的右边.
///2.如果是[LayoutType.stack]类型，那么红点在child右上角覆盖的效果
///红点有3种类型，如下
///1.[BadgeType.none] 代表没有红点
///2.[BadgeType.dot] 代表小红点
///3.[BadgeType.number]代表数字红点
// ignore: must_be_immutable
class Badge extends StatelessWidget {
  final Widget child;
  final BadgeType badgeType;
  final LayoutType layoutType;
  final int color;
  int number;

  Badge(
      {this.child,
        this.badgeType = BadgeType.none,
        this.number = 0,
        this.color,
        this.layoutType = LayoutType.horizontal});

  @override
  Widget build(BuildContext context) {
    if (BadgeType.none == badgeType) {
      return child;
    }
    return LayoutType.horizontal == layoutType
        ? _horizontalLayout()
        : BadgeWidget(
      dotChild: _dotContent(),
      numChild: child,
    );
  }

  Widget _horizontalLayout() {
    return Row(
      children: <Widget>[
        child,
        InterValHelper.w(4),
        Container(
          alignment: Alignment.centerRight,
          child: _dotContent(),
        ),
      ],
    );
  }

  Widget _dotContent() {
    number = number??0;
    return badgeType == BadgeType.dot
        ? ClipOval(
      child: Container(
        alignment: Alignment.center,
        width: 6.6,
        height:  6.6,
        color: Color(color ?? Colors.red.value),
      ),
    )
        : number <= 0
        ? Container()
        : Container(
        width: 15,
        height: 12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(color ?? Colors.red.value),
            shape: number<10?BoxShape.circle: BoxShape.rectangle,
            borderRadius: number<10?null:BorderRadius.circular(6),

        ),
        child: TextHelper.build("${number>99?"99+":number}",
          textColor: Colors.white.value, fontSize: number>99?6:8,));
  }
}


class BadgeWidget extends StatelessWidget {
  final Widget dotChild;
  final Widget numChild;

  BadgeWidget({this.dotChild, this.numChild});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: BadgeLayoutDelegate(),
      children: <Widget>[
        LayoutId(
          id: BadgeLayoutDelegate.child_id,
          child: numChild,
        ),
        LayoutId(
          id: BadgeLayoutDelegate.dot_id,
          child: dotChild,
        ),
      ],
    );
  }
}

class BadgeLayoutDelegate extends MultiChildLayoutDelegate {
  static const dot_id = "BadgeLayoutDelegate_dot_id";
  static const child_id = "BadgeLayoutDelegate_child_id";

  BadgeLayoutDelegate();



  @override
  Size getSize(BoxConstraints constraints) {
    Size size = super.getSize(constraints);
    if(size.width >0 && size.height>0){
      return size;}

    return  constraints.constrain(Size.zero);
  }

  @override
  void performLayout(Size size) {
    Size childSize = layoutChild(child_id, size.width >0 && size.height>0?BoxConstraints.loose(size): BoxConstraints());
    Size dotSize = layoutChild(dot_id, size.width >0 && size.height>0?BoxConstraints.loose(size):BoxConstraints());
    final childY  = size.height/2.0-childSize.height/2.0;
    positionChild(child_id, Offset(size.width/2.0-childSize.width/2.0, childY));
    positionChild(dot_id, Offset(size.width/2.0+childSize.width/2.0-dotSize.width/2,childY-dotSize.height/2));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}

enum BadgeType {
  none,
  dot, //红点
  number, //有数据有红背景

}

//布局类型
enum LayoutType {
  horizontal, //左右
  stack, //叠加
}
