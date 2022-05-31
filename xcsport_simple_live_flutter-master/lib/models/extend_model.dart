import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

//详情扩展
class ExtendModel extends BaseModel {
  ExtendModel();
  _ExtendModel data;

  ExtendModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = map['data'] == null ? null : _ExtendModel.fromMap(map['data']);
  }

  List<LiveVideoInfo> getAnchorList(DetailParams detailParams, bool isFreeAnchor) {
    var baseLang = config.langMap['baseLang'];

    //视频直播
    List<VideoLive> videoLives = data?.videoLives ?? [];
    var streamNaLive = data?.streamNa?.liveVideoInfo ?? [];

    List<LiveVideoInfo> anchors = [];
    int index = 1;
    if(isFreeAnchor) {
      var list = videoLives.where((element) => element.anchorId == detailParams.anchorId);
      if(list != null && list.isNotEmpty){
        final  f = list.first;
        anchors.add(LiveVideoInfo(
          headImg: f.icon ?? "",
          nickName: string(f.name, defaultVal: string(f.nickname)),
          vid: f.anchorId,
          weburl: f.url,
          m3u8: f.m3u8,
          live: "",
          flv: f.flv,
          rtmp: "",
          liveType: f.liveType,
        ));
      }
    }
    else {
      if (PlayPriority.anchor == detailParams.playPriority && !config.isDeleteInternationalAppointModule) {
        videoLives.forEach((f) {
          anchors.add(LiveVideoInfo(
            headImg: f.icon ?? "",
            nickName: string(f.name, defaultVal: string(f.nickname)),
            vid: f.anchorId,
            weburl: f.url,
            m3u8: f.m3u8,
            live: "",
            flv: f.flv,
            rtmp: "",
            liveType: f.liveType,
          ));
        });
        if(!isFreeAnchor){
          streamNaLive.forEach((f) {
            f.nickName = "${baseLang['detail']['live']}${index++}";
            anchors.add(f);
          });
        }
      } else {
        streamNaLive.forEach((f) {
          // 国际版屏蔽主播
          if(f.liveVideoType == LiveVideoType.Anchor && config.isDeleteInternationalAppointModule){
            return;
          }
          f.nickName = "${baseLang['detail']['live']}${index++}";
          anchors.add(f);
        });

        videoLives.forEach((f) {
          // 国际版屏蔽主播
          String anchorId = f.anchorId ?? '';
          if(anchorId.isNotEmpty && config.isDeleteInternationalAppointModule){
            return;
          }
          anchors.add(LiveVideoInfo(
            headImg: f.icon ?? "",
            nickName: string(f.name, defaultVal: string(f.nickname)),
            vid: f.anchorId,
            weburl: f.url,
            m3u8: f.m3u8,
            live: "",
            flv: f.flv,
            rtmp: "",
            liveType: f.liveType,
          ));
        });
      }

      Map<String, dynamic> liveParams = detailParams?.liveParams ?? {};
      LiveVideoInfo liveVideoInfo;
      try {
        print("liveParams :$liveParams");
        String flv = liveParams['flv'];
        String m3u8 = liveParams['m3u8'];
        String rtmp = liveParams['rtmp'];
        String url = liveParams['url'];

        liveVideoInfo = anchors.firstWhere((f) {
          if (flv == f.flv ||
              m3u8 == f.m3u8 ||
              rtmp == f.rtmp ||
              url == f.weburl ||
              (flv == null && m3u8 == null && rtmp == null && f.liveType == LiveType.MerchantLive)) {
            return true;
          }
          return false;
        });
      } catch (e) {}
      if (null != liveVideoInfo) {
        List<LiveVideoInfo> infos = [];
        infos.add(liveVideoInfo);
        anchors.forEach((f) {
          if (liveVideoInfo != f) {
            infos.add(f);
          }
        });
        anchors = infos;
      }
    }

    return anchors;
  }


}

