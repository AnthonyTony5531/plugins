 import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/anchor/live_view/live_view_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';

class FreeAnchorModel {
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
   String groupTitle = '';
   bool isShowHiddenSame;

   // 自由主播字段
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
   //
   LiveViewModel liveViewModel;
   String gameImage;
   String anchorId;
   String anchorCover;


   // 热门主播直播
   FreeAnchorModel fromFreeAnchorRspProtocolWithGame(Map<String,dynamic> g) {
     liveViewModel = LiveViewModel().fromCommonMatchsProtocolWithGame(g);
     var json = AiJson(g);
     gameImage = json.getString("iconMp");
     icon = json.getString("icon");
     videoType = json.getString("type");
     name = json.getString("name");
     if(isStrNullOrEmpty(name)) name = json.getString("nickname");
     gameImage = json.getString("gameImage");
     nickname = json.getString("nickname");
     anchorId = json.getString('anchorId');
     cover = json.getString('cover');
     flv = json.getString('flv');
     m3u8 = json.getString('m3u8');
     rtmp = json.getString('rtmp');
     cover = json.getString('cover');
     anchorCover = json.getString('cover');
     merchantId = json.getString('merchantId');
     watchTotal = json.getNum('watchTotal');
     reserveTotal = json.getNum('reserveTotal');
     reserve = json.getBool('reserve');
     url = json.getString("url");
     anchorStatus = json.getString("anchorStatus");
     sex = json.getString("sex");
     // 广场关注的主播
     followId = json.getString("followId");
     fans = json.getNum('fans');
     createTime = json.getTimestamp('createTime');
     nickName = json.getString("nickName");
     heaImage = json.getString("heaImage");
     live = json.getString("live");
     title = json.getString('title');
     label = json.getString('label');
     anchorLevel = json.getString('anchorLevel');
     anchorType = json.getString('anchorType');

     anchorLevelTitle = getAnchorLevelTitle(anchorLevel);
     anchorLevelIcon = getAnchorLevelIcon(anchorLevel);
     isShowBadge = !isStrNullOrEmpty(anchorId);
     isShowAnchorLevel = !isStrNullOrEmpty(anchorLevel);
     isShowAnchorLabel = !isStrNullOrEmpty(label);
     isShowAnchorTitle = !isStrNullOrEmpty(title);
     isShowFreeAnchor = !isStrNullOrEmpty(anchorType) && anchorType == '1';
     if(isStrNullOrEmpty(title) && isShowFreeAnchor){
       title = '$nickname的直播间';
     }
//     isShowFreeAnchor = false;

//     isShowAnchorLevel = true;
//     isShowAnchorLabel = true;
//     label = '爆料小能手';
//     anchorLevelTitle = '钻石主播';
//     anchorLevel = '1';
//     isShowFreeAnchor = true;
//     anchorLevelIcon = getAnchorLevelIcon(anchorLevel);
//     title = '今天聊聊欧冠16强抽签，兄弟们快来围观' * 2;

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
     anchorDefaultIcon = json.getString('anchorDefaultIcon');
     // 是否关注主播
     isFollowAnchor = config.userInfo.hasFollowAnchor(anchorId);
     return this;
   }

   Sex anchorSex(){
     if(this.sex == null || isEmpty(this.sex) || this.sex == '0'){
       return Sex.Women;
     }
     else {
       return Sex.Man;
     }
   }

   String getAnchorLevelTitle(String anchorLevel){
     if(anchorLevel == '1'){
       return '钻石主播';
     }
     else if(anchorLevel == '2'){
       return '金牌主播';
     }
     else if(anchorLevel == '3'){
       return '普通主播';
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