import 'dart:async';

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_view.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_view_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/enter_game_detail_config.dart';
import 'package:flutter/material.dart';

import 'free_live_player_view_style.dart';
import 'free_live_player_view_model.dart';

///
/// {notes}
///
class FreeLivePlayerView extends StatefulView<FreeLivePlayerViewStyle, FreeLivePlayerViewModel> {
  final FreeLivePlayerViewModel model;
  final VoidCallback onCloseVideo;
  final VoidCallback goBack;
  final VoidCallback onEntryDetail;
  FreeLivePlayerView({Key key,  this.model, this.onCloseVideo, this.goBack, this.onEntryDetail}) : super(model: model, key: key);

  @override
  _FreeLivePlayerViewState createState() => _FreeLivePlayerViewState();
}

class _FreeLivePlayerViewState extends ViewState<FreeLivePlayerViewStyle, FreeLivePlayerViewModel, FreeLivePlayerView> {
  FreeLivePlayerViewModel _viewModel;
  StreamSubscription<FreeAnchorEntryDetailEvent> freeAnchorEntryDetailEvent;

  @override
  FreeLivePlayerViewModel get defaultModel {
    _viewModel ??= FreeLivePlayerViewModel();
    return _viewModel;
  }

  DetailParams params;
  DetailSet detailSet;

  @override
  void initState() {
    bindEntryDetailEvent();
    params = DetailParams();
    detailSet = DetailSet()..detailParams = params;
    super.initState();
  }

  @override
  void dispose() {
    model?.playerController?.dispose();
    unbindEntryDetailEvent();
    super.dispose();
  }

  void bindEntryDetailEvent(){
    // 主播列表进详情
    freeAnchorEntryDetailEvent = Event.eventBus.on<FreeAnchorEntryDetailEvent>().listen(freeAnchorEntryDetail);
  }

  void unbindEntryDetailEvent(){
    freeAnchorEntryDetailEvent?.cancel();
  }

  void freeAnchorEntryDetail(event){
    if(event is FreeAnchorEntryDetailEvent){
      model?.playerController?.player?.pause();
    }
  }

  void stopVideoPlay(){
    model?.playerController?.player?.pause();
  }


  @override
  Widget render(BuildContext context) {
    detailSet.selectViewType = SelectViewTypeVideo;
    bool isShowFreeAnchor = model?.freeAnchorModel?.isShowFreeAnchor ?? false;
    bool isRBGame = model?.freeAnchorModel?.isRBGame ?? false;
    bool showLiveVideo = model.isShowLivePlayer && isRBGame;
    CommonVideoPlayerViewModel videoPlayerVM;
    if(showLiveVideo) {
      var params = DetailParams();
      String m3u8 = model.freeAnchorModel.m3u8 ?? '';
      String flv = model.freeAnchorModel.flv ?? '';
      String rtmp = model.freeAnchorModel.rtmp ?? '';
      String anchorId = model.freeAnchorModel.anchorId ?? '';
      String liveId = model.freeAnchorModel.liveId;
      // 视频更换时要更新播放地址
      params.liveId = liveId;
      params.anchorId = anchorId;
      params.isFreeAnchorListEntry = true;
      params.isFreeAnchorListChatRoom = true;
      params.isFreeAnchor = isShowFreeAnchor;
      params.liveParams = { // dev_f2分支没用到，先保留
        'flv' : flv,
        'm3u8' : m3u8,
        'rtmp' : rtmp,
      };
      detailSet.detailParams = params;

      videoPlayerVM = CommonVideoPlayerViewModel.create(
        freeLiveId: model.freeAnchorModel.liveId,
        freeAnchorId: model.freeAnchorModel.anchorId,
        freeAnchorModel: model.freeAnchorModel,
        extendModel: model.extendModel,
        matchesDetailModel: model.matchesDetailModel,
        padding: EdgeInsets.zero,
        freeLiveMargin: 16.0 * 2,
        defaultHeader: Container(),
        canRotate: true,
        isFreeAnchor: isShowFreeAnchor,
        isFreeAnchorListEntry: true,
        detailSet: detailSet,
        onCloseVideo: widget.onCloseVideo,
        onEntryGameDetail: (){},
      );
      videoPlayerVM.controller.toolPanel.bottomBar.model.videoType = VideoType.Video;
      videoPlayerVM.configUrlAndType(
        flv: flv,
        rtmp: rtmp,
        m3u8: m3u8,
      );
    }
    print('00-render-videoPlayerVM.url=${videoPlayerVM?.url}, type=${videoPlayerVM?.type} showLiveVideo=$showLiveVideo');
    return Material(
      color: Colors.transparent,
      child: showLiveVideo
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    widget?.onEntryDetail?.call();
                    DetailParams params = EntryGameDetailConfig.getDetailParams(model.freeAnchorModel, isFreeAnchorListEntry: true);
                    EntryGameDetailConfig.enterGameDetail(context, params, goBack: widget.goBack);
                    stopVideoPlay();
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0, bottom: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      child: Column(
                        children: [
                          CommonVideoPlayerView(
                            model: videoPlayerVM,
                          ),
                        ],
                      )
                    ),
                  ),
                )
            : Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0, bottom: 12.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    child: Container(
                      color: Colors.white,
                      height: isShowFreeAnchor ? 194.0 : 244.0,
                      width: MediaQuery.of(context).size.width - 16.0,
                    )
                ),
              )
    );
  }


  Widget freeAnchorInfo(){
    String title = model?.freeAnchorModel?.title ?? '';
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      alignment: Alignment.center,
      child: Text(
        title,
        style: anchorTitleStyle(),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  TextStyle anchorTitleStyle() {
    return AiTextStyle(
        color: Color(0xFF222222),
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h5,
        fontFamily: config.skin.fontFimaly.pingFang,
        height: 1.5
    );
  }
}