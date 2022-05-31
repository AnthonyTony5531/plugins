import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_game_service.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareGameMessageView extends StatefulWidget {

  final ValueChanged<AiGameCellModel> onShowGame;
  ShareGameMessageView({Key key, this.onShowGame}): super(key: key);

  @override
  _ShareGameMessageViewState createState() => _ShareGameMessageViewState();
}

class _ShareGameMessageViewState extends State<ShareGameMessageView> {


  String gameName = '';
  String gameIcon = '';
  AiGameCellModel gameMessage;
  StreamSubscription<OpenGameEvent> _openGame;

  @override
  void initState() {
    bindEvent();
    super.initState();
  }

  void bindEvent() {
//    _openGame = Event.eventBus.on<OpenGameEvent>().listen(openGameEvent);
  }

  void unBindEvent() {
//    _openGame?.cancel();
  }

  @override
  void dispose(){
    unBindEvent();
    super.dispose();
  }

  void openGameEvent(e){
    gameMessage = AnchorGameService.ins.anchorGameMessage;
    if(gameMessage != null){
      gameName = gameMessage.gameName;
      gameIcon = !isStrNullOrEmpty(gameMessage.icon) ? gameMessage.icon : gameMessage.img;
    }
  }

  @override
  Widget build(BuildContext context) {

    openGameEvent(null);
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: Container(
          width: 240.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              sw(8.0),
//              AiImage.asset('assets/images/detail/chatroom/icon_detail_longhudou.png', fit: BoxFit.cover, width: 40.0, height: 40.0),
              AiImage.fromUrl(gameIcon, '', BoxFit.cover, 40.0,  40.0),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(gameName, style: gameNameStyle(),),
                      Text('和主播一起畅玩', style: anchorDesStyle(),),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  print('马上去投注');
                  widget.onShowGame?.call(gameMessage);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  width: 62.0,
                  height: 26.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    color: Color(0xFF5078FF)
                  ),
                  child: Text('马上玩', style: gameNameStyle(),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle gameNameStyle() {
    return AiTextStyle(
      color: Color(0xFF222222),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
    );
  }

  TextStyle anchorDesStyle() {
    return AiTextStyle(
      color: Color(0xFFFF4000),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
    );
  }

}
