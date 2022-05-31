import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class PlatformCounts extends BaseModel {
  List<PlatformCount> list = [];
  PlatformCounts({this.list});

  PlatformCounts.fromMap(Map<String, dynamic> json) : super.fromMap(json) {
    var _list = AiJson(json).getArray('data') ?? [];
    _list.forEach((element) {
      list.add(PlatformCount(platformId: element['platformId'], count: element['gameCount'], liveCount: element['liveGameCount']));
    });
  }
}

class PlatformCount {
  String platformId;
  int count;
  int liveCount;
  PlatformCount({this.platformId, this.count, this.liveCount});
}