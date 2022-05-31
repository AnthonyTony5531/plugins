//**********************************************************************
//* author:Sam
//* date:2020-08-26
//**********************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

//下拉上拉容器
class PageSliderContainer extends StatefulWidget {
  final Widget topChild;
  final Widget bottomChild;
  final Widget body;
  PageSliderController controller;

  PageSliderContainer({Key key, @required this.body, @required  this.controller, @required  this.topChild,  @required this.bottomChild}) : super(key: key){
     this.controller  ??= PageSliderController();
  }
  @override
  _PageSliderContainerState createState() => _PageSliderContainerState();
}

class _PageSliderContainerState extends State<PageSliderContainer> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: widget.controller, child: Consumer<PageSliderController>(
      builder: (_, controller, __){
        return  PageSliderContainerRenderObjectWidget(
          offset: controller?.offset,
          controller: controller,
          children: <Widget>[
            widget.body,
            controller?.offset?.dy == 0.0 ? SizedBox() : widget.topChild,
            controller?.offset?.dy == 0.0 ? SizedBox() : widget.bottomChild,
          ],
        );
      },
    ),);
  }

  @override
  void dispose() {
    super.dispose();
    widget?.controller?.dispose();
  }
}




class PageSliderContainerRenderObjectWidget extends MultiChildRenderObjectWidget{

  final Offset offset;
  final PageSliderController controller;

  PageSliderContainerRenderObjectWidget({Key key,this.offset,  List<Widget> children, this.controller}): super(key: key, children: children);


  @override
  RenderBox createRenderObject(BuildContext context) {
    print("$offset");
    return PageSliderContainerWidget(offset: offset,controller: controller);
  }







  @override
  void updateRenderObject(BuildContext context, PageSliderContainerWidget renderObject) {
    renderObject..offset = offset;
    renderObject..controller = controller;
  }

}

class PageSliderContainerWidget extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, PageSliderContainerData>,
        RenderBoxContainerDefaultsMixin<RenderBox, PageSliderContainerData> {

   Offset _offset;
   PageSliderController _controller;

   set controller(PageSliderController value){
     if (_controller == value)
       return;
     _controller = value;
     markNeedsLayout();
   }

   set offset(Offset offset){
     if (_offset == offset)
       return;
     _offset = offset;
     markNeedsLayout();
   }


   PageSliderContainerWidget({List<RenderBox> children, Offset offset, double screenWith,double screenHeight,  PageSliderController controller}): _offset = offset, _controller = controller {
    this.addAll(children);
  }



  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! PageSliderContainerData)
      child.parentData = PageSliderContainerData();
  }







  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    size = Size(constraints.maxWidth,constraints.maxHeight);


    RenderBox body  = firstChild;
    final PageSliderContainerData bodyParentData = body.parentData as PageSliderContainerData;


    body.layout(BoxConstraints.loose(size),parentUsesSize: true);
    bodyParentData.offset = Offset(_offset.dx, _offset.dy);



    RenderBox topChild  = bodyParentData.nextSibling;
    topChild.layout(BoxConstraints.loose(size),parentUsesSize: true);

    final PageSliderContainerData topChildParentData = topChild.parentData as PageSliderContainerData;
    topChildParentData.offset = Offset(_offset.dx, _offset.dy-topChild.size.height);


    RenderBox bottomChild  = topChildParentData.nextSibling;
    bottomChild.layout(BoxConstraints.loose(size),parentUsesSize: true);

    final PageSliderContainerData bottomChildParentData = bottomChild.parentData as PageSliderContainerData;
    bottomChildParentData.offset = Offset(0, size.height+_offset.dy);

    _controller?._containerHeight = size.height;
    _controller?._topHeight = topChild.size.height;
    _controller?._bottomHeight = bottomChild.size.height;

  }


   void paintRenderBox(PaintingContext context, Offset offset) {
     defaultPaint(context, offset);
   }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox child = firstChild;
    while (child != null) {
      final PageSliderContainerData childParentData = child.parentData as PageSliderContainerData;
      context.pushClipRect(needsCompositing, offset, Offset.zero & size, paintRenderBox);
      child = childParentData.nextSibling;
    }
  }



   void defaultPaint(PaintingContext context, Offset offset) {
     RenderBox child = firstChild;
     while (child != null) {
       final PageSliderContainerData childParentData = child.parentData as PageSliderContainerData;
       context.paintChild(child, childParentData.offset + offset);
       child = childParentData.nextSibling;
     }
   }


   @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result,position: position);
  }



}


class PageSliderContainerData  extends ContainerBoxParentData<RenderBox>{




}



class PageSliderController with ChangeNotifier{
  Offset _offset =Offset.zero;

  double get containerHeight =>_containerHeight;


  double get topHeight =>_topHeight;

  double get  bottomHeight => _bottomHeight;

  double _containerHeight = 0.0;


  double _topHeight = 0.0;

  double _bottomHeight = 0.0;


  Offset get offset => _offset;

  set offset(Offset value){
    if(null == value)
      return;
    if(_offset.dy == value.dy && value.dx ==_offset.dx ){
      return;
    }
    _offset = value;
    notifyListeners();
  }

}
