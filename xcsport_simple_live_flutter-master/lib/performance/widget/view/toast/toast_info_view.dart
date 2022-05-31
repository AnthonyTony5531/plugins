import 'package:flutter/material.dart';

/// @author grey
/// Function :

class ToastInfoView extends StatelessWidget {
  final String message;

  const ToastInfoView(this.message);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: height - 50.0,
      bottom: 0.0,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.black,
          width: double.infinity,
          height: 50.0,
          alignment: Alignment.centerLeft,
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
