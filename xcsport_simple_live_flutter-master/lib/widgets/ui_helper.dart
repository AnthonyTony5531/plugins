//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************

import 'package:fast_ai/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static Widget circularRectangleContainer(
      {VoidCallback onTap,
      Widget child,
      Color color = Colors.white,
      Color bolderColor = Colors.transparent,
      double bolderWidth = 0.0,
      EdgeInsets padding,
      BorderRadiusGeometry borderRadius}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          color: color,
          border: new Border.all(color: bolderColor, width: bolderWidth),
          shape: BoxShape.rectangle,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }

  static Size measureSize(GlobalKey key) {
    try {
      RenderBox box = key.currentContext?.findRenderObject();
      if (null != box) {
        return box.size;
      }
    } catch (e) {}
    return Size(0, 0);
  }

  static Offset globalToLocal(GlobalKey key) {
    try {
      RenderBox box = key.currentContext?.findRenderObject();
      if (null != box) {
        return box.globalToLocal(Offset.zero) ??Offset.zero;
      }
    } catch (e) {}
    return Offset.zero;
  }

  static Offset localToGlobal(GlobalKey key) {
    try {
      RenderBox box = key.currentContext?.findRenderObject();
      if (null != box) {
        return box.localToGlobal(Offset.zero)??Offset.zero;
      }
    } catch (e) {}
    return Offset.zero;
  }

  static double measureSizeHeight(GlobalKey key) {
    try {
      RenderBox box = key.currentContext?.findRenderObject();
      if (null != box) {
        return box.size.height;
      }
    } catch (e) {}
    return 0;
  }

  static Offset findOffset(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject();
    Offset offset;
    try {
      offset = box?.localToGlobal(Offset.zero);
    } catch (e) {
      logDebug(e);
    }
    return offset ?? Offset.zero;
  }
}
