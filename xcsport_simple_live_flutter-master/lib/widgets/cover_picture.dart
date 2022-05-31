
import 'dart:math';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/utils/ai_json.dart';

class CoverPicture{

 static const String AnchorDefaultIcon = 'anchorDefaultIcon';
 static void anchorAddDefaultIcon(i,g1,g2){
    // 设置默认图片
    String anchorId1 = AiJson(g1).getString('anchorId');
    String sex1 = AiJson(g1).getString('sex');

    String anchorId2 = '';
    String sex2  = '';
    if(g2 != null){
      anchorId2 = AiJson(g2).getString('anchorId');
      sex2 = AiJson(g2).getString('sex');
    }
    String type = AiJson(g1).getString('gameType');
    int maxIndex = 8;
    if(type == 'FT'){
      maxIndex = 40;
    }
    else if (type == 'BK'){
      maxIndex = 8;
    }
    else if(type == 'OP_DJ'){
      maxIndex = 14;
    }

    // int randomindex = Random().nextInt(maxIndex);
    // 左边主播默认图
    if (anchorId1.isNotEmpty) {
      int randomindex = Random().nextInt(8);
      if(!config.userInfo.anchorDefaultIconMap.containsKey(anchorId1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        int index  =  i < 7 ?  i + 1 : randomindex + 1;
        anchorDefaultIcon1 = getAnchorLiveBgImage(index,isWomen(sex1));
        config.userInfo.anchorDefaultIconMap[anchorId1] = anchorDefaultIcon1;
      }
    }
    else{
      // 左边视频
      int randomindex = Random().nextInt(maxIndex);
      String gidm = AiJson(g1).getString('gidm');
      String videoType = AiJson(g1).getString('type');
      String gameType = AiJson(g1).getString('gameType');
      String key1 = gidm + videoType;
      if(!config.userInfo.anchorDefaultIconMap.containsKey(key1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        int index  =  i < maxIndex - 1 ?  i + 1 : randomindex + 1;
        anchorDefaultIcon1 = getGameBgImage(gameType, index);
        config.userInfo.anchorDefaultIconMap[key1] = anchorDefaultIcon1;
      }
    }

    // 右边主播默认图
    if(g2 != null){
      if(anchorId2.isNotEmpty){
        int randomindex = Random().nextInt(8);
        if(!config.userInfo.anchorDefaultIconMap.containsKey(anchorId2)){
          String anchorDefaultIcon2 = '';
          int index  =  i + 1 < 7 ?  i + 2 : randomindex + 1;
          anchorDefaultIcon2 = getAnchorLiveBgImage(index,isWomen(sex2));
          config.userInfo.anchorDefaultIconMap[anchorId2] = anchorDefaultIcon2;
        }
      }
      else{
        // 右边视频
        int randomindex = Random().nextInt(maxIndex);
        String gidm = AiJson(g2).getString('gidm');
        String videoType = AiJson(g2).getString('type');
        String gameType = AiJson(g2).getString('gameType');
        String key1 = gidm + videoType;
        if(!config.userInfo.anchorDefaultIconMap.containsKey(key1)){
          // 前8张按顺序默认，大于8张随机分配
          String anchorDefaultIcon1 = '';
          int index  =  i + 1 < maxIndex - 1 ?  i + 2 : randomindex + 1;
          anchorDefaultIcon1 = getGameBgImage(gameType, index);
          config.userInfo.anchorDefaultIconMap[key1] = anchorDefaultIcon1;
        }
      }
    }
    if(g1 != null){
      if(anchorId1.isNotEmpty){
        String anchorIcon = config.userInfo.anchorDefaultIconMap[anchorId1];
        g1[AnchorDefaultIcon] = anchorIcon ?? getAnchorLiveBgImage(1,isWomen(sex1));
      }
      else{
        String gidm = AiJson(g1).getString('gidm');
        String videoType = AiJson(g1).getString('type');
        String gameType = AiJson(g1).getString('gameType');
        String key1 = gidm + videoType;
        String anchorIcon = config.userInfo.anchorDefaultIconMap[key1];
        g1[AnchorDefaultIcon] = anchorIcon ?? getGameBgImage(gameType,2);
      }
    }

    if(g2 != null){
      if(anchorId2.isNotEmpty){
        String anchorIcon = config.userInfo.anchorDefaultIconMap[anchorId2];
        g2[AnchorDefaultIcon] = anchorIcon ?? getAnchorLiveBgImage(1,isWomen(sex2));
      }
      else{
        String gidm = AiJson(g2).getString('gidm');
        String videoType = AiJson(g2).getString('type');
        String gameType = AiJson(g2).getString('gameType');
        String key1 = gidm + videoType;
        String anchorIcon = config.userInfo.anchorDefaultIconMap[key1];
        g2[AnchorDefaultIcon] = anchorIcon  ?? getGameBgImage(gameType,2);
      }
    }
  }

  static String getGameBgImage(String gameType,num index) {
    if (gameType == 'BK') {
      return "assets/images/match/match_bg_video_bk_$index" + '.png';
    }
    else if(gameType == 'OP_DJ'){
      return "assets/images/match/match_bg_video_game_$index" + '.png';
    }
    else {
      return "assets/images/match/match_bg_video_live_$index" + '.png';
    }
  }

 static String getAnchorLiveBgImage(num index,bool isWomen){
    String women = isWomen ? 'img_beauty_' : 'img_boy_';
    return 'assets/images/liveplayer/$women$index.png';
  }

 static bool isWomen(String sex){
    // 0:女 1:男
    if(sex == null || isEmpty(sex) || sex == '0'){
      return true;
    }
    else {
      return false;
    }
  }

}