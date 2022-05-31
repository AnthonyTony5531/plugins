
import 'package:fast_ai/utils/string_util.dart';

class AiImageHelper {
//img_detail_bg_badminton.png //羽毛球
//img_detail_bg_baseball.png  //棒球
//img_detail_bg_basketball.png //篮球
//img_detail_bg_beachvolleyball.png //沙滩排球
//img_detail_bg_bicycle.png //自行车
//img_detail_bg_billiards.png //桌球
//img_detail_bg_boxing.png //综合格斗
//img_detail_bg_cricket.png //地板球
//img_detail_bg_darts.png //飞镖
//img_detail_bg_dograce.png //赛狗
//img_detail_bg_esports.png //电竞
//img_detail_bg_football.png //足球
//img_detail_bg_galf.png //高尔夫
//img_detail_bg_handball.png //手球
//img_detail_bg_hockey.png //曲棍球
//img_detail_bg_horserace.png //赛马
//img_detail_bg_icehockey.png //冰球
//img_detail_bg_pingpong.png //兵乓球
//img_detail_bg_snooker.png //斯诺克
//img_detail_bg_usfootball.png //美式足球
//img_detail_bg_volleyball.png // 排球

//    String url;
//    if (gameType == 'FT') {
//      url = 'assets/images/detail/match-ft-bg.png';
//    } else if (gameType == 'BK') {
//      url = 'assets/images/detail/篮球3x.png';
//    } else if (gameType == 'TN') {
//      url = 'assets/images/detail/网球3x.png';
//    } else if (gameType == 'BS') {
//      url = 'assets/images/detail/棒球3x.png';
//    } else if (gameType == 'OP_DJ') {
//      url = 'assets/images/detail/电竞3x.png';
//    } else {
//      url = 'assets/images/detail/其他球类3x.png';
//    }
//    return url;
  static String gameTypeBg(String gameType) {
    GameType value = parse2GameType(gameType);
    String basePath = 'assets/images/img_detail_bg/';
    // String bg = 'assets/images/detail/其他球类3x.png';
    String bg = "${basePath}img_detail_bg_football.png";
    switch (value) {
      case GameType.ALL:
        bg = "${basePath}img_detail_bg_football.png";
        break;
      case GameType.FT:
        bg = "${basePath}img_detail_bg_football.png";
        break;
      case GameType.BK:
        bg = "${basePath}img_detail_bg_basketball.png";
        break;
      case GameType.TN:
        bg = "${basePath}img_detail_bg_tennis.png";
        break;
      case GameType.OP_DJ:
        bg = "${basePath}img_detail_bg_esports.png";
        break;
      case GameType.BS:
        bg = "${basePath}img_detail_bg_baseball.png";
        break;
      case GameType.BK_AFT:
        bg = "${basePath}img_detail_bg_baseball.png";
        break;
      case GameType.OP_RL:
        bg = "${basePath}img_detail_bg_usfootball.png";
        break;
      case GameType.OP_RU:
        bg = "${basePath}img_detail_bg_usfootball.png";
        break;
      case GameType.OP_IH:
        bg = "${basePath}img_detail_bg_icehockey.png";
        break;
      case GameType.OP_HB:
        bg = "${basePath}img_detail_bg_usfootball.png";
        break;
      case GameType.OP_SN:
        bg = "${basePath}img_detail_bg_snooker.png";
        break;
      case GameType.OP_BO:
        bg = "${basePath}img_detail_bg_boxing.png";
        break;
      case GameType.OP_MMA:
        bg = "${basePath}img_detail_bg_boxing.png";
        break;
      case GameType.OP_DR:
        bg = "${basePath}img_detail_bg_darts.png";
        break;
      case GameType.OP_TN:
        bg = "${basePath}img_detail_bg_pingpong.png";
        break;
      case GameType.OP_VB:
        bg = "${basePath}img_detail_bg_volleyball.png";
        break;
      case GameType.OP_BM:
        bg = "${basePath}img_detail_bg_badminton.png";
        break;
      case GameType.OP_FH:
        bg = "${basePath}img_detail_bg_hockey.png";
        break;
      case GameType.OP_FB:
        bg = "${basePath}img_detail_bg_cricket.png";
        break;
      case GameType.OP_BV:
        bg = "${basePath}img_detail_bg_beachvolleyball.png";
        break;
      case GameType.OP_CK:
        bg = "${basePath}img_detail_bg_cricket.png";
        break;
      case GameType.OP_CY:
        bg = "${basePath}img_detail_bg_bicycle.png";
        break;
      case GameType.OP_GF:
        bg = "${basePath}img_detail_bg_galf.png";
        break;
      case GameType.OP_GH:
        bg = "${basePath}img_detail_bg_dograce.png";
        break;
      case GameType.OP_HR:
        bg = "${basePath}img_detail_bg_horserace.png";
        break;
      default:
        break;
    }
    return bg;
  }

  static String gameTypeSmallImage(String gameType) {
    GameType value = parse2GameType(gameType);
    String image = '';
    switch (value) {
      case GameType.ALL:
        break;
      case GameType.FT:
        break;
      case GameType.BK:
        break;
      case GameType.TN:
        image = "assets/images/detail/icon_serve_side_tennis.png";
        break;
      case GameType.OP_DJ:
        break;
      case GameType.BS:
        image = "assets/images/detail/icon_serve_side_baseball.png";
        break;
      case GameType.BK_AFT:
        break;
      case GameType.OP_RL:
        break;
      case GameType.OP_RU:
        break;
      case GameType.OP_IH:
        break;
      case GameType.OP_HB:
        break;
      case GameType.OP_SN:
        break;
      case GameType.OP_BO:
        break;
      case GameType.OP_MMA:
        break;
      case GameType.OP_DR:
        break;
      case GameType.OP_TN:
        image = "assets/images/detail/icon_serve_side_pingpong.png";
        break;
      case GameType.OP_VB:
        image = "assets/images/detail/icon_serve_side_volleyball.png";
        break;
      case GameType.OP_BM:
        break;
      case GameType.OP_MS:
        break;
      case GameType.OP_FH:
        break;
      case GameType.OP_FB:
        break;
      case GameType.OP_BV:
        break;
      case GameType.OP_CK:
        break;
      case GameType.OP_CY:
        break;
      case GameType.OP_GF:
        break;
      case GameType.OP_GH:
        break;
      case GameType.OP_HR:
        break;
      case GameType.OP_LO:
        break;
      case GameType.OP_JR:
        break;
      case GameType.OP_SB:
        break;
      case GameType.OP_OF:
        break;
      case GameType.OP_FU:
        break;
      case GameType.OP_GY:
        break;
      case GameType.OP_TAF:
        break;
      case GameType.OP_SS:
        break;
      case GameType.OP_SW:
        break;
    }
    return image;
  }
}
