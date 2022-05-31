// 发奖
import 'package:fast_ai/utils/ai_json.dart';

class ActivityDrawLotteryModel {
  final num awardAmount; // 发奖金额
  final num status; // 0失败、1成功

  ActivityDrawLotteryModel({this.awardAmount,this.status});

  factory ActivityDrawLotteryModel.fromJson(Map<String,dynamic> json) {
    AiJson aiJson = AiJson(json);
    return ActivityDrawLotteryModel(
        awardAmount: aiJson.getNum('awardAmount'),
      status: aiJson.getNum('status'),
    );
  }
}