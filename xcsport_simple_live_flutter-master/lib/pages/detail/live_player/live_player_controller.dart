/*
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_config.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bet/live_bet_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_history/live_history_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_hot_helper/live_hot_helper_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_match_station/live_match_station_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_more_league/live_more_league_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_more_menu/live_more_menu_controller.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';

import 'views/anchor_selector/anchor_selector_model.dart';
import 'views/live_bottombar/live_bottombar_model.dart';
import 'views/live_toolpanel/live_toolpanel_controller.dart';
import 'views/live_topbar/live_topbar_model.dart';
import 'views/video_player/video_player.dart';

class LivePlayerController {
  var baseLang = config.langMap['baseLang'];

  //虚拟关闭投注
  bool isVirtualMatchOver = false;

  //是否是虚拟
  bool isVirtual = false;
  ToolPanelController toolPanel = ToolPanelController(
      anchorSelectorModel: AnchorSelectorModel(),
      bottombarModel: LiveBottombarModel(),
      topbarModel: LiveTopbarModel());
  // TODO 废弃
  AiWebVideoPlayerController videoPlayer = AiWebVideoPlayerController();
  LivePlayerConfig cfg = LivePlayerConfig();

  var anyAction = VoidListener();

  var matchOverListener = MatchOverListener();

  LivePlayerController() {
    toolPanel.setPlayer(this);
    toolPanel.setLiveHistoryController(toolPanel.historyController);
    toolPanel.setHotExpression(toolPanel.liveHotHelperController);
    toolPanel.setLiveMatchStationController(toolPanel.matchStationController);
    toolPanel.setLiveMoreMenuController(toolPanel.moreMenuController);
    toolPanel.setLiveBetStateController(toolPanel.betStateController);
    toolPanel.setLiveMoreLeagueController(toolPanel.moreLeagueController);
    videoPlayer.setPlayer(this);
  }

  dispose() {
    // videoPlayer.dispose();
    toolPanel.setPlayer(null);
    videoPlayer.setPlayer(null);
  }

  String animateLiveUrl;

  bool get hasAnimateLive {
    return !isNullOrEmpty(animateLiveUrl);
  }

  bool get hasVideLive {
    return toolPanel.anchorSelectorFull.model.currentAnchor != null &&
        (toolPanel?.anchorSelectorFull?.model?.anchors?.length ?? 0) > 0;
  }

  static bool hasShowTips = false;

  void  shouldShowToastWhenMobileTryPlay() {
    bool isNotWifi = config.isConnectMobile;
    //LogCollectUtil.collect('isNotWifi $isNotWifi');
    // bool isOnlyWifi = cfg.fluxMode == AiFluxMode.OnlyWifi;
    //LogCollectUtil.collect('isOnlyWifi $isOnlyWifi');
    bool hasVideLive = this.hasVideLive;
    //LogCollectUtil.collect('hasVideLive $hasVideLive');
    if (!hasShowTips && hasVideLive && isNotWifi && config.isApp) {
      hasShowTips = true;
      showToas(config.langMap['baseLang']['flux_tips']);
    }
  }

    bool get needShowFluxWidget {
    bool isNotWifi = config.isConnectMobile;
    //LogCollectUtil.collect('isNotWifi $isNotWifi');
    bool isOnlyWifi = cfg.fluxMode == AiFluxMode.OnlyWifi;
    //LogCollectUtil.collect('isOnlyWifi $isOnlyWifi');
    bool hasVideLive = this.hasVideLive;
    //LogCollectUtil.collect('hasVideLive $hasVideLive');
    if (!hasShowTips && hasVideLive && isNotWifi) {
      hasShowTips = true;
//      showToas("您当前为非WIFI环境，请注意流量消耗");
      showToas(config.langMap['baseLang']['flux_tips']);
    }
    return isNotWifi && isOnlyWifi && hasVideLive && !config.isApp;
  }

  // bool get needShowFluxWidget => true && cfg.fluxMode == AiFluxMode.OnlyWifi && hasVideLive;

  void updateExtendModel(ExtendModel resExtend, DetailParams detailParams, bool isFreeAnchor) {
    isFreeAnchor ??= false;
    //动画直播
    animateLiveUrl = resExtend?.data?.animateLiveUrl;

    //视频直播
    List<VideoLive> videoLives = resExtend?.data?.videoLives ?? [];
    var streamNaLive = resExtend?.data?.streamNa?.liveVideoInfo ?? [];

    List<LiveVideoInfo> anchors = [];

    int index = 1;
    if(isFreeAnchor){
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
    }else{
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
              (flv == null &&
                  m3u8 == null &&
                  rtmp == null &&
                  f.liveType == LiveType.MerchantLive)) {
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


    // 测试
//     anchors.add(LiveVideoInfo(
//       nickName: "测试web",
//       vid: "test1",
//       weburl: "https://smtv.io/embed_player/2323777.html?openbacksourcebtn=false&opendmcontrolbtn=false",
//     ));

//     anchors.add(LiveVideoInfo(
//       nickName: "测试web",
//       vid: "test1",
//       weburl: "https://smtv.io/embed_player/2323770.html?openbacksourcebtn=false&opendmcontrolbtn=false",
//     ));

//    anchors.add(LiveVideoInfo(
//      nickName: "测试flv",
//      vid: "test_flv",
//      flv: "https://hls.hnjump.cn/live/room-2335215.flv?wsSecret=f4b88ceaacfe3b904344fc5baa4c1507&wsABSTime=5ea04ece",
//    ));
//    anchors.add(LiveVideoInfo(
//      nickName: "测试m3u8",
//      vid: "test_m3u8",
//      m3u8: "http://fat.video.xc.com:10080/fvod/iQ50sGMMR/video.m3u8",
//    ));
    // anchors.add(LiveVideoInfo(
    //   nickName: "测试flv2",
    //   vid: "test_flv2",
    //   flv: "https://play.zqcf718.com/live/stream7026274.flv",
    // ));

//     anchors.add(LiveVideoInfo(
//       nickName: "测试rtmp",
//       vid: "test_rtmp",
//       m3u8: "rtmp://hls.yteaews.cn/live/room-2323777-hd?wsSecret=1a23b94e5e5368d54bf760a77f46b9de&wsABSTime=5e0a1b12",
//     ));
    // anchors.add(LiveVideoInfo(
    //   nickName: "测试流mp4",
    //   vid: "test_mp4",
    //   m3u8: "http://dev.img.xc.com///video/base/2981101/9dd40cb0ec8f45cfabd5b87609b5d48d.mp4",
    // ));

    toolPanel.updateAnchors(anchors, detailParams.anchorId, isFreeAnchor: isFreeAnchor);
  }

  void updateDetailModel(MatchesDetailModel resDetail) {}

  void updatePageModel(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    freshTopBar(pageModel, extendModel, footballAuxiliaryData);
    freshBottomBar(pageModel);
  }

  void freshTopBar(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    String leagueName =
        pageModel.matchesDetailModel?.data?.leagueShortName ?? "";
    String homeName = string(pageModel.matchesDetailModel?.data?.homeTeamAbbr,
        defaultVal: string(pageModel.matchesDetailModel?.data?.homeTeam));
    String awayName = string(pageModel.matchesDetailModel?.data?.awayTeamAbbr,
        defaultVal: string(pageModel.matchesDetailModel?.data?.awayTeam));
    String homeScore = pageModel.scoreModel?.homeScore ?? "";
    String awayScore = pageModel.scoreModel?.awayScore ?? "";
    String showType = string(pageModel.matchesDetailModel?.data?.showtype);
    toolPanel.topBar.model.leagueName = leagueName;
    toolPanel.topBar.model.homeName = homeName;
    toolPanel.topBar.model.awayName = awayName;
    toolPanel.topBar.model.homeGoal = homeScore;
    toolPanel.topBar.model.awayGoal = awayScore;
    toolPanel.topBar.model.awayGoal = awayScore;
    toolPanel.topBar.model.awayLogo =
        pageModel.matchesDetailModel?.data?.awayLogo;
    toolPanel.topBar.model.homeLogo =
        pageModel.matchesDetailModel?.data?.homeLogo;
    toolPanel.topBar.model.gameType =
        pageModel.matchesDetailModel?.data?.gameType;
    toolPanel.topBar.model.animateLiveUrl =
        extendModel?.data?.animateLiveUrl ?? "";
    toolPanel.topBar.model.gidm =
        pageModel.matchesDetailModel?.data?.gidm;
    toolPanel.topBar.model.extendModel = extendModel;
    //如果是足球
    if ("FT" == toolPanel.topBar.model.gameType && showType == 'RB') {
      toolPanel.topBar.model.auxiliaryData = footballAuxiliaryData;
    }
    toolPanel.topBar.update();
//    new MatchCollectionInfoService().saveOrUpdateCurrentMatchUserWatching(MatchCollectionInfoModel(
//      gidm:toolPanel.topBar.model.gidm,
//      homeImg:toolPanel.topBar.model.homeLogo,
//      awayImg: toolPanel.topBar.model.awayLogo,
//      homeTeam: homeName,
//      awayTeam: awayName,
//      homeScore: pageModel.matchesDetailModel.data?.showtype ==  "RB"? homeScore:"",
//      awayScore: pageModel.matchesDetailModel.data?.showtype ==  "RB"? awayScore:"",
//      strong:  (pageModel.matchesDetailModel?.data?.detail?.isNotEmpty??false)?pageModel.matchesDetailModel?.data?.detail[0].game.strong:null,
//    ));
  }

  void freshBottomBar(DPageModel pageModel) {
    String leagueName =
        pageModel.matchesDetailModel?.data?.leagueShortName ?? "";
    String homeName = string(pageModel.matchesDetailModel?.data?.homeTeamAbbr,
        defaultVal: string(pageModel.matchesDetailModel?.data?.homeTeam));
    String awayName = string(pageModel.matchesDetailModel?.data?.awayTeamAbbr,
        defaultVal: string(pageModel.matchesDetailModel?.data?.awayTeam));
    String homeScore = pageModel.scoreModel?.homeScore ?? "";
    String awayScore = pageModel.scoreModel?.awayScore ?? "";
    String leagueId = pageModel.matchesDetailModel?.data?.leagueId ?? "";
    toolPanel.bottomBar.model.leagueName = leagueName;
    toolPanel.bottomBar.model.homeName = homeName;
    toolPanel.bottomBar.model.awayName = awayName;
    toolPanel.bottomBar.model.homeGoal = homeScore;
    toolPanel.bottomBar.model.awayGoal = awayScore;
    toolPanel.bottomBar.model.leagueId = leagueId;
    toolPanel.bottomBar.model.matchRemain =
        pageModel.matchesDetailModel?.remain();
    toolPanel.bottomBar.model.virtualTime =
        MM_dd_HH_mm(pageModel.matchesDetailModel?.data?.gameDate);
    toolPanel.bottomBar.model.seasonName =
        "${string(pageModel.matchesDetailModel?.data?.season, defaultVal: '')}/${config.langMap['baseLang']['matchDay']}${string(pageModel.matchesDetailModel?.data?.round, defaultVal: '0')}";
    toolPanel.bottomBar.model.timeViewModel
        .fromDetailMatchsModelWithGame(pageModel.matchesDetailModel);
    toolPanel.bottomBar.update();
  }
}

class LivePlayerChildController {
  LivePlayerController _player;

  LiveHotHelperController _hotExpression;

  LiveHistoryController _liveHistoryController;

  LiveMatchStationController _liveMatchStationController;

  LiveMoreMenuController _liveMoreMenuController;

  LivePlayerController get player {
    return _player;
  }

  void setPlayer(LivePlayerController player) {
    this._player = player;
  }

  void setHotExpression(LiveHotHelperController hotExpression) {
    _hotExpression = hotExpression;
  }

  LiveHotHelperController get hotExpression {
    return _hotExpression;
  }

  LiveHistoryController get liveHistoryController {
    return _liveHistoryController;
  }

  void setLiveHistoryController(LiveHistoryController liveHistoryController) {
    _liveHistoryController = liveHistoryController;
  }

  void setLiveMatchStationController(
      LiveMatchStationController liveMatchStationController) {
    _liveMatchStationController = liveMatchStationController;
  }

  void setLiveMoreMenuController(
      LiveMoreMenuController liveMoreMenuController) {
    _liveMoreMenuController = liveMoreMenuController;
  }

  LiveMatchStationController get matchStationController {
    return _liveMatchStationController;
  }

  LiveBetStateController _liveBetStateController;

  void setLiveBetStateController(LiveBetStateController controller) {
    _liveBetStateController = controller;
  }

  LiveBetStateController get liveBetStateController => _liveBetStateController;

  LiveMoreLeagueController _LiveMoreLeagueController;

  void setLiveMoreLeagueController(LiveMoreLeagueController controller) {
    _LiveMoreLeagueController = controller;
  }

  LiveMoreLeagueController get liveMoreLeagueController =>
      _LiveMoreLeagueController;

  LiveMoreMenuController get liveMoreMenuController {
    return _liveMoreMenuController;
  }

  dispose() {
    _player = null;
  }
}
*/