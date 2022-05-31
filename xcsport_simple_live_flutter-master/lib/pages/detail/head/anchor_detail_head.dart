import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
//import 'package:fast_ai/pages/anchor/anchor_match/anchor_match_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
//import 'package:fast_ai/pages/member/personal/personal_page.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnchorDetailHead extends StatefulWidget {
  AnchorDetailHead(
      {Key key, this.detailParams, this.topOffset, this.extendModel})
      : super(key: key);
  final DetailParams detailParams;
  final ExtendModel extendModel;
  final double topOffset;

  @override
  _AnchorDetailHeadState createState() => _AnchorDetailHeadState();
}

class _AnchorDetailHeadState extends State<AnchorDetailHead> {
  DetailParams detailParams;
  double get topOffset =>
      widget?.topOffset ?? AiMeasure.topOffset(context) + 50;
  bool isReverseAnchor = false;
  bool isReserve = false;
//  AnchorMatchModel model = AnchorMatchModel();
  double anchorReserveW = 80.0;
  String reserve = '';
  String reserveLive = '';
  @override
  void initState() {
    super.initState();
    reserve = config.langMap['baseLang']['anchor']['reserve'];
    reserveLive = config.langMap['baseLang']['anchor']['reserveLive'];
    detailParams = widget?.detailParams ?? DetailParams();
    //获取非滚球时的主播信息
    if (widget.extendModel != null &&
        widget.extendModel?.data?.showType != 'RB' &&
        !isEmpty(this.detailParams?.anchorId)) {
      if (widget.extendModel?.data?.unAnchorLiveList != null) {
        List<UnAnchorLive> unAnchorLiveList =
            widget.extendModel.data.unAnchorLiveList.where((item) {
          return item.anchorId == this.detailParams.anchorId;
        }).toList();
        if (unAnchorLiveList.length > 0) {
          UnAnchorLive anchorInfo = unAnchorLiveList[0];

          if (!isEmpty(anchorInfo.cover)) {
            detailParams.anchorCover = anchorInfo.cover;
          } else if (isEmpty(detailParams.anchorCover)) {
            String mapCover =
                config.userInfo.anchorDefaultIconMap[anchorInfo.anchorId];
            if (mapCover != null) {
              detailParams.anchorCover = mapCover;
            } else {
              detailParams.anchorCover = anchorInfo.icon;
            }
          }

          detailParams.anchorIcon = anchorInfo.icon;
          detailParams.anchorName = anchorInfo.name;
        }
      }
    } else {
      detailParams.anchorIcon =
          string(detailParams.anchorIcon, defaultVal: detailParams.anchorCover);
    }
    isReserve = detailParams?.isReserve == '1';
    measureTextWidth();
  }

  void measureTextWidth() {
    double reserveW = AiMeasure.measureTextWidth(reserve, titleStyle());
    double reserveLiveW = AiMeasure.measureTextWidth(reserveLive, titleStyle());
    anchorReserveW = isReserve ? reserveW : reserveLiveW;
  }

  // Future getAnchorInfo() async {
  //   if (isEmpty(this.detailParams.anchorName) ||
  //       isEmpty(this.detailParams.anchorIcon) ||
  //       isEmpty(this.detailParams.anchorCover)) {
  //     // 从宿主App直接进来
  //     var anchorModel = await AnchorDynamicListReqProtocol(
  //             anchorId: widget.detailParams.anchorId)
  //         .request();
  //     widget.detailParams.anchorName = anchorModel.name;
  //     widget.detailParams.anchorCover = anchorModel.mobileCover;
  //     if (mounted) setState(() {});