class _ExtendModel {
  dynamic animateLiveUrl,
      animationLive,
      anchorLive,
      chatRoomId,
      connectGameId,
      dataAnalysisUrl,
      isSupport,
      live,
      liveStatus,
      running,
      showType,
      stream,
      supportRate,
      videoLive,
      anchorId,
      merchantAnchorId,
      videoUrl,
      merchantVideoUrl,
      wordImageLiveUrl,
      watchTotal;
  StreamNa streamNa;
  List<VideoLive> videoLives; // 平台和商户主播
  List<VideoLive> merchantVideoLives; // 商户主播
  List<_GameLive> gameLives;
  List<UnAnchorLive> unAnchorLiveList; //今日，早盘的主播信息
  _ExtendModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.animateLiveUrl = map['animateLiveUrl'];
    this.animationLive = map['animation_live'];
    this.anchorLive = map['anchorLive'];
    this.chatRoomId = map['chatRoomId'];
    this.connectGameId = map['connectGameId'];
    this.dataAnalysisUrl = map['dataAnalysisUrl'];
    this.isSupport = map['isSupport'] ?? false;
    this.live = map['live'];
    this.liveStatus = map['live_status'];
    this.running = map['running'];
    this.showType = map['showType'];
    this.stream = map['stream'];
    this.anchorId = AiJson(map).getString('anchorId');
    this.merchantAnchorId = AiJson(map).getString('merchantAnchorId');
    this.videoUrl = AiJson(map).getString('videoUrl');
    this.merchantVideoUrl = AiJson(map).getString('merchantVideoUrl');

    this.streamNa =
        map['streamNa'] != null ? StreamNa.fromMap(map['streamNa']) : null;
    // 商户视频
    List merchantStream = AiJson(map).getArray('merchantStreamNa');
    if (merchantStream.isNotEmpty) {
      merchantStream.forEach((value) {
        this.streamNa.addLiveInfo(value, liveType: LiveType.MerchantLive);
      });
    }

    this.supportRate = map['supportRate'];
    this.videoLive = map['videoLive'];
    this.watchTotal = map['watchTotal']; //视赛事观看数量
    this.videoLives = map['videoLives'] != null
        ? map['videoLives'].map<VideoLive>((v) => VideoLive.fromMap(v)).toList()
        : [];
    this.unAnchorLiveList = map['unAnchorLiveList'] != null
        ? map['unAnchorLiveList']
            .map<UnAnchorLive>((v) => UnAnchorLive.fromMap(v))
            .toList()
        : [];
    // 商户主播
    List merchantAnchors = AiJson(map).getArray('merchantAnchor');
    this.merchantVideoLives = [];
    if (merchantAnchors.isNotEmpty) {
      merchantAnchors.forEach((value) {
        VideoLive videoLive = VideoLive.fromMerchantMap(value);
        this.merchantVideoLives.add(videoLive);
      });
      if (this.videoLives.length > 0) {
        this.videoLives.insertAll(0, this.merchantVideoLives);
      } else {
        this.videoLives.addAll(this.merchantVideoLives);
      }
    }

    if (isNotEmpty(videoLives)) {
      videoLives.removeWhere((e) => !e.status);
    }

    this.wordImageLiveUrl = map['wordImageLiveUrl'];
    this.gameLives = map['gameLives'] == null
        ? null
        : map['gameLives'].map<_GameLive>((v) => _GameLive.fromMap(v)).toList();
  }
}

