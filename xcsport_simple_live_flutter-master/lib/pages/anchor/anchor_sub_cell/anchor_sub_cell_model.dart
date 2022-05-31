import 'dart:math';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/anchor/live_view/live_view_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';

enum Sex{
  Women,
  Man,
  None,
}

class AnchorSubCellModel{
  String gameImage = "";
  // 滚球主播直播
  String icon = '';
  String name = '';
  String nickname = '';
  String anchorStatus = '';
  // String anchorId = '';
  String url = '';
  String videoBgImage = ''; // 视频背景图片
  //首页热门主播
  String cover;
  String flv;
  String m3u8;
  String rtmp;
  String merchantId;
  int watchTotal;
  int reserveTotal;
  String anchorDefaultIcon;
  bool reserve = false; // 主播是否预约成功
  bool isFollowAnchor; // 是否关注主播
  bool isShowBadge = false; // 是否显示角标
  String videoType = ''; // 同场比赛视频源类型1,3,4,5
  String videoUrl = '';
  bool isSelectCurrentLive = false; // 滚球视频切换是否选中
  String sex; // 性别 0:女 1:男
  // 关注的主播
  String followId = '';
  int fans = 0;
  int createTime = 0;
  String nickName;
  String heaImage;
  String live = '2'; // 是否直播，1：直播中；2：未开播
  String groupTitle;
  bool isShowHiddenSame;
  // 比赛自由主播字段(主播有关联比赛)
  String title;        // 直播间标题
  String label;        // 主播标签
  String anchorLevel;  // 主播级别
  String anchorType;   // "直播类型 1=自由播 0=匹配"
  String anchorLevelTitle;
  String anchorLevelIcon;
  bool isShowAnchorLevel = false;
  bool isShowAnchorLabel = false;
  bool isShowAnchorTitle = false;
  bool isShowFreeAnchor = false;
  bool isRBGame = false;
  bool isAnchorRank = false; // 主播排行入口
  int anchorLiveStatus = 0; // 主播开播状态 1:开播 0:未开播
  String anchorRank; // 主播排行(手动添加字段)
  // 自由主播(没有关联比赛)
  String liveId;       // 房间号(直播间ID)
  num livePopularity;   // 直播间人气
  String liveTitle;     // 直播间标题
  String freeLiveType;  // 游戏和自由主播字段(游戏后台先固定为：小游戏)
  num liveStatus;       // 直播间状态 0=未开播 1=开播中(该字段区分自由播和赛事主播有值则为自由播)
  String anchorId;      // 主播ID
  String headPortrait;  // 主播头像
  String mobileCover;   // 直播封面
  num clickPraiseCount; // 点赞数
  num wishGiftSwitch;   // 心愿礼物开关(0=关闭 1=开启)
  String announcement;  // 直播公告
  String liveGame;      // 小游戏名字(龙虎斗)
  String liveStartTime; // 开播时间
  //
  LiveViewModel liveViewModel = LiveViewModel();
  String anchorCover = "";
  num betNum = 0;

