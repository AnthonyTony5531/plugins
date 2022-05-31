//**********************************************************************
//* author:Sam
//* date:2020-08-29
//**********************************************************************


import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/loading_widget/ai_match_page_loading.dart';
import 'package:flutter/material.dart';

class AiPageLoading extends StatelessWidget {
  final bool isHiddenClose;
  final bool isListDetail;

  AiPageLoading({Key key, isHiddenClose, isListDetail})
      : isHiddenClose = isHiddenClose ?? false,
        isListDetail = isListDetail ?? false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
//    double height = isListDetail ? 100.0 : 120.0;
    double height = 120.0;
    double width = media.size.width * 1.5;
    double pixelRatio = media.devicePixelRatio;
    Color closeCol = isHiddenClose ? Colors.transparent : null;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          AiMatchPageLoading(
            width: width,
            height: height,
            colors: const [
              Colors.transparent,
              Color(0x19ffffff),
              Colors.transparent,
            ],
            bold: 20.0,
            lineCount: 14,
            animateTime: 2000,
          ),
          isListDetail||isHiddenClose?Container():Positioned(
            top: AiMeasure.topOffset(context)+5,
            right: 1,
            child: GestureDetector(
              onTap: () {
                if (!isHiddenClose) {
                  AiRouter.pop(context);
//                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(9),
                margin: EdgeInsets.only(right: 0),
                child: AiSvgPicture.asset(
                    'assets/images/detail/head/icon_detail_x_white.svg',
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//class AiPageLoading extends StatelessWidget {
//  final bool isHiddenClose;
//  final bool hasAnimation;
//  final bool isListDetail;
//  AiPageLoading({Key key, this.isHiddenClose = false,this.hasAnimation = true,this.isListDetail = false});
//
//   Timer _timer;
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      color: Colors.transparent ,
//      child: Stack(
//        children: <Widget>[
//          MatchPageLoading(
//              height: isListDetail ? 100.0 : 120,
//              hasAnimation: hasAnimation,
//              colors: [
//                Colors.white.withOpacity(0),
//                Colors.white.withOpacity(0.1),
//                Colors.white.withOpacity(0),
//              ],
//              bold: 18,
//              distance: 45,
//              width: 100,
//              loadingTimer: (timer) {
//                timer = timer;
//              }),
//          Offstage(
//            offstage: isHiddenClose,
//            child: Align(
//              alignment: Alignment.topRight,
//              child: InkWell(
//                onTap: () {
//                  print('00--AiPageLoading--');
//                  _timer?.cancel();
//                  Navigator.pop(context);
//                },
//                child: Container(
//                    padding: EdgeInsets.only(
//                        top: AiMeasure.topOffset(context) + 14,
//                        left: 20,
//                        right: 10),
//                    child: Container(
//                      child: AiSvgPicture.asset(
//                          'assets/images/detail/head/icon_detail_x_white.svg',
//                          width: 22,
//                          height: 22,
//                          fit: BoxFit.cover),
//                    )
//                ),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
