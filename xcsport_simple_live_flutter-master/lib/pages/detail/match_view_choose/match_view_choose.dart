import 'package:fast_ai/api/protocols/detail/collect_game_protocol.dart';
//import 'package:fast_ai/api/protocols/player/collect_list.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';
//import 'package:fast_ai/pages/collect/match_collection_info_service.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_config.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
//import 'package:fast_ai/pages/member/anchorHomePage/anchor_home_page.dart';
//import 'package:fast_ai/pages/member/follow/follow_match/follow_match_model.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/barrage/barrage_manager.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../detail_page_model.dart';
import 'match_view_choose_model.dart';
import 'match_view_choose_style.dart';

//联赛详情更多弹窗
class MatchViewChoose extends StatefulWidget {
  final MatchViewChooseModel model;
  final MatchViewChooseStyle style;
  final ValueChanged<MatchViewChooseModel> onConfirmChoosed;
  final String selectAnchorId;
  CommonVideoPlayerController playerController;

  MatchViewChoose(
      {Key key,
      this.onConfirmChoosed,
      this.model,
      this.style,
      this.playerController,
      this.selectAnchorId})
      : super(key: key);

  @override
  _MatchViewChooseState createState() => _MatchViewChooseState();
}

var baseLang = config.langMap['baseLang'];

class _MatchViewChooseState extends State<MatchViewChoose> {
  final defaultStyle = MatchViewChooseStyle();
  final defaultModel = MatchViewChooseModel();
  bool isCollected = true;

  MatchViewChooseStyle get style {
    return widget?.style ?? defaultStyle;
  }

