import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:flutter/cupertino.dart';

class EntryGameDetailConfig{

  static enterGameDetail(BuildContext context, DetailParams detailParams, {VoidCallback goBack}){
    DetailPage.show(context, DetailPage(params:detailParams,), goBack: goBack);
  }

  static DetailParams getDetailParams(AnchorSubCellModel model,{PlayPriority playPriority = PlayPriority.anchor, bool isDetailMoreLiveChange = false, bool isFreeAnchorListEntry = false}) {

    String showtype = 'RB';
    String anchorId = model.anchorId;
    String anchorName = model.name;
    String anchorIcon = model.icon;
    String anchorCover = model.cover;
    String anchorUrl = model.url;
    String type = '1'; // 1表示主播，2表示视频
    if (isEmpty(model.anchorId)) {
      type = '2';
    }
    bool isFreeLiveGameAnchor = (model.liveStatus != null && model.liveStatus == 1 && model.isShowFreeAnchor && model?.freeLiveType == config.freeAnchorGame);
    return DetailParams(
        showtype: showtype,
        anchorId: anchorId,
        anchorName: anchorName,
        anchorIcon: anchorIcon,
        anchorCover: anchorCover,
        anchorUrl: anchorUrl,
        reverseVideoUrl: anchorUrl,
        isReserve: model.reserve ?? false ? '1' : '2',
        type: type,
        playPriority: playPriority,
        isDetailMoreLiveChange: isDetailMoreLiveChange,
        isFreeAnchor: model.isShowFreeAnchor,
        isFreeAnchorListEntry: isFreeAnchorListEntry,
        anchorLiveStatus: model.anchorLiveStatus,
        watchTotal: model.watchTotal,
        liveGame: model.liveGame,
        liveId: model.liveId,
        liveStatus: model.liveStatus,
        isFreeLiveGameAnchor: isFreeLiveGameAnchor,
        wishGiftSwitch: model.wishGiftSwitch,
        announcement: model.announcement,
        livePopularity: model.livePopularity,
        gameKey: model.liveGame,
        liveParams: {
          'flv' : model.flv,
          'm3u8' : model.m3u8,
          'rtmp' : model.rtmp,
          'url' : model.url,
        }
    );
  }
}