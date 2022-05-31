
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-22
 * 说明：比赛走地状态图标
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LiveViewModel {

  LiveViewModel({
    this.isShowDynamic : true,
    this.live = "",
    this.animationLive = "",
    this.running = "",
    this.showType = "",
    this.anchorLogo = ""
  });

  LiveViewModel fromCollectListReqProtocol(Map<String,dynamic> rawGame){
    live = AiJson(rawGame).getString("live");
    animationLive = AiJson(rawGame).getString("animation_live");
    running = AiJson(rawGame).getString("running");
    showType = AiJson(rawGame).getString("showtype");
    getAnchorInfo(rawGame);
//    var anchors = AiJson(rawGame).getArray("anchor");
//    var merchantAnchors = AiJson(rawGame).getArray('merchantAnchor');
//    if(merchantAnchors.isNotEmpty){
//      anchorLogo = AiJson(rawGame).getString("merchantAnchor.[0].icon");
//      // 商户主播
//      anchorLogos = merchantAnchors.map((f)=>
//        AnchorLogo(
//          icon: AiJson(f).getString("icon"),
//          anchorId: AiJson(f).getString("anchorId"),
//        )
//      ).toList();
//    }
//    else{
//      // 平台主播
//      anchorLogo = AiJson(rawGame).getString("anchor.[0].icon");
//      anchorLogos = anchors.map((f)=>
//        AnchorLogo(
//          icon: AiJson(f).getString("icon"),
//          anchorId: AiJson(f).getString("anchorId"),
//        )
//      ).toList();
//    }
    return this;
  }

  LiveViewModel fromCommonMatchsProtocolWithGame(Map<String,dynamic> rawGame){
    live = AiJson(rawGame).getString("live");
    animationLive = AiJson(rawGame).getString("animation_live");
    running = AiJson(rawGame).getString("running");
    showType = AiJson(rawGame).getString("showtype");
//    anchorLogo = AiJson(rawGame).getString("anchor_icon");
    getAnchorInfo(rawGame);
    return this;
  }

  LiveViewModel fromLeagueRound(Map<String,dynamic> rawGame){
    live = AiJson(rawGame).getString("live");
    animationLive = AiJson(rawGame).getString("animation_live");
    running = AiJson(rawGame).getString("running");
    showType = AiJson(rawGame).getString("showtype");
    getAnchorInfo(rawGame);
//    anchorLogo = AiJson(rawGame).getString("anchor_icon");
//    var anchors = AiJson(rawGame).getArray("anchor");
//    var merchantAnchors = AiJson(rawGame).getArray('merchantAnchor');
//    if(merchantAnchors.isNotEmpty){
//      // 商户主播
//      anchorLogo = AiJson(rawGame).getString("merchantAnchor.[0].icon");
//      anchorLogos = merchantAnchors.map((f)=>
//        AnchorLogo(
//          icon: AiJson(f).getString("icon"),
//          anchorId: AiJson(f).getString("anchorId"),
//        )
//      ).toList();
//    }
//    else{
//      // 平台主播
//      anchorLogos = anchors.map((f)=>
//        AnchorLogo(
//          icon: AiJson(f).getString("icon"),
//          anchorId: AiJson(f).getString("anchorId"),
//        )
//      ).toList();
//    }
    return this;
  }

  void getAnchorInfo(Map<String,dynamic> rawGame){

    var anchors = AiJson(rawGame).getArray("anchor");
    var merchantAnchors = AiJson(rawGame).getArray('merchantAnchor');
    if(merchantAnchors.isNotEmpty){
      // 商户主播
      anchorLogo = AiJson(rawGame).getString("merchantAnchor.[0].icon");
      anchorLogos = merchantAnchors.map((f)=>
          AnchorLogo(
            icon: AiJson(f).getString("icon"),
            anchorId: AiJson(f).getString("anchorId"),
          )
      ).toList();
    }
    else {
      // 平台主播
      anchorLogo = '';
      List anchors = AiJson(rawGame).getArray('anchor');
      if (anchors.isNotEmpty) {
        // 本商户主播
        anchors.forEach((value) {
          String tagsMerchantId = AiJson(value).getString('tagsMerchantId');
          if (tagsMerchantId.isNotEmpty && tagsMerchantId ==
              (config?.userInfo?.account?.data?.merchantId ?? '')) {
            anchorLogo = AiJson(value).getString("icon");
          }
        });
        // 平台主播
        if (anchorLogo.isEmpty) {
          for (var value in anchors) {
            String tagsMerchantId = AiJson(value).getString('tagsMerchantId');
            if (tagsMerchantId.isEmpty) {
              anchorLogo = AiJson(value).getString("icon");
              break;
            }
          }
        }
      }
      if (anchorLogo.isEmpty) {
        anchorLogo = AiJson(rawGame).getString("anchor_icon");
      }
      anchorLogos = anchors.map((f) =>
          AnchorLogo(
            icon: AiJson(f).getString("icon"),
            anchorId: AiJson(f).getString("anchorId"),
          )
      ).toList();
    }
  }

  // /是否显示动态图
  bool isShowDynamic;

  //-----------------比赛数据-------------------
  //视频直播标示
  String live;
  //动画直播标示
  String animationLive;
  //是否开走地
  String running;
  //滚球,今日，早餐标示
  String showType;
  //主播头像
  String anchorLogo;
  List<AnchorLogo> anchorLogos = List<AnchorLogo>();

  //-----------------计算属性-------------------
  bool get hasVideo{
    if (live == "2" || live == "4") {
      return true;
    } else { 
      return false; 
    }
  }
  bool get hasAnchor{
    if (live == "3" || live == "4") {
      return true;
    } else { 
      return false;
    }
  }
  bool get hasAnimation{
    if (animationLive == null) 
      return false;
    if (animationLive == "1") {
      return true;
    } else {
      return false;
    }
  }
  bool get hasLive{
    if(running == "Y")
      return true;
    else
      return false;
  }

  // 仅有主播
  bool isOnlyAnchorLive(){
    return live == '3';
  }

  LiveType get liveType{
    // live_status  直播状态：1:未开始，2:直播中，3:已结束，4:已停播
    // live  1表示没有直播，2表示有直播，3有主播直播，4有高清直播+主播直播',
    if (showType != 'RB') {
      if (hasAnchor) {
        return LiveType.anchor;
      }else if (hasVideo) {
        return LiveType.video;
      } else if (hasAnimation) {
        return LiveType.amishow;
      } else if (hasLive) {
        return LiveType.live;
      }
    } else {
      if (hasAnchor) {
        return LiveType.anchorColor;
      }else if (hasVideo) {
        return LiveType.videoColor;
      } else if (hasAnimation) {
        return LiveType.amishowColor;
      } else if (hasLive) {
        return LiveType.liveColor;
      }
    }
    return LiveType.nodisplay;
  }
}

enum LiveType{
  video,
  amishow,
  live,
  anchor,
  videoColor,
  amishowColor,
  liveColor,
  anchorColor,
  nodisplay
}

class AnchorLogo {
  final String icon;
  final String anchorId;
  AnchorLogo({this.icon, this.anchorId});
}
