import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class AnchorPlayerBaseInfoModel extends BaseModel {
  AnchorPlayerInfoModel anchorPlayerInfoModel;

  AnchorPlayerBaseInfoModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200){
      Map dataMap = AiJson(map).getMap('data');
      anchorPlayerInfoModel = AnchorPlayerInfoModel.fromJson(dataMap);
    }
  }
}

class AnchorPlayerInfoModel {
  final num levelId;
  final num odds; // 赔率
  final num bettingAmount; // 投注额
  final num points; // 积分
  final String levelName; // 段位名称
  final num level; // 排位等级
  final num updateTime;
  AnchorPlayerInfoModel(
      {this.levelName,
      this.levelId,
      this.points,
      this.bettingAmount,
      this.odds,
      this.updateTime,
      this.level,});

  factory AnchorPlayerInfoModel.fromJson(Map map) {
    AiJson json = AiJson(map);
    return AnchorPlayerInfoModel(
      levelId: json.getNum('levelId'),
      odds: json.getNum('odds'),
      bettingAmount: json.getNum('bettingAmount'),
      points: json.getNum('points'),
      levelName: json.getString('levelName'),
      level: json.getNum('level'),
      updateTime: json.getNum('updateTime'),
    );
  }
}
