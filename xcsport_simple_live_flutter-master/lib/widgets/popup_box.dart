/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：显示弹窗口
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:ui';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/widgets/ai_bottom_sheet.dart';
import 'package:fast_ai/widgets/popup_drag_page.dart';
import 'package:fast_ai/widgets/popup_float_page.dart';
import 'package:fast_ai/widgets/popup_page.dart';
import 'package:fast_ai/widgets/popup_slider_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'float_widget.dart';

/*
 * 
       await Navigator.push(context, PopupBox(
        child : DateSelector()
      ));
 */

Future showPopup1(BuildContext context,Widget child, [bool isFullScreen = false, VoidCallback onClose]){
  return _showPopup1(context,child,isFullScreen,onClose);
}

Future showPopup(BuildContext context,Widget child, [bool isFullScreen = false, VoidCallback onClose, RouteSettings routeSettings])async{
  await _showPopup1(context,child,isFullScreen,onClose,routeSettings);
}

Future _showPopup1(BuildContext context,Widget child, [bool isFullScreen = false, VoidCallback onClose, RouteSettings routeSettings])async{
  showModalBottomSheet(
    routeSettings: routeSettings,
    isScrollControlled: true,
    context: context, 
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      if(isFullScreen){ //全屏
        double topOffset = 0;
        if(isFullScreen){
          double pixelRatio = MediaQuery.of(context).devicePixelRatio;
          double topPadding = window.padding.top / pixelRatio;
          topOffset = topPadding;
        }
        return Container(
          //padding: EdgeInsets.only(top: topOffset),
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: (){ 
                  if (onClose != null) {
                    onClose();
                  }
                  AiRouter.pop(context);
                },
                child: Container(
                  height: kToolbarHeight + topOffset,
                  //color: Colors.white10,
                )
              ),
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),),
                    child: child
                ),
              ),
            ],
          )
        );
      }else{//非全屏
        double topOffset = 0;
        if(isFullScreen){
          double pixelRatio = MediaQuery.of(context).devicePixelRatio;
          double topPadding = window.padding.top / pixelRatio;
          topOffset = topPadding;
        }
        return Container(
          padding: EdgeInsets.only(top: topOffset),
          child: Column(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: (){ 
                    if (onClose != null) {
                      onClose();
                    }
                    AiRouter.pop(context);
                  },
                  child: Container(
                    //color: Colors.white10,
                  )
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),),
                child: child
              ),
            ],
          ),
        );
      }
    }
  );

  config.edgePopGesture = true;
}

Future popuDialog(BuildContext context,Widget child,)async{
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(top: 1),
        child: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: (){
                AiRouter.pop(context);
              },
              child: Container(
              //color: Colors.white10,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: child
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                AiRouter.pop(context);
              },
              child: Container(
              //color: Colors.white10,
              )
            ),
          ),
        ],
        ),
      );
    }
  );

  config.edgePopGesture = true;
}

Future showPage(BuildContext context, Widget child, [PopAnimate popAnimate = PopAnimate.Right])async{
  return showPageSheet(context,child,popAnimate);
}

Future showDragPage(BuildContext context, Widget child, [PopAnimate popAnimate = PopAnimate.Right])async{
  showDragPageSheet(context,child,popAnimate);
}

Future showMaterialPageRoute(BuildContext context, Widget child,{RouteSettings settings, VoidCallback goBack})async{
  return showSliderPageSheet(context,child,settings: settings).then((value) => goBack?.call());
}

Future showSystemDefaultMaterialPageRoute(BuildContext context, Widget child,{void Function(dynamic) onValue, RouteSettings settings})async{
  return AiRouter.pushWithRoute(context, MaterialPageRoute(builder: (BuildContext context) => child,settings: settings)).then((value) {
    AiRouter.updateEdgePopGestureStatus();
    if(onValue != null){
      onValue(value);
    }
  });
}

Future showModalBottomSheetRoute(
    BuildContext context,
    {Widget child,
      double height = -1,
      Color barrierColor,
      bool isClip = true,
      bool enableDrag = true,
      bool isMiniGame = false,
    }){
  if(height == -1){
    height = MediaQuery.of(context).size.height * 0.7;
  }

  if(isMiniGame) {
    return aiShowModalBottomSheet(
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      barrierColor: barrierColor,
      builder: (BuildContext _context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0)
          ),
          child: Container(
            height: height,
            child: child,
          ),
        );
      }
    );
  }

  return showModalBottomSheet(
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      barrierColor: barrierColor,
      builder: (BuildContext _context) {
          if(isClip){
            return ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
              child: Container(
                height: height,
                child: child,
              ),
            );
          }
          else{
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              height: height,
              child: child,
            );
          }
      });
}

// Future showFloatPageRoute(BuildContext context, Widget child,[bool directShow = false])async{
//   // showSliderPageSheet(context,child);
//   // showRightView(context,child,directShow);
//   showFloatWidgetPage(context,child);
// }

// void closeFloatPageRoute(BuildContext context){
//   // hideSliderPageSheet(context);
//   // hideRightView();
//   closeFloatWidgetPage(context);
// }

enum PopAnimate{
  Size,
  Fade,
  Scale,
  Rotation,
  Down,
  Up,
  Right,
  Left
}

class PopupPageLayout extends StatelessWidget {
  final Widget child;
  const PopupPageLayout({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x33000000),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              AiRouter.pop(context);
            },
            child: Container(
              color:  Color(0x01000000),
              height: kToolbarHeight + AiMeasure.topOffset(context),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: child,
              )
            ),
          )
        ],
      )
    );
  }
}

