/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-28
 * 说明：用于两个元素布局
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final Widget title; //标题
  final Widget text; //内容
  final Widget divider;
  final TitlePosition position; //Title的位置
  final double fixTitleSize; //固定title的大小
  final double fixSize; //固定总体的大小
  final double spanSize; //间距
  final AlignmentGeometry alignment; //整体对齐
  final bool visable;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool textExpanded;
  const TitleText({
    Key key,
    this.title,
    @required this.text,
    this.position = TitlePosition.Left,
    this.fixTitleSize,
    this.fixSize,
    this.spanSize = defaultSpanSize, 
    this.alignment, 
    this.divider, 
    this.visable = true, 
    this.mainAxisAlignment, 
    this.mainAxisSize, 
    this.textExpanded = false, 
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);
  static const double defaultSpanSize = 5;

  Widget expText(Widget child){
    if(this.textExpanded){
      return Expanded(child: child,);
    }else{
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = this.title;
    if (title == null) title = Container();
    var text = this.text;
    if (text == null) text = Container();
    var divider = this.divider;
    if (divider == null) divider = Container();
    if(!this.visable){
      title = Container();
      text = Container();
      divider = Container();
    }

    if (position == TitlePosition.Top) {
      return Container(
        height: fixSize,
        alignment: alignment,
        child: Column(
          mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: this.mainAxisSize ?? MainAxisSize.min,
          crossAxisAlignment : crossAxisAlignment,
          children: <Widget>[
            Container(child: title,margin: EdgeInsets.only(top: spanSize),height: fixTitleSize,),
            divider,
            expText(Container(child: text, margin: EdgeInsets.only(top: spanSize,bottom: spanSize))),
          ],
        ),
      );
    } else if (position == TitlePosition.Bottom) {
      return Container(
        height: fixSize,
        alignment: alignment??Alignment(0, 1),
        child: Column(
          mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: this.mainAxisSize ?? MainAxisSize.min,
          crossAxisAlignment : crossAxisAlignment,
          children: <Widget>[
            expText(Container(alignment: alignment??Alignment(0, 1),child: text,margin: EdgeInsets.only(bottom: spanSize,top: spanSize))),
            divider,
            Container(child: title,margin: EdgeInsets.only(bottom: spanSize),height: fixTitleSize),
          ],
        ),
      );
    } else if (position == TitlePosition.Right) {
      return Container(
        width: fixSize,
        alignment: alignment??Alignment(1, 0),
        child: Row(
          mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: this.mainAxisSize ?? MainAxisSize.min,
          crossAxisAlignment : crossAxisAlignment,
          children: <Widget>[
            expText(Container(alignment: alignment??Alignment(1, 0), child: text, margin: EdgeInsets.only(right: spanSize,left: spanSize))),
            divider,
            Container(child: title,margin: EdgeInsets.only(right: spanSize),width: fixTitleSize),
          ],
        ),
      );
    } else {
      return Container(
        width: fixSize,
        alignment: alignment,
        child: Row(
          mainAxisSize: this.mainAxisSize ?? MainAxisSize.min,
          mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment : crossAxisAlignment,
          children: <Widget>[
            Container(child: title,margin: EdgeInsets.only(left: spanSize),width: fixTitleSize),
            divider,
            expText(Container(child: text, margin: EdgeInsets.only(left: spanSize,right: spanSize)))
          ],
        ),
      );
    }
  }
}

enum TitlePosition { Right, Left, Top, Bottom }

