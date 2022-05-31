import 'dart:math';

import 'package:dio/dio.dart';
//import 'package:fast_ai/api/protocols/matches/game_anchor_attention_protocol.dart';
import 'package:fast_ai/api/protocols/matches/game_anchor_live_protocol.dart';
//import 'package:fast_ai/api/protocols/matches/game_anchor_reserve_protocol.dart';
//import 'package:fast_ai/api/protocols/matches/game_look_anchor_live_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
//import 'package:fast_ai/pages/hot/banner/aibanner_model.dart';
//import 'package:fast_ai/pages/inplay/running_nav/running_nav_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell_model.dart';
import 'package:fast_ai/widgets/cover_picture.dart';

//import 'anchor_match_nav/anchor_match_nav_model.dart';

const String AnchorDefaultIcon = 'anchorDefaultIcon';

class AnchorMatchModel{

//  final AnchorMatchNavModel navModel = AnchorMatchNavModel();
//  final AiBannerModel bannerModel = AiBannerModel();
  int anchorRBTotal = 0;
  int unAnchorRBTotal = 0;
  int totalCount = 0;
  int listLength = 0;
  bool isAddRBSectionTitle = false;
  bool isAddUnRBSectionTitle = false;
  bool isRBSingular = false;
  int bufferNum = 0;
  var bufferData;

  // bool isHiddenSameLive = true;
  List<AnchorMatchCellModel> anchorMatchs = <AnchorMatchCellModel>[]; // 广场直播
  GameAnchorLiveReqProtocol req = GameAnchorLiveReqProtocol();

  void setRequestGameTypeLive({String gameType = 'FT'}){
    req.gameType = gameType;
    req.videoType = ''; 
  }

  void setRequestAll(){
    req.page = '1';
    req.videoType = '';  // 1:主播 2:视频 为空全部
    req.gameType = '';
  }
  // 主播直播
  void setRequestAnchorLive(){
    req.page = '1';
    req.videoType = '1';
    req.gameType = '';
  }
  // 视频直播
  void setRequestVideoLive(){
    req.page = '1';
    req.videoType = '2';
    req.gameType = '';
  }


  // Map<String, dynamic> anchorDefaultIconMap = {};
  // 主播直播
  Future<List<AnchorMatchCellModel>> requestAnchorLiveFromServer(int page,int rbType,{int pageSize = 40,CancelToken cancelToken}) async {

    List<AnchorMatchCellModel> cellModels = <AnchorMatchCellModel>[];
    anchorMatchs = <AnchorMatchCellModel>[];
    // 1:滚球 2非滚球
    req.page = page.toString();
    req.rbType = rbType == 1 ? '1' : '2';
    req.pageSize = pageSize.toString();
    req.hideSame = config.userInfo.isHiddenSameLive;
    var rsp = await req.request(cancelToken: cancelToken);
    if(rbType == 1){
      if(rsp.total % 2 == 0 && rsp.total >= 2){
        totalCount = rsp.total ~/ 2;
      }
      else if(rsp.total > 2 && rsp.total % 2 != 0){
        totalCount = rsp.total ~/ 2 + 1;
      }
      else{
        totalCount = rsp.total;
      }
    }
    else{
      if(rsp.total % 2 == 0 && rsp.total >= 2){
        unAnchorRBTotal = rsp.total ~/ 2;
      }
      else if(rsp.total > 2 && rsp.total % 2 != 0){
        unAnchorRBTotal = rsp.total ~/ 2 + 1;
      }
      else{
        unAnchorRBTotal = rsp.total;
      }
    }
    for (var i = 0; i < rsp.anchorList.length; i+=2) {
      var g1 = rsp.anchorList[i];
      var g2 = i < rsp.anchorList.length - 1 ? rsp.anchorList[i+1] : null;
      // 设置默认图片
      CoverPicture.anchorAddDefaultIcon(i,g1,g2);
//      cellModels.add((AnchorMatchCellModel()..liveType = RBLiveType.HotAnchorType).fromGameAnchorLiveRspProtocolWithGame(g1,g2,isShowBadge: true),);
    }
    listLength = cellModels.length;
    anchorMatchs.addAll(cellModels);
    return cellModels;
  }

