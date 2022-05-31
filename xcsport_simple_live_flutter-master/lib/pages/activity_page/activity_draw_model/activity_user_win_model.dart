// 获取抽奖
import 'dart:convert';

import 'package:fast_ai/utils/ai_json.dart';

class WinPrizeUserModel {
  final num awardType; //中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  final num id; // 发奖id
  final List<String> imageList;// 翻牌图片["B","C","A","A","E","B","C","D","A"]
  final int createTime;
  final num lotteryId;
  WinPrizeUserModel({this.awardType,this.id,this.imageList,this.createTime,this.lotteryId});

  factory WinPrizeUserModel.fromJson(Map<String,dynamic> json) {
    AiJson aiJson = AiJson(json);
    var imgString = aiJson.getString('imageList');
    var list = [];
    try {
      list = jsonDecode(imgString);
    } catch (e, _) {
      print('======imageList===格式不对');
    }
    return WinPrizeUserModel(
      awardType: aiJson.getNum('awardType'),
      imageList: list.map((e) => '$e').toList(),
      createTime: aiJson.getTimestamp('createTime') ,
      lotteryId: aiJson.getNum('lotteryId'),
      id: aiJson.getNum('id'),
    );
  }
}