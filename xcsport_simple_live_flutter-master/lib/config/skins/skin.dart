import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/skins/skins_config.dart';
import 'package:flutter/material.dart';
import '../config.dart';

class Skin {
  _FontFimaly _fontFimaly;
  _FontFimaly get fontFimaly {
    if (_fontFimaly == null) _fontFimaly = _FontFimaly();
    return _fontFimaly;
  }

  _FontSize _fontSize;
  _FontSize get fontSize {
    if (_fontSize == null) _fontSize = _FontSize();
    return _fontSize;
  }

  _FontWeight _fontWeight;
  _FontWeight get fontWeight {
    if (_fontWeight == null) _fontWeight = _FontWeight();
    return _fontWeight;
  }

  _Radius _radius;
  _Radius get radius {
    if (_radius == null) _radius = _Radius();
    return _radius;
  }

  _Colors _colors;
  _Colors get colors {
    if (_colors == null) _colors = _Colors();
    return _colors;
  }

  _Disdance _disdance;
  _Disdance get disdance {
    if (_disdance == null) _disdance = _Disdance();
    return _disdance;
  }

  _GameStyle _game;
  _GameStyle get game {
    if (_game == null) _game = _GameStyle();
    return _game;
  }

  _ListView _list;
  _ListView get list {
    if (_list == null) _list = _ListView();
    return _list;
  }

  _Menu _menu;
  _Menu get menu {
    if (_menu == null) _menu = _Menu();
    return _menu;
  }

  _Bet _bet;
  _Bet get bet {
    if (_bet == null) _bet = _Bet();
    return _bet;
  }

  _HobbyList _hobbyList;
  _HobbyList get hobbyList {
    if (_hobbyList == null) _hobbyList = _HobbyList();
    return _hobbyList;
  }

  _GuideStyle _guideStyle;
  _GuideStyle get guideStyle {
    if (_guideStyle == null) _guideStyle = _GuideStyle();
    return _guideStyle;
  }

  _DrawerStyle _drawerStyle;
  _DrawerStyle get drawerStyle {
    if (_drawerStyle == null) _drawerStyle = _DrawerStyle();
    return _drawerStyle;
  }

  _ConstellationStyle _constellationStyle;
  _ConstellationStyle get constellationStyle {
    if (_constellationStyle == null)
      _constellationStyle = _ConstellationStyle();
    return _constellationStyle;
  }

  _MoreLiveViewStyle _moreLiveViewStyle;
  _MoreLiveViewStyle get moreLiveViewStyle {
    if (_moreLiveViewStyle == null) _moreLiveViewStyle = _MoreLiveViewStyle();
    return _moreLiveViewStyle;
  }

  _PersonalViewStyle _personalViewStyle;
  _PersonalViewStyle get personalViewStyle {
    if (_personalViewStyle == null) _personalViewStyle = _PersonalViewStyle();
    return _personalViewStyle;
  }

  _StrangeMatchDialogStyle _strangeMatchViewStyle;
  _StrangeMatchDialogStyle get strangeMatchViewStyle {
    if (_strangeMatchViewStyle == null)
      _strangeMatchViewStyle = _StrangeMatchDialogStyle();
    return _strangeMatchViewStyle;
  }

  _AttentionBannerStyle _attentionBannerStyle;
  _AttentionBannerStyle get attentionBannerStyle {
    if (_attentionBannerStyle == null)
      _attentionBannerStyle = _AttentionBannerStyle();
    return _attentionBannerStyle;
  }

  _MemberBettingDetailStyle _memberBettingDetailStyle;
  _MemberBettingDetailStyle get memberBettingDetailStyle {
    if (_memberBettingDetailStyle == null)
      _memberBettingDetailStyle = _MemberBettingDetailStyle();
    return _memberBettingDetailStyle;
  }

  _HotMatchRecommendStyle _hotMatchRecommendStyle;
  _HotMatchRecommendStyle get hotMatchRecommendStyle {
    if (_hotMatchRecommendStyle == null)
      _hotMatchRecommendStyle = _HotMatchRecommendStyle();
    return _hotMatchRecommendStyle;
  }
}

//--------------------------------------基础格式---------------------------------------------
class _FontFimaly {
  String pingFang; //sysFontFimaly['PingFang'];
  String money = sysFontFimaly['Money'];
  String liGothicMed = sysFontFimaly['LiGothicMed'];
  String dINCondensed = sysFontFimaly['DINCondensed'];
  String yakuHei = sysFontFimaly['HYYakuHei'];
  String visbyCF = sysFontFimaly['VisbyCF'];
  String youSheBiaoTiHei = sysFontFimaly['YouSheBiaoTiHei'];

