/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-19
 * 说明：头部工具栏
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/top_bar_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'live_topbar_model.dart';

class LiveTopBar extends StatefulWidget {
  final TopBarController controller;
  final Size size;
  final bool disableGradient;
  final bool isFreeAnchor;

  LiveTopBar(
      {Key key,
      @required this.controller,
      @required this.size,
      this.isFreeAnchor = false,
      this.disableGradient = false})
      : super(key: key);

  @override
  _LiveTopBarState createState() => _LiveTopBarState();
}

class _LiveTopBarState extends State<LiveTopBar> with TickerProviderStateMixin {
  TopBarController get controller {
    return widget.controller;
  }

  AnimationController _animationController;
  var baseLang = config.langMap['baseLang'];
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    controller.animationController = null;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.animationController = _animationController;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(0, -childHeight * _animationController.value),
          child: StreamBuilder<LiveTopbarModel>(
            initialData: controller.model,
            stream: widget.controller.stream(),
            builder: (context, as) {
              return controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown
                  ? topDownWidget(context, as.data)
                  : leftRightWidget();
            }
          ),
          // child: ModelControllerBuilder<LiveTopbarModel, LiveTopbarController>(
          //   builder: _builder,
          //   controller: widget.controller,
          // ),
        );
      },
    );
  }

  bool isGoalEmpty(LiveTopbarModel model) {
    return isNullOrEmpty(model.homeGoal) && isNullOrEmpty(model.awayGoal);
  }

  // Widget _builder(BuildContext context, LiveTopbarModel model) {
  //   return controller.player.toolPanel.bottomBar.model.screenDirection ==
  //           ScreenDirection.TopDown
  //       ? topDownWidget(context, model)
  //       : leftRightWidget();
  // }

  Widget topDownWidget(BuildContext context, LiveTopbarModel model) {
    return Container();
  }

  double get childHeight {
    return controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown ? 80 : 104;
  }

  Widget leftRightWidget() {
    return Container(
      height: childHeight,
      width: widget.size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.8),
          Colors.black.withOpacity(0.8),
          Colors.black.withOpacity(0.0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 12,
//              top: childHeight/2.0-AiMeasure.measureText('高度', AiTextStyle(
//                fontSize: 16,
//              )).height/2,
              top: 20,
              child: backIcon()),
          Show(
            isShow: !widget.isFreeAnchor,
            child: Align(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.of(context).size.width * (1 / 3.5)),
                      child: TextHelper.build(
                          controller.toolPanel.bottomBar.model.leagueName,
                          fontSize: 16,
                          maxLine: 3,
                          textColor: Colors.white.value),
                    ),
                    h(2),
                    leagueScore(),
                    footballWidget(),
                  ],
                ),
              ),
            ),
          ),
          Show(
              isShow: !widget.isFreeAnchor,
              child: moreIcon()),
        ],
      ),
    );
  }

  Widget moreIcon() {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.more_horiz,
          size: 24,
          color: Colors.white,
        ),
        onPressed: () {
          if (Hooks.ins.isBlocked(HookName.MatchDetailHorizontalMoreItem, {}))
            return;
          controller.toolPanel.moreMenuController.show();
          controller.toolPanel.hide();
        },
      ),
    );
  }

  Widget backIcon() {
    return Container(
      child: InkWell(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
        ),
        onTap: () {
          if (controller.toolPanel.bottomBar.model.screenDirection ==
              ScreenDirection.TopDown) {
            print('-- setPreferredOrientations LeftRight --');
            controller.hide();
//            changeFloatWidget(context);
            // AiRouter.pop(context);
            // controller.backTap.fire();
          } else {
            print('-- setPreferredOrientations TopDown --');
            controller.toolPanel.bottomBar.screenDirectionChanged.fire(ScreenDirection.TopDown);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]).whenComplete(() {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
            });
          }
        },
      ),
    );
  }

  //联赛比分
  Widget leagueScore() {
    var model = controller.toolPanel.topBar.model;
    return Align(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextHelper.buildLargeContent(
                    "${string(model.homeName, defaultVal: '-')}",
                    textColor: Colors.white.value),
                InterValHelper.w(8),
                AiImage.leagueLogo(model.homeLogo, size: 32, fit: BoxFit.cover),
                InterValHelper.w(20)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Row(
              children: <Widget>[
                TextHelper.buildContentTitle(
                    string(model.homeGoal, defaultVal: "-"),
                    textColor: 0xFFFF4000,
                    fontFamily: FontFamily.number),
                InterValHelper.w(4),
                TextHelper.buildContentTitle(":",
                    textColor: 0xFFFF4000, fontFamily: FontFamily.number),
                InterValHelper.w(4),
                TextHelper.buildContentTitle(
                    string(model.awayGoal, defaultVal: "-"),
                    textColor: 0xFFFF4000,
                    fontFamily: FontFamily.number),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                InterValHelper.w(20),
                AiImage.leagueLogo(model.awayLogo, size: 32, fit: BoxFit.cover),
                InterValHelper.w(8),
                TextHelper.buildLargeContent(model.awayName ?? "-",
                    textColor: Colors.white.value),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget otherInfo() {
    return footballWidget();
  }

  Widget footballWidget() {
    if (!(controller.toolPanel.topBar.model.auxiliaryData
        is FootballAuxiliaryData)) return Container();
    var model = controller.toolPanel.topBar.model.auxiliaryData as FootballAuxiliaryData;
    return Container(
      //color: Colors.red,
      //width: ,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          scoreCell(
              icon: "bet_cornerkeck",
              name: baseLang['detail']['conner'],
              score: model.corner),
          InterValHelper.w(
            8,
          ),
          scoreCell(
              icon: "bet_yellowcard",
              name: baseLang['detail']['yellow'],
              score: model.yellowCard),
          InterValHelper.w(
            8,
          ),
          scoreCell(
              icon: "bet_redcard",
              name: baseLang['detail']['red'],
              score: model.redCard),
//            InterValHelper.w(
//              8,
//            ),
//            scoreCell(
//                icon: "icon_detail_kick_normal",
//                name: "点球",
//                score: model?.pointSphere ?? "--"),
//            InterValHelper.w(
//              8,
//            ),
//            scoreCell(
//                icon: "icon_detail_addtime_normal",
//                name: "加时",
//                score: model?.ot ?? "--"),
//            InterValHelper.w(
//              8,
//            ),
//            scoreCell(
//                icon: "icon_detail_kick_normal",
//                name: "点球大战",
//                score: model?.penaltyKick ?? "--"),
        ],
      ),
    );
  }

  Widget scoreCell({String icon, String name, String score}) {
    return Container(
      //width: 40,
      //color: Colors.red,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              AiSvgPicture.asset(
                'assets/images/detail/$icon.svg',
                width: 12,
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(name,
                    style: AiTextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(210, 228, 255, 0.6))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              string(score, defaultVal: "-:-"),
              style: AiTextStyle(
                  letterSpacing: 0.31, fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget createTeamName(BuildContext context, LiveTopbarModel model) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(model.homeName,
                textAlign: TextAlign.end,
                style: AiTextStyle(
                    fontFamily: config.skin.fontFimaly.pingFang,
                    fontSize: config.skin.fontSize.h5,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        isGoalEmpty(model)
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(model.homeGoal,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.dINCondensed,
                        fontSize: config.skin.fontSize.h3,
                        color: Color(0xFFFF4000))),
              ),
        Container(
            margin: isGoalEmpty(model)
                ? EdgeInsets.only(bottom: 5)
                : EdgeInsets.only(),
            width: isGoalEmpty(model) ? 15 : 10,
            child: isGoalEmpty(model)
                ? Text(
                    "vs",
                    style: config.skin.game.vsStyle,
                    textAlign: TextAlign.center,
                  )
                : Text(
                    ":",
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: config.skin.fontSize.h4,
                        color: Color(0xFFFF4000)),
                    textAlign: TextAlign.center,
                  )),
        isGoalEmpty(model)
            ? Container()
            : Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(model.awayGoal,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.dINCondensed,
                        fontSize: config.skin.fontSize.h3,
                        color: Color(0xFFFF4000))),
              ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(model.awayName,
                style: AiTextStyle(
                    fontFamily: config.skin.fontFimaly.pingFang,
                    fontSize: config.skin.fontSize.h5,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }

  Widget createLeagueName(BuildContext context, LiveTopbarModel model) {
    var body = TitleText(
      text: AiImage.asset(
        "assets/images/liveplayer/arrow_down.png",
        width: 18,
        height: 18,
      ),
      title: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: widget.size.width - 200),
        child: Text(
          model.leagueName,
          style: AiTextStyle(
              fontFamily: config.skin.fontFimaly.pingFang,
              fontSize: config.skin.fontSize.h4,
              color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
    return InkWell(
      onTap: () {
        controller.leagueGameTap.fire();
      },
      child: body,
    );
  }
}
