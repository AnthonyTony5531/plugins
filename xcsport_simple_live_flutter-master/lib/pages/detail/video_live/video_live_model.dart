import 'dart:math';

import 'package:fast_ai/api/protocols/detail/game_rb_live_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';

class VideoLiveModel{

  
  int totalCount = 0;
  Map<String,dynamic> anchorDefaultIconMap = {};
  LiveVideoInfo liveVideoInfo;

  GameRBLiveReqProtocol liveReq = GameRBLiveReqProtocol();
  Future<List<AnchorSubCellModel>> requestRBLiveFromServer(int page) async {

   List<AnchorSubCellModel> cellModels = [];
   liveReq.hideSame = config.userInfo.isHiddenRBSameLive;
    liveReq.page = page.toString();
    var req = await liveReq.request();
    totalCount = req.total;
    for(int index = 0; index < req.anchorList.length; index ++){
      var g = req.anchorList[index];
      // 设置默认图片
      anchorAddDefaultIcon(index,g);
      AnchorSubCellModel model = AnchorMatchCellModel().fromRBLiveProtocolWithGame(g).hotLiveModel;
      // 筛选选中滚球直播
      model.isSelectCurrentLive = false;
      if(liveVideoInfo != null){
        if(isNotEmpty(liveVideoInfo?.flv) && 
          model?.flv == liveVideoInfo?.flv){
          model.isSelectCurrentLive = true;
        }
        else if(isNotEmpty(liveVideoInfo?.m3u8) && 
                model?.m3u8 == liveVideoInfo?.m3u8){
          model.isSelectCurrentLive = true;
        }
        else if(isNotEmpty(liveVideoInfo?.rtmp) && 
        model?.rtmp == liveVideoInfo?.rtmp){
          model.isSelectCurrentLive = true;
        }
        else if(isNotEmpty(liveVideoInfo?.weburl) && 
        model?.url == liveVideoInfo?.weburl){
          if ((model?.merchantId ?? '').isNotEmpty && model?.anchorId == liveVideoInfo?.vid) {
              model.isSelectCurrentLive = true;
          }
        }
      }
      cellModels.add(model);
    }
    return cellModels;
  }
   void anchorAddDefaultIcon(i,g){
    int maxIndex = 8;
    String type = AiJson(g).getString('gameType');
    if(type == 'FT'){
      maxIndex = 40;
    }
    else if (type == 'BK'){
      maxIndex = 8;
    }
    else if(type == 'OP_DJ'){
      maxIndex = 14;
    }
    // 设置默认图片
    String anchorId1 = AiJson(g).getString('anchorId');
    // 左边主播默认图
    if (anchorId1.isNotEmpty) {
      // 随机分配背景图
      int randomindex = Random().nextInt(8);
      if(!this.anchorDefaultIconMap.containsKey(anchorId1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        if (i < 8) {
          anchorDefaultIcon1 = 'assets/images/liveplayer/img_beauty_${i + 1}.png';
        }
        else{
          anchorDefaultIcon1 = 'assets/images/liveplayer/img_beauty_${randomindex + 1}.png';
        }
        this.anchorDefaultIconMap[anchorId1] = anchorDefaultIcon1;
      }
    }
    else{
      // 视频
      int randomindex = Random().nextInt(maxIndex);
      String gidm = AiJson(g).getString('gidm');
      String gameType = AiJson(g).getString('gameType');
      String key1 = gidm;
      if(!this.anchorDefaultIconMap.containsKey(key1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        int index  =  i < maxIndex ?  i + 1 : randomindex + 1;
        anchorDefaultIcon1 = getGameBgImage(gameType, index);
        this.anchorDefaultIconMap[key1] = anchorDefaultIcon1;
      }
    }
    if(g != null){
      if(anchorId1.isNotEmpty){
        String anchorIcon = this.anchorDefaultIconMap[anchorId1];
        g['anchorDefaultIcon'] = anchorIcon;
      }
      else{
        String gidm = AiJson(g).getString('gidm');
        String gameType = AiJson(g).getString('gameType');
        String key1 = gidm;
        String anchorIcon = this.anchorDefaultIconMap[key1];
        g['anchorDefaultIcon'] = anchorIcon ?? getGameBgImage(gameType,2);
      }
    }
  }

  String getGameBgImage(String gameType,num index) {
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
}