  // 主播直播
  Future<List<AnchorMatchCellModel>> requestMatchLiveFromServer(int page,{int pageSize = 40,CancelToken cancelToken}) async {

    List<AnchorMatchCellModel> cellModels = List<AnchorMatchCellModel>();
    if(page == 1){
      bufferData = null;
    }
    // 1:滚球 2非滚球
    req.page = page.toString();
    req.rbType = '';
    req.pageSize = pageSize.toString();
//    req.hideSame =  navModel.selectKey == RunningNavItemModel.AnchorLive ? false : config.userInfo.isHiddenSameLive;
    if(config.isDeleteInternationalAppointModule){
      req.videoType = '2';
    }
    var rsp = await req.request(cancelToken: cancelToken);
    if(rsp.total % 2 == 0 && rsp.total >= 2){
      totalCount = rsp.total ~/ 2;
    }
    else if(rsp.total > 2 && rsp.total % 2 != 0){
      totalCount = rsp.total ~/ 2 + 1;
    }
    else{
      totalCount = rsp.total;
    }
    // 滚球数据为单数数据源要向前移一位
    if(rsp.anchorList.length >= 0 && bufferData != null){
      rsp.anchorList.insert(0, bufferData);
      if(rsp.anchorList.length >= pageSize){
        bufferData = rsp.anchorList.last;
        print('');
      }
    }
    totalCount += bufferNum;
    print('总条数111-----:${rsp.total}');
    print('总条数-----:$totalCount');
    for (var i = 0; i < rsp.anchorList.length; i+=(isRBSingular ? 1 : 2)) {
      var g1 = rsp.anchorList[i];
      var g2 = i < rsp.anchorList.length - 1 ? rsp.anchorList[i+1] : null;
      String showType1 = AiJson(g1).getString('showType');
      String showType2 = AiJson(g2).getString('showType');
      // 设置默认图片
      CoverPicture.anchorAddDefaultIcon(i,g1,g2);
//      AnchorMatchCellModel model = (AnchorMatchCellModel()..liveType = RBLiveType.HotAnchorType).fromGameAnchorLiveRspProtocolWithGame(g1,g2,isShowBadge: true);
      // 滚球分组标题
      if(showType1 == 'RB' && !isAddRBSectionTitle){
        isAddRBSectionTitle = true;
//        model.groupTitle = config.langMap['baseLang']['anchor']['liveStreaming'];
      }
      // 非滚球分组标题
      if(showType1 != 'RB' && !isAddUnRBSectionTitle){
        isAddUnRBSectionTitle = true;
//        model.groupTitle = config.langMap['baseLang']['anchor']['comingLive'];
      }
      // 滚球数量单数
      if(i > 0){
        isRBSingular = false;
      }
      if(showType1 == 'RB' && showType2 != 'RB'){
        totalCount += 1;
        bufferNum = 1;
        // 数据往前移一位
        isRBSingular = true;
        // 保存最后一条数据
        if(rsp.anchorList.length >= pageSize){
          bufferData = rsp.anchorList.last;
        }
//        model = (AnchorMatchCellModel()..liveType = RBLiveType.HotAnchorType).fromGameAnchorLiveRspProtocolWithGame(g1,null,isShowBadge: true);
      }
      if(cellModels.length < pageSize / 2){
//        cellModels.add(model);
      }
    }
    listLength = cellModels.length;
    return cellModels;
  }


  void clear(){
    // cellModels.clear();
    totalCount = 0;
    anchorRBTotal = 0;
    unAnchorRBTotal = 0;
    isAddUnRBSectionTitle = false;
    isAddRBSectionTitle = false;
    isRBSingular = false;
    bufferNum = 0;
  }

//  // 预约直播
//  GameAnchorReserveReqProtocol reserveReq = GameAnchorReserveReqProtocol();
//  Future<GameAnchorReserveRspProtocol> requestAnchorReserveFromServer(String reserve,String anchorId,String gidm,{String videoUrl = '',String videoType = '1'}) async {
//    var body = {
//      'anchorId': anchorId ?? '',
//      'gidm': gidm ?? '',
//      'videoUrl': videoUrl ?? '',
//      'videoType': videoType ?? '',
//      'reserve': reserve ?? '',
//    };
//    var rsp = await reserveReq.request(body);
//    return rsp;
//  }

//  // 观看主播直播
//  GameLookAnchorLiveReqProtocol lookAnchorReq = GameLookAnchorLiveReqProtocol();
//  Future<GameLookAnchorLiveResProtocol> requestLookAnchorLiveFromServer(String anchorId,String gidm,{String videoUrl = '',String videoType = '1'}) async {
//     var body = {
//      'anchorId': anchorId ?? '',
//      'gidm': gidm ?? '',
//      'videoUrl': videoUrl ?? '',
//      'videoType': videoType ?? '',
//    };
//    var rsp = await lookAnchorReq.request(body);
//    return rsp;
//  }

//  // 关注主播
//  GameAnchorAttentionReqProtocol attentionReq = GameAnchorAttentionReqProtocol();
//  Future<BaseModel> requestAnchorAttentionFromServer(params) async {
//    var rsp = await attentionReq.request(params);
//    return rsp;
//  }


  // AnchorSubCellModel getCellModel(){
  //   return AnchorSubCellModel()
  //   ..leagueName = '英格兰超级联赛'
  //   ..anchorStatus = '1000'
  //   ..nickname = '小倩说球'
  //   ..name = '小倩说球'
  //   ..homeName = '皇家马德里皇家马德里皇家马德里'
  //   ..awayName = '瓦伦西亚'
  //   ..homeGoal = '108'
  //   ..awayGoal = '108'
  //   ..gidm = '111'
  //   ..liveType = RBLiveType.HotAnchorType
  //   ..gameDate = 1590481930;
  // }

}