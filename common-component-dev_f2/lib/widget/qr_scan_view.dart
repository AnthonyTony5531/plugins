// /*
//  * @Author: King
//  * @Date: 2021-08-17 11:52:13
//  * @Last Modified by: King
//  * @Last Modified time: 2021-08-17 11:59:36
//  */

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:scan/scan.dart';

// typedef QrScanBuilder = Widget Function(Widget scanWidget);

// //二维码扫描页面
// class QrScanView extends StatefulWidget {
//   final QrScanBuilder builder;
//   final Color color;
//   final double scanAreaScale;
//   const QrScanView({Key key, @required this.builder, this.color= Colors.blue, this.scanAreaScale=0.7}) : super(key: key);

//   @override
//   _QrScanViewState createState() => _QrScanViewState();
// }

// class _QrScanViewState extends State<QrScanView> {
//   ScanController controller = ScanController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(ScanView(
//       controller: controller,
//       scanAreaScale: widget.scanAreaScale,
//       scanLineColor: widget.color,
//       onCapture: (data) {
//         Navigator.pop(context, data);
//       },
//     ));
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.pause();
//   }
// }
