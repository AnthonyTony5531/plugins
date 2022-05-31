
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_model.dart';

class LiveBottombarModel{
  VideoType videoType = VideoType.Score;
  AutioState autioState = AutioState.Voice;
  BarrageSwitch barrageSwitch = BarrageSwitch.On;

  ScreenDirection screenDirection = ScreenDirection.TopDown;

  String leagueName = "";
  String homeName = "";
  String awayName = "";
  String homeGoal = "";
  String awayGoal = "";
  String showType = "RB";
  String leagueId = "";
  //赛季名字
  String seasonName = "";
  //比赛剩余开赛时间
  int matchRemain;

  String virtualTime;
  bool enableShowFullScreen = true;
  bool enableShowRefreshButton = true;

//  TimeViewModel timeViewModel = TimeViewModel();

  void update(DPageModel pageModel) {
    String leagueName = pageModel.matchesDetailModel?.data?.leagueShortName ?? "";
    String homeName = string(pageModel.matchesDetailModel?.data?.homeTeamAbbr, defaultVal: string(pageModel.matchesDetailModel?.data?.homeTeam));
    String awayName = string(pageModel.matchesDetailModel?.data?.awayTeamAbbr, defaultVal: string(pageModel.matchesDetailModel?.data?.awayTeam));
//    String homeScore = pageModel.scoreModel?.homeScore ?? "";
//    String awayScore = pageModel.scoreModel?.awayScore ?? "";
    String leagueId = pageModel.matchesDetailModel?.data?.leagueId ?? "";
    this.leagueName = leagueName;
    this.homeName = homeName;
    this.awayName = awayName;
//    this.homeGoal = homeScore;
//    this.awayGoal = awayScore;
    this.leagueId = leagueId;
    this.matchRemain = pageModel.matchesDetailModel?.remain();
    this.virtualTime = MM_dd_HH_mm(pageModel.matchesDetailModel?.data?.gameDate);
    this.seasonName = "${string(pageModel.matchesDetailModel?.data?.season, defaultVal: '')}/${config.textByPath('matchDay')}${string(pageModel.matchesDetailModel?.data?.round, defaultVal: '0')}";
//    this.timeViewModel.fromDetailMatchsModelWithGame(pageModel.matchesDetailModel);
  }
}

enum VideoType{
  Score,//比分
  Animation, //动画直播
  Video,  //视频直播
}

enum AutioState{
  Mute,  //静音
  Voice, //发声
}

enum ScreenDirection{
  LeftRight,  //横向
  TopDown     //竖向
}

//弹幕开
enum BarrageSwitch{
  On,//开
  Off,//关
}

