import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/gift/player/overall_gift_player.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/pages/detail/head/new_head/league_left.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'head_right.dart';

class NewHeadDefault extends StatefulWidget {
  NewHeadDefault({
    Key key,
    this.headHeight,
    this.topOffset,
    this.leagueId,
    this.leagueName,
    this.leagueLogo,
    this.leagueCount,
    this.showShoppingCar = false,
    this.controller,
    this.anchorId
  }) : super(key: key);

  final double topOffset;
  final bool showShoppingCar;
  final ChatroomController controller;
  double headHeight;
  String leagueId;
  String leagueName;
  String leagueLogo;
  String anchorId;
  int leagueCount;

  // MatchesDetailModel matchesDetailModel;
  // ExtendModel extendModel;
  // DPageModel dPageModel;
  @override
  State<StatefulWidget> createState() {
    return _NewHeadDefault();
  }
}

class _NewHeadDefault extends State<NewHeadDefault> with WidgetsBindingObserver {
  Map get baseLang => config.langMap['baseLang'];

  String get leagueId {
    return widget.leagueId;
  }

  String get leagueName {
    return widget.leagueName;
  }

  String get leagueLogo {
    return widget.leagueLogo;
  }

  int get leagueCount {
    return widget.leagueCount;
  }

  double get headHeight {
    return widget.headHeight;
  }

  DetailSet detailSet = config.userInfo.detailSet;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
    }
    //后台
    else if (state == AppLifecycleState.paused) {}
  }

  TextStyle styleFont10 = AiTextStyle(fontSize: 10, color: Color.fromRGBO(255, 255, 255, 0.7), fontFamily: config.skin.fontFimaly.pingFang);
  //初始值为动画样式
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.topOffset, left: 10),
      height: headHeight + widget.topOffset,
      decoration: BoxDecoration(
//        color: Color(0xFF19191E),
        color: Colors.transparent
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LeagueLeft(
                leagueId:this.leagueId,
                leagueName: this.leagueName,
                leagueLogo: this.leagueLogo,
                leagueCount: this.leagueCount,
              ),
              HeadRight(chatroomController: widget.controller,)
            ],
          ),
          if(!isStrNullOrEmpty(widget.anchorId))
            OverallGiftPlayer()
        ],
      )
    );
  }
}
