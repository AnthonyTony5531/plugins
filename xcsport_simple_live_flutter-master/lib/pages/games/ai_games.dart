//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************

import 'dart:async';

//import 'package:fast_ai/api/protocols/aigames/ai_gamelist_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/default_views/match_empty.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:fast_ai/widgets/ui_helper.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'ai_game_cell.dart';

class AiGames extends StatefulWidget {
  @override
  _AiGamesState createState() => _AiGamesState();
}

class _AiGamesState extends State<AiGames> with WidgetsBindingObserver {
  List<AiGameCellModel> models = [];
  bool isLoading = true;
  Timer _reqTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    startRequestTimer();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _reqTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //前台
    if (state == AppLifecycleState.resumed) {
      fresh();
      startRequestTimer();
    }
    //后台
    else if (state == AppLifecycleState.paused) {
      _reqTimer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color(0xFF17172C),
        //color: const Color(0xFFFFD600),
        child: isLoading
            ? FutureBuilder(
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.done) {
                    isLoading = false;
                    if (data.hasError) {
                      return error();
                    }

                    return body();
                  }
                  return loading();
                },
                future: Future(
                  () async {
                    await fresh();
                  },
                ),
              )
            : body());
  }

  Widget loading() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            background: AiImage.asset(
              "assets/images/aigame/bg_gamelist.png",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: const Color(0xFF17172C),
          //backgroundColor: const Color(0xFFFFD600),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: MatchLoading(
                isListView: false,
                count: 5,
              ),
            );
          }, childCount: 1),
        )
      ],
    );
  }

  Widget error() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            background: AiImage.asset(
              "assets/images/aigame/bg_gamelist.png",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: const Color(0xFF17172C),
          //backgroundColor: const Color(0xFFFFD600),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: MatchEmtpy(
                name: 'net',
              ),
            );
          }, childCount: 1),
        )
      ],
    );
  }

  Widget empty() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            background: AiImage.asset(
              "assets/images/aigame/bg_gamelist.png",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: const Color(0xFF17172C),
          //backgroundColor: const Color(0xFFFFD600),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              padding: EdgeInsets.only(top: 88),
              child: Column(
                children: <Widget>[
                  TextHelper.buildContentTitle("${config.langMap['baseLang']['games']['emptyGameText']}", textColor: 0xFFFFD600),
                  InterValHelper.h(14),
                  UiHelper.circularRectangleContainer(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: TextHelper.buildContentTitle("${config.langMap['baseLang']['games']['backHome']}", textColor: 0xFFFFD600, ))
                ],
              ),
            );
          }, childCount: 1),
        )
      ],
    );
  }

  bool isInited = false;
  Future<void> fresh() async {
////    var req = await AiGameListRequastProtocol().request();
////    if (req.isSuccess) {
////      models = req.models;
////    } else {
////      throw req.msg;
////    }
//    var gameListReq = AiGameListNewReqProtocol();
//    // 每个游戏单独发请求拿url
////    gameListReq.onCallBack = (){
////      if(mounted){
////        setState(() {});
////      }
////    };
//    var req = await gameListReq.request();
//    if(req.isSuccess){
//      models = req.models;
//    }
//    else{
//      throw req.msg;
//    }
  }
  
  void startRequestTimer() {
    _reqTimer = Timer.periodic(Duration(seconds: config.fiexd.gameUpdateTime), (timer) async {
      if (mounted) {
        await fresh();
        setState(() {});
      }
    });
  }

  Widget body() {
    if(isEmpty(models)){
      return empty();
    }
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            background: AiImage.asset(
              "assets/images/aigame/bg_gamelist.png",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: const Color(0xFF17172C),
          //backgroundColor: const Color(0xFFFFD600),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return AiGameCell(model: models[index],onCallbackRefresh: (){
              if(mounted){
                setState(() {});
              }
            },);
          }, childCount: models.length),
        ),
//        SliverList(
//          delegate: SliverChildBuilderDelegate((context, index) {
//            return Container(
//              padding: EdgeInsets.only(
//                bottom: 49,
//              ),
//              child: Align(
//                child: IntrinsicWidth(
//                  child: InkWell(
//                    onTap: (){
//
//                    },
//                    child: Row(
//                      children: <Widget>[
//                        TextHelper.buildContentTitle('查看更多',
//                            textColor: Colors.black.value),
//                        InterValHelper.w(6.9),
//                        Icon(
//                          Icons.arrow_forward_ios,
//                          size: 12,
//                          color: Colors.black.withOpacity(0.4),
//                        ),
//                        Icon(
//                          Icons.arrow_forward_ios,
//                          size: 12,
//                          color: Colors.black,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            );
//          }, childCount: 1),
//        ),
      ],
    );
  }
}
