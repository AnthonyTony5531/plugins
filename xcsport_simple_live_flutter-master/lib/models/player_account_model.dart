import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_json.dart';

class PlayerAccountModel extends BaseModel {
  PlayerAccountModel();

  _PlayerAccountModel data = _PlayerAccountModel();
  PlayerAccountModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = _PlayerAccountModel.fromMap(map['data']);
  }
}

class _PlayerAccountModel {
  String headImg = "";
  String loginName = "";
  String nickName = "";
  String playerId = "";
  String uid = "";
  String profiles = "";
  String privacy = "";
  String merchantId = "";
  num createTime = 0;
  bool forceModifyPwd;
  String anchorId = '';
  //关注的联赛id
  // List<String> followLeagues = [];
  // //关注的球队比赛
  // List<String> followGames = [];
  //关注的球队
  // List<String> followTeams = [];
  List<String> followPlayerIds = [];
  dynamic winRank = 0;
  dynamic winRate = 0;
  int level = 0;
  Map<String, dynamic>  data;
  _PlayerAccountModel();

  _PlayerAccountModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.data = map;

    // this.headImg = map["headImg"]==null ? "": '${Api.baseImgUrl}/${map["headImg"]}';
    this.headImg = map["headImg"] == null ? "" : map["headImg"];
    if (!this.headImg.startsWith("http")) {
      if (this.headImg.startsWith('/'))
        this.headImg = "${Api.baseImgUrl}${map["headImg"]}";
      else
        this.headImg = "${Api.baseImgUrl}/${map["headImg"]}";
    }
    this.loginName = map['loginName'];
    String subNickName = map['nickName'];
//    if (subNickName != null && subNickName.length > 11) {
//      subNickName = subNickName.substring(0, 11);
//    }
    this.nickName = subNickName;
    this.merchantId = map["merchantId"];
    AiCache.get().setString("merchantId", merchantId ?? '');
    this.playerId = map['playerId'];
    this.uid = map['uid'];
    this.winRank = map['winRank'];
    this.createTime = new AiJson(map).getTimestamp('createTime');
    this.anchorId = map['anchorId'];
    this.profiles = map['profiles'];
    this.privacy = (map['privacy'] ?? '').toString();
    this.level = map['level'] ?? 0;
    this.forceModifyPwd = map['forceModifyPwd'] ?? false;
    // try{
    //   this.followTeams =map['farTeamIds'].map<String>((f)=>f.toString()).toList();
    // }catch(e){
    //   this.followTeams = [];
    // }
    // try{
    //   this.followLeagues =map['farLeagueIds'].map<String>((f)=>f.toString()).toList();
    // }catch(e){
    //   this.followLeagues = [];
    // }
    // try{
    //   this.followGames =map['collectGidms'].map<String>((f)=>f.toString()).toList();
    // }catch(e){
    //   this.followGames = [];
    // }
    try {
      this.followPlayerIds =
          map['followPlayerIds'].map<String>((f) => f.toString()).toList();
    } catch (e) {
      this.followPlayerIds = [];
    }

    this.winRate = map['winRate'];

    String key = (this.playerId ?? '') + 'nickName';
    AiCache.get().setString(key, nickName ?? '');

    key = (this.playerId ?? '') + 'loginName';
    AiCache.get().setString(key, loginName ?? '');

    key = (this.playerId ?? '') + 'headImg';
    AiCache.get().setString(key, this.headImg ?? '');

    key = (this.playerId ?? '') + 'profiles';
    AiCache.get().setString(key, this.profiles ?? '');

    AiCache.get().setString('playerId', this.playerId ?? '');
    AiCache.get().setString('uid', this.uid ?? '');
    AiCache.get().setString('privacy', this.privacy ?? '');

    // if (nickName != null) {
    //   String key = this.playerId ?? '' + 'nickName';
    //   AiCache.get().setString(key, this.nickName);
    // }
    // if (loginName != null) {
    //   String key = this.playerId ?? '' + 'loginName';
    //   AiCache.get().setString(key, this.loginName);
    // }
    // if (headImg != null) {
    //   String key = this.playerId ?? '' + 'headImg';
    //   AiCache.get().setString(key, this.headImg);
    // }
    // if (profiles != null) {
    //   String key = this.playerId ?? '' + 'profiles';
    //   AiCache.get().setString(key, this.profiles);
    // }
    // if (playerId != null) {
    //   AiCache.get().setString('playerId', this.playerId);
    // }
    // if (uid != null) {
    //   AiCache.get().setString('uid', this.uid);
    // }
    // if ((privacy != null)) {
    //   AiCache.get().setString('privacy', this.privacy);
    // }
  }

  // bool isFollowTeam(String teamId){
  //   if(isNullOrEmpty(teamId))return false;
  //   if(followTeams == null)return false;
  //   return followTeams.contains(teamId);
  // }

  //   bool isFollowLeague(String leagueId){
  //   if(isNullOrEmpty(leagueId))return false;
  //   if(followLeagues == null)return false;
  //   return followLeagues.contains(leagueId);
  // }
}
