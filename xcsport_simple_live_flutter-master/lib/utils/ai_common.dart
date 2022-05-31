/*
 * @Author: your name
 * @Date: 2020-06-07 17:36:58
 * @LastEditTime: 2020-09-25 22:10:46
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \xcsport-sdk-pcg:\project\xcsports-sdk-flutter\lib\utils\ai_common.dart
 */
import 'package:fast_ai/config/config.dart';

class AiCommon {

  //选择全部时的icon，支持外部传入
  static Map<String,dynamic> get getAllIcon {
    return config.customStyle.getImgUrl('menu_all_icon');
  }
  static Map<String, dynamic> get sportTypes => {
    "ALL":    {"name":config.langMap['baseLang']['ALL'],  "img":getAllIcon['url'],     "img_s":"assets/images/sports_type/shawdow/icon_item_all_normal.png",   'usePackage':getAllIcon['usePackage']},
    "FT":     {"name":config.langMap['baseLang']['sports']['FT'],   "img":"assets/images/sports_type/sports_football.png",     "img_s":"assets/images/sports_type/shawdow/icon_item_football_normal.png"},
    "BK":     {"name":config.langMap['baseLang']['sports']['BK'],   "img":"assets/images/sports_type/sports_basketball.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_basketball_normal.png"},
    "TN":     {"name":config.langMap['baseLang']['sports']['TN'],   "img":"assets/images/sports_type/tennis.png",         "img_s":"assets/images/sports_type/shawdow/icon_item_tennis_normal.png"},
    "BS":     {"name":config.langMap['baseLang']['sports']['BS'],   "img":"assets/images/sports_type/sports_baseball.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_baseball_normal.png"},
    "OP_DJ":  {"name":config.langMap['baseLang']['sports']['OP_DJ'],   "img":"assets/images/sports_type/essports.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_essports_normal.png"},
    "BK_AFT": {"name":config.langMap['baseLang']['sports']['BK_AFT'],"img":"assets/images/sports_type/usfootball.png", "img_s":"assets/images/sports_type/shawdow/icon_item_usfootball_normal.png"},
    "OP_RU":  {"name":config.langMap['baseLang']['sports']['OP_RU'],  "img":"assets/images/sports_type/sports_unionfootball.png",  "img_s":"assets/images/sports_type/shawdow/icon_item_unionfootball_normal.png"},
    "OP_IH":  {"name":config.langMap['baseLang']['sports']['OP_IH'],   "img":"assets/images/sports_type/icehockey.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_icehockey_normal.png"},
    "OP_HB":  {"name":config.langMap['baseLang']['sports']['OP_HB'],   "img":"assets/images/sports_type/sports_handball.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_handball_normal.png"},
    "OP":     {"name":config.langMap['baseLang']['sports']['OP'],   "img":"assets/images/sports_type/sports_other.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_other_normal.png"},
   
    "OP_MMA": {"name":config.langMap['baseLang']['sports']['OP_MMA'],   "img":"assets/images/sports_type/fighting.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_fighting_normal.png"},
    "OP_BO":  {"name":config.langMap['baseLang']['sports']['OP_BO'],   "img":"assets/images/sports_type/sports_boxing.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_boxing_bormal.png"},
    "OP_SN":  {"name":config.langMap['baseLang']['sports']['OP_SN'],   "img":"assets/images/sports_type/sports_snooker.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_snooker_normal.png"},
    "OP_DR":  {"name":config.langMap['baseLang']['sports']['OP_DR'],   "img":"assets/images/sports_type/darts.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_darts_normal.png"},
    "OP_TN":  {"name":config.langMap['baseLang']['sports']['OP_TN'],   "img":"assets/images/sports_type/pingpong.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_pingpong_normal.png"},
    "OP_FH":  {"name":config.langMap['baseLang']['sports']['OP_FH'],   "img":"assets/images/sports_type/hockey.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_hockey_normal.png"},
    
    "OP_FB":    {"name":config.langMap['baseLang']['sports']['OP_FB'],   "img":"assets/images/sports_type/sports_dibanqiu.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_dibanqiu_normal.png"},
  
    "OP_BV":  {"name":config.langMap['baseLang']['sports']['OP_BV'],   "img":"assets/images/sports_type/beachvolley.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_beachvolley_bormal.png"},
    "OP_CK":  {"name":config.langMap['baseLang']['sports']['OP_CK'],   "img":"assets/images/sports_type/cricket.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_cricket_normal.png"},
    "OP_VB":  {"name":config.langMap['baseLang']['sports']['OP_VB'],   "img":"assets/images/sports_type/volleyball.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_volleyball_normal.png"},
    "OP_AR":  {"name":config.langMap['baseLang']['sports']['OP_AR'],   "img":"assets/images/sports_type/sports_race.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_race_normal.png"},
    "OP_BA":  {"name":config.langMap['baseLang']['sports']['OP_BA'],   "img":"assets/images/sports_type/bicycle.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_bicycle_normal.png"},
    "OP_GF":  {"name":config.langMap['baseLang']['sports']['OP_GF'],   "img":"assets/images/sports_type/golf.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_golf_normal.png"},
    "DR":     {"name":config.langMap['baseLang']['sports']['DR'],   "img":"assets/images/sports_type/dograce.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_dograce_normal.png"},
    "OP_BM":  {"name":config.langMap['baseLang']['sports']['OP_BM'],   "img":"assets/images/sports_type/badminton.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_badminton_normal.png"},
    
    
    "OP_LO":  {"name":config.langMap['baseLang']['sports']['OP_LO'],   "img":"assets/images/sports_type/caipiao.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_caipiao_normal.png"},
    "OP_JR":  {"name":config.langMap['baseLang']['sports']['OP_JR'],   "img":"assets/images/sports_type/jinrong.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_jinrong_normal.png"},
    "OP_MS":  {"name":config.langMap['baseLang']['sports']['OP_MS'],   "img":"assets/images/sports_type/racecar.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_racecar_normal.png"},
    "OP_SB":  {"name":config.langMap['baseLang']['sports']['OP_SB'],   "img":"assets/images/sports_type/leiqiu.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_leiqiu_normal.png"},
    "OP_CY":  {"name":config.langMap['baseLang']['sports']['OP_CY'],   "img":"assets/images/sports_type/bike.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_bike_normal.png"},
    "OP_OF":  {"name":config.langMap['baseLang']['sports']['OP_OF'],   "img":"assets/images/sports_type/waterball.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_waterball_normal.png"},
    "OP_FU":  {"name":config.langMap['baseLang']['sports']['OP_FU'],   "img":"assets/images/sports_type/footballinhome.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_footballinhome_normal.png"},
    "OP_GY":  {"name":config.langMap['baseLang']['sports']['OP_GY'],   "img":"assets/images/sports_type/ticao.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_ticao_normal.png"},
    "OP_TAF":  {"name":config.langMap['baseLang']['sports']['OP_TAF'],   "img":"assets/images/sports_type/tianjing.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_tianjing_normal.png"},
    "OP_SS":  {"name":config.langMap['baseLang']['sports']['OP_SS'],   "img":"assets/images/sports_type/fanchuan.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_fanchuan_normal.png"},
    "OP_SW":  {"name":config.langMap['baseLang']['sports']['OP_SW'],   "img":"assets/images/sports_type/youyong.png",    "img_s":"assets/images/sports_type/shawdow/icon_item_youyong_normal.png"},
  };