class StreamNa {
  final List<LiveVideoInfo> liveVideoInfo = [];
  StreamNa.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    addLiveInfo(map["videoLive"]);
    addLiveInfo(map["live"]);
    addLiveInfo(map["liveali"]);
    addLiveInfo(map["stream"]);
    addLiveInfo(map["streamNa"]);
  }

  void addLiveInfo(Map<String, dynamic> map,
      {LiveType liveType = LiveType.Live}) {
    var info = liveVideoInfofromMap(map, liveType: liveType);
    if (null != info) {
      liveVideoInfo.add(info);
    }
  }

  LiveVideoInfo liveVideoInfofromMap(Map<String, dynamic> map,
      {LiveType liveType = LiveType.Live}) {
    if (null == map) return null;
    var status = map['status'];
    if (status ?? false) {
      return LiveVideoInfo(
          flv: map['flv'],
          live: map['flv'],
          m3u8: map['m3u8'],
          rtmp: map['rtmp'],
          weburl: map['url'],
          watchTotal: map['watchTotal'],
          liveVideoType: LiveVideoType.Live,
          liveType: liveType);
    }
    return null;
  }
}

class StreamNaLive {
  dynamic flv, live, m3u8, rtmp, status, vid;
  StreamNaLive.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.status = map['status'];
    if (status ?? false) {
      this.flv = map['flv'];
      this.live = map['live'];
      this.m3u8 = map['m3u8'];
      this.rtmp = map['rtmp'];
      this.vid = map['vid'];
    }
  }
}

class StreamNaStream {
  dynamic flv, m3u8, rtmp, status;
  StreamNaStream.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.status = map['status'];
    if (status ?? false) {
      this.flv = map['flv'];
      this.m3u8 = map['m3u8'];
      this.rtmp = map['rtmp'];
    }
  }
}

class VideoLive {
  dynamic anchorId,
      url,
      flv,
      m3u8,
      anchorStatus,
      endTime,
      icon,
      info,
      name,
      nickname,
      roomNum,
      startTime,
      sex,
      reserveTotal,
      status;       // true:视频可播，false:视频不可播
  int watchTotal;
  LiveType liveType = LiveType.Live;
  VideoLive.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.status = map['status']; //是否开播 true，false
    if (status ?? false) {
      this.anchorId = map['anchorId'];
      this.endTime =  new AiJson(map).getTimestamp('startTime');
      this.icon = map['icon'];
      this.info = map['info'];
      this.name = map['name'];
      this.nickname = map['nickname'];
      this.roomNum = map['roomNum'];
      this.startTime = new AiJson(map).getTimestamp('startTime');
      this.url = map['url'];
      this.flv = map['flv'];
      this.m3u8 = map['m3u8'];
      this.anchorStatus = map['anchorStatus']; //直播状态1：开播，2：停播
      this.liveType = LiveType.Live;
      this.watchTotal = map['watchTotal'] ?? 0;
    }
  }

  // 商户主播信息
  VideoLive.fromMerchantMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.status = AiJson(map).getBool('status'); //是否开播 true，false
    if (status ?? false) {
      this.anchorId = AiJson(map).getString('anchorId');
      this.name = AiJson(map).getString('anchorName');
      if (isEmpty(this.name)) this.name = AiJson(map).getString('name');
      this.nickname = AiJson(map).getString('nickName');
      this.icon = AiJson(map).getString('icon');
//      this.url = AiJson(map).getString('anchorUrl');
      this.startTime = AiJson(map).getTimestamp('createDate');
      this.watchTotal = AiJson(map).getNum('watchTotal');
      this.flv = AiJson(map).getString('flv');
      this.m3u8 = AiJson(map).getString('m3u8');
      this.sex = AiJson(map).getString('sex');
      this.reserveTotal = AiJson(map).getNum('reserveTotal');
      this.liveType = LiveType.MerchantLive;
    }
  }
}

class UnAnchorLive {
  dynamic anchorId, icon, name, nickname, cover;

  UnAnchorLive.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.anchorId = map['anchorId'];
    this.icon = map['icon'];
    this.cover = map['cover'];
    this.name = map['name'];
    this.nickname = map['nickname'];
  }
}

class _GameLive {
  dynamic fromName, url;
  _GameLive.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.fromName = map['fromName'];
    this.url = map['url'];
  }
}
