
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-06
 * 可计算当前显示项的ListView
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:flutter/material.dart';


typedef ShouldRebuildFunction<T>  = bool Function(T oldWidget,T newWidget); 

class ShouldRebuild<T extends Widget> extends StatefulWidget {
  final T child;
  final ShouldRebuildFunction<T> shouldRebuild;
  ShouldRebuild({Key key, @required this.child, @required this.shouldRebuild}) : super(key: key);

  @override
  _ShouldRebuildState createState() => _ShouldRebuildState<T>();
}

class _ShouldRebuildState<T extends Widget> extends State<ShouldRebuild> {

  @override
  ShouldRebuild<T> get widget => super.widget;
  T oldWidget;

  @override
  Widget build(BuildContext context) {
    final T newWidget = widget.child;
    if(this.oldWidget == null || widget.shouldRebuild == null || widget.shouldRebuild(oldWidget,newWidget)){
    // if(this.oldWidget == null || widget.shouldRebuild == null || true){
      this.oldWidget = newWidget;
    }else{
      // logInfo("ShouldRebuild no chage ...... ");
    }
    return oldWidget;
  }
}