  static getSportType(String gameType){
    return sportTypes[gameType]??sportTypes["OP"];
  }


  static Map<String, dynamic> get virtualSportTypes => {
    "vflm": {"name": config.langMap['baseLang']['vmSport']['sportType']['vflm'],  "img": "assets/images/virtual_game/icon_item_soccerleague_normal.png",     "img_s":"assets/images/virtual_game/icon_item_soccerleague_normal_s.png",},
    "vfas": {"name": config.langMap['baseLang']['vmSport']['sportType']['vfas'],   "img":"assets/images/virtual_game/icon_item_asiancup_normal.png",     "img_s":"assets/images/virtual_game/icon_item_asiancup_normal_s.png"},
    "vfcc": {"name": config.langMap['baseLang']['vmSport']['sportType']['vfcc'],   "img":"assets/images/virtual_game/icon_item_champion_normal.png",     "img_s":"assets/images/virtual_game/icon_item_champion_normal_s.png"},
    "vfwc": {"name": config.langMap['baseLang']['vmSport']['sportType']['vfwc'],   "img":"assets/images/virtual_game/icon_item_worldcup_normal.png",     "img_s":"assets/images/virtual_game/icon_item_worldcup_normal_s.png"},
    "vfec": {"name": config.langMap['baseLang']['vmSport']['sportType']['vfec'],   "img":"assets/images/virtual_game/icon_item_eurocup_normal.png",     "img_s":"assets/images/virtual_game/icon_item_eurocup_normal_s.png"},
    "vfnc": {"name": config.langMap['baseLang']['vmSport']['sportType']['vfnc'],   "img":"assets/images/virtual_game/icon_item_nationscup_normal.png",     "img_s":"assets/images/virtual_game/icon_item_nationscup_normal_s.png"},
    "vbl":  {"name": config.langMap['baseLang']['vmSport']['sportType']['vbl'],   "img":"assets/images/virtual_game/icon_item_bkleague_normal.png",     "img_s":"assets/images/virtual_game/icon_item_bkleague_normal_s.png"},
  };

  static getVirtualSportType(String gameType){
    return virtualSportTypes[gameType];
  }



  static Map<String, dynamic> get resultDetail {
    return {
      "C":{"text":config.langMap['baseLang']['order']['cancel1'],"img":"assets/images/icon_early_result_cancel.svg"},
      "W":{"text":config.langMap['baseLang']['order']['win'],"img":"assets/images/win.svg"},
      "L":{"text":config.langMap['baseLang']['order']['lose'],"img":"assets/images/lose.svg"},
      "P":{"text":config.langMap['baseLang']['order']['x'],"img":"assets/images/draw.svg"},
      "LL":{"text":config.langMap['baseLang']['order']['loseＨalf'],"img":"assets/images/losehalf.svg"},
      "LW":{"text":config.langMap['baseLang']['order']['winHalf'],"img":"assets/images/winhalf.svg"},
      "EW":{"text":config.langMap['baseLang']['order']['earlyWin'],"img":"assets/images/icon_early_result_win.png"},
      "EL":{"text":config.langMap['baseLang']['order']['earlyLose'],"img":"assets/images/icon_early_result_lose.png"}
    };
  }
  
  //赛事异常状态
  //赛事延期DD，赛事腰斩DF,DN，赛事取消,DT
  // static List<String> matchExceptional = ['DD','DF','DN','DT'];
  
   static final Map<String, dynamic> matchExceptional = {
    "DD": config.langMap['baseLang']['utils']['matchExceptional']['DD'],
    "DF": config.langMap['baseLang']['utils']['matchExceptional']['DF'],
    "DN": config.langMap['baseLang']['utils']['matchExceptional']['DN'],
    "DT": config.langMap['baseLang']['utils']['matchExceptional']['DT'],
  };
  
}