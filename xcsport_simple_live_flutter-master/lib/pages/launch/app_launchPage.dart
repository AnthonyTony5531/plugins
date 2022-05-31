

import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AppLaunchPage extends StatefulWidget {
  final VoidCallback onFinish;
  AppLaunchPage({Key key, this.onFinish}) : super(key: key);

  @override
  AppLaunchPageState createState() => AppLaunchPageState();
}

class AppLaunchPageState extends State<AppLaunchPage> {
  StreamSubscription<DismissLaunchPage> _dismissEvent;
  void listenLaunchEvent() {
    _dismissEvent = Event.eventBus.on<DismissLaunchPage>().listen((event) {
      widget.onFinish();
    });
  }

  @override
  void initState() { 
    super.initState();
    this.listenLaunchEvent();
    print('_LaunchPageState-initState');

    Future.delayed(Duration(milliseconds: 1500), (){
      print('超时移除启动页');
      widget.onFinish();
    });
  }  

  @override
  void dispose() {
    print('_LaunchPageState-dispose');
    _dismissEvent.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: GestureDetector(
        onTap: (){
          widget.onFinish();
          print('点击移除启动页');
        },
        child: createLaunchImage(context)
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     Text('启动页'),
      //     FloatingActionButton(
      //       child: Text('开启${Config.appName}'),
      //       onPressed: widget.onFinish,
      //     ),
      //   ],
      // ),
    );
  }

  Widget createLaunchImage(BuildContext context){
    return AiImage.asset(
          'assets/images/launch/LaunchImagePortrait~iphone.png', 
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,  
    );
  }
}
