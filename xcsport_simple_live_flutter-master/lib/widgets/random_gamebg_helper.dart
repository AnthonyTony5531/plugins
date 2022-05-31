//**********************************************************************
//* author:Sam
//* date:2020-06-29
//**********************************************************************


import 'dart:math';

import 'package:fast_ai/utils/string_util.dart';

class RandomGameBgHelper{

   static Map<String, String > _cache = {};


  String getBackground(String key, {String gameType="FT"}){

    String bg =  _cache[key];
    if(isNotEmpty(bg)){
      //print('00-getBackground=$bg');
      return bg;
    }
    int randomInt = Random().nextInt(getGameBgImageCount(gameType))+1;
    bg = getGameBgImage(gameType, randomInt);
    _cache[key] = bg;
    //print('11-getBackground=$bg');
    return bg;
  }


  String getGameBgImage(String gameType,num index) {
    if (gameType == 'BK') {//1-9
      return "assets/images/match/match_bg_video_bk_$index" + '.png';
    }
    else if(gameType == 'OP_DJ'){//1-14
      return "assets/images/match/match_bg_video_game_$index" + '.png';
    }
    else {//1-40
      return "assets/images/match/match_bg_video_live_$index" + '.png';
    }
  }

  int getGameBgImageCount(String gameType){
    if (gameType == 'BK'){
      return 9;
    }
    else if(gameType == 'OP_DJ'){
      return  14;
    }
    return 40;
  }


}