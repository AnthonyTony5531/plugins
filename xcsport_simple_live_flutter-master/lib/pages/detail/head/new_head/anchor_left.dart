import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fast_ai/api/net.dart';
//import 'package:fast_ai/api/protocols/matches/game_anchor_attention_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_follow_card.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/router.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/overlay/loading_overlay.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'anchor_center.dart';

class AnchorLeft extends StatefulWidget {
  AnchorLeft({
    this.newHeadAnchorModel,
    this.playerController,
    this.detailSet,
    this.anchorId,
    this.isFreeAnchor = false,
    Key key,
  }) : super(key: key);
  NewHeadAnchorModel newHeadAnchorModel;
  CommonVideoPlayerController playerController;
  DetailSet detailSet;
  bool isFreeAnchor;
  final String anchorId;
  @override
  State<StatefulWidget> createState() {
    return _AnchorLeft();
  }
}

class _AnchorLeft extends State<AnchorLeft> {
  StreamSubscription<FollowAnchorEvent> followEvent;
  bool isShowDetailPage = true;

  NewHeadAnchorModel get newHeadAnchorModel {
    return widget.newHeadAnchorModel;
  }

  dynamic get watchTotal {
    return widget.newHeadAnchorModel.extendModel?.data?.watchTotal ?? '0';
  }

  dynamic get anchorIcon {
    if(widget.isFreeAnchor){
      return widget.detailSet.detailParams.anchorIcon;
    }
    String icon = '';
    if (newHeadAnchorModel.currentAnchor != null) {
      icon = newHeadAnchorModel.currentAnchor.icon;
    }
    print('00-anchorIcon=$icon');
    return icon;
  }

  dynamic get anchorName {
     if(widget.isFreeAnchor){
      return widget.detailSet.detailParams.anchorName;
    }
    String nickName = '';
    if (newHeadAnchorModel.currentAnchor != null) {
      // nickName = newHeadAnchorModel.currentAnchor.nickname;
      nickName = newHeadAnchorModel.currentAnchor.name;
    }
    return nickName;
  }

  _addEventBus() {
    followEvent = Event.eventBus.on<FollowAnchorEvent>().listen((anchor) {
      if (anchor.anchorId == anchorId) {
        config.userInfo.followAnchor(anchorId);
        if (mounted) setState(() {});
      }
    });
  }

  _clearEventBus() {
    followEvent?.cancel();
  }

  String get anchorId => widget.isFreeAnchor
      ? widget.anchorId
      : string(widget.playerController.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid, defaultVal: newHeadAnchorModel?.currentAnchor?.anchorId ?? '');

  Timer _timer;
  StreamSubscription<UserCardFollowStatusChangedEvent>
      userCardFollowStatusEvent;
  StreamSubscription<FollowAnchorEvent> redPackFollowAnchorEvent;

  void pageChangeListener(
      int pageCount, Route route, Route previousRoute, PageMethod method) {
    String routeName = route?.settings?.name ?? '';
    String previousRouteName = previousRoute?.settings?.name ?? '';
    if (routeName.isNotEmpty &&
        method == PageMethod.Push &&
        (previousRouteName == AiRouter.AiMainPage ||
            previousRouteName == AiRouter.AiDetailPage ||
            previousRouteName == AiRouter.AiMoreFunction)) {
      isShowDetailPage = false;
    } else {
      isShowDetailPage = true;
    }
  }

