import 'dart:async';
import 'dart:math';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SdkLaunchTitleView extends StatefulWidget {
  final VoidCallback onComplete;
  const SdkLaunchTitleView({Key key, this.onComplete}) : super(key:key);

  @override
  _SdkLaunchTitleViewState createState() => _SdkLaunchTitleViewState();
}

class _SdkLaunchTitleViewState extends State<SdkLaunchTitleView> with SingleTickerProviderStateMixin {
  @override

  // 启动页文字动画索引
  int _titleIndex = 0;
  bool _didAnimate = false;
  Animation<double> _animation;
  AnimationController _controller;
  Timer _timer;
  bool _animationFinished = false;

  StreamSubscription<AiCacheInitCompleteEvent> _aiCacheInitCompleteEvent;

  String get adUrl {
    String url = config?.merchantAppConfig?.sdkLaunchUrl;
    if(url == null) {
      try {
        url = AiCache.get().getString(AiCache.sdk_launch_url);
      }
      catch(e){
        print('00-SdkLaunchTitleView-adUrl-error=$e');
      }
    }
    return url ?? '';
  }
  String get launchTitle {
    String title = config?.sdkParams?.launchTitle;
    try{
      title = AiCache?.get()?.getString(AiCache.sdk_launch_title);
    }
    catch(e) {
      print('00-SdkLaunchTitleView-title-error=$e');
    }
    //print('00-get launchTitle=$title');
    return title ?? AiCache.sdk_launch_title_default_value;
  }
  List<String> get launchSubTitles {
    return config?.sdkParams?.launchSubTitles;
  }

  @override
  void initState() {
    print('00-SdkLaunchTitleView-initState');
    _controller = AnimationController(duration: Duration(milliseconds: config.launchTitleAnimationDuration), vsync: this);

    _aiCacheInitCompleteEvent = Event.eventBus.on<AiCacheInitCompleteEvent>().listen((e){
      print('22-_aiCacheInitCompleteEvent launchTitle=$launchTitle');
      if(mounted) setState(() {});
      print('33-_aiCacheInitCompleteEvent launchTitle=$launchTitle');
    });

    Future.delayed(Duration(seconds: 3), (){
      // 弱网络或没网，启动广告没配置 5秒后自动走后面流程
      print('44-_aiCacheInitCompleteEvent');
      onLaunchTitleAnimation();
    });
    print('55-SdkLaunchTitleView-initState, adUrl=$adUrl, launchTitle=$launchTitle, launchSubTitles=${launchSubTitles?.toString()}');
    super.initState();
  }


  @override
  void dispose() {
    _timer?.cancel();
    _aiCacheInitCompleteEvent?.cancel();
    _controller?.dispose();
    print('SdkLaunchTitleView-dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('00-SdkLaunchTitleView-build');
    if(_animation == null) {
      _animation = Tween(begin: MediaQuery.of(context).size.height, end: 110.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))..addListener((){
        if(mounted) setState(() {});
      });
    }

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AiImage.fromUrlHasSize(
                          adUrl,
                          '',
                          fit: BoxFit.cover,
                          pFit: BoxFit.cover,
                          useLocalAsset: true,
                          imageBuilder: (BuildContext context, ImageProvider imageProvider) {
                            imageProvider.resolve(ImageConfiguration()).addListener(ImageStreamListener((ImageInfo image, bool synchronousCall){
                              //print('00-SdkLaunchTitleView-imageBuilder-onImage');
                              onLaunchTitleAnimation();
                            }, onChunk: (ImageChunkEvent event){
                              //print('00-SdkLaunchTitleView-imageBuilder-onChunk, total=${event.expectedTotalBytes}, count=${event.cumulativeBytesLoaded}');
                            }, onError: (_, __){
                              onLaunchTitleAnimation();
                              //print('00-SdkLaunchTitleView-imageBuilder-onError');
                            }));

                            return Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )
              ),
              Positioned(
                left: 0,
                top: MediaQuery.of(context).size.height-_animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: _animation.value,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('$launchTitle', textAlign: TextAlign.center, style: AiTextStyle(
                        fontSize: 21,
                        fontWeight: config.skin.fontWeight.bold,
                        color: Color(0xFF000000),
                      ),),
                      h(12),
                      Text('${(launchSubTitles?.length ?? 0) > _titleIndex ? launchSubTitles[_titleIndex] : ''}', textAlign: TextAlign.center, style: AiTextStyle(
                        fontSize: config.skin.fontSize.h5,
                        fontWeight: config.skin.fontWeight.regular,
                        color: config.skin.colors.fontColorDark70,
                      ),)
                    ],
                  ),
                )
              )
            ]
          ),
        ),
      ),
    );
  }

  void onFinishLaunchTitleAnimation(){
    print('00-SdkLaunchTitleView-onFinishLaunchTitleAnimation');
    if(_animationFinished) return;
    print('11-SdkLaunchTitleView-onFinishLaunchTitleAnimation');
    _animationFinished = true;
    if(mounted) setState(() {});

    if(widget.onComplete != null) widget.onComplete();
  }

  void onLaunchTitleAnimation(){
    //print('00-SdkLaunchTitleView-onLaunchTitleAnimation');
    if(_didAnimate) return;
    _didAnimate = true;
    //print('11-SdkLaunchTitleView-onLaunchTitleAnimation');
//    Future.delayed(Duration(milliseconds: config.launchTitleAnimationDuration), (){
//      onFinishLaunchTitleAnimation();
//    });
    _controller.forward().then((_){
      print('SdkLaunchTitleView-动画执行完毕');
      onFinishLaunchTitleAnimation();
    });

    // 定时更新副标题
    if(launchSubTitles.length < 2) return;
    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      int index = 0;
      while (index == _titleIndex) {
        index = Random().nextInt(launchSubTitles.length);
      }
      _titleIndex = index;
      if(mounted) setState(() {});
    });
  }
}
