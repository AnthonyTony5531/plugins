
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/bottom_nav/bottom_navigation_bar_extent_config.dart';
import 'package:fast_ai/pages/guide/cliper/circle_cliper_path.dart';
import 'package:fast_ai/pages/guide/cliper/line_painter.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';


enum IndexGuideType{
  TabSdk,IconSdk
}


class IndexGuideView extends StatefulWidget {

  final VoidCallback finishCallback;
  final IndexGuideType indexGuideType;

  IndexGuideView({Key key, this.finishCallback,this.indexGuideType}) : super(key : key);

  @override
  _IndexGuideViewState createState() => _IndexGuideViewState();
}


class _IndexGuideViewState extends State<IndexGuideView> {

  var hotGuide = config.langMap['baseLang']['page']['guideData']['hotGuide'];

  int step  = 1;

  bool showGuideView = false;


  TextStyle textStyle = AiTextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.none,fontWeight: config.skin.fontWeight.regular);

  @override
  void initState() {
    // 3.10版本移除首页引导页
    // showGuideView = AiCache.get().getBool(AiCache.NEED_SHOW_HOT_PAGE_GUIDE) ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showGuideView ? Stack(
      children: <Widget>[
        (config.isTabSDK || config.isFlutterSdk || config.isFastAiSdk) ? tabSdkFirstStepGuideView() : iconSdkFirstStepGuideView(),
        Offstage(
          offstage: step != 2,
          child: GestureDetector(
            onTap: () async {
              if(mounted){
                setState(() {
                  showGuideView = false;
                  AiCache.get().setBool(AiCache.NEED_SHOW_HOT_PAGE_GUIDE, false);
                });
              }
              if(widget.finishCallback != null){
                widget.finishCallback();
              }
            },
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Stack(
                children: <Widget>[

                  Positioned(
                    bottom: 40,
                    left: 1,
                    right: 1,
                    child: AiSvgPicture.asset('assets/images/guide/img_home_2nd_into.svg', fit: BoxFit.fitWidth),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ) : SizedBox();
  }

  Widget iconSdkFirstStepGuideView(){
    double width = MediaQuery.of(context).size.width;
    double textWidth = AiMeasure.measureText('${hotGuide['guide1']}', textStyle).width;
    double guide5TextWidth = AiMeasure.measureText('${hotGuide['guide5']}', textStyle).width;

    return Offstage(
      offstage: step != 1,
      child: GestureDetector(
        onTap: (){
          if(mounted){
            setState(() {
              step = 2;
            });
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipPath(
                clipper: CircleClipperPath(circles: [
                  CirclePosition(radius: 18,marginTop: MediaQuery.of(context).viewPadding.top + 7,marginRight: 5),
                  CirclePosition(radius: 25,marginBottom: MediaQuery.of(context).viewPadding.bottom+7,marginLeft: width/10 - 25),
                ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            Positioned.fill(child: CustomPaint(
              painter: DashLinePainter(
                  circles: [
                    CirclePosition(radius: 21,marginTop: MediaQuery.of(context).viewPadding.top + 4,marginRight: 2),
                    CirclePosition(radius: 28,marginBottom: MediaQuery.of(context).viewPadding.bottom+7 - 3,marginLeft: width/10 - 25 -3),
                  ]
              ),),
            ),

            Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom + 56 + 86,
              left: 120,
              child: Text('${hotGuide['guide2']}\n${hotGuide['guide3']}',style: textStyle,textAlign: TextAlign.center,),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 150,
              left: (width-guide5TextWidth)/2,
              child: Text('${hotGuide['guide5']}',style: textStyle,textAlign: TextAlign.center,),
            ),
//            Positioned(
//              top: MediaQuery.of(context).viewPadding.top + 180,
//              left: (width-textWidth)/2,
//              child: Text('${hotGuide['guide1']}',style: textStyle,textAlign: TextAlign.center,),
//            ),
//            Positioned(
//              top: 220,
//              left: 1,
//              right: 1,
//              child: AiSvgPicture.asset('assets/images/guide/img_home_into_jizhitop.svg', fit: BoxFit.fitWidth),
//            ),
            Positioned(
              right: 1,
              bottom: MediaQuery.of(context).viewPadding.bottom + 30,
              child: AiSvgPicture.asset('assets/images/guide/img_home_into_cocobot.svg',fit: BoxFit.contain),
            ),

          ],
        ),
      ),
    );
  }

  Widget tabSdkFirstStepGuideView(){
    double width = MediaQuery.of(context).size.width;
    double textWidth = AiMeasure.measureText('${hotGuide['guide4']}', textStyle).width;
    return Offstage(
      offstage: step != 1,
      child: GestureDetector(
        onTap: (){
          if(mounted){
            setState(() {
              step = 2;
            });
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipPath(
                clipper: CircleClipperPath(circles: [
                  CirclePosition(radius: 21,marginTop: MediaQuery.of(context).viewPadding.top+5,marginRight: 4),
                ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            Positioned.fill(child: CustomPaint(
              painter: DashLinePainter(
                  circles: [
                    CirclePosition(radius: 24,marginTop: MediaQuery.of(context).viewPadding.top+2,marginRight: 2),
                  ]
              ),),
            ),

            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 130,
              left: (width-textWidth)/2,
              child: Text('${hotGuide['guide4']}',style: textStyle,textAlign: TextAlign.center,),
            ),

            Positioned(
              right: 1,
              bottom: MediaQuery.of(context).viewPadding.bottom + 30,
              child: AiSvgPicture.asset('assets/images/guide/img_home_into_cocobot.svg',fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }

}