  //'packages/$package/$fontFamily'
  // 添加字体请通知自行修改sdk_package_utls.sh脚本prepareSDKAsset方法，不然导致安卓SDK显示异常(图片和文案)等不可预测bug，iOS SDK仅显示默认字体！！！！！！！！！！！！
}

class _FontSize {
  /// 24号字体
  double h1 = sysFontSize['H1'];

  /// 20号字体
  double h2 = sysFontSize['H2'];

  /// 18号字体
  double h2_1 = sysFontSize['H2_1'];

  /// 16号字体
  double h3 = sysFontSize['H3'];

  /// 14号字体
  double h4 = sysFontSize['H4'];

  /// 12号字体
  double h5 = sysFontSize['H5'];

  /// 10号字体
  double h6 = sysFontSize['H6'];

  /// 9号字体
  double h7 = sysFontSize['H7'];

  /// 8号字体
  double h8 = sysFontSize['H8'];
}

class _FontWeight {
  FontWeight bold = sysFontWeight['bold']; // w900
  FontWeight medium = sysFontWeight['Medium']; // w600
  FontWeight regular = sysFontWeight['Regular']; // w400
  FontWeight light = sysFontWeight['Light']; // w100
}

class _Radius {
  double r10 = sysRadius['R10'];
  double r100 = sysRadius['R100'];
}

class _Colors {
  /// 0xFF5078FF
  Color attentionColor1 = sysColors['Attention_Color1'];

  /// 0xFFFF4000
  Color attentionColor2 = sysColors['Attention_Color2'];

  /// 0xFF11D664
  Color attentionColor3 = sysColors['Attention_Color3'];

  /// 100%黑色 0xFF000000
  Color fontColorDark = sysColors['FontColor_Dark'];

  /// 100%白色 0xFF000000
  Color fontColorWhite = sysColors['FontColor_White'];

  /// 0xFF666666
  Color fontColorRegular = sysColors['FontColor_Regular'];

  /// 0xFF999999
  Color fontColorLight = sysColors['FontColor_Light'];

  /// 0xFFCCCCCC
  Color fontColorDisable = sysColors['FontColor_Disable'];

  /// 0xFFF4F5F8  应用的全局背景颜色
  Color bgColorGloabl = sysColors['BgColorGloabl'];

  // 0x222222
  Color bgColorDeepDark = sysColors['bgColorDeepDark'];

  /// 0xFFFFFFFF
  Color bgColorLocal = sysColors['BgColorLocal'];

  /// 0xFFCCCCCC
  Color iconColor = sysColors['IconColor'];

  /// 0xFFEFEFEF
  Color deviderColor = sysColors['DeviderColor'];

  /// 0xFF11D664
  Color loseColor = sysColors['LoseColor'];

  /// 10%黑色
  Color fontColorDark10 = sysColors['FontColor_Dark10'];

  /// 30%黑色
  Color fontColorDark30 = sysColors['FontColor_Dark30'];

  /// 40%黑色
  Color fontColorDark40 = sysColors['FontColor_Dark40'];

  /// 50%黑色
  Color fontColorDark50 = sysColors['FontColor_Dark50'];

  /// 60%黑色
  Color fontColorDark60 = sysColors['FontColor_Dark60'];

  /// 70%黑色
  Color fontColorDark70 = sysColors['FontColor_Dark70'];

  /// 80%黑色
  Color fontColorDark80 = sysColors['FontColor_Dark80'];

  /// 90%黑色
  Color fontColorDark90 = sysColors['FontColor_Dark90'];

  /// 40%白色
  Color fontColorWhite40 = sysColors['FontColor_White40'];

  /// 50%白色
  Color fontColorWhite50 = sysColors['FontColor_White50'];

  /// 60%白色
  Color fontColorWhite60 = sysColors['FontColor_White60'];

  /// 70%白色
  Color fontColorWhite70 = sysColors['FontColor_White70'];

  /// 灰: 对应100% 0xFF19263B
  Color mainColor = sysColors['main_Color'];

  /// 灰: 对应60% 0x9919263B
  Color mainColor60 = sysColors['main_Color60'];

  /// 灰: 对应40% 0x6619263B
  Color mainColor40 = sysColors['main_Color40'];

  /// 灰白：底色，分隔线 0xFFF5F5F5
  Color bgColor = sysColors['bg_Color'];

  Color rankBGRedColor = sysColors['rank_bg_red_color'];
  Color rankBGBlueColor = sysColors['rank_bg_blue_color'];
}

class _Disdance {
  double dL10 = sysDisdance['L10'];
  double dL3 = sysDisdance['L3'];
  double dL5 = sysDisdance['L5'];