  @override
  void initState() {
    super.initState();

    _addEventBus();

    if (!isAnchorLive || !widget.isFreeAnchor) return;

    print('00-anchorId=$anchorId');
    bool followed = config.userInfo.hasFollowAnchor(anchorId);
    print(
        "00-AnchorLeft-followed=$followed, followPlayerIds=${config?.userInfo?.account?.data?.followPlayerIds?.toString()}");
    if (followed) return;
    AiNavigatorObserver.getInstance()
        ?.addPageCountChangeListener(pageChangeListener);
//    _timer = Timer(Duration(seconds: 30), () {
//      AiNavigatorObserver.getInstance()
//          ?.removePageCountChangeListener(pageChangeListener);
//      _timer?.cancel();
//      print("11-AnchorLeft-");
//      if (!isAnchorLive ||
//          !widget.isFreeAnchor ||
//          config.userInfo.hasFollowAnchor(anchorId) ||
//          MediaQuery.of(context).orientation == Orientation.landscape ||
//          !isShowDetailPage) return;
//      PopupShareService.ins.pause('_anchorFollowCard');
//      showPopup1(
//          context,
//          AnchorFollowCard(
//            anchorId: anchorId,
//            anchorName: anchorName,
//            anchorUrl: anchorIcon,
//            gidm: widget?.detailSet?.detailParams?.gidm,
////            onFollowed: () {
////              updateWidget();
////              print("11-AnchorFollowCard-end");
////            },
//            onFollowTap: (data, anchorId) {
//              queryFollow(data, anchorId);
//            },
//          )).then((value) {
//        PopupShareService.ins.resume('_anchorFollowCard');
//      });
//    });

    userCardFollowStatusEvent =
        Event.eventBus.on<UserCardFollowStatusChangedEvent>().listen((e) {
      updateWidget();
    });

    redPackFollowAnchorEvent =
        Event.eventBus.on<FollowAnchorEvent>().listen((e) {
      updateWidget();
    });
  }

  void updateWidget() {
    if (mounted) setState(() {});
  }

  Future<void> queryFollow(Map<String, dynamic> data, String anchorId) async {
//    var resp = await Net.setPlayerFollow(data);
//    if (resp.isSuccess) {
//      config.userInfo.followAnchor(anchorId);
//      Fluttertoast.showToast(
//          msg: config.langMap['baseLang']['square']['attentionSuccess']);
//      updateWidget();
//    }
    //Fluttertoast.showToast(msg: resp.isSuccess ? '关注成功' : resp.msg);
  }

  @override
  void dispose() {
    _clearEventBus();
    _timer?.cancel();
    userCardFollowStatusEvent?.cancel();
    userCardFollowStatusEvent?.cancel();
    super.dispose();
  }

  TextStyle styleFont10 = AiTextStyle(
      fontSize: 10,
      color: Color.fromRGBO(255, 255, 255, 0.7),
      fontFamily: config.skin.fontFimaly.pingFang);
  TextStyle styleFont11 = AiTextStyle(
      fontSize: 11,
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang);

