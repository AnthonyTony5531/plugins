// @author king
// @date 2020-11-09

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//文字提示窗口

enum ToastAlignment { TOP, BOTTOM, CENTER }

class ToastWindow {
  static bool _canShowNext = true;

  static Future<void> show(String text, {bool isBlackStyle, ToastAlignment alignment}) async {

    if (isBlackStyle == null) isBlackStyle = false;
    if (alignment == null) alignment = ToastAlignment.CENTER;

    ToastGravity gravity = ToastGravity.CENTER;
    switch (alignment) {
      case ToastAlignment.TOP:
        gravity = ToastGravity.TOP;
        break;
      case ToastAlignment.BOTTOM:
        gravity = ToastGravity.BOTTOM;
        break;
      case ToastAlignment.CENTER:
        gravity = ToastGravity.CENTER;
        break;
    }

    await Fluttertoast.cancel();
    if (Platform.isIOS) {
      if (_canShowNext) {
        _canShowNext = false;
        Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: gravity,
          backgroundColor: isBlackStyle ? Color(0xB2000000) : Color.fromRGBO(239, 240, 245, 0.9),
          textColor: isBlackStyle ? Colors.white : Color(0xff333333),
          fontSize: 14.0,
        );
        Future.delayed(Duration(seconds: 1), () {
          _canShowNext = true;
        });
      }
      return;
    } else {
      Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        backgroundColor: isBlackStyle ? Color(0xB2000000) : Color.fromRGBO(239, 240, 245, 0.9),
        textColor: isBlackStyle ? Colors.white : Color(0xff333333),
        fontSize: 14.0,
      );
    }
  }

}
