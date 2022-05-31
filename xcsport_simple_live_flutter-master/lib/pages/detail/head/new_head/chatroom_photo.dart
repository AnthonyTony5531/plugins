import 'dart:async';
import 'dart:math';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatroomPhoto extends StatefulWidget {
  String systemId;
  String gidm;
  String anchorId;
  String roomNo;
  bool isFreeAnchor;
  CommonVideoPlayerController playerController;
  ExtendModel extendModel;
  num watchTotal;
  int livePopularity; // 自由播人气数
  bool isFreeLiveGameAnchor; // 游戏自由播正在播
  DetailSet detailSet;
  ChatroomPhoto(
      {Key key,
      this.systemId,
      this.gidm,
      this.extendModel,
      this.anchorId,
      this.roomNo,
      this.isFreeAnchor,
      this.watchTotal = 0,
      this.isFreeLiveGameAnchor = false,
      this.livePopularity = 0,
      this.detailSet,
      this.playerController})
      : super(key: key);

  @override
  _ChatroomPhotoState createState() => _ChatroomPhotoState();
}

class _ChatroomPhotoState extends State<ChatroomPhoto> {
  ExtendModel get extendModel {
    return widget.extendModel;
  }

  bool get _isFreeAnchor => widget.isFreeAnchor ?? false;

  List<Widget> userHeadList = [];
  List<List<Color>> colors = [];
  int persons = 0;

//  int _livePopularity = 0;

  Timer _autoRefreshTime;

  @override
  void initState() {
    super.initState();
//    persons = Random().nextInt(10000) + 5000;
    colors.add([Color(0xFFFADB1B), Color(0xFFC08A03)]);
    colors.add([Color(0xFFE1F8FB), Color(0xFF67D2D7)]);
    colors.add([Color(0xFFFED5C6), Color(0xFFFF7D6E)]);
    for (int index = 0; index < 3; index++) {
      int i = Random().nextInt(48);
      String headUrl = '/FE/common/head/' + '$i' + '_s_100x100.jpg';
      userHeadList.add(userPhotoWidget(headUrl, colors[index]));
    }
//    _livePopularity = widget.livePopularity ?? 0;
//    if (_isFreeAnchor) {
//      _startTimer();
//    }
  }

  int get livePopularity {
    int fans = widget.detailSet?.detailParams?.livePopularity;
    if(widget.detailSet?.detailParams?.freeLiveRoomInfo != null){
      fans = widget.detailSet?.detailParams?.freeLiveRoomInfo?.livePopularity;
    }
    if(fans == null){
      fans = widget.detailSet?.detailParams?.livePopularity;
    }
    return fans ?? 0;
  }

  @override
  void dispose() {
    _autoRefreshTime?.cancel();
    _autoRefreshTime = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChatroomPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.roomNo != oldWidget.roomNo) {
//      _livePopularity = widget.livePopularity ?? 0;
      if (_isFreeAnchor) {
//        _startTimer();
      } else {
        _autoRefreshTime?.cancel();
        _autoRefreshTime = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userChildrenWidget(),
    );
  }

