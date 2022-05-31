import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class PlayInfo extends BaseModel {
  static String profilesOpen = "open";
  static String profilesShield = "shield";

   _PlayInfo data;

  PlayInfo.fromMap(map) : super.fromMap(map) {
    this.data = _PlayInfo.fromMap(map['data']);
  }
}

class _PlayInfo {
  var playerId, playerUserId, nickName, headImg, fansCount, followNum, ranking, profiles, privacy, isFollow, anchorId, profilesStatus;

  _PlayInfo.fromMap(Map map) {
    if (map == null) return;
    playerId = map['playerId'];
    playerUserId = map['playerUserId'];
    nickName = map['nickName'];
    headImg = map['headImg'];
    fansCount = map['fansCount'];
    followNum = map['followNum'];
    ranking = map['ranking'] ?? '-';
    profiles = map['profiles'] ?? config.langMap['baseLang']['models']['noProfile'];
    isFollow = map['isFollow'] ?? 2;
    privacy = map['privacy'] ?? 0;
    anchorId = map['anchorId'];
    profilesStatus = map['profilesStatus'] ?? PlayInfo.profilesOpen;
    Map<String, dynamic> titles = AiJson(map).getMap('titles');
  }
}