  MatchViewChooseModel get model {
    return widget?.model ?? defaultModel;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double boxWidth = width < height ? width : height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: boxWidth),
      child: Container(
        // width: boxWidth,
        height: 340,
        color: config.skin.list.backgroundColor,
        child: Column(
          children: <Widget>[
            createMatchDataLine(),
            createSplitLine(),
            createMatchViewLine(),
            Expanded(child: createCancelLine())
          ],
        ),
      ),
    );
  }

  Widget createButton(String name, String type, bool isActive, Widget image,
      {VoidCallback onPress}) {
    return InkWell(
      onTap: () {
        if (null != onPress) {
          onPress();
          return;
        }
        if (type == 'collect') {
          onItemTap(type);
        } else {
          if (isActive) {
            onItemTap(type);
          }
        }
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: TitleText(
          position: TitlePosition.Top,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              // width: 48,
              // height: 48,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: image,
            ),
          ),
          text: Text(
            name,
            style: AiTextStyle(
              fontSize: 12,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  double imgWidth = 23;
//  final service = MatchCollectionInfoService();

  Widget createMatchDataLine() {
    // 是否有主播直播
    String anchorId = widget.playerController.toolPanel?.anchorSelectorFull
            ?.model?.currentAnchor?.vid ??
        '';
    String image = widget.playerController.toolPanel?.anchorSelectorFull
            ?.model?.currentAnchor?.headImg ??
        '';

//    bool isCollect =
//        service.hasCollected(service.getCurrentMatchUserWatching());
    return Center(
      child: Row(
        children: <Widget>[
          createButton(
              hasCollected
                  ? baseLang['detail']['okCollect']
                  : baseLang['detail']['noCollect'],
              'collect',
              hasCollected,
              AiSvgPicture.asset(
                "assets/images/${hasCollected ? "collected" : "uncollect"}.svg",
                width: imgWidth,
              )),
          string(anchorId).isNotEmpty &&
                  (widget.playerController.toolPanel?.anchorSelectorFull
                          ?.model?.currentAnchor?.liveVideoType ==
                      LiveVideoType.Anchor)
              ? createButton(config.langMap['baseLang']['anchor']['anchorPage'],
                  'anchor',
                  true,
                  Container(
                    width: imgWidth,
                    height: imgWidth,
                    child: AiImage.fromUrl(image,
                        "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png"),
                  ), onPress: () async {
//                  var param = await showMaterialPageRoute(
//                      context,
//                      AnchorHomePage(
//                        anchorId: anchorId,
//                        fromPage: 'detailPage',
//                      ));
//                  AiRouter.pop(context);
//                  if (param is DetailParams) {
//                    Event.eventBus.fire(param);
//                  }
                })
              : Container(),
//          createButton(
//              isCollect ? '${config.langMap['baseLang']['widgets']['overlay']['desc']['cancel']}' : '${config.langMap['baseLang']['widgets']['overlay']['desc']['addCollect']}',
//              'floatWindow',
//              !isCollect,
//              AiSvgPicture.asset(
//                "assets/images/detail/${isCollect ? "icon_win_x_black.svg" : "icon_win_black.svg"}",
//                width: imgWidth,
//              ), onPress: () {
//            if (isCollect) {
//              service.cancelCollectMatch(service.getCurrentMatchUserWatching());
//            } else {
////              if (service.isCollectionCacheFull()) {
////                TextAlert.of(context).showAlert(message: '${config.langMap['baseLang']['widgets']['overlay']['fullHint']}');
////                return;
////              }
//              service.collectMatch(service.getCurrentMatchUserWatching());
//            }
//            service.notifyFresh();
//            setState(() {});
//          }),
        ],
      ),
    );
  }

  String get showType {
    return model.extendModel?.data?.showType;
  }

  bool get hasCollected {
    return config.userInfo.hasFollowGame(model.gidm);
  }

  bool get hasVideo {
    return widget.playerController.hasVideLive;
  }

  bool get hasAnimateLive {
    String animateLiveUrl = model.extendModel?.data?.animateLiveUrl;
    return !isStrNullOrEmpty(animateLiveUrl);
  }

  Widget createMatchViewLine() {
    var items = <Widget>[];
    print(model.extendModel);
    bool hasVideoFlag = hasVideo;
    bool hasAnimateLiveFlag = hasAnimateLive;

    // live  1表示没有直播，2表示有直播，3有直播+主播
    // live_status 直播状态：1:未开始，2:直播中，3:已结束，4:已停播
    // anchor_live 1:有主播直播；2：没有主播直播
    // video_live 1:有高清直播，2：没有高清直播

    if (ModuleSwitch.getInstance().videoAndAnchor()) {
      items.add(createButton(
          baseLang['detail']['videoLive'],
          'video',
          hasVideoFlag,
          AiSvgPicture.asset(
            "assets/images/detail/icon_detail_live_${hasVideoFlag ? "yellow" : "gray"}.svg",
            width: imgWidth,
          )));
    }

    if (ModuleSwitch.getInstance().animationLive()) {
      items.add(createButton(
          baseLang['detail']['animationLive'],
          'animation',
          hasAnimateLiveFlag,
          AiSvgPicture.asset(
            "assets/images/detail/icon_detail_animation_${hasAnimateLiveFlag ? "yellow" : "gray"}.svg",
            width: imgWidth,
          )));
    }

    items.add(createButton(
        baseLang['detail']['scoreBlack'],
        'default',
        true,
        AiSvgPicture.asset(
          "assets/images/detail/icon_detail_score_yellow.svg",
          width: imgWidth,
        )));
    return Center(
      child: Row(
        children: items,
      ),
    );
  }

  Widget createSplitLine() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                height: 1, width: double.infinity, color: Colors.black12)),
        Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Text(baseLang['detail']['viewChange'],
              style: AiTextStyle(
                fontSize: 10,
                color: Colors.black,
              )),
        ),
        Expanded(
            flex: 1,
            child: Container(
                height: 1, width: double.infinity, color: Colors.black12)),
      ],
    );
  }

  Widget createCancelLine() {
    return InkWell(
      onTap: onCancelTap,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          baseLang['page']['close'],
          style: AiTextStyle(
              fontFamily: config.skin.fontFimaly.pingFang, fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  onItemTap(String type) {
    model.userConfirmed = true;
    model.selectItem = type;
    if ("collect" == type) {
      collected();
      return;
    }
    if (model.selectItem == 'video' && showType != 'RB') {
      Fluttertoast.showToast(msg: baseLang['detail']['waitMatch']);
      return;
    }
    if ("video" == type) {
      BarrageManager.get().show();
    } else if ("animation" == type) {
      Event.eventBus.fire(WifiEvent(AiFluxMode.ArrowMobile));
      BarrageManager.get().close();
      BarrageManager.get().clear();
    }
    AiRouter.pop(context);
    if (widget.onConfirmChoosed != null) {
      widget.onConfirmChoosed(model);
    }
  }

  onCancelTap() {
    AiRouter.pop(context);
  }

  //收藏操作
  void collected() {
    List collectList = config?.userInfo?.followGames ?? [];
    if (!hasCollected) {
      if (collectList.length >= 10) {
        showToas(baseLang['detail']['collectUpperLimit']);
        return;
      }
    }

    LoadingDialog loadingDialog = LoadingDialog.create(
      baseLang['message']['loadWaiting'],
      onForceClose: () async {},
    );

    loadingDialog.show(context);
    Future(() async {
      var rsp = await CollectGameReqProtocol(
              gidm: model.gidm,
              option: hasCollected
                  ? CollectedOption.cancel
                  : CollectedOption.collected)
          .request();
      loadingDialog.dismiss();
      if (200 == rsp.code) {
        if (hasCollected) {
          // config.userInfo.account.data.followGames.remove(model.gidm);
          config?.userInfo?.followGames?.remove(model.gidm);
          CollectGameEvent collectGameEvent = CollectGameEvent();
          Event.eventBus.fire(collectGameEvent);
        } else {
          // config.userInfo.account.data.followGames.add(model.gidm);
          config?.userInfo?.followGames?.add(model.gidm);
        }
        if (mounted) {
          setState(() {});
        }
        // 更新收藏比赛id
//        collectList = config?.userInfo?.followGames ?? [];
//        CollectListReqProtocol req = CollectListReqProtocol();
//        if (collectList.length >= 7) {
//          var rsp = await req.request();
//          FollowMatchModel().fromCollectListReqProtocolUpdate(rsp);
//        }
      } else {
        Flushbar(
          title: baseLang['message']['title'],
          message: baseLang['message']['netErrorAgin'],
          duration: Duration(seconds: 2),
        ).show(context);
      }
    });
  }
}

bool get isCollectedMatchFloatWindowOpen {
  return AiCache.get().getBool('collected_match_float_window_open') ?? true;
}

set isCollectedMatchFloatWindowOpen(bool value) {
//  new MatchCollectionInfoService().notifyFresh();
  AiCache.get().setBool('collected_match_float_window_open', value);
}

//浮窗操作窗口
//class FloatWindowOperator extends StatefulWidget {
//  @override
//  _FloatWindowOperatorState createState() => _FloatWindowOperatorState();
//}
//
//class _FloatWindowOperatorState extends State<FloatWindowOperator> {
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      color: Colors.transparent,
//      child: Center(
//        child: Container(
//          width: 113,
//          height: 118,
//          margin: EdgeInsets.only(bottom: 150),
//          color: Colors.white,
//          child: UiHelper.circularRectangleContainer(
//              color: const Color(0xFFF0F1F4),
//              borderRadius: BorderRadius.circular(0),
//              child: Center(
//                child: Container(
//                    width: 48,
//                    height: 48,
//                    child: UiHelper.circularRectangleContainer(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.circular(10),
//                      child: Icon(Icons.add_circle, )
//                    )),
//              )),
//        ),
//      ),
//    );
//  }
//}
