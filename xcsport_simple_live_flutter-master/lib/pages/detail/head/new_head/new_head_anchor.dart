import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/gift/player/overall_gift_player.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_left.dart';
import 'package:fast_ai/pages/detail/head/new_head/chatroom_photo.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'head_right.dart';

class NewHeadAnchor extends StatefulWidget {
  NewHeadAnchor({
    Key key,
    this.matchesDetailModel,
    this.extendModel,
    this.anchorId,
    this.headHeight,
    this.topOffset,
    this.dPageModel,
    this.leagueId,
    this.leagueName,
    this.leagueLogo,
    this.leagueCount,
    this.playerController,
    this.detailSet,
    this.roomNo,
//    this.isFreeAnchor = false,
    this.controller,
    this.watchTotal = 0,
    this.livePopularity = 0,
    this.isFreeLiveGameAnchor = false,
  }) : super(key: key);
  MatchesDetailModel matchesDetailModel;
  ExtendModel extendModel;
  String anchorId;
  final double topOffset;
  double headHeight;
  DPageModel dPageModel;
  String leagueId;
  String leagueName;
  String leagueLogo;
//  bool isFreeAnchor;
  bool isFreeLiveGameAnchor; // 游戏自由播正在播
  int leagueCount;
  DetailSet detailSet;
  CommonVideoPlayerController playerController;
  String roomNo;
  ChatroomController controller;
  num watchTotal;
  int livePopularity; // 自由播人气数
  @override
  State<StatefulWidget> createState() {
    return _NewHeadAnchor();
  }
}

class _NewHeadAnchor extends State<NewHeadAnchor> with WidgetsBindingObserver {
  Map get baseLang => config.langMap['baseLang'];

  MatchesDetailModel get matchesDetailModel {
    return widget?.matchesDetailModel;
  }

  ExtendModel get extendModel {
    return widget.extendModel;
  }

  String get anchorId {
    return widget.anchorId;
  }

  DPageModel get dPageModel {
    return widget.dPageModel;
  }

  double get headHeight {
    return widget.headHeight;
  }

  DetailSet detailSet = config.userInfo.detailSet;
  bool get isFreeAnchor => widget.detailSet?.detailParams?.isFreeAnchor ?? false;

  //AnchorSelectorModel anchorsModel = AnchorSelectorModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
    }
    //后台
    else if (state == AppLifecycleState.paused) {}
  }

  TextStyle styleFont10 = AiTextStyle(
      fontSize: 10,
      color: Color.fromRGBO(255, 255, 255, 0.7),
      fontFamily: config.skin.fontFimaly.pingFang);
  //初始值为动画样式
  @override
  Widget build(BuildContext context) {
    // VideoLive videoLive;
    // try {
    //   videoLive = extendModel?.data?.merchantVideoLives
    //       ?.firstWhere((v) => v.anchorId == anchorId);
    //   if (videoLive == null) {
    //     videoLive = extendModel?.data?.videoLives
    //         ?.firstWhere((v) => v.anchorId == anchorId);
    //   }
    // } catch (e) {
    //   print('e=$e');
    // }

//    (detailSet.selectViewType == SelectViewTypeVideo && !isStrNullOrEmpty(currentSelectAnchorId) && currentSelectAnchorId == anchorId) && !isFreeAnchorNoStart




  String currentSelectAnchorId = isFreeAnchor? this.anchorId : widget?.playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid;
    num liveStatus = widget.detailSet?.detailParams?.liveStatus;
    bool isFreeAnchorNoStart = liveStatus != null && liveStatus == 0 && isFreeAnchor;

    NewHeadAnchorModel newHeadAnchorModel =
        NewHeadAnchorModel(this.extendModel, this.anchorId);
    newHeadAnchorModel.initData();


  print('SelectViewTypeVideo----:${detailSet.selectViewType}');
  print('currentSelectAnchorId----:$currentSelectAnchorId');
  print('anchorId----:$anchorId');
  print('isFreeAnchorNoStart----:$isFreeAnchorNoStart');

  return Container(
      padding: EdgeInsets.only(top: widget.topOffset, left: 10),
      height: headHeight + widget.topOffset,
      decoration: BoxDecoration(
//        color: Color.fromRGBO(69, 69, 75, 1),
//        color: Color(0xFF19191E),
//          color: Colors.white.withOpacity(0.1)
          color: Colors.transparent
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnchorLeft(
                newHeadAnchorModel: newHeadAnchorModel,
                playerController: widget.playerController,
                detailSet: widget.detailSet ?? detailSet,
                anchorId: widget.anchorId,
                isFreeAnchor: isFreeAnchor,
              ),
//          w(3),
              Expanded(
                child: Offstage(
                  offstage: true,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      showContribution();
                    },
                    child: Container(
                      child: Align(
//                    child: Container(
//                      width: 24.0,
//                      height: 24.0,
//                      color: Colors.transparent,
//                      child: AiImage.asset('assets/images/detail/head/icon_enter_anchor_rank.png',width: 24.0,height: 24.0),
//                    ),
                      ),
                    ),
                  ),
                ),
              ),
              (detailSet.selectViewType == SelectViewTypeVideo && !isStrNullOrEmpty(currentSelectAnchorId) && currentSelectAnchorId == anchorId) && !isFreeAnchorNoStart
                  ? Container(child: ChatroomPhoto(
                      detailSet: widget.detailSet,
                      livePopularity: widget.livePopularity,
                      isFreeLiveGameAnchor: widget.isFreeLiveGameAnchor,
                      systemId: widget?.matchesDetailModel?.data?.systemId,
                      gidm: widget?.matchesDetailModel?.data?.gidm,
                      anchorId: anchorId,
                      roomNo: widget.roomNo,
                      isFreeAnchor: isFreeAnchor,
                      extendModel: this.extendModel,
                      watchTotal: widget.watchTotal,
                      playerController: widget.playerController),
                    )
                  : Container(),
              HeadRight(
                chatroomController: widget.controller,
                playerController: widget.playerController,
              )
            ],
          ),
          if(!isStrNullOrEmpty(widget.anchorId))
            OverallGiftPlayer()
        ],
      )
    );
  }

  bool get isAnchorLive => isNotEmpty(widget.playerController.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid);


  /// 贡献榜
  void showContribution(){
    PopupShareService.ins.pause('_showContribution');
    showModalBottomSheetRoute(
        context,
        child: AnchorContribution(
          isFreeLiveGameAnchor: widget.isFreeLiveGameAnchor,
          gidm: widget?.matchesDetailModel?.data?.gidm,
          anchorId: widget.anchorId,
          roomNo: widget.roomNo,
          systemId: widget?.matchesDetailModel?.data?.systemId,
          isFreeAnchor: isFreeAnchor,
        ),
        barrierColor: Colors.transparent
    ).then((v){
      PopupShareService.ins.resume('_showContribution');
    });

  }
}