  Widget userChildrenWidget() {
    getWatchTotal();
    String text = (persons ?? 0).toString();
    if (persons >= 10000) {
      text = (persons / 10000).toStringAsFixed(1) + 'w';
    }
    if (persons == 0) text = '';
    if (persons == 0 && widget.watchTotal > 0) {
      text = (widget.watchTotal ?? 0).toString();
    }
    // 自由播人气
    if (widget.isFreeAnchor) {
      text = livePopularity.toString();
      if (livePopularity >= 10000) {
        text = (livePopularity / 10000).toStringAsFixed(1) + 'w';
      }
    }

    double textWidth = AiMeasure.measureTextWidth(text, numTextStyle());
    double rightMargin = 3.0;
    double leftMargin = 8.0;
    double textContainerW = textWidth + rightMargin * 2 + leftMargin;
    double headW = 30.0;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (ModuleSwitch.getInstance().userContributionRank()) {
          showContribution();
        }
      },
      child: Container(
          width: textContainerW + 90.0 - 8.0,
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 11.0,
                right: 0,
                width: textContainerW,
                height: 26.0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 5, top: 2, right: rightMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    border: new Border.all(color: Color(0xFF5078FF), width: 1),
                  ),
                  child: Text(
                    text,
                    style: numTextStyle().copyWith(color: Color(0xFF5078FF)),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: textContainerW - 3,
                width: headW,
                height: headW,
                child: userHeadList[0],
              ),
              Positioned(
                top: 8.0,
                right: (textContainerW - 3) + (headW - 3),
                width: 30.0,
                height: 30.0,
                child: userHeadList[1],
              ),
              Positioned(
                top: 8.0,
                right: (textContainerW - 3) + (headW - 3) * 2,
                width: 30.0,
                height: 30.0,
                child: userHeadList[2],
              ),
            ],
          )),
    );
  }

  Widget userPhotoWidget(String headUrl, List<Color> colors) {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.5),
        ),
        child: AiImage.rankingUserLogo(headUrl, size: 29.0),
      ),
    );
  }

  TextStyle numTextStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
    );
  }

  /// 贡献榜
  void showContribution() {
    PopupShareService.ins.pause('_showContribution');
    showModalBottomSheetRoute(context,
            child: AnchorContribution(
              isFreeLiveGameAnchor: widget.isFreeLiveGameAnchor,
              gidm: widget.gidm,
              anchorId: widget.anchorId,
              roomNo: widget.roomNo,
              systemId: widget.systemId,
              isFreeAnchor: widget.isFreeAnchor,
            ),
            barrierColor: Colors.transparent)
        .then((v) {
      PopupShareService.ins.resume('_showContribution');
    });
  }

  void getWatchTotal() {
    // var weburl = widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor?.weburl ?? "";
    // var m3u8 = widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor?.m3u8 ?? "";
    // var flv = widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor?.flv ?? "";

//    String anchorId = widget.playerController?.toolPanel?.anchorSelectorFull
//        ?.model?.currentAnchor?.vid;
//    if (this.extendModel.data?.videoLives != null) {
//      if (anchorId != null) {
//        List<VideoLive> videoLives =
//            this.extendModel.data.videoLives.where((item) {
//          return item.anchorId == anchorId;
//        }).toList();
//        if (videoLives.length > 0) {
//          persons = videoLives[0].watchTotal ?? 0;
//        }
//      } else if (widget.playerController?.toolPanel?.anchorSelectorFull
//              ?.model?.anchors !=
//          null) {
//        persons = widget.playerController.toolPanel.anchorSelectorFull
//            .model.anchors[0].watchTotal ?? 0;
//      }
//    }
    LiveVideoInfo liveVideoInfo = widget.playerController.toolPanel
        .anchorSelectorFull.model.currentAnchor;
    var webUrl = liveVideoInfo?.weburl ?? "";
    var m3u8 = liveVideoInfo?.m3u8 ?? "";
    var flv = liveVideoInfo?.flv ?? "";
    var name = liveVideoInfo?.nickName ?? '';
    if (this.extendModel?.data?.videoLives != null) {
      print('');
      // 主播观看数量
      this.extendModel?.data?.videoLives?.forEach((value) {
        var valueM3u8 = value?.m3u8 ?? "";
        var valueFlv = value?.flv ?? "";
        var valueName = value?.name ?? '';
        if (isNotEmpty(valueM3u8) && isNotEmpty(m3u8) && valueM3u8 == m3u8 ||
            isNotEmpty(valueFlv) && isNotEmpty(flv) && valueFlv == flv ||
            isNotEmpty(valueName) && isNotEmpty(name) && valueName == name) {
          persons = value?.watchTotal ?? 0;
          print('主播观看数量----:$persons');
          return;
        }
      });
    }
    // 视频观看数量
    if (widget?.playerController?.toolPanel?.anchorSelectorFull?.model?.anchors != null) {
      print('');
      widget?.playerController?.toolPanel?.anchorSelectorFull?.model?.anchors?.forEach((value) {
        var valueWeburl = value?.weburl ?? "";
        var valueM3u8 = value?.m3u8 ?? "";
        var valueFlv = value?.flv ?? "";
        if ((isNotEmpty(valueM3u8) && isNotEmpty(m3u8) && valueM3u8 == m3u8 ||
                isNotEmpty(valueFlv) && isNotEmpty(flv) && valueFlv == flv ||
                isNotEmpty(valueWeburl) && isNotEmpty(webUrl) && valueWeburl == webUrl) &&
            value.liveVideoType == LiveVideoType.Live) {
          persons = value?.watchTotal ?? 0;
          print('视频观看数量----:$persons');
          return;
        }
      });
    }
  }

  void _startTimer() {
    _autoRefreshTime?.cancel();
    _autoRefreshTime = Timer.periodic(const Duration(seconds: 30), (timer) {
      _getFreeLiveFunCount();
    });
  }

  // 自由播 - 粉丝数
  Future<void> _getFreeLiveFunCount() async {
    final count = await Net.getChatroomPhotoFreeFunCount(liveId: widget.roomNo);
    if (count != 0) {
//      _livePopularity = count;
      setState(() {});
    }
  }
}
