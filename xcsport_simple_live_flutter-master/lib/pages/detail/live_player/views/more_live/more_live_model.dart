import 'dart:math';

import 'package:fast_ai/api/protocols/detail/game_rb_live_protocol.dart';
import 'package:fast_ai/api/protocols/matches/game_anchor_live_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';

class MoreLiveModel{

  int willLiveTotalCount = 0;
  int slideUnRBLiveTotalCount = 0;

  bool isShowHiddenSame = false;
  int totalCount = 0;
  int listLength = 0;
  LiveVideoInfo liveVideoInfo;
  Map<String,dynamic> anchorDefaultIconMap = {};
  bool isAddRBSectionTitle = false;
  bool isAddUnRBSectionTitle = false;

//  GameAnchorLiveReqProtocol willLiveReq = GameAnchorLiveReqProtocol();
  GameRBLiveReqProtocol liveReq = GameRBLiveReqProtocol();
  GameAnchorLiveReqProtocol req = GameAnchorLiveReqProtocol();
  Future<List<AnchorMatchCellModel>> requestRBLiveFromServer(int page,{int pageSize = 40}) async {

    List<AnchorMatchCellModel> cellModels = [];
    liveReq.hideSame = config.userInfo.isHiddenRBSameLive;
    liveReq.page = page.toString();
    liveReq.pageSize = pageSize.toString();
    var rsp = await liveReq.request();
    if(rsp.total % 2 == 0 && rsp.total >= 2){
      totalCount = rsp.total ~/ 2;
    }
    else if(rsp.total > 2 && rsp.total % 2 != 0){
      totalCount = rsp.total ~/ 2 + 1;
    }
    else{
      totalCount = rsp.total;
    }
    for(int index = 0; index < rsp.anchorList.length; index += 2){

      var g1 = rsp.anchorList[index];
      var g2 = index < rsp.anchorList.length - 1 ? rsp.anchorList[index+1] : null;
      // 设置默认图片
      anchorAddDefaultIcon(index,g1,g2);
      listLength = cellModels.length;
//      AnchorMatchCellModel cellModel = (AnchorMatchCellModel()..liveType = RBLiveType.RBLive).fromGameAnchorLiveRspProtocolWithGame(g1, g2);
//      cellModels.add(cellModel);
//      // 筛选选中滚球直播
//      checkIsSelectCurrentLive(cellModel.leftModel);
//      checkIsSelectCurrentLive(cellModel.rightModel);
    }
    return cellModels;
  }

  void clear(){
    willLiveTotalCount = 0;
    slideUnRBLiveTotalCount = 0;
    totalCount = 0;
    listLength = 0;
    isAddRBSectionTitle = false;
    isAddUnRBSectionTitle = false;
    isShowHiddenSame = false;
  }

//  // 正在直播
//  Future<List<AnchorSubCellModel>> requestSlideRBLiveFromServer(int page,{int pageSize = 20}) async {
//
//    List<AnchorSubCellModel> cellModels = [];
//    liveReq.hideSame = config.userInfo.isHiddenRBSameLive;
//    liveReq.page = page.toString();
//    liveReq.pageSize = pageSize.toString();
//    var rsp = await liveReq.request();
//    totalCount = rsp.total;
//    for(int index = 0; index < rsp.anchorList.length; index ++){
//      var g1 = rsp.anchorList[index];
//      // 设置默认图片
//      anchorAddDefaultIcon(index,g1,null);
//      AnchorMatchCellModel cellModel = (AnchorMatchCellModel()..liveType = RBLiveType.RBLive).fromRBLiveProtocolWithGame(g1);
//      cellModels.add(cellModel.hotLiveModel);
//      // 筛选选中滚球直播
//      checkIsSelectCurrentLive(cellModel.hotLiveModel);
//    }
//    return cellModels;
//  }
//  // 将要直播
//  Future<List<AnchorSubCellModel>> requestAnchorLiveFromServer(int page,int rbType,{int pageSize = 20}) async {
//    List<AnchorSubCellModel> cellModels = [];
//    // 1:滚球 2非滚球
//    willLiveReq.page = page.toString();
//    willLiveReq.rbType = rbType == 1 ? '1' : '2';
//    willLiveReq.pageSize = pageSize.toString();
//    willLiveReq.hideSame = config.userInfo.isHiddenSameLive;
//    print('隐藏相同--------:${willLiveReq.hideSame}');
//    var rsp = await willLiveReq.request();
//    if(rbType == 1){
//      totalCount = rsp.total;
//    }
//    else{
//      slideUnRBLiveTotalCount = rsp.total;
//    }
//    for(int index = 0; index < rsp.anchorList.length; index ++){
//      var g1 = rsp.anchorList[index];
//      // 设置默认图片
//      anchorAddDefaultIcon(index,g1,null);
//      AnchorMatchCellModel cellModel = (AnchorMatchCellModel()..liveType = RBLiveType.RBLive).fromRBLiveProtocolWithGame(g1);
//      cellModels.add(cellModel.hotLiveModel);
//      // 筛选选中滚球直播
//      checkIsSelectCurrentLive(cellModel.hotLiveModel);
//    }
//    listLength = cellModels.length;
//    return cellModels;
//  }

