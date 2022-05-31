FloatActivityDrawConfig activityConfig = FloatActivityDrawConfig.ins;

class FloatActivityDrawConfig {
  static FloatActivityDrawConfig ins = FloatActivityDrawConfig();

  // 活动是否关闭
  bool showFloatActivityDraw = false;

  // 简单记录翻牌点击顺序
  int acNumber = 0;

  // 默认基础奖E
  String baseImg = 'D';

  // 默认翻牌数量
  int activityNum = 12;

  // 是否可以翻牌
  bool isTurn = true;

  // 是否到数量了
  bool isTrue = false;

  // 动画翻转时间
  int animalDuration = 500;

  // 谢谢惠顾数量
//  int thankNum = 0;
}