  double dL18 = sysDisdance['L18'];
  double dL20 = sysDisdance['L20'];
  double dL24 = sysDisdance['L24'];
  double dL30 = sysDisdance['L30'];
  double dL36 = sysDisdance['L36'];
  double dL40 = sysDisdance['L40'];
  double dL52 = sysDisdance['L52'];
  double dL60 = sysDisdance['L60'];
}

//--------------------------------------比赛格式---------------------------------------------
class _GameStyle {
  //标题格式
  final TextStyle titleStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h5,
      height: 1.1,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorLight);
  final double leagueLogoSizeSmall = config.skin.disdance.dL18;
  final double leagueLogoSize = config.skin.disdance.dL24;
  //联赛格式
  final TextStyle leagueStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorRegular);
  //强队格式
  final TextStyle strongTeamStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);
  //弱队格式
  final TextStyle weekTeamStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorDark);
  //vs格式
  final TextStyle vsStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorLight);
  //vs Goal格式
  final TextStyle vsGoalStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);
  //球队图标大小
  final double teamLogoSize = config.skin.disdance.dL24;
  final double teamLogoSizeSmall = config.skin.disdance.dL18;
  //更多玩法
  final TextStyle morePlayStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      color: config.skin.colors.attentionColor2,
      fontWeight: config.skin.fontWeight.regular,
      height: 1.1);
  //比分字体
  final TextStyle goalStyle = AiTextStyle(
    color: config.skin.colors.attentionColor2,
    fontFamily: config.skin.fontFimaly.dINCondensed,
    fontSize: config.skin.fontSize.h2_1,
    fontWeight: config.skin.fontWeight.medium,
  );

  //------------------------标准---------------------------
  //赔率
  final TextStyle oddsStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //赔率UP
  final TextStyle oddsUpStyle = AiTextStyle(
    color: config.skin.colors.attentionColor2,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //赔率down
  final TextStyle oddsDownStyle = AiTextStyle(
    color: config.skin.colors.attentionColor3,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //球头
  TextStyle ratioStyle = AiTextStyle(
    color: config.skin.colors.fontColorLight,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
  );
  //------------------------大20---------------------------
  //赔率
  final TextStyle oddsStyle20 = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.light,
  );
  //赔率UP
  final TextStyle oddsUpStyle20 = AiTextStyle(
    color: config.skin.colors.attentionColor2,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.light,
  );
  //赔率down
  final TextStyle oddsDownStyle20 = AiTextStyle(
    color: config.skin.colors.attentionColor3,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
  );
  //球头
  TextStyle ratioStyle20 = AiTextStyle(
    color: config.skin.colors.fontColorLight,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
  );
  //------------------------Banner---------------------------
  //赔率
  final TextStyle oddsStyleBanner = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //赔率UP
  final TextStyle oddsUpStyleBanner = AiTextStyle(
    color: config.skin.colors.attentionColor2,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //赔率down
  final TextStyle oddsDownStyleBanner = AiTextStyle(
    color: config.skin.colors.attentionColor3,
    fontFamily: config.skin.fontFimaly.liGothicMed,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
  );
  //球头
  TextStyle ratioStyleBanner = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
  );

  //------------------------------------------------------
  //时间
  TextStyle timeStyle = AiTextStyle(
      color: config.skin.colors.fontColorDark70,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      height: 1.1);
  //更多盘口+
  TextStyle moreLineStyle = AiTextStyle(
    color: config.skin.colors.fontColorLight,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
  );
}
//--------------------------------------TabView格式------------ d-----------------------------

//--------------------------------------列表格式---------------------------------------------
class _ListView {
  //group标题
  final TextStyle groupTitleStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorRegular);
  //summny标题
  final TextStyle summnyTitleStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorRegular);
  //suspension弹出式提示
  final TextStyle suspensionTextStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorRegular);
  //单元格边距
  final double cellMarginSize = config.skin.disdance.dL10;
  //单元格内边距
  final double cellPanddingSize = config.skin.disdance.dL5;
  final Color backgroundColor = config.skin.colors.bgColorGloabl;
  final Color cellBackgroundColor = config.skin.colors.bgColorLocal;
}