  // 主播直播(接口暂时不分页，默认100条)
  Future<List<AnchorSubCellModel>> requestMatchLiveFromServer(int page,{int pageSize = 100, bool isFreeAnchor = false, bool isListDetail = false}) async {

    List<AnchorSubCellModel> cellModels = <AnchorSubCellModel>[];
    // 1:滚球 2非滚球
    req.videoType = '1';
    req.page = page.toString();
    req.rbType = '';
    req.pageSize = pageSize.toString();
    req.hideSame = config.userInfo.isHiddenSameLive;
    var rsp = await req.request();
    print('总条数111-----:${rsp.total}');
    print('总条数-----:$totalCount');
    // 屏蔽赛事直播
    rsp.anchorList?.clear();
    rsp?.total = 0;
    if(isListDetail){
      totalCount = rsp.total;
    }else{
      totalCount = rsp.totalRooms + rsp.total;
    }
    List list = [];
    if(rsp.liveRooms.isNotEmpty && !isListDetail){
      // 屏蔽自由播未开播的
      rsp.liveRooms.removeWhere((element){
        String liveStatus = AiJson(element).getString('liveStatus');
        return liveStatus != null && liveStatus == '0';
      });
      int count = rsp.liveRooms.length;
      totalCount = count + rsp.total;
      list.addAll(rsp.liveRooms);
    }
    if(rsp.anchorList.isNotEmpty){
      list.addAll(rsp.anchorList);
    }
    for (var i = 0; i < list.length; i++ ) {
      var g1 = list[i];
      String showType1 = AiJson(g1).getString('showType');
      // 设置默认图片
      anchorAddDefaultIcon(i,g1,null);
      AnchorMatchCellModel model = (AnchorMatchCellModel()..liveType = RBLiveType.RBLive).fromRBLiveProtocolWithGame(g1);
      // 滚球分组标题
      if(showType1 == 'RB' && !isAddRBSectionTitle && !model.hotLiveModel.isShowFreeAnchor){
        isAddRBSectionTitle = true;
        isShowHiddenSame = true;
        model.hotLiveModel.groupTitle = config.langMap['baseLang']['detail']['videoRecomend'];
        model.hotLiveModel.isShowHiddenSame = isShowHiddenSame;
      }
      // 非滚球分组标题
      if(showType1 != 'RB' && !isAddUnRBSectionTitle && !model.hotLiveModel.isShowFreeAnchor){
        isAddUnRBSectionTitle = true;
        model.hotLiveModel.groupTitle = config.langMap['baseLang']['detail']['willLive'];
        if(!isShowHiddenSame){
          isShowHiddenSame = true;
          model.hotLiveModel.isShowHiddenSame = isShowHiddenSame;
        }
      }
      // 多语言屏蔽主播
      if(!isStrNullOrEmpty(model?.hotLiveModel?.anchorId) && config.isDeleteInternationalAppointModule){
        if(totalCount > 0){
          totalCount --;
        }
        continue;
      }
      checkIsSelectCurrentLive(model.hotLiveModel);
      cellModels.add(model.hotLiveModel);
    }
    listLength = cellModels.length;
    return cellModels;
  }


  // 正在直播
  Future<List<AnchorSubCellModel>> requestSlideRBLiveFromServer(int page,{int pageSize = 20}) async {

    List<AnchorSubCellModel> cellModels = [];
    liveReq.hideSame = config.userInfo.isHiddenRBSameLive;
    liveReq.page = page.toString();
    liveReq.pageSize = pageSize.toString();
    var rsp = await liveReq.request();
    totalCount = rsp.total;
    for(int index = 0; index < rsp.anchorList.length; index ++){
      var g1 = rsp.anchorList[index];
      // 设置默认图片
      anchorAddDefaultIcon(index,g1,null);
      AnchorMatchCellModel cellModel = (AnchorMatchCellModel()..liveType = RBLiveType.RBLive).fromRBLiveProtocolWithGame(g1);
      cellModels.add(cellModel.hotLiveModel);
      // 筛选选中滚球直播
      checkIsSelectCurrentLive(cellModel.hotLiveModel);
    }
    return cellModels;
  }

