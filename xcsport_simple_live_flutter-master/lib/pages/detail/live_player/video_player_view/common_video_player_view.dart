import 'dart:math';

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/anchor/anchor_grade.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chat/live_chat_message.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_flux_tips.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_loading.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_toolpanel/live_toolpanel.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/barrage/barrage.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/float_widget.dart';
import 'package:flutter/material.dart';

import 'base_video_player.dart';
import 'common_video_player_view_model.dart';
import 'common_video_player_view_style.dart';

///
/// (本地、远程、直播、web)视频播放器
///
class CommonVideoPlayerView extends StatefulView<CommonVideoPlayerViewStyle, CommonVideoPlayerViewModel> {
  final CommonVideoPlayerViewModel model;

  CommonVideoPlayerView({Key key,  this.model }) : super(model: model, key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends ViewState<CommonVideoPlayerViewStyle, CommonVideoPlayerViewModel, CommonVideoPlayerView> with WidgetsBindingObserver {
  CommonVideoPlayerViewModel _viewModel;
  GlobalKey<BarrageState> _barrageKey = GlobalKey();

  @override
  CommonVideoPlayerViewModel get defaultModel {
    _viewModel ??= CommonVideoPlayerViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    model.changeScreen(model.canRotate);

    return Show(isShow: model.canRotate, child: buildBody(), replacement: model.defaultHeader);
  }

  Widget buildBody() {
    model.updateFluxMode();
    var width = 0.0;
    var height = 0.0;
    var padding = model.padding;

    if (model.bottomBarController.model.screenDirection == ScreenDirection.TopDown) {
      padding = padding.copyWith(bottom: 0);
      width = MediaQuery.of(context).size.width - padding.left - padding.right - model.freeLiveMargin;
      height = width * 0.562512;
    } else {
      width = MediaQuery.of(context).size.width - padding.left - padding.right;
      height = MediaQuery.of(context).size.height - padding.top - padding.bottom;
    }
    var size = Size(width, height);

    var videoType = model.bottomBarController.model.videoType;
    if (videoType == VideoType.Score || (model.isFreeAnchor && model.liveStatus != null && model.liveStatus == 0)) {
      return model.defaultHeader;
    }
    else {
      // 获取视频URL，设置type
      _barrageKey.currentState?.resize(
        width: width,
        height: height,
        paddingTop: max(AiMeasure.topOffset(context).toInt(), 50),
        maxChannel: model.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown ? 2 : 3
      );

      setFloatVideoInfo(fvUrl: model.url, fvFormat: model.type, fvSize: size, isFreeAnchor: model.isFreeAnchor);
      return Container(
        padding: model.padding,
        width: width + padding.left + padding.right,
        height: height + padding.top + padding.bottom,
        color: Color(0xFF071C29),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 播放器
            Positioned.fill(
              child: !(model.controller.needShowFluxWidget) ? BaseVideoPlayerView(
                type: model.type,
                url: model.url,
                controller: model.controller.player,
                fijkBuilder: model.playerConfig,
                panelBuilder: model.panelBuilder,
              ) : Container(),
            ),

            // 控制面板
            LiveLoading(
              player: model.controller.player,
            ),
            Container(
              width: width,
              height: height,
              child: Barrage(
                key: _barrageKey,
                width: width + padding.left + padding.right,
                height: height + padding.top + padding.bottom,
                maxChannel: 2,
                paddingTop: AiMeasure.topOffset(context).toInt(),
              ),
            ),
            LiveFluxTipsBackground(
              player: model.controller,
            ),

            model.isFreeAnchorListEntry
            ? Positioned(
              top: 0,
              right: 0,
              child: (model?.freeAnchorModel?.isShowFreeAnchor ?? false) ? SizedBox.shrink() : merchantInfo()
            )
            : Positioned(
              top: 0,
              child: LiveToolPanel(
                anchorId: model.anchorId,
                roomNo: model.roomNo,
                videoPlayerController: model.controller,
                orientation: model.orientation,
                swiperController: model.swiperController,
                onEntryGameDetail: model.onEntryGameDetail,
                isVlogLive: model.isVlogLive,
                size: size,
                isFreeAnchor:model.isFreeAnchor,
                isFreeLiveGameAnchor: model.isFreeLiveGameAnchor,
                padding: padding,
                horizontalDragCallBack: model?.horizontalDragCallBack,
                matchesDetailModel: model?.matchesDetailModel,
                extendModel: model?.extendModel,
                newHeadAnchorModel: model?.newHeadAnchorModel,
                detailSet: model?.detailSet,
                onShowMatchInfo: model?.onShowMatchInfo,
              ),
            ),

//            model.isFreeAnchorListEntry ? SizedBox.shrink() : moreLiveWidget(),

            model.isFreeAnchorListEntry && (!isStrNullOrEmpty(model.selectAnchorId) || !isStrNullOrEmpty(model.anchorId))
            ? Positioned(
              top: 36.0,
              right: 0,
              bottom: 0,
              width: 116.0,
              child: LiveChatMessage(
                matchesDetailModel: model.matchesDetailModel,
                extendModel: model.extendModel,
                toolPanelController: model.controller.toolPanel,
                detailParams: model.detailSet.detailParams,
              )
            ) : SizedBox.shrink(),

            model.isFreeAnchorListEntry
            ? Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: freeAnchorInfoWidget()
            ) : SizedBox.shrink()
          ],
        ),
      );
    }
  }

  // Widget _panelBuilder(BuildContext context, AiVideoController controller, AiVideoState state) {
  //   return ;
  // }

  Widget freeAnchorInfoWidget() {
    AnchorSubCellModel freeAnchorModel = model?.freeAnchorModel;
    String anchorLevelIcon = freeAnchorModel?.anchorLevelIcon ?? '';
    String anchorLevelTitle = freeAnchorModel.anchorLevelTitle ?? '';
    //String userLogo = string(freeAnchorModel?.icon,defaultVal: freeAnchorModel?.cover);
    String anchorLabel = freeAnchorModel.label ?? '';
    String anchorName = freeAnchorModel.name ?? '';
    if(isStrNullOrEmpty(anchorName)){
      anchorName = freeAnchorModel.nickname;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Offstage(
                      offstage: !freeAnchorModel.isShowAnchorLevel,
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0, top: 10.0),
                        child: AnchorGrade(
                          anchorLevelIcon: anchorLevelIcon,
                          anchorLevelTitle: anchorLevelTitle,
                        ),
                      ),
                    )
                  ),
                  merchantInfo()
                ],
              )
            )
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: <Color>[Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
            ),
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8.0),
                Text(anchorName, style: style.textStyle,),
                Offstage(
                  offstage: isStrNullOrEmpty(anchorLabel),
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    height: 16.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(2.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF70ADFE), Color(0xFF4B72FF)]
                      )
                    ),
                    padding: EdgeInsets.only(left: 6.0, right: 4.0),
                    child: Text(anchorLabel, style: style.anchorLabelStyle,),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget merchantInfo(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          merchantInfoWidget(),
          closeVideoWidget(),
        ],
      ),
    );
  }

  Widget closeVideoWidget(){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(right: 5.0, top: 5.0),
        width: 25,
        height: 25,
        child: Center(child: Icon(Icons.close,color: Colors.white,))
      ),
      onTap: (){
        config.userInfo.isCloseFreeAnchor = true;
        model?.controller?.player?.pause();
        Event.eventBus.fire(FreeAnchorCloseVideoEvent());
        if(model?.onCloseVideo != null){
          model?.onCloseVideo();
        }
      },
    );
  }

  Widget merchantInfoWidget() {
    String liveName = config.userInfo.merchantLiveInfo["liveName"];
    String liveLogo = config.userInfo.merchantLiveInfo["liveLogo"];
    if (isStrNullOrEmpty(liveName) && isStrNullOrEmpty(liveLogo)) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(top: 5.0),
//      width: 80.0,
      height: 28.0,
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !isStrNullOrEmpty(liveLogo) ? Container(
            margin: EdgeInsets.only(right: 3),
            width: 16.0,
            child: AiImage.fromUrl(liveLogo, "team", BoxFit.fill),
          ) : Container(),
          Text(
            liveName,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: style.liveTextStyle,
          ),
        ],
      ),
    );
  }

  // 更多直播视频
  Widget moreLiveWidget() {
    if (model.isHiddenMore || model.isVlogLive || model.isListDetail || !ModuleSwitch.getInstance().videoAndAnchor()) {
      return SizedBox.shrink();
    }
    return StreamBuilder(
        stream: model.moreLiveController.stream,
        initialData: model.moreLivePosition,
        builder: (cxt, span) {
          return AnimatedPositioned(
            top: 80.0,
            right: model.moreLivePosition,
            curve: Curves.linear,
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 63.0,
                height: 28.0,
                child: AiImage.asset('assets/images/detail/more/enter_detail_more_live.png', width: 63.0, height: 28.0, userInternational: true),
              ),
              onTap: () {
                if (!model.showMoreLiveView()) {
//                  ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailLiveMore);
                  if (model?.onMoreVideo != null) {
                    model?.onMoreVideo();
                  }
                }
              },
            ),
          );
        });
  }

  Widget createViewPlayer() {
    return AiImage.asset("assets/images/liveplayer/img_live_test_normal.png", fit: BoxFit.fill);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      model.subscribe(); //前台
      model.bottomBarController.videoPlayer.player.replay();
    }
    else if (state == AppLifecycleState.paused) {
      model.unsubscribe(); //后台
      model.bottomBarController.videoPlayer.player.pause();
    }
  }

  @override
  void dispose() {
    print('dispose-CommonVideoPlayerView');
    super.dispose();
  }
}