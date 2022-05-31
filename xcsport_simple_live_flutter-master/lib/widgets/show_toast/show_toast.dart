import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool _canShowNext = true;

void showToas(String text, {Color backgroundColor}) async {
  await Fluttertoast.cancel();
  if (Platform.isIOS) {
    if (_canShowNext) {
      _canShowNext = false;
      Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: backgroundColor ?? Color(0xB2000000),
        textColor: Colors.white,
        fontSize: 16.0,
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
      gravity: ToastGravity.CENTER,
      backgroundColor: backgroundColor ?? Color(0xB2000000),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