  void checkIsSelectCurrentLive(AnchorSubCellModel model){
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

  }


  void anchorAddDefaultIcon(i,g1,g2){
    // 设置默认图片
    String anchorId1 = AiJson(g1).getString('anchorId');
    String anchorId2 = '';
    if(g2 != null){
      anchorId2 = AiJson(g2).getString('anchorId');
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
      if(!this.anchorDefaultIconMap.containsKey(anchorId1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        int index  =  i < 8 ?  i + 1 : randomindex + 1;
        anchorDefaultIcon1 = getAnchorLiveBgImage(index);
        this.anchorDefaultIconMap[anchorId1] = anchorDefaultIcon1;
      }
    }
    else{
      // 左边视频
      int randomindex = Random().nextInt(maxIndex);
      String gidm = AiJson(g1).getString('gidm');
      String videoType = AiJson(g1).getString('type');
      String gameType = AiJson(g1).getString('gameType');
      String key1 = gidm + videoType;
      if(!this.anchorDefaultIconMap.containsKey(key1)){
        // 前8张按顺序默认，大于8张随机分配
        String anchorDefaultIcon1 = '';
        int index  =  i < maxIndex ?  i + 1 : randomindex + 1;
        anchorDefaultIcon1 = getGameBgImage(gameType, index);
        this.anchorDefaultIconMap[key1] = anchorDefaultIcon1;
      }
    }

    // 右边主播默认图
    if(g2 != null){
      if(anchorId2.isNotEmpty){
        int randomindex = Random().nextInt(8);
        if(!this.anchorDefaultIconMap.containsKey(anchorId2)){
          String anchorDefaultIcon2 = '';
          int index  =  i + 1 < 8 ?  i + 2 : randomindex + 1;
          anchorDefaultIcon2 = getAnchorLiveBgImage(index);
          this.anchorDefaultIconMap[anchorId2] = anchorDefaultIcon2;
        }
      }
      else{
        // 右边视频
        int randomindex = Random().nextInt(maxIndex);
        String gidm = AiJson(g2).getString('gidm');
        String videoType = AiJson(g2).getString('type');
        String gameType = AiJson(g2).getString('gameType');
        String key1 = gidm + videoType;
        if(!this.anchorDefaultIconMap.containsKey(key1)){
          // 前8张按顺序默认，大于8张随机分配
          String anchorDefaultIcon1 = '';
          int index  =  i + 1 < maxIndex ?  i + 2 : randomindex + 1;
          anchorDefaultIcon1 = getGameBgImage(gameType, index);
          this.anchorDefaultIconMap[key1] = anchorDefaultIcon1;
        }
      }
    }
    if(g1 != null){
      if(anchorId1.isNotEmpty){
        String anchorIcon = this.anchorDefaultIconMap[anchorId1];
        g1['anchorDefaultIcon'] = anchorIcon ?? getAnchorLiveBgImage(1);
      }
      else{
        String gidm = AiJson(g1).getString('gidm');
        String videoType = AiJson(g1).getString('type');
        String gameType = AiJson(g1).getString('gameType');
        String key1 = gidm + videoType;
        String anchorIcon = this.anchorDefaultIconMap[key1];
        g1['anchorDefaultIcon'] = anchorIcon ?? getGameBgImage(gameType,2);
      }
    }

    if(g2 != null){
      if(anchorId2.isNotEmpty){
        String anchorIcon = this.anchorDefaultIconMap[anchorId2];
        g2['anchorDefaultIcon'] = anchorIcon ?? getAnchorLiveBgImage(1);
      }
      else{
          String gidm = AiJson(g2).getString('gidm');
          String videoType = AiJson(g2).getString('type');
          String gameType = AiJson(g2).getString('gameType');
          String key1 = gidm + videoType;
          String anchorIcon = this.anchorDefaultIconMap[key1];
          g2['anchorDefaultIcon'] = anchorIcon  ?? getGameBgImage(gameType,2);
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

  String getAnchorLiveBgImage(num index){
    return 'assets/images/liveplayer/img_beauty_$index.png';
  }
}