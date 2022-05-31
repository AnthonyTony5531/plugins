import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/widgets/default_views/match_empty.dart';
import 'package:fast_ai/widgets/loading_widget/page_loading.dart';
import 'package:flutter/widgets.dart';

import '../router.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-06
///*********************************************************************




//加载页面好手，为了解决直接使用FutureBuilder带来各种问题。
class CommonPageLoadingWidget extends StatefulWidget {

  final LoadingBuilder builder;
  final PageLoadingController controller;
  final String matchEmptyName;

  CommonPageLoadingWidget({@required this.builder, this.controller, this.matchEmptyName}):super(key:controller?._key);

  @override
  _CommonPageLoadingWidgetState createState() => _CommonPageLoadingWidgetState();
}

class _CommonPageLoadingWidgetState<T> extends State<CommonPageLoadingWidget> {

  bool _needLoading = true;

  dynamic data;
  StreamController streamController;
  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    print('CommonPageLoadingWidget initState');
    _load();
  }

  void _load(){
    print('00-CommonPageLoadingWidget-_load-start');

    Future<dynamic>(()async{
      print('11-CommonPageLoadingWidget-_load');
      data = await widget?.builder?.onLoad();
      return data;
    }).then((f){
      print('22-CommonPageLoadingWidget-_load-then-f=$f');
      if(streamController !=null && !streamController.isClosed){
        _needLoading = false;
        streamController?.add(f);
        //streamController.sink.add(event)
        print('33-CommonPageLoadingWidget-_load-then');
      }
    }, onError: (e){
      print('44-CommonPageLoadingWidget-_load-onError-e=$e');
      if(streamController !=null && !streamController.isClosed){
        _needLoading = false;
        streamController?.addError(e);
        print('55-CommonPageLoadingWidget-_load-onError');
      }
    }, );
  }

  @override
  Widget build(BuildContext context) {
    //没有网络直接跳网络异常
    if(config.isNotConnect && !config.userInfo.isLogout()){
      print('00-_CommonPageLoadingWidgetState-build');
      return widget?.builder?.netLoseWidget ?? MatchEmtpy(name: 'net', onTap: (){
        refreshAll();
      },);
    }
    return StreamBuilder(
      stream: streamController?.stream,
      initialData: true,
      builder: (context, sp){
        if(_needLoading) {
          print('11-_CommonPageLoadingWidgetState-build');
          return widget?.builder?.loadingWidget??PageLoading();
        }
        if(sp.hasError){
          print('22-_CommonPageLoadingWidgetState-build');
          return widget?.builder?.errorWidget ?? MatchEmtpy(name: widget?.matchEmptyName ,onTap: (){
            AiRouter.pushAndRemoveUtilWithoutContext(TabSdkPage.main, predicate: (route){
              return route ==null;
            });
          },);
        }

        try{
          print('33-_CommonPageLoadingWidgetState-build');
          return widget?.builder?.onCompleted(data);
        }
        catch (e) {
          print('44-_CommonPageLoadingWidgetState-build-error=$e');
          return Container();
        }
      },
    );
  }




  void refreshAll(){
    print('00-refreshAll');
    if(mounted){
      print('11-refreshAll');
      _needLoading = true;
      streamController?.add(null);
      Future(()async{
        print('22-refreshAll');
        _load();
      });
    }
  }

  void refresh(){
    streamController?.add(data);

  }


  dynamic freshData(){
    return data;
  }
  @override
  void dispose() {
    print('00-CommonPageLoadingWidget-dispose');
    streamController?.close();
    super.dispose();
  }

}


class PageLoadingController{
  GlobalKey<_CommonPageLoadingWidgetState> _key = GlobalKey<_CommonPageLoadingWidgetState>();
  //通知重新执行
  void notifyRefresh(){
    _key?.currentState?.refresh();
  }

  //通知全部执行
  void notifyRefreshAll(){
    print('00-notifyRefreshAll_key.currentState=${_key?.currentState}');
    _key?.currentState?.refreshAll();
  }

  dynamic freshData(){
    return _key?.currentState?.data;
  }

  void dispose(){
    print('00-PageLoadingController-dispose');
    _key = null;
    print('11-PageLoadingController-dispose');
  }
}


//加载页面构造器
class LoadingBuilder{


  //加载中
  final Widget loadingWidget;

  //错误页面
  final Widget errorWidget;

  //网络异常
  final  Widget netLoseWidget ;

  //执行onLoad后回调
  final OnCompleted onCompleted;

  //初始化时候在这加载
  final  dynamic onLoad;

  LoadingBuilder({this.onLoad, @required this.onCompleted,this.loadingWidget, this.errorWidget, this.netLoseWidget,});
}

typedef  OnCompleted = Widget Function(dynamic data);