  // 热门主播直播
  AnchorSubCellModel fromGameAnchorLiveRspProtocolWithGame(Map<String,dynamic> g) {
      var json = AiJson(g);
      liveViewModel = LiveViewModel().fromCommonMatchsProtocolWithGame(g);
      gameImage = json.getString("iconMp");
      icon = json.getString("icon");
      videoType = json.getString("type");
      name = json.getString("name");
      if(isEmpty(name)) name = AiJson(g).getString("nickname");
      gameImage = json.getString("gameImage");
      anchorCover = json.getString('cover');
      nickname = json.getString("nickname");
      anchorId = json.getString('anchorId');
      cover = json.getString('cover');
      flv = json.getString('flv');
      m3u8 = json.getString('m3u8');
      rtmp = json.getString('rtmp');
      merchantId = json.getString('merchantId');
      watchTotal = json.getNum('watchTotal');
      reserveTotal = json.getNum('reserveTotal');
      reserve = json.getBool('reserve');
      url = json.getString("url");
      anchorStatus = json.getString("anchorStatus");
      anchorLiveStatus = json.getNum("status");
      sex = json.getString("sex");
      // 广场关注的主播
      followId = json.getString("followId");
      fans = json.getNum('fans');
      createTime = json.getTimestamp('createTime');
      nickName = json.getString("nickName");
      heaImage = json.getString("heaImage");
      live = json.getString("live");
      // 比赛主播
      anchorRank = json.getString('anchorRank');
      isAnchorRank = !isStrNullOrEmpty(anchorRank) && anchorRank == 'true';
      title = json.getString('title');
      label = json.getString('label');
      anchorLevel = json.getString('anchorLevel');
      anchorType = json.getString('anchorType');
      isFollowAnchor = false;
      isShowFreeAnchor = false;
      // 自由主播
      liveStatus = g['liveStatus']; // 自由播独有
      if(liveStatus != null){
        isShowFreeAnchor = true;
        isFollowAnchor = true;
        liveId = json.getString('liveId');
        livePopularity = json.getNum('livePopularity');
        liveTitle = json.getString('liveTitle');
        freeLiveType = json.getString('liveType');
        liveStatus = json.getNum('liveStatus');
        headPortrait = json.getString('headPortrait');
        mobileCover = json.getString('mobileCover');
        clickPraiseCount = json.getNum('clickPraiseCount');
        wishGiftSwitch = json.getNum('wishGiftSwitch');
        announcement = json.getString('announcement');
        liveGame = json.getString('liveGame');
        liveStartTime = json.getString('liveStartTime');
        title = liveTitle;
        anchorLiveStatus = liveStatus;
        heaImage = headPortrait;
        icon = headPortrait;
        cover = mobileCover;
      }
//      isRBGame = (showType == 'RB' || ((!isStrNullOrEmpty(flv) || !isStrNullOrEmpty(m3u8) || !isStrNullOrEmpty(rtmp)) && anchorLiveStatus == 1));
      isRBGame = anchorLiveStatus == 1;
      anchorLevelTitle = getAnchorLevelTitle(anchorLevel);
      anchorLevelIcon = getAnchorLevelIcon(anchorLevel);
      isShowBadge = !isStrNullOrEmpty(anchorId);
      isShowAnchorLevel = !isStrNullOrEmpty(anchorLevel) && anchorLevel != "3";
      isShowAnchorLabel = !isStrNullOrEmpty(label);
      isShowAnchorTitle = !isStrNullOrEmpty(title);
//      isShowFreeAnchor = !isStrNullOrEmpty(anchorType) && anchorType == '1';
      var langJson = AiJson(config.langMap['baseLang']);
      String studio = langJson.getString('anchor.studio');
      if(isStrNullOrEmpty(title) && isShowFreeAnchor){
        title = '$nickname$studio';
      }
      if(isShowFreeAnchor && !isRBGame){
        title = langJson.getString('anchor.broadcastTitle');
      }
      // 观看任务未0时，给随机数
      if(watchTotal <= 0){
        watchTotal = 500 + Random().nextInt(500);
      }
//       isShowAnchorLevel = true;
//       isShowAnchorLabel = true;
//       label = '爆料小能手';
//       anchorLevelTitle = '钻石主播';
//       anchorLevel = '1';
//       isShowFreeAnchor = true;
//       anchorLevelIcon = getAnchorLevelIcon(anchorLevel);
//       title = '今天聊聊欧冠16强抽签，兄弟们快来围观' * 2;

      if(merchantId.isEmpty){
        if(isNotEmpty(flv) && isEmpty(url)){
          url = flv;
        }
        else if(isNotEmpty(m3u8) && isEmpty(url)){
          url = m3u8;
        }
        else if(isNotEmpty(rtmp) && isEmpty(url)){
          url = rtmp;
        }
      }
      // 自己添加
      anchorDefaultIcon = AiJson(g).getString('anchorDefaultIcon');
      // 是否关注主播
      isFollowAnchor = config.userInfo.hasFollowAnchor(anchorId);

    return this;
  }

  Sex ahocrSex(){
    if(this.sex == null || isEmpty(this.sex) || this.sex == '0'){
      return Sex.Women;
    }
    else {
      return Sex.Man;
    }
  }

  String getAnchorLevelTitle(String anchorLevel){
    String diamondAnchor = AiJson(config.langMap['baseLang']).getString('anchor.diamondAnchor');
    String goldAnchor = AiJson(config.langMap['baseLang']).getString('anchor.goldAnchor');
    String ordinaryAnchor = AiJson(config.langMap['baseLang']).getString('anchor.ordinaryAnchor');
    if(anchorLevel == '1'){
      return diamondAnchor;
    }
    else if(anchorLevel == '2'){
      return goldAnchor;
    }
    else if(anchorLevel == '3'){
//      return ordinaryAnchor;
      return '';
    }
    return '';
  }

  String getAnchorLevelIcon(String anchorLevel){
    if(anchorLevel == '1'){
      return 'assets/images/matchlist/tag_live_diamond.png';
    }
    else if(anchorLevel == '2'){
      return 'assets/images/matchlist/tag_live_gold_medal.png';
    }
    else if(anchorLevel == '3'){
      return 'assets/images/matchlist/tag_live_diamond.png';
    }
    return '';
  }
}

//自由主播
class AnchorLiveModel{

  num liveId;
  num livePopularity;
  String liveTitle;
  String liveType;
  num liveStatus;
  String anchorId;
  String name;
  String headPortrait;
  String mobileCover;
  num fans;
  num clickPraiseCount;
  num anchorLevel;
  String label;
  num wishGiftSwitch;
  String announcement;
  String flv;
  String m3u8;
  String rtmp;

  AnchorLiveModel fromGameAnchorLiveRspProtocolWithGame(Map<String,dynamic> g) {
    var json = AiJson(g);
    liveId = json.getNum('liveId');
    livePopularity = json.getNum('livePopularity');
    liveTitle = json.getString('liveTitle');
    liveType = json.getString('liveType');
    liveStatus = json.getNum('liveStatus');
    anchorId = json.getString('anchorId');
    name = json.getString('name');
    headPortrait = json.getString('headPortrait');
    mobileCover = json.getString('mobileCover');
    fans = json.getNum('fans');
    clickPraiseCount = json.getNum('clickPraiseCount');
    anchorLevel = json.getNum('anchorLevel');
    label = json.getString('label');
    wishGiftSwitch = json.getNum('wishGiftSwitch');
    announcement = json.getString('announcement');
    flv = json.getString('flv');
    m3u8 = json.getString('m3u8');
    rtmp = json.getString('rtmp');
    return this;
  }


}



