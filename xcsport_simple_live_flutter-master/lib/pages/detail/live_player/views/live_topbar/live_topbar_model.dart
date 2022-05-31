
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';

class LiveTopbarModel{
  String leagueName = "";
  String homeName = "";
  String awayName = "";
  String homeGoal = "";
  String awayGoal = "";
  String showType = "RB";
  String homeLogo  = "";
  String awayLogo  = "";
  String gameType = "FT";
  String gidm = "";
  String animateLiveUrl = "";
  ExtendModel extendModel;

  //附属数据
  dynamic auxiliaryData;

  //状态 是否收起
  bool isExpanded = true;

  void update(DPageModel pageModel, ExtendModel extendModel) {
    String leagueName = pageModel.matchesDetailModel?.data?.leagueShortName ?? "";
    String homeName = string(pageModel.matchesDetailModel?.data?.homeTeamAbbr, defaultVal: string(pageModel.matchesDetailModel?.data?.homeTeam));
    String awayName = string(pageModel.matchesDetailModel?.data?.awayTeamAbbr, defaultVal: string(pageModel.matchesDetailModel?.data?.awayTeam));
//    String homeScore = pageModel.scoreModel?.homeScore ?? "";
//    String awayScore = pageModel.scoreModel?.awayScore ?? "";
    this.leagueName = leagueName;
    this.homeName = homeName;
    this.awayName = awayName;
//    this.homeGoal = homeScore;
//    this.awayGoal = awayScore;
//    this.awayGoal = awayScore;
    this.awayLogo = pageModel.matchesDetailModel?.data?.awayLogo;
    this.homeLogo = pageModel.matchesDetailModel?.data?.homeLogo;
    this.gameType = pageModel.matchesDetailModel?.data?.gameType;
    this.animateLiveUrl = extendModel?.data?.animateLiveUrl ?? "";
    this.gidm = pageModel.matchesDetailModel?.data?.gidm;
  }
}


//足球附属数据
class FootballAuxiliaryData{
  String corner; //角球
  String yellowCard; //黄牌
  String redCard; //红牌
  String pointSphere; //点球
  String ot; //加时赛
  String penaltyKick; //点球大战
  FootballAuxiliaryData({
    this.corner,
    this.yellowCard,
    this.redCard,
    this.pointSphere,
    this.ot,
    this.penaltyKick,
  });
}