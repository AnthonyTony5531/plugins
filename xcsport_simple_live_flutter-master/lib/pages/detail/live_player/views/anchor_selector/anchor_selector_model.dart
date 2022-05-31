import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';

class AnchorSelectorModel {
  List<LiveVideoInfo> _anchors = [];
  AnchorSelectorModel() {
    // anchors.add(LiveVideoInfo(playerId : "1", headImg: "xxx.png",nickName: "球哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "2", headImg: "xxx.png",nickName: "鸡哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "3", headImg: "xxx.png",nickName: "老哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "4", headImg: "xxx.png",nickName: "XX哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "5", headImg: "xxx.png",nickName: "BB球哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "6", headImg: "xxx.png",nickName: "BB球哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "7", headImg: "xxx.png",nickName: "BB球哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "8", headImg: "xxx.png",nickName: "BB球哥解说"));
    // anchors.add(LiveVideoInfo(playerId : "9", headImg: "xxx.png",nickName: "BB球哥解说"));

    // currentAnchor = anchors.first;
  }

  LiveVideoInfo _currentAnchor;
  set currentAnchor(LiveVideoInfo value) {
    _currentAnchor = value;
  }

  LiveVideoInfo get currentAnchor {
    _updateCurrentAnchor();
    return _currentAnchor;
  }

  final int pageSize = 6;
  int get pageCount {
    if (anchors.length % pageSize == 0) return anchors.length ~/ pageSize;
    return anchors.length ~/ pageSize + 1;
  }

  List<LiveVideoInfo> getAnchors(int page) {
    return anchors.skip(page * pageSize).take(pageSize).toList();
  }

  List<LiveVideoInfo> get anchors {
    return _anchors;
  }

  set anchors(List<LiveVideoInfo> value) {
    if (value == null)
      _anchors = [];
    else
      _anchors = value;
    _updateCurrentAnchor();
  }

  String defaultAnchorId = "";

  _updateCurrentAnchor() {
    if (_currentAnchor == null && anchors.length > 0) {
      _currentAnchor = anchors.first;
      if (!isNullOrEmpty(defaultAnchorId)) {
        var idx = anchors.indexWhere((f) => f.vid == defaultAnchorId);
        if (idx != -1) {
          _currentAnchor = anchors[idx];
        }
      }
    } else if (anchors.length == 0) {
      _currentAnchor = null;
    }
  }

  void setFreeCurrentAnchor(){
    if(anchors.length > 0){
      _currentAnchor = anchors.first;
    }
  }
}

class LiveVideoInfo {
  bool isSelectAnchorLive = false;
  final String headImg;
  String nickName;
  final String vid; // 主播Id

  String weburl;
  String flv;
  final String live;
  final String rtmp;
  String m3u8;
  final LiveVideoType liveVideoType;
  LiveType liveType;
  int watchTotal;
  LiveVideoInfo(
      {this.vid,
      this.headImg = "",
      this.nickName = "",
      this.weburl = "",
      this.flv = "",
      this.live = "",
      this.rtmp = "",
      this.m3u8 = "",
      this.watchTotal = 0,
      this.liveVideoType = LiveVideoType.Anchor,
      this.liveType = LiveType.Live});

  bool equal(LiveVideoInfo other) {
    if (null == other) return false;
    if (this == other) return true;
    if (!(other is LiveVideoInfo)) {
      return false;
    }
    LiveVideoInfo temp = other as LiveVideoInfo;

    if (isNotEmpty(temp.vid) || isNotEmpty(vid)) {
      return temp.vid == vid;
    }

    return headImg == other.headImg &&
        nickName == other.nickName &&
        weburl == other.weburl &&
        flv == other.flv &&
        live == other.flv &&
        m3u8 == other.m3u8 &&
        rtmp == other.rtmp &&
        liveVideoType == liveVideoType;
  }
}

enum VideoStreamType { flv, live, m3u8, rtmp, web }

enum LiveVideoType { Live, Anchor }

enum LiveType {
  Live, // 平台视频
  MerchantLive, // 商户视频
}
