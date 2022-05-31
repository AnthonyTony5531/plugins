import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
enum RBLiveType{
  AnchorType,   // 主播直播
  VideoType,    // 视频直播
  HotAnchorType, // 热门快捷入口主播
  RBLive,        // 详情滚球直播 
}

class AnchorMatchCellModel{
  RBLiveType liveType;
  AnchorSubCellModel leftModel = AnchorSubCellModel();
  AnchorSubCellModel rightModel = AnchorSubCellModel();
  AnchorSubCellModel videoModel = AnchorSubCellModel();
  AnchorSubCellModel hotLiveModel = AnchorSubCellModel();
  AnchorLiveModel freeAnchorModel = AnchorLiveModel();

// 热门直播(单独)
  AnchorMatchCellModel fromAnchorReqProtocolWithGame(Map<String,dynamic> g1) {
    hotLiveModel = AnchorSubCellModel().fromGameAnchorLiveRspProtocolWithGame(g1);
    return this;
  }

// 详情视频直播
  AnchorMatchCellModel fromRBLiveProtocolWithGame(Map<String,dynamic> g1) {
    // g1['showtype'] = 'RB';
    hotLiveModel = AnchorSubCellModel().fromGameAnchorLiveRspProtocolWithGame(g1);
    return this;
  }

  // 自由主播
  AnchorLiveModel fromFreeAnchorReqProtocolWithGame(Map<String,dynamic> g1) {
    freeAnchorModel = AnchorLiveModel().fromGameAnchorLiveRspProtocolWithGame(g1);
    return freeAnchorModel;
  }

}




