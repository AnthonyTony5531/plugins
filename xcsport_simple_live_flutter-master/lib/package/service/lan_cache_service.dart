import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/service/http_cache_service/http_protocol_adapter.dart';
import 'package:common_component/util/effective_time_data_cache.dart';
import 'package:fast_ai/api/protocols/lang_name/league_group_lang_name_protocol.dart';
import 'package:fast_ai/api/protocols/lang_name/league_lang_name_protocol.dart';
import 'package:fast_ai/api/protocols/lang_name/match_lang_name_protocol.dart';
import 'package:fast_ai/api/protocols/lang_name/team_lang_name_protocol.dart';
import 'package:fast_ai/package/fastai_package.dart';

const String CacheLangType = 'CacheLangType';
const String LeagueAdapterName = 'LeagueLangHttpAdapter';
const String LeagueGroupAdapterName = 'LeagueGroupLangHttpAdapter';
const String MatchAdapterName = 'MatchLangHttpAdapterName';
const String TeamAdapterName = 'TeamLangHttpAdapterName';

//const int CacheInterval = 1;// 缓存时间(单位：天)
const int CacheInterval = 1; // 缓存时间(单位：min)

//国际化语言缓存
class LanCacheService extends IService {
  @override
  String get name => "fast_ai.LanCacheService";

  @override
  Future<void> init() {
    aiPackage.service.networkDataCache.addAdapter([
      LeagueLangHttpAdapter(),
      LeagueGroupLangHttpAdapter(),
      MatchLangHttpAdapter(),
      TeamLangHttpAdapter(),
    ]);

    return super.init();
  }

  Future<void> clearAllLangCache() async{
   await  aiPackage.service.networkDataCache.removeByType(CacheLangType);
  }

  Future<List<Map<String, dynamic>>> getLeagueLans(List<String> ids) async {
    try {
      List<EffectiveCacheData> list = await aiPackage.service.networkDataCache
          .loadHttpCache(
              adapterName: LeagueAdapterName, ids: ids, params: null);

      return list.map((effectiveCacheData) {
        return effectiveCacheData.params.data;
      }).toList();
    } catch (e) {
      print("e ---> $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getLeagueGroupLans(
      List<String> ids) async {
    try {
      List<EffectiveCacheData> list = await aiPackage.service.networkDataCache
          .loadHttpCache(
              adapterName: LeagueGroupAdapterName, ids: ids, params: null);

      return list.map((effectiveCacheData) {
        return effectiveCacheData.params.data;
      }).toList();
    } catch (e) {
      print("e ---> $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMatchLans(List<String> ids) async {
    try {
      List<EffectiveCacheData> list = await aiPackage.service.networkDataCache
          .loadHttpCache(adapterName: MatchAdapterName, ids: ids, params: null);

      return list.map((effectiveCacheData) {
        return effectiveCacheData.params.data;
      }).toList();
    } catch (e) {
      print("e ---> $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getTeamLans(List<String> ids) async {
    try {
      List<EffectiveCacheData> list = await aiPackage.service.networkDataCache
          .loadHttpCache(adapterName: TeamAdapterName, ids: ids, params: null);

      return list.map((effectiveCacheData) {
        return effectiveCacheData.params.data;
      }).toList();
    } catch (e) {
      print("e ---> $e");
      return [];
    }
  }
}

/* ------------------------------ adapter ----------------------------------- */

/// 联赛
class LeagueLangHttpAdapter extends HttpProtocolAdapter {
  @override
  String get adapterName => LeagueAdapterName;

  @override
  Future<List<EffectiveCacheDataParams>> request(
      List<String> ids, Map<String, dynamic> requestParams) async {
    var protocol = LeagueLangNameReqProtocol(leagueId: ids.join(','));
    LeagueLangNameRspProtocol langNameRspProtocol = await protocol.request();
    if (langNameRspProtocol.isSuccess) {
      List<EffectiveCacheDataParams> params = langNameRspProtocol.leaguesName
          .map(
            (e) => EffectiveCacheDataParams.create(
              type: CacheLangType,
              data: e.toJson(),
              id: e.leagueId,
              adapterName: adapterName,
              effectiveDuration: Duration(minutes: CacheInterval),
              requestParams: {},
            ),
          )
          .toList();

      return params;
    }
    return null;
  }
}

/// 联赛组
class LeagueGroupLangHttpAdapter extends HttpProtocolAdapter {
  @override
  String get adapterName => LeagueGroupAdapterName;

  @override
  Future<List<EffectiveCacheDataParams>> request(
      List<String> ids, Map<String, dynamic> requestParams) async {
    var rsp =
        await LeagueGroupLangNameReqProtocol(groupId: ids.join(',')).request();
    if (rsp.isSuccess) {
      List<EffectiveCacheDataParams> params = rsp.leagueGroupsName
          .map(
            (e) => EffectiveCacheDataParams.create(
              type: CacheLangType,
              data: e.toJson(),
              id: e.groupId,
              adapterName: adapterName,
              effectiveDuration: Duration(minutes: CacheInterval),
              requestParams: {},
            ),
          )
          .toList();

      return params;
    }
    return null;
  }
}

/// 比赛
class MatchLangHttpAdapter extends HttpProtocolAdapter {
  @override
  String get adapterName => MatchAdapterName;

  @override
  Future<List<EffectiveCacheDataParams>> request(
      List<String> ids, Map<String, dynamic> requestParams) async {
    var rsp = await MatchLangNameReqProtocol(gidms: ids.join(',')).request();
    if (rsp.isSuccess) {
      List<EffectiveCacheDataParams> params = rsp.matchsName
          .map(
            (e) => EffectiveCacheDataParams.create(
              type: CacheLangType,
              data: e.toJson(),
              id: e.gidm,
              adapterName: adapterName,
              effectiveDuration: Duration(minutes: CacheInterval),
              requestParams: {},
            ),
          )
          .toList();

      return params;
    }
    return null;
  }
}

/// 队伍
class TeamLangHttpAdapter extends HttpProtocolAdapter {
  @override
  String get adapterName => TeamAdapterName;

  @override
  Future<List<EffectiveCacheDataParams>> request(
      List<String> ids, Map<String, dynamic> requestParams) async {
    var rsp = await TeamLangNameReqProtocol(teamId: ids.join(',')).request();
    if (rsp.isSuccess) {
      List<EffectiveCacheDataParams> params = rsp.teamsName
          .map(
            (e) => EffectiveCacheDataParams.create(
              type: CacheLangType,
              data: e.toJson(),
              id: e.teamId,
              adapterName: adapterName,
              effectiveDuration: Duration(minutes: CacheInterval),
              requestParams: {},
            ),
          )
          .toList();

      return params;
    }
    return null;
  }
}
