import 'dart:io';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class BettingDialog extends StatefulWidget {
  final Widget child;

  BettingDialog({Key key, @required this.child}) : super(key: key);

  @override
  _BettingDialogState createState() =>
      _BettingDialogState();
}

class _BettingDialogState extends State<BettingDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          clipper: RectClipper(),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: config.skin.colors.bgColorGloabl,
              ),
              margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              child: widget.child),
        ),
        /*config.isTabSDK ?
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.topCenter,
          ),
        )
        :*/
//        InkWell(
//          onTap: (){
//            Navigator.pop(context);
//          },
//          child: Container(
//            height: config.isTabSDK && Platform.isIOS ? 95 : 65,
//            width: MediaQuery.of(context).size.width,
//            color: Colors.transparent,
//            padding: EdgeInsets.only(top: 15),
//            alignment: Alignment.topCenter,
//            child: InkWell(
//              onTap: (){
//                Navigator.pop(context);
//              },
//              child: AiSvgPicture.asset(
//                'assets/images/icon_bet_arrow_down.svg',
//                width: 24,
//                height: 24,
//              ),
//            ),
//          ),
//        ),
      ],
    );
  }
}

class RectClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBAndCorners(10, 0, size.width - 10, size.height,
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20));
    //return RRect.fromLTRB(0, 0, size.width, size.height-130);
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true;
  }
}
