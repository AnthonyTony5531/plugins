import 'package:fast_ai/models/base_model.dart';

class SeasonWinStatistic extends BaseModel {
  _SeasonWinStatistic data;
  SeasonWinStatistic.fromMap(map): super.fromMap(map) {
    data = _SeasonWinStatistic.fromMap(map['data']);
  }
}


class _SeasonWinStatistic {
  var total,
  totalWinRate,
  totalWinCountRate,
  rank,
  sp,
  level,
  star,
  levelRank;
  List<_SubStatic> subStatic;
  _SeasonWinStatistic.fromMap(Map map) {
    if(map == null) return;
    total = map['total'] ?? 0;
    totalWinRate = ((map['totalWinRate'] ?? 0) * 100).round();
    totalWinCountRate = ((map['totalWinCountRate'] ?? 0) * 100).round();
    rank = map['rank'] ?? 0;
    sp = (map['sp'] ?? 0.00).toStringAsFixed(2);
    level = map['level'] ?? 0;
    levelRank = map['levelRank'] ?? 0;
    star = map['star'] ?? 0;
    subStatic = map['subStatic'].map<_SubStatic>((c) => _SubStatic.fromMap(c)).toList();
  }
}

class _SubStatic {
  var winCountRate, //胜率
  staDate,
  winRate; //盈利率
  _SubStatic.fromMap(Map map) {
    if(map == null) return;
    winCountRate = map['winCountRate'] * 100 ~/ 1;
    staDate = map['staDate'];
    winRate = map['winRate'] * 100 ~/ 1;
  }
}