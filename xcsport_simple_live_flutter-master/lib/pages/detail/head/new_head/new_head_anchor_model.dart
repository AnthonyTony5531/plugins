/*
 * @Author: your name
 * @Date: 2020-08-31 21:46:48
 * @LastEditTime: 2020-09-01 17:03:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \xcsport-sdk-pcg:\project\xcsports-sdk-flutter\lib\pages\detail\head\new_head\AnchorSelectorModel.dart
 */
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/utils/util.dart';

class NewHeadAnchorModel {
  NewHeadAnchorModel(ExtendModel extendModel, String defaultAnchorId) {
    this.extendModel = extendModel;
    this.defaultAnchorId = defaultAnchorId;
  }
  ExtendModel extendModel;
  String defaultAnchorId = "";

  initData() {
    this.anchors = this.extendModel?.data?.videoLives;
  }

  List<VideoLive> _anchors = [];
  List<VideoLive> get anchors {
    return _anchors;
  }

  set anchors(List<VideoLive> value) {
    if (value == null)
      _anchors = [];
    else
      _anchors = value;
    _updateCurrentAnchor();
  }

  VideoLive _currentAnchor;
  set currentAnchor(VideoLive value) {
    _currentAnchor = value;
  }

  VideoLive get currentAnchor {
    _updateCurrentAnchor();
    return _currentAnchor;
  }

  _updateCurrentAnchor() {
    if (_currentAnchor == null && anchors.length > 0) {
      _currentAnchor = anchors.first;
      if (!isNullOrEmpty(defaultAnchorId)) {
        var idx = anchors.indexWhere((f) => f.anchorId == defaultAnchorId);
        if (idx != -1) {
          _currentAnchor = anchors[idx];
        }
      }
    } else if (anchors.length == 0) {
      _currentAnchor = null;
    }
  }

  bool get hasVideoLive {
    // live  1表示没有直播，2表示有直播，3有直播+主播
    // live_status 直播状态：1:未开始，2:直播中，3:已结束，4:已停播
    // anchor_live 1:有主播直播；2：没有主播直播
    // video_live 1:有高清直播，2：没有高清直播
    return this.extendModel?.data?.live != '1';
  }
  // 是否有动画直播
  bool get hasAnimateLive {
    String animateLiveUrl = this.extendModel?.data?.animateLiveUrl;
    return this.extendModel?.data?.animationLive == "1" && !isStrNullOrEmpty(animateLiveUrl);
  }
}
