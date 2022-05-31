//聊天用户
class ChatUser {
  //聊天id
  final String chatId;

  //头部地址
  final String headerUrl;

  //显示名字
  final String showName;

  //类型 主播:6
  int playerType;

  // 商戶主播ID
  final String anchorId;

  // 用户等级
  final int level;

  // 排行榜类型
  int rankType;

  // 排行榜名次
  int rankIndex;

  // 进场样式
  String rankAnimationImg;

  ChatUser({
    this.chatId,
    this.headerUrl,
    this.showName,
    this.playerType,
    this.anchorId,
    this.level,
    this.rankType,
    this.rankIndex,
    this.rankAnimationImg,
  });

  @override
  String toString() {
    return 'ChatUser{chatId: $chatId, headerUrl: $headerUrl, showName: $showName, playerType: $playerType, anchorId: $anchorId, level: $level, rankType: $rankType, rankIndex: $rankIndex, rankAnimationImg: $rankAnimationImg}';
  }
}