//--------------------------------------菜单格式---------------------------------------------
class _Menu {
  var titleStyle = AiTextStyle(
      color: config.skin.colors.fontColorRegular,
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var titleDarkStyle = AiTextStyle(
      color: config.skin.colors.fontColorWhite50,
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var titleStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorDark,
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.medium);
  var titleDarkStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorWhite,
      fontSize: config.skin.fontSize.h4,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.medium);
  var sub1TitleStyle = AiTextStyle(
      color: config.skin.colors.fontColorRegular,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var sub1TitleDarkStyle = AiTextStyle(
      color: config.skin.colors.fontColorWhite50,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var sub1TitleStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorDark,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.medium);
  var sub1TitleDarkStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorWhite,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.medium);
  var sub2TitleStyle = AiTextStyle(
      color: config.skin.colors.fontColorRegular,
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var sub2TitleDarkStyle = AiTextStyle(
      color: config.skin.colors.fontColorWhite50,
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular);
  var sub2TitleStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorDark,
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.regular);
  var sub2TitleDarkStyleSelectd = AiTextStyle(
      color: config.skin.colors.fontColorWhite,
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.regular);

  var countStyle = AiTextStyle(
      color: config.skin.colors.fontColorLight,
      fontSize: config.skin.fontSize.h7,
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontWeight: config.skin.fontWeight.medium);
  var countDarkStyle = AiTextStyle(
      color: config.skin.colors.fontColorWhite40,
      fontSize: config.skin.fontSize.h7,
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontWeight: config.skin.fontWeight.medium);
  var countStyleSelected = AiTextStyle(
      color: config.customStyle
          .themeIncludeFontColor, // config.skin.colors.fontColorDark,
      fontSize: config.skin.fontSize.h7,
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontWeight: config.skin.fontWeight.medium);
  var countBackgroundSelected = config.skin.colors.attentionColor1;
  var paddingSize = config.skin.disdance.dL10;
}

class _Bet {
  var betOptionStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);
  var betOptionBigStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);

  var betOddsStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);

  var betOddsWhiteStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorWhite);

  var captionStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorRegular);
  var captioNumberStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorRegular);
}

class _HobbyList {
  var noteStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.mainColor40,
  );

  var editStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.mainColor,
  );

  var leagueNameStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.medium,
    color: config.skin.colors.fontColorDark,
  );

  var followMoreStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.mainColor,
  );

  var defaulTitleStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.mainColor);

  var defaulContentStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorDark40);

  var myMainTeamStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorDark60);

  var modiyTextStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorDark,
  );

  var noteStyle1 = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.mainColor40,
  );

  var mainTeamStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h2_1,
    fontWeight: config.skin.fontWeight.medium,
    color: config.skin.colors.mainColor,
  );

  var followAddSelectTextStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
    color: config.skin.colors.fontColorDark,
  );
  var followAddUnSelectTextStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorDark,
  );

  var leagueTeamStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorDark,
  );

  var leagueTeamCellTitleStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.mainColor);

  var leagueTeamCountStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h6,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.mainColor60,
  );

  var leagueTeamSelectTextStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
    color: config.skin.colors.fontColorDark,
  );
}

class _GuideStyle {
  var titleStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: 20,
    fontWeight: config.skin.fontWeight.medium,
    color: Color(0xff68CA89),
  );

  var subTitleStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: 15,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.black,
  );

  var skipStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
    color: Color(0xFFFFFFFF),
  );

  var nextStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
    color: Color(0xFFFFFFFF),
  );

  var descStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.medium,
    color: Color(0xFFFFFFFF),
  );
  var subDescStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    color: Color(0xFFFFFFFF),
  );
}

class _DrawerStyle {
  var secondTitle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.medium,
      color: config.skin.colors.fontColorDark);

  var contentTxt = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorDark.withOpacity(0.7));
  var labelTxt = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      color: config.skin.colors.fontColorDark);
}

class _ConstellationStyle {
  var itemTitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.bgColorLocal,
  );

  var dateTxt = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.bgColorLocal.withOpacity(0.5),
  );

  var detailPageTitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.medium,
    fontSize: config.skin.fontSize.h4,
    color: config.skin.colors.bgColorLocal,
    letterSpacing: 0.27,
  );

  var detailPageTitleActions = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h5,
    color: config.skin.colors.bgColorLocal,
  );

  var detailTabBarTitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.medium,
    fontSize: config.skin.fontSize.h4,
    color: config.skin.colors.bgColorLocal,
  );

  var detailFlexViewTitle = AiTextStyle(
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h3,
      fontFamily: config.skin.fontFimaly.pingFang,
      color: Colors.white);

  var detailFlexDateTitle = AiTextStyle(
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      color: Colors.white);

  var detailFortuneTxt = AiTextStyle(
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      color: Colors.white.withOpacity(0.6));

  var chapterTitleStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.regular,
      color: Colors.white.withOpacity(0.8));

  var emptyDataTipsStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.regular,
      color: Colors.white.withOpacity(0.5));

  var detailTabTitle = AiTextStyle(
      fontWeight: config.skin.fontWeight.bold,
      fontSize: 32,
      fontFamily: config.skin.fontFimaly.dINCondensed);
}

