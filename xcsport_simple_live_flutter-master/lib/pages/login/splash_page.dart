import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutterswiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/config/config.dart';
import 'dart:math';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _topPadding = 20;
  int index = 0;
  double offsetX = 0;
  bool _dismissing = false;
  bool _onNotification(Notification notification){
    if(index != _guideDatas.length-1 && !_dismissing) return false;
    // print('notification=$notification');
    switch (notification.runtimeType) {
      case ScrollStartNotification:
          offsetX = (notification as ScrollStartNotification)?.dragDetails?.localPosition?.dx ?? 0;
          //print('start=${(notification as ScrollStartNotification)?.dragDetails?.localPosition?.dx}');
        break;
      case ScrollUpdateNotification:
        double x = (notification as ScrollUpdateNotification)?.dragDetails?.localPosition?.dx ?? 0;
        //print('update=$x');
        if(offsetX - x > 60 && !_dismissing) {
          _dismissing = true;
          _dismiss();
          return true;
        }
        break;
      case ScrollEndNotification:
        offsetX = 0;
        break;
      case OverscrollIndicatorNotification:
        break;
      default:
    }
    return false;
  }

  void _dismiss(){
    print('_dismiss--------');
    

    AiCache.get().setString(AiCache.app_version, config.appInfo.appVersion);
//    AiRouter.pushReplacementNamed('loginPage');
    AiRouter.pushReplacementNamed(AiRouter.AiLoginPage);
  }

  final List<dynamic> _guideDatas = [
    {
      'title':'${config.langMap['baseLang']['login']['splashGuide'][0]['title']}',
      'subTitle':'${config.langMap['baseLang']['login']['splashGuide'][0]['subTitle']}',
      'color': Color(0xFFCB4739),
      'imageName': 'assets/images/guide/icon_guide1.png',
    },
    {
      'title':'${config.langMap['baseLang']['login']['splashGuide'][1]['title']}',
      'subTitle':'${config.langMap['baseLang']['login']['splashGuide'][1]['subTitle']}',
      'color': Color(0xFFF267B1),
      'imageName': 'assets/images/guide/icon_guide2.png',
    },
    {
      'title':'${config.langMap['baseLang']['login']['splashGuide'][2]['title']}',
      'subTitle':'${config.langMap['baseLang']['login']['splashGuide'][2]['subTitle']}',
      'color': Color(0xFF40A3FF),
      'imageName': 'assets/images/guide/icon_guide3.png',
    },
    {
      'title':'${config.langMap['baseLang']['login']['splashGuide'][3]['title']}',
      'subTitle':'${config.langMap['baseLang']['login']['splashGuide'][3]['subTitle']}',
      'color': Color(0xFF3B953F),
      'imageName': 'assets/images/guide/icon_guide4.png',
    }
  ];

  List<Widget> _guideWidgets = [];
  void _initGuideData() {
    if (_guideWidgets.length != 0) {
      return;
    }
    final bool flag = (_topPadding-44.0).abs() < pow(10, -14);
    for (var i = 0; i < _guideDatas.length; i++) {
      _guideWidgets.add(
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: flag ? 120 : 80.0), 
                      child: Text(_guideDatas[i]['title'], style: AiTextStyle(color: Color(0xFF000000), fontSize: 17),), 
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5), 
                      child: Text(_guideDatas[i]['subTitle'], style: AiTextStyle(color: _guideDatas[i]['color'], fontSize: 24,),), 
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: AiImage.asset(
                        _guideDatas[i]['imageName'],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    _guideDatas.length-1 == i ? Positioned(
                      bottom: 80,
                      left: (MediaQuery.of(context).size.width-160)/2,
                      child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              height: 48,
                              width: 160,
                              child: FlatButton(
                                onPressed: _dismiss,
                                color: Theme.of(context).colorScheme.secondary,
                                child: Container(child: Text('${config.langMap['baseLang']['login']['startJourney']}', style: AiTextStyle(color: Color(0xFF19263B), fontSize: 14),), alignment: Alignment.center,),
                              ),
                            ),
                          ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ],
        )
        )
        
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MediaQuery.of(context).padding.top=${MediaQuery.of(context).padding.top}');
    _topPadding = MediaQuery.of(context).padding.top;
    _initGuideData();
    return Scaffold(
      body: NotificationListener(
        onNotification: _onNotification,
        child: Swiper(
          itemCount: _guideWidgets.length,
          loop: false,
          itemBuilder: (BuildContext context, int idx) {
            return _guideWidgets[idx];
          },
          onIndexChanged: (idx){
            index = idx;
          },
          pagination: SwiperPagination(
            margin: EdgeInsets.only(bottom: 30),
            builder: DotSwiperPaginationBuilder(
              activeColor: Color(0x19000000),
              color: Color(0x19000000),
              space: 5,
              size: 5,
              activeSize: 20
            )
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    print('_SplashPageState-initState');
    super.initState();
  }

  @override 
  void dispose() {
    print('_SplashPageState-dispose');
    super.dispose();
  }
}

/*
需要修改 swiper_pagination.dart 209行
源码
        child: ClipOval(
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: active ? activeSize : size,
          ),
        ),
替换为
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: size,
          ),
        ),        
*/
