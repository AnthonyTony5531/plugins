// @author king 
// @date 2020-12-06


import 'package:flutter/cupertino.dart';

import 'sc_refresh_container.dart';

class  ScFreshContainerRenderObject extends MultiChildRenderObjectWidget{
  final double translate;
  final bool isStack;
  ScFreshContainerRenderObject({Key key,this.translate, this.isStack=false,List<Widget> children}): super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ScFreshContainer(translate: translate, isStack:this.isStack);
  }

  @override
  void updateRenderObject(BuildContext context, ScFreshContainer renderObject) {
    renderObject.translate = this.translate;
    renderObject.isStack = this.isStack;
  }

}


