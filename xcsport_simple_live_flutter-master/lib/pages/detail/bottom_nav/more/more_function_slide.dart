

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_slide_video.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double sliderWidth = 200.0;

class MoreFunctionSlide{

//  static double offsetX = 0;
//  static double bufferOffsetX= 0;
//  static StateSetter stateSet;
//  static AnimationController animationController;
//  static double distance = 0;
//  static bool isEndDrag = true;
//  static double startDistanceX = 0;
//  static double leftMargin = 60.0;
//  static double bufferValue = 0.1;
//  static bool isShowMenu = false;
//  static bool isClickMoreBtn = false;
//  static OverlayEntry _overlayEntry;
//  static bool isShowMoreVideo = false;
//  static bool isCoverViewDrag = false;
//  static Size size;
  bool isListDetail = false; //精选页进详情
  bool isFreeAnchor = false; //自由播主播
  double offsetX = 0;
  double bufferOffsetX= 0;
  StateSetter stateSet;
  AnimationController animationController;
  double distance = 0;
  bool isEndDrag = true;
  double startDistanceX = 0;
  double leftMargin = 60.0;
  double bufferValue = 0.1;
  bool isShowMenu = false;
  bool isClickMoreBtn = false;
  OverlayEntry _overlayEntry;
  bool isShowMoreVideo = false;
  bool isCoverViewDrag = false;
  Size size;