class _MoreLiveViewStyle {
  var anchorNameStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h8,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white,
  );
  var liveNumStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h8,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white,
  );
  var teamNameStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h6,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white,
  );
  var scoreStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      color: Color.fromARGB(255, 255, 64, 0));
  var leagueStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h8,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white54,
  );

  var defaultTitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white,
  );

  var defaultSubtitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    color: Colors.white54,
  );
}

class _PersonalViewStyle {
  var content = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    letterSpacing: 0.23,
    color: config.skin.colors.fontColorDark.withOpacity(0.4),
  );
}

class _StrangeMatchDialogStyle {
  var title = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.medium,
    fontSize: config.skin.fontSize.h4,
    letterSpacing: 0.27,
    color: config.skin.colors.fontColorDark,
  );
  var subTitle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.medium,
    fontSize: 13,
    letterSpacing: 0.25,
    color: config.skin.colors.fontColorDark.withOpacity(0.8),
  );
  var content1 = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 13,
    letterSpacing: 0.25,
    color: config.skin.colors.fontColorDark.withOpacity(0.8),
  );
  var content2 = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h5,
    letterSpacing: 0.23,
    color: config.skin.colors.fontColorDark.withOpacity(0.8),
  );
  var content3 = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 13,
    letterSpacing: 0.25,
    color: config.skin.colors.fontColorDark,
  );
  var digit = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 13,
    letterSpacing: 0.25,
    color: Color(0xFFFF4000),
  );
}

class _AttentionBannerStyle {
  var optionName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      fontSize: config.skin.fontSize.h6,
      color: Colors.white.withOpacity(0.6),
      letterSpacing: 0.19);

  var showIor = AiTextStyle(
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h2_1,
      color: Colors.white,
      letterSpacing: 0.34);

  var teamName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      fontSize: config.skin.fontSize.h4,
      color: Colors.white,
      letterSpacing: 0.27);

  var timeViewStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h6,
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 0.19,
      height: 1.1);

  var scoreStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: 23,
      color: Colors.white,
      letterSpacing: 0.44);

  var leaguesNameStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 0.23);

  var matchsTimeStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h6,
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 0.19);

  var percent = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: config.skin.fontSize.h8,
      color: Colors.white,
      letterSpacing: 0.15);
}

class _MemberBettingDetailStyle {
  var statusName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      color: config.skin.colors.fontColorDark,
      letterSpacing: 0.23);

  var money = AiTextStyle(
      fontFamily: config.skin.fontFimaly.money,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h1,
      color: config.skin.colors.fontColorDark,
      letterSpacing: 0.46);

  var status = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h4,
      color: config.skin.colors.fontColorDark.withOpacity(0.7),
      letterSpacing: 0.27);

  var rowKey = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h4,
      color: config.skin.colors.fontColorDark50,
      letterSpacing: 0.27);

  var rowValue = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h4,
      color: config.skin.colors.fontColorDark,
      letterSpacing: 0.27);

  var gameName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h4,
      color: config.skin.colors.fontColorDark,
      letterSpacing: 0.27);
}

class _HotMatchRecommendStyle {
  var optionName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      fontSize: config.skin.fontSize.h6,
      color: Colors.white.withOpacity(0.6),
      letterSpacing: 0.19);

  var showIor = AiTextStyle(
      fontFamily: config.skin.fontFimaly.liGothicMed,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h2_1,
      color: Colors.white,
      letterSpacing: 0.34);

  var teamName = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      fontSize: config.skin.fontSize.h5,
      color: Color(0xFF19263B),
      letterSpacing: 0.23);

  var timeViewStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h6,
      color: config.skin.colors.fontColorDark60,
      letterSpacing: 0.19,
      height: 1.1);

  var scoreStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: config.skin.fontSize.h2_1,
      color: Color(0xFFFF4000),
      letterSpacing: 0.34);

  var leaguesNameStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      color: Color(0xFF19263B).withOpacity(0.6),
      letterSpacing: 0.23);

  var vsStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: config.skin.fontSize.h2_1,
      color: config.skin.colors.fontColorDark,
      letterSpacing: 0.34);

  var matchsTimeStyle = AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h6,
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 0.19);

  var percent = AiTextStyle(
      fontFamily: config.skin.fontFimaly.dINCondensed,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: config.skin.fontSize.h8,
      color: Colors.white,
      letterSpacing: 0.15);
}
