

import 'package:fast_ai/pages/guide/guide_view.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';


double floatShoppingCarX = 0;
double floatShoppingCarY = 0;


///
///
///
class FloatGuideViewHelper{
  static OverlayEntry guideViewOverlayEntry;
  static BuildContext context;
  static GuidePageKey curGuidePageKey;
  static Map<String,bool> _canShowPage = {"hotPage": true,};


  /// 只初始化一次
  static void init(BuildContext cxt){
    context = cxt;
  }


  ///
  static void showGuideView(GuidePageKey pageName){
    if(context == null){
      return;
    }
    if(pageName == curGuidePageKey){
      return;
    }
    if(guideViewOverlayEntry != null){
      hideGuideView();
    }
    curGuidePageKey = pageName;
    if (guideViewOverlayEntry == null) {
      WidgetsBinding.instance.addPostFrameCallback((cb){
        guideViewOverlayEntry = OverlayEntry(builder: (context){
          return GuideView(pageName: pageName, finishCallback: (){
            hideGuideView();
          },);
        });
        Overlay.of(context).insert(guideViewOverlayEntry);
      });
    }
  }

  static void hideGuideView(){
    try{
      guideViewOverlayEntry?.remove();
      guideViewOverlayEntry = null;
      curGuidePageKey = null;
    } catch(e){
      guideViewOverlayEntry = null;
      curGuidePageKey = null;
      //print("hideGuideView:::$e");
    }

  }

  static bool showing(){
    return guideViewOverlayEntry != null;
  }

  static void setCanShowPage(String page){
    if(isNullOrEmpty(page)){
      return;
    }
    _canShowPage[page] = true;
  }

  static bool isCanShowPage(String page){
    if(isNullOrEmpty(page)){
      return false;
    }
    if(_canShowPage.containsKey(page)){
      return _canShowPage[page];
    } else {
      return false;
    }

  }

  static void kill(){
    context = null;
  }

}