  void showMoreVideo(
      BuildContext context, {
      String gameType,
      String currentGidm,
      LiveVideoInfo currentLiveVideoInfo,
      AnimationController controller,
      bool isClickMore = false,
      VoidCallback closeCallback}
      ){

    if(isClickMore){
      // 防止连续点击
      if(isShowMoreVideo){
        return;
      }
      isShowMoreVideo = true;
      Future.delayed(Duration(seconds: 1),(){
        isShowMoreVideo = false;
      });
    }
    isClickMoreBtn = isClickMore;
    reset();
    size = MediaQuery.of(context).size;
    leftMargin =  size.width - sliderWidth;
    offsetX = isClickMoreBtn ? 0.0 : size.width;
    isEndDrag = isClickMore ? true : false;
    animationController = controller;
    animationController.addListener(slideListener);
    Future.delayed(Duration(milliseconds: 300),(){
      animationController?.reset();
      animationController?.forward();
    });
    offsetX = size.width;

   // _overlayEntry?.remove();
   // _overlayEntry = null;
    OverlayState overlayState = Overlay?.of(context);
    if(_overlayEntry == null){
      _overlayEntry = OverlayEntry(builder: (BuildContext context){
        return StatefulBuilder(builder: (BuildContext context, StateSetter stateSetter){
          stateSet = stateSetter;
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: isShowMenu ? 0.0 : size.width,
                  top: 0.0,
                  width: isShowMenu ? size.width : 0.0,
                  height: isShowMenu ? size.height : 0.0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: (){
                      closeMoreVideo(size);
                    },
                    onHorizontalDragStart: (detail){
                      isShowMenu = true;
                      distance = 0;
                      bufferOffsetX = -200.0;
                      isShowMoreVideo = false;
                    },
                    onHorizontalDragEnd: (details){
                      isCoverViewDrag = true;
                      onHorizontalDragEnd(details, context);
                    },
                    onHorizontalDragUpdate: (details){
                      isCoverViewDrag = true;
                      onHorizontalDragUpdate(details,context);
                    },
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: offsetX,
                  height: size.height,
                  width: 200.0,
                  child: MoreFunctionSlideVideo(
                    isListDetail: isListDetail,
                    isFreeAnchor: isFreeAnchor,
                    currentLiveVideoInfo: currentLiveVideoInfo,
                    closeCallback: (){
                      if(closeCallback != null){
                        closeCallback();
                      }
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                      removeListener();
                    },
                  ),
                ),
              ],
            ),
          );
        });
      });
      overlayState?.insert(_overlayEntry);
    }
  }

  void slideListener(){
    if(isClickMoreBtn){
      if(isShowMenu){
        double x = size.width - animationController.value * distance;
        offsetX = startDistanceX + x;
      }
      else{
        double x = (size.width - distance) + animationController.value * distance;
        offsetX = startDistanceX + x;
      }
      if(stateSet != null){
        stateSet((){});
      }
    }
    else{
      if(isEndDrag){
        if(bufferOffsetX.abs() < 10.0){
          double x = animationController.value * distance;
          offsetX = startDistanceX + x;
        }
        else{
//            print('大于-----：${animationController.value}');
          double value = animationController.value;
          if(value < bufferValue){
            return;
          }
          bufferValue = value;
          double x = value * -distance;
          double offset = startDistanceX + x;
          offsetX = offset;
        }
        if(stateSet != null){
          stateSet((){});
        }
      }
    }
  }

  void removeListener() {
    isClickMoreBtn = false;
    animationController?.removeListener(slideListener);
  }

  void dispose(){
    try{
      isClickMoreBtn = false;
      animationController?.removeListener(slideListener);
      animationController?.stop();
      animationController?.dispose();
      animationController = null;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    catch(e){
      print('更多退出-------报错');
    }
  }

  void reset(){
    bufferValue = 0;
    offsetX = 0;
    bufferOffsetX= 0.0;
    distance = isClickMoreBtn ? 200 : 0.0;
    isShowMenu = isClickMoreBtn;
    isEndDrag = true;
    startDistanceX = 0;
    leftMargin = 60.0;
    isCoverViewDrag = false;
  }

  void closeMoreVideo(Size size){
    if(isClickMoreBtn){
      if(isShowMoreVideo){
        return;
      }
    }
    isShowMenu = false;
    if(isClickMoreBtn){
      distance = 200.0;
    }
    else{
      distance = size.width - leftMargin;
      startDistanceX = leftMargin;
      bufferOffsetX = 0.0;
    }
    animationController.reset();
    animationController.forward().then((value){
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
    removeListener();
  }


  void onHorizontalDragStart(details,context){
    Size size = MediaQuery.of(context).size;
    offsetX = size.width;
    bufferOffsetX = 0.0;
    distance = 200;
    isEndDrag = false;
    startDistanceX = 0;
  }

  void onHorizontalDragUpdate(details,context){

    Size size = MediaQuery.of(context).size;
    if(details is DragUpdateDetails){
      bufferOffsetX += details.delta.dx;
    }else if(details is PointerMoveEvent){
      bufferOffsetX += details.delta.dx;
    }
//        print('拖动距离------:$offsetX');
    double leftMargin = size.width - 200.0;
    // 左边边界
    if(size.width + bufferOffsetX <= leftMargin){
      bufferOffsetX = leftMargin - size.width;
    }
    // 右边边界
    if(bufferOffsetX >= 0){
      bufferOffsetX = 0;
    }

    offsetX = size.width + bufferOffsetX;
    if(stateSet != null ){
      stateSet((){});
    }
  }
  void onHorizontalDragEnd(details,context){
    Size size = MediaQuery.of(context).size;
//    if(details is DragEndDetails){
//      DragEndDetails endDetails = details;
//    }else if(details is PointerUpEvent){
//
//    }
    double leftMargin = size.width - 200.0;
    isEndDrag = true;
    startDistanceX = offsetX;
    double rightMargin = isCoverViewDrag ? 150.0 : 10.0;
    isClickMoreBtn = false;
    if(offsetX < size.width - rightMargin){
      isShowMenu = true;
      distance = offsetX - leftMargin;
      bufferOffsetX = leftMargin - size.width;
    }
    else{
      isShowMenu = false;
      distance = size.width - offsetX;
      bufferOffsetX = 0;
    }
    animationController?.reset();
    animationController?.forward();
    if(!isShowMenu){
      Future.delayed(Duration(milliseconds: 300),(){
        removeListener();
      });
    }

  }

}