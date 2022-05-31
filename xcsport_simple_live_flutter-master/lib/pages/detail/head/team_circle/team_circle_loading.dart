import "package:fast_ai/utils/ai_image.dart";
import 'dart:math';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:flutter/material.dart';
import '../../canvas_circle/canvas_circle_base.dart';
import '../../canvas_circle/turn_box.dart';
import 'team_circle_style.dart';

//支持率圆加载
class TeamCircleLoading extends StatefulWidget {
  TeamCircleLoading({Key key, this.gameType, this.homeTeam, this.awayTeam, this.homeLogo, this.awayLogo})
      : super(key: key);
  String gameType, homeTeam, awayTeam, homeLogo, awayLogo;
  @override
  _TeamCircleLoading createState() {
    return new _TeamCircleLoading();
  }
}

class _TeamCircleLoading extends State<TeamCircleLoading> with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController _animationController;

  //AnimationController _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));
  String get gameType {
    return widget.gameType;
  }

  String get homeTeam {
    return widget.homeTeam;
  }

  String get awayTeam {
    return widget.awayTeam;
  }

  String get homeLogo {
    return widget.homeLogo;
  }

  String get awayLogo {
    return widget.awayLogo;
  }

  TeamCircleStyle style;
  _TeamCircleLoading({this.style}) {
    if (this.style == null) this.style = TeamCircleStyle();
  }

  bool isInit = false;
  DetailSet detailSet;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_animationController.dispose();
    super.dispose();
  }

  //圆圈动画
  void animatedCircle() {
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
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

  //type: 1主队，0和，2客队
  Center circleTeam(type) {
    String teamName = '';
    List<Color> circleColors; //圆的边框进度
    var radius = style.bigRadius; //圆的半径
    var stokeWidth = style.bigStokeWidth; //圆的边框大小

    bool isShowXCricle = true;
    if (type == 1) {
      teamName = homeTeam;
      circleColors = style.circleColorsHome;
    } else if (type == 2) {
      teamName = awayTeam;
      circleColors = style.circleColorsAway;
    } else if (type == 'X') {
      if (config.fiexd.gameType1X2.indexOf(gameType) < 0) {
        isShowXCricle = false;
      }
      teamName = isShowXCricle == true ? config.langMap['baseLang']['detail']['shuangfangX'] : '';
      circleColors = style.circleColorsDraw;
      radius = style.smallRadius;
      stokeWidth = style.smallStokeWidth;
    }

    var circleTeam = Center();

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
                                  value: 0,
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
                          teamName,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: AiTextStyle(
                            fontSize: 14.0,
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

    return circleTeam;
  }

  Positioned circleContext(type) {
    var context;
    String logoUrl = '';
    if (type == 1) {
      logoUrl = homeLogo;
    }
    if (type == 2) {
      logoUrl = awayLogo;
    }

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
        child: AiImage.teamLogo(logoUrl, size: 40,isHomeTeam: type == 1),
      );
    }
    return context;
  }
}
