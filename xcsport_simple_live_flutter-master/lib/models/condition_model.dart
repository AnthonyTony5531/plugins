import 'package:fast_ai/models/base_model.dart';

class ConditionModel extends BaseModel {
  List<_ConditionModel> data;
  
  ConditionModel.fromMap(Map<String, dynamic> map): super.fromMap(map) {
    this.data = map[data]?.map<_ConditionModel>((item) => _ConditionModel.fromMap(item));
  }
}

class _ConditionModel {
  var count;
  var gameListCount;
  var gameType;
  // _ConditionModel({this.count, this.gameListCount, this.gameType});
  _ConditionModel.fromMap(Map<String, dynamic> map) {
    this.count = map['count'] ?? 0;
    this.gameListCount = map['gameListCount'] ?? 0;
    this.gameType = map['gameType'] ?? 'FT';

  }
}