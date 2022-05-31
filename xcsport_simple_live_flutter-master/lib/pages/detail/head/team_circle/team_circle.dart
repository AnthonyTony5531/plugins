import "package:fast_ai/utils/ai_image.dart";
import 'dart:async';
import 'dart:math';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/material.dart';
import '../../canvas_circle/canvas_circle_base.dart';
import '../../canvas_circle/turn_box.dart';
import 'team_circle_style.dart';

//支持率圆,包含logo,包含logo
class TeamCircle extends StatefulWidget {

  TeamCircle({Key key, this.matchesDetailModel, this.extendModel}) : super(key: key);
  ExtendModel extendModel;
  MatchesDetailModel matchesDetailModel;

  @override
  TeamCircleState createState() {
    return new TeamCircleState();
  }
}

class TeamCircleState extends State<TeamCircle> with TickerProviderStateMixin, WidgetsBindingObserver{
  AnimationController _animationController;
  MatchesDetailModel get matchesDetailModel {
    return widget.matchesDetailModel;
  }

  ExtendModel get extendModel {
    return widget.extendModel;
  }
  //AnimationController _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));

  TeamCircleStyle style;
  TeamCircleState({this.style}) {
    if (this.style == null) this.style = TeamCircleStyle();
  }

  bool isInit = false;
  DetailSet detailSet;
  @override
  void initState() {
    listenInit();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    //_animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    listenCancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
      listenInit();
    }
    //后台
    else if (state == AppLifecycleState.paused) {
      listenCancel();
    }
  }

  void listenInit() {
    listenOnSupportEvent();
  }

  void listenCancel() {
    onSupportEvent.cancel();
  }

  //圆圈动画
  void animatedCircle() {
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.forward();
  }

  //点击支持监听
  StreamSubscription<OnSupportEvent> onSupportEvent;
  void listenOnSupportEvent() {
    onSupportEvent = Event.eventBus.on<OnSupportEvent>().listen((event) {
      this.isInit = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    detailSet = config.userInfo.detailSet;
    // if (isInit == false) {
    //   //执行圆圈动画
    //   this.animatedCircle();
    // }
    this.isInit = true;

    return Container(
      //height: 95,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[circleTeam(1), circleTeam('X'), circleTeam(2)],
      ),
    );
  }


  bool mustShrink(){
    var style = AiTextStyle(
      fontSize: 14.0,
      color: Color(0xFFD2E4FF),
    );
    String homeTeamAbbr = string( matchesDetailModel.data.homeTeamAbbr, defaultVal:  matchesDetailModel.data.homeTeam);
    String awayTeam = string( matchesDetailModel.data.awayTeamAbbr, defaultVal:  matchesDetailModel.data.awayTeam);
    return AiMeasure.measureTextLineIsExceed(homeTeamAbbr, style, 100, 1)||AiMeasure.measureTextLineIsExceed(awayTeam, style, 100, 1);

  }

  //type: 1主队，0和，2客队
  Center circleTeam(type) {

    String teamName = '';
    List<Color> circleColors; //圆的边框进度
    var radius = style.bigRadius; //圆的半径
    var stokeWidth = style.bigStokeWidth; //圆的边框大小
    double speed = 0.0;
    bool isShowXCricle = true;
    if (type == 1) {
      teamName =string( matchesDetailModel.data.homeTeamAbbr, defaultVal:  matchesDetailModel.data.homeTeam);
      circleColors = style.circleColorsHome;
      if(null != extendModel.data?.supportRate){
        speed = extendModel.data.supportRate[0] / 10000;
      }
    } else if (type == 2) {
      teamName = string( matchesDetailModel.data.awayTeamAbbr, defaultVal:  matchesDetailModel.data.awayTeam);
      circleColors = style.circleColorsAway;
      if(null !=  extendModel.data?.supportRate){
        speed = extendModel.data.supportRate[2] / 10000;
      }
    } else if (type == 'X') {
      if(null != extendModel.data?.supportRate){
        speed = extendModel.data?.supportRate[1] / 10000;
      }
      if (config.fiexd.gameType1X2.indexOf(matchesDetailModel.data?.gameType??"") < 0) {
        isShowXCricle = false;
      }
      teamName = isShowXCricle == true ? config.langMap['baseLang']['detail']['shuangfangX'] : '';
      circleColors = style.circleColorsDraw;
      radius = style.smallRadius;
      stokeWidth = style.smallStokeWidth;
    }

    var circleTeam = Center();

    var styleN = AiTextStyle(
      fontSize: 14.0,
      color: Color(0xFFD2E4FF),
    );
    if(AiMeasure.measureTextLineIsExceed(teamName, styleN, 100, 1)){
      teamName = '${teamName.substring(0, teamName.length ~/2)}\n${teamName.substring(teamName.length ~/2+1, teamName.length)}';
    }

    circleTeam = Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  //alignment: Alignment.center,
                  //margin: const EdgeInsets.only(top: 20.0),
                  height: 85.0,
                  width: 100.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      isShowXCricle == true
                          ? Positioned(
                              height: 50.0,
                              top: 10,
                              left: 23,
                              child: TurnBox(
                                turns: 0.64,
                                child: GradientCircularProgressIndicator(
                                  colors: circleColors, //[Color(0xFFF05050), Color(0xFFFC9393)],
                                  radius: radius,
                                  stokeWidth: stokeWidth,
                                  value: speed,
                                  totalAngle: 1.45 * pi,
                                  strokeCapRound: true,
                                ),
                              ),
                            )
                          : Container(),
                      circleContext(type),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          string(teamName),
                          textAlign: TextAlign.center,
                          style: AiTextStyle(
                            fontSize: mustShrink()?10:14.0,
                            color: Color(0xFFD2E4FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // circleTeam = Center(
    //   child: Column(
    //     //crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       AnimatedBuilder(
    //         animation: _animationController,
    //         builder: (BuildContext context, Widget child) {
    //           return Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 4.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 Container(
    //                   //color: Colors.red,
    //                   //alignment: Alignment.center,
    //                   //margin: const EdgeInsets.only(top: 20.0),
    //                   height: 85.0,
    //                   width: 100.0,
    //                   child: Stack(
    //                     alignment: Alignment.center,
    //                     children: <Widget>[
    //                       isShowXCricle == true
    //                           ? Positioned(
    //                               height: 50.0,
    //                               top: 10,
    //                               left: 23,
    //                               child: TurnBox(
    //                                 turns: 0.64,
    //                                 child: GradientCircularProgressIndicator(
    //                                   colors: circleColors, //[Color(0xFFF05050), Color(0xFFFC9393)],
    //                                   radius: radius,
    //                                   stokeWidth: stokeWidth,
    //                                   value: speed,
    //                                   // detailParam.fixedDetailHeadType==0?( _animationController.value <= speed
    //                                   //     ? _animationController.value
    //                                   //     : speed):speed, // _animationController.value,
    //                                   totalAngle: 1.45 * pi,
    //                                   strokeCapRound: true,
    //                                 ),
    //                               ),
    //                             )
    //                           : Container(),
    //                       circleContext(type),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 50.0),
    //                         child: Text(
    //                           teamName,
    //                           maxLines: 1,
    //                           textAlign: TextAlign.center,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: AiTextStyle(
    //                             fontSize: 14.0,
    //                             color: Color(0xFFD2E4FF),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );

    return circleTeam;
  }

  Positioned circleContext(type) {
    var context;
    String logoUrl = '';
    if (type == 1) {
      logoUrl = matchesDetailModel.data?.homeLogo ?? '';
    }
    if (type == 2) {
      logoUrl = matchesDetailModel.data?.awayLogo ?? '';
    }
    print('logoUrl:$logoUrl');
    if (type == 'X') {
      context = Positioned(
        height: 45.0,
        top: 25,
        left: 40,
        child: Text('VS',
            style: AiTextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Score")),
      );
    } else {
      context = Positioned(
        height: 40.0,
        top: 5,
        left: 32.5,
        child: AiImage.teamLogo(logoUrl,size: 40,isHomeTeam: type == 1),
      );
    }
    return context;
  }
}