  @override
  Widget build(BuildContext context) {
    String selectViewType = selectViewLogo(widget.detailSet.selectViewType);
    bool isAttentionAnchor = config.userInfo.hasFollowAnchor(anchorId);
    print("$selectViewType");
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 10, 2),
      height: 37,
      constraints: BoxConstraints(
          maxWidth: (isAnchorLive || widget.isFreeAnchor) && !isAttentionAnchor
              ? 165
              : 150),
//       decoration: BoxDecoration(
// //        color: Colors.red,
//         color: Colors.white.withOpacity(0.1),
// //        color: Color.fromRGBO(55, 55, 60, 1),
// //        color: Color(0xFF222226),
// //        border: Border.all(
// //          //添加边框
// //          width: 0, //边框宽度
// //          color: Color.fromRGBO(55, 55, 60, 1), //边框颜色
// //        ),
//         borderRadius: new BorderRadius.all(Radius.circular(18.5)), //设置圆角
//       ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('anchor_left-anchorId=$anchorId');
                  // if (isAnchorLive || widget.isFreeAnchor) {
                  //   if (Hooks.ins.isBlocked(HookName.AboutAnchor, {})) return;
                  //   showPopup(
                  //       context,
                  //       UserCard(
                  //         anchorId: anchorId,
                  //       ));
                  // }
                },
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  child: isAnchorLive || widget.isFreeAnchor
                      ? AiImage.userLogo(anchorIcon, size: 26.5)
                      : AiImage.asset(selectViewType,
                          width: 26.5, height: 26.5),
                ),
              ),
              Container(
//                color: Colors.red,
                width: 80,
                // decoration: BoxDecoration(
                //   color: Colors.red,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // print('anchor_left-anchorId=$anchorId, 增加点击区域，主播名也点击');
                        // if (isAnchorLive || widget.isFreeAnchor) {
                        //   if (Hooks.ins.isBlocked(HookName.AboutAnchor, {}))
                        //     return;
                        //   showPopup(
                        //       context,
                        //       UserCard(
                        //         anchorId: anchorId,
                        //       ));
                        // }
                      },
                      child: Container(
                        child: Text(
                          isAnchorLive || widget.isFreeAnchor
                              ?string(anchorName,
                                  defaultVal: config.langMap['baseLang']
                                      ['detail']['anchorLive'])
                              : widget.detailSet.selectViewType ==
                                      SelectViewTypeVideo
                                  ? config.langMap['baseLang']['detail']
                                      ['videoLive']
                                  : (widget.detailSet.selectViewType ==
                                          SelectViewTypeAnimation
                                      ? config.langMap['baseLang']['detail']
                                          ['animationLive']
                                      : config.langMap['baseLang']['detail']
                                          ['scoreLive1']),
                          style: styleFont11,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
//                    Container( // detail/extend接口现在没有返回粉丝数，现将观看人数挪到右边组件展示
//                      child: Text(
//                        this.watchTotal.toString() +
//                            config.langMap['baseLang']['detail']['watch'],
//                        style: styleFont10,
//                      ),
//                    ),
                  ],
                ),
              )
            ],
          ),
          Offstage(
            offstage: !(isAnchorLive || widget.isFreeAnchor)||true,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
//                if (!(isNotEmpty(anchorId)) || true) {
//                  return;
//                }
//                if (Hooks.ins.isBlocked(HookName.StartAttentionAnchor, {}))
//                  return;
//
//                bool hasFollowAnchor =
//                    config.userInfo.hasFollowAnchor(anchorId);
//                if (hasFollowAnchor) {
//                  //已关注不能取消关注
//                  return;
//                }
//                var lay = LoadingOverlay.of(context)
//                  ..show(
//                      text:
//                          "${config.langMap['baseLang']['detail']['waiting']},${hasFollowAnchor ? config.langMap['baseLang']['detail']['unfollowing'] : config.langMap['baseLang']['detail']['following']}");
//                int follow = hasFollowAnchor ? 2 : 1;
//                var params = {
//                  'playerId': anchorId,
//                  'followType': 2, // 1.大神 2.主播
//                  'follow': follow,
//                  'anchorId': anchorId,
//                  'gidm': widget?.detailSet?.detailParams?.gidm ?? '',
//                };
//                GameAnchorAttentionReqProtocol attentionReq =
//                    GameAnchorAttentionReqProtocol();
//                var rsp = await attentionReq.request(params);
//                lay.dispose();
//                if (rsp.code == 200) {
//                  hasFollowAnchor = !hasFollowAnchor;
//                  showToas(hasFollowAnchor
//                      ? config.langMap['baseLang']['anchor']['followed']
//                      : config.langMap['baseLang']['anchor']['unfollow']);
//                  if (hasFollowAnchor) {
//                    config.userInfo.followAnchor(anchorId);
//                  } else {
//                    config.userInfo.unfollowAnchor(anchorId);
//                  }
//                  setState(() {});
//                } else {
//                  showToas(!hasFollowAnchor
//                      ? config.langMap['baseLang']['anchor']['followFailed']
//                      : config.langMap['baseLang']['anchor']['unfollowFailed']);
//                }
              },
              child: Container(
                 width: 40,
                  // child: isAttentionAnchor
                  //     ? Container(
                  //         child: AiImage.asset(
                  //             "assets/images/detail/head/icon_detail_top_fans.png",
                  //             width: 22,
                  //             height: 30,
                  //             fit: BoxFit.contain),
                  //       )
                  //     : Container(
                  //         width: 38.0,
                  //         height: 24.0,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           color: config.customStyle.themeColor
                  //               .withOpacity(isNotEmpty(anchorId) ? 1 : 0.4),
                  //           borderRadius: BorderRadius.circular(12.0),
                  //         ),
                  //         child: AutoSizeText(
                  //           config.langMap['baseLang']['follow'],
                  //           style: attentionStyle(),
                  //           maxLines: 1,
                  //           minFontSize: 8.0,
                  //         ),
                  //       )
                        ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle attentionStyle() {
    return AiTextStyle(
      color: config.customStyle.themeIncludeFontColor
          .withOpacity(isNullOrEmpty(anchorId) ? 0.4 : 1),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  bool get isAnchorLive =>
      (widget.detailSet.selectViewType == SelectViewTypeVideo &&
          isNotEmpty(anchorId));
}
