// 获取抽奖活动详情
import 'package:fast_ai/utils/ai_json.dart';

class ActivityDrawProgressModel {
  final List<PrizePoolModel> prizePoolList;
  final num poolRate; // 基础池进度
  final String activityImg; // 活动背景图片
  final String cardImg; // 卡片背面图片
  final String floatingImg; // 浮窗图片
  final String popupImg; // 弹窗图片
  final String awardImg; // 中奖特效图片
  ActivityDrawProgressModel(
      {this.poolRate,
      this.prizePoolList,
      this.activityImg,
      this.cardImg,
      this.floatingImg,
      this.popupImg,
      this.awardImg,
      });

  factory ActivityDrawProgressModel.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    List prizePoolList = aiJson.getArray('prizePoolList');
    return ActivityDrawProgressModel(
        poolRate: aiJson.getNum('poolRate'),
        activityImg: aiJson.getString('activityImg'),
        cardImg: aiJson.getString('cardImg'),
        floatingImg: aiJson.getString('floatingImg'),
        popupImg: aiJson.getString('popupImg'),
        awardImg: aiJson.getString('awardImg'),
        prizePoolList: prizePoolList.isNotEmpty
            ? prizePoolList.map((e) => PrizePoolModel.fromMap(e)).toList()
            : []);
  }
}

class PrizePoolModel {
  final num awardAmount;
  final num awardType;
  final String playerId;
  final String poolImg;
  final num isTrue; // 1真实的 、0就是的
  PrizePoolModel({this.awardType, this.awardAmount, this.playerId,this.poolImg,this.isTrue});

  factory PrizePoolModel.fromMap(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    return PrizePoolModel(
      awardAmount: aiJson.getNum('awardAmount'),
      awardType: aiJson.getNum('awardType'),
      playerId: aiJson.getString('playerId'),
      poolImg: aiJson.getString('poolImg'),
      isTrue: aiJson.getNum('isTrue',defaultValue: 1) ?? 1,
    );
  }
}
