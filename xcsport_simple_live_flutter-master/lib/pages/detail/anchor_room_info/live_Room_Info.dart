
import 'package:fast_ai/utils/ai_json.dart';

class LiveRoomInfo{
  String liveId;        // 房间号(直播间ID)
  num livePopularity;   // 直播间人气
  String liveTitle;     // 直播间标题
  String liveType;      // 游戏和自由主播字段(游戏后台先固定为：小游戏)
  String liveGame;      // 小游戏名字(龙虎斗)
  String liveStartTime; // 开播时间
  String anchorId;      // 主播ID
  String name;          // 主播名字
  String headPortrait;  // 主播头像
  String mobileCover;   // 直播封面
  String fans;          // 粉丝数
  String clickPraiseCount; // 点赞数
  String anchorLevel;  // 主播级别
  String label;        // 主播标签
  num wishGiftSwitch;   // 心愿礼物开关(0=关闭 1=开启)
  String announcement;  // 直播公告
  String liveStatus;    // 直播状态(1:开播 0:结束直播)
  String flv;
  String m3u8;
  String rtmp;
  LiveRoomInfo.fromMap(Map<String,dynamic> data){
    liveId = AiJson(data).getString('liveId');
    livePopularity = AiJson(data).getNum('livePopularity');
    liveTitle = AiJson(data).getString('liveTitle');
    liveType = AiJson(data).getString('liveType');
    liveGame = AiJson(data).getString('liveGame');
    liveStartTime = AiJson(data).getString('liveStartTime');
    anchorId = AiJson(data).getString('anchorId');
    name = AiJson(data).getString('name');
    headPortrait = AiJson(data).getString('headPortrait');
    mobileCover = AiJson(data).getString('mobileCover');
    fans = AiJson(data).getString('fans');
    clickPraiseCount = AiJson(data).getString('clickPraiseCount');
    anchorLevel = AiJson(data).getString('anchorLevel');
    label = AiJson(data).getString('label');
    wishGiftSwitch = AiJson(data).getNum('wishGiftSwitch');
    announcement = AiJson(data).getString('announcement');
    liveStatus = AiJson(data).getString('liveStatus');
    flv = AiJson(data).getString('flv');
    m3u8 = AiJson(data).getString('m3u8');
    rtmp = AiJson(data).getString('rtmp');
  }
}