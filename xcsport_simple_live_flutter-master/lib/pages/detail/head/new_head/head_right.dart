import 'dart:async';

import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
//import 'package:fast_ai/pages/betting_2p0/betting_bottom_dialog.dart';
//import 'package:fast_ai/pages/betting_2p0/betting_container_2p0.dart';
//import 'package:fast_ai/pages/container_page.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/styles.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/float_widget.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:fast_ai/widgets/xc_bottom_sheet/xc_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../router.dart';

class HeadRight extends StatefulWidget {

  final bool showShoppingCar;
  final ChatroomController chatroomController;
  CommonVideoPlayerController playerController;

  HeadRight({
    Key key,
    this.playerController,
    this.showShoppingCar = false,
    this.chatroomController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeadRight();
  }
}

class _HeadRight extends State<HeadRight> {
  DetailSet detailSet = config.userInfo.detailSet;
  StreamSubscription _hitOptionCountEvent;
  int _hitOptionCount = 0;
  bool isColsePage = false;

  @override
  void initState() {
//    _hitOptionCount = config.userInfo.hitMap[config.userInfo.currentSaveHitOptionType]?.length ?? 0;
//    _hitOptionCountEvent = Event.eventBus.on<HitOptionCount>().listen((HitOptionCount event){
//      if(mounted){
//        setState(() {
//          _hitOptionCount = 0;
//          _hitOptionCount = config.userInfo.hitMap[config.userInfo.currentSaveHitOptionType]?.length ?? 0;
//        });
//      }
//    });
    super.initState();
  }



  @override
  void dispose() {
    _hitOptionCountEvent?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: <Widget>[
          // Offstage(
          //   offstage: widget?.showShoppingCar ?? false,
          //   child: InkWell(
          //     onTap: _openShoppingCar,
          //     child: Container(
          //       width: 36,
          //       child: Badge(
          //           child: AiSvgPicture.asset(
          //             'assets/images/detail/head/icon_detail_betlist_white.svg',
          //             width: 24,
          //             height: 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ,
          //             fit: BoxFit.cover,
          //           ),
          //           badgeType: BadgeType.number,
          //           number: _hitOptionCount,
          //           layoutType: LayoutType.stack),
          //     ),
          //   ),
          // ),
          w(10),
          InkWell(
              onTap: () {
                if (isColsePage) {
                  return;
                }
//                // 必须赋值为false,有可能导致详情页黑屏
//                widget?.chatroomController?.chatRoomWantKeepAlive = false;
                isColsePage = true;
                Future.delayed(Duration(seconds: 2),(){
                  isColsePage = false;
                });

                if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
                  FloatActivityDrawCarHelper.activityDrawStatus(true, isDetail: true);
                }
                AiRouter.pop(context);
//                // 精选赛事详情返回
//                if(config.userInfo.isShowRefinedDetail){
//                  config.userInfo.isShowRefinedDetail = false;
//                  Event.eventBus.fire(RefinedChatRoomEvent());
//                  if(config.isTabSDK){
//                    XcSdkApi.showBottomBar();
//                  }
//                  sleep(10,(){
//                    Event.eventBus.fire(RefinedDetailEvent(isShowRefinedDetail: false));
//                  });
//                  return;
//                }
//                num betTotal = config?.userInfo?.roomFirstBettingTotal ?? 0;
//                num currentBet = config?.userInfo?.currLaunchAllBetGold ?? 0;
//                num betTotal = config?.userInfo?.videoBettingTotal ?? 0;
//                num currentBet = config?.userInfo?.videoCurrAllBetGold ?? 0;
//                num watchLiveTime = config?.userInfo?.watchLiveTime ?? 0;
//                Event.eventBus.fire(CloseDetailPageEvent());
//                if(detailSet.detailParams?.fromPage == "vlog" ||
//                    betTotal > currentBet ||
//                    watchLiveTime >= 0 ||
//                    config.userInfo.isWatchLiveTimeShort){
//                  AiRouter.pop(context);
//                  return ;
//                }
//                if(config.userInfo.currentMenuKey == AppMenuKey.Live){
//                  AiRouter.pop(context);
//                  return;
//                }
//                changeFloatWidget(context);
              },
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(9),
                margin: EdgeInsets.only(right: 1),
                child: AiSvgPicture.asset(
                  'assets/images/detail/head/icon_detail_x_white.svg',
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover
                ),
              ))
        ],
      ),
    );
  }

  void _openShoppingCar(){
//    PopupShareService.ins.pause("_openShoppingCar");
//    if(Hooks.ins.isBlocked(HookName.StartShowBookCar , {}))return;
//
//    xcShowModalBottomSheet(
//        settings: RouteSettings(name: AiRouter.BettingContainer2P0),
//        isScrollControlled: true,
//        backgroundColor: Colors.transparent,
//        context: context,
//        elevation: 0,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        builder: (BuildContext _context) {
//          return BettingBottomDialog(
//            child: Theme(data: Styles.aiTheme,child: BettingContainer2P0(parentContext: _context, tabIndex: (config.userInfo.getHitCount(null) > 0 ? 0 : 1),addPaddingTop: 90,rightPadding: 10, leftPadding: 10, )),
//          );
//        }
//    ).then((v) {
//      PopupShareService.ins.resume("_openShoppingCar");
//    });
  }
}