  //     if (isNotEmpty(anchorModel.playerId)) {
  //       PlayInfo playInfo = await Net.mobilePlayerInfo(anchorModel.playerId);
  //       widget.detailParams.anchorIcon = playInfo.data.headImg.toString();
  //       if (mounted) setState(() {});
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String anchorId = detailParams?.anchorId ?? '';
    String name = detailParams?.anchorName ?? '';
    num liveStatus = detailParams.liveStatus;
    bool isFreeAnchorNoStart = (detailParams.isFreeAnchor && liveStatus != null && liveStatus == 0);
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: AiImage.fromUrl(
                    detailParams.anchorCover,
                    config.userInfo.anchorDefaultIconMap[anchorId],
                    BoxFit.cover),
              )),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
                opacity: 0.7,
                child: Container(
                    decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black,
                    Color(0xFF101119),
                  ]),
                ))),
          ),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        var params = {
                          "anchorId": detailParams.anchorId,
                          "playerName": detailParams.anchorName,
                          'anchorIcon': detailParams.anchorIcon,
                          "isAnchor": true,
                        };
//                        showMaterialPageRoute(
//                                context, PersonalPage(params: params))
//                            .then((value) {
//                          List followPlayerIds = config
//                                  ?.userInfo?.account?.data?.followPlayerIds ??
//                              [];
//                        });
//                      showSystemDefaultMaterialPageRoute(context, AnchorHomePage(anchorId: detailParams?.anchorId));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(colors: [
                            Color(0xFFCF556F),
                            Color(0xFFAA51BC),
                            Color(0xFF6D44DC),
                          ]),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          child: AiImage.rankingUserLogo(
                              detailParams.anchorIcon,
                              size: 58,
                              defaultLogo: config
                                  .userInfo.anchorDefaultIconMap[anchorId]),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Text(
                          isFreeAnchorNoStart ? '主播还未开播' : name,
                          style: nameStyle(),
                        )),
                    Show(
                      isShow: !detailParams.isFreeAnchor,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12.0),
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                border: Border.all(
                                    color: isReserve
                                        ? Colors.transparent
                                        : Theme.of(context).colorScheme.secondary,
                                    width: 1),
                                color: Color(0x1A5078FF),
                              ),
                              child: Text(
                                 isReserve ? reserve : reserveLive,
                                style: titleStyle(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          if (Hooks.ins.isBlocked(HookName.StartBookingLive, {})) return;
                          if (!widget.detailParams.allLoadFinished) {
                            return;
                          }
                          onReserveAnchor();
//                          ModuleStatistics.ins.statisticsEvent(
//                              StatisticsType.StatisticsDetailAppointmentGame);
                        },
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  TextStyle nameStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: config.customStyle.themeColor,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  // 预约直播
  void onReserveAnchor() async {
//    if (isReverseAnchor) {
//      return;
//    }
//    isReverseAnchor = true;
//    Future.delayed(Duration(milliseconds: 1000), () {
//      isReverseAnchor = false;
//    });
//    isReserve = !isReserve;
//    setReverseAnchor(isReserve);
//    if (mounted) {
//      setState(() {});
//    }
//    // 1：预约，2：取消预约
//    var rsp = await model.requestAnchorReserveFromServer(
//        isReserve ? '1' : '2', detailParams.anchorId, detailParams.gidm,
//        videoUrl: detailParams.anchorUrl,
//        videoType: (detailParams.anchorId.isNotEmpty ? 1 : 2).toString());
//    if (rsp.code == 200) {
//      showToas(isReserve
//          ? config.langMap['baseLang']['detail']['anchorReserveMessage']
//          : config.langMap['baseLang']['detail']['anchorCancelMessage']);
//      Event.eventBus.fire(AnchorReserveEvent());
//      if (mounted) {
//        setState(() {});
//      }
//    } else {
//      showToas(config.langMap['baseLang']['anchor']['reserveFailed']);
//      isReserve = !isReserve;
//      setReverseAnchor(isReserve);
//    }
//    if (mounted) {
//      setState(() {});
//    }
  }

  void setReverseAnchor(bool isReserve) {
    detailParams.isReserve = isReserve ? '1' : '2';
    measureTextWidth();
  }
}
