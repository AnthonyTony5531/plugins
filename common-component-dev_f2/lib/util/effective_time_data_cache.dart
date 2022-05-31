import 'dart:async';
import 'dart:convert';
import 'package:common_component/component/cache.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:flutter/widgets.dart';

const Duration DefaultEffectiveDuration = Duration(minutes: 5);
const Duration DefaultMaxEffectivenessDuration = Duration(minutes: 10);

/// @author king
/// @date 2021-06-20
/// 根据指定时间有效内存储数据
class EffectiveTimeDataCache {
  static const KeyPre = "EffectiveTimeDataCache";

  final ValueListener onNetCacheDataChanged = new ValueListener();

  var _listener = <String, ValueListener>{};

  Cache cache;

  void addListener(String id, ValueChanged<EffectiveCacheData> valueChanged) {
    ValueListener listener = _listener[id];
    if (null == listener) {
      listener = ValueListener();
      _listener[id] = listener;
    }
    listener.addListener(valueChanged);
  }

  static String createKey(String id) {
    if (id.startsWith("$KeyPre")) return id;
    return "$KeyPre$id";
  }

  static String decodeKey(String id) {
    return id.replaceAll(KeyPre, '');
  }

  void removeListener(
      String id, ValueChanged<EffectiveCacheData> valueChanged) {
    ValueListener listener = _listener[createKey(id)];
    listener?.removeListener(valueChanged);
  }

  Future<void> notifyDataChanged(
      String key, EffectiveCacheData netCacheData) async {
    ValueListener listener = _listener[key];
    listener?.fire(netCacheData);
  }

  EffectiveTimeDataCache({
    this.cache,
  });

  EffectiveCacheData saveOrUpdate(EffectiveCacheDataParams params) {
    String id = createKey(params.id);
    EffectiveCacheData _old = getCache(id);
    EffectiveCacheData _new =
        EffectiveCacheData.create(createTime: DateTime.now(), params: params);
    cache.setString(id, _new.toJson(), needSaveKey: true);
    if (_old != _new) {
      notifyDataChanged(params.id, _new);
    }
    return _new;
  }

  EffectiveCacheData getCache(final String id) {
    final String createId = createKey(id);
    final cacheJsonString = cache.getString(createId, null);
    if (null != cacheJsonString) {
      var cacheJson = jsonDecode(cacheJsonString);
      EffectiveCacheData temdata;
      try {
        temdata = EffectiveCacheData.create(
            createTime: DateTime.fromMillisecondsSinceEpoch(
                cacheJson[EffectiveCacheData.CreateTimeKey]),
            params: EffectiveCacheDataParams.create(
                data: cacheJson[EffectiveCacheData.DataKey],
                adapterName: cacheJson[EffectiveCacheData.AdapterNameKey],
                requestParams: cacheJson[EffectiveCacheData.RequestParamsKey],
                id: id,
                type: cacheJson[EffectiveCacheData.Type],
                autoUpdate: cacheJson[EffectiveCacheData.AutoUpdateKey],
                maxEffectivenessDuration: Duration(
                    milliseconds: cacheJson[
                        EffectiveCacheData.MaxEffectivenessDurationKey]),
                effectiveDuration: Duration(
                    milliseconds:
                        cacheJson[EffectiveCacheData.EffectiveDurationKey])));
      } catch (e, s) {
        print("EffectiveCacheData getCache error, $e, \n $s");
      }

      return temdata;
    }
    return null;
  }

  Future<void> removeByType(String type) async {
    List<dynamic> key = await cache.getKeys();
    key.forEach((element) {
       var data = getCache(element);
       if(data.params.type == type){
         cache.remove(type);
       }
    });
  }

  void remove(String id) {
    id = createKey(id);
    _listener[id] = null;
    cache.remove(id);
  }

  //判断NetCacheData是否过期
  bool isInvalidate(EffectiveCacheData data) {
    assert(data != null);
    return data.createTime
        .add(data.params.effectiveDuration)
        .isBefore(DateTime.now());
  }

  //超过最大失效时间
  bool hasOverMaxEffectivenessTime(EffectiveCacheData data) {
    assert(data != null);
    return data.createTime
        .add(data.params.maxEffectivenessDuration)
        .isBefore(DateTime.now());
  }
}

class EffectiveCacheData {
  static const CreateTimeKey = "createTime";
  static const DataKey = "data";
  static const AdapterNameKey = "adapterName";
  static const EffectiveDurationKey = "effectiveDuration";
  static const MaxEffectivenessDurationKey = "maxEffectivenessDuration";
  static const RequestParamsKey = "requestParams";
  static const AutoUpdateKey = "AutoUpdateKey";
  static const Type = "type";

  final DateTime createTime;
  final EffectiveCacheDataParams params;

  EffectiveCacheData.create({@required this.createTime, this.params})
      : assert(params != null, "EffectiveCacheDataParams was null ");

  String toJson() {
    return jsonEncode({
      CreateTimeKey: createTime.millisecondsSinceEpoch,
      AdapterNameKey: params.adapterName,
      DataKey: params.data,
      RequestParamsKey: params.requestParams,
      AutoUpdateKey: params.autoUpdate,
      EffectiveDurationKey: params.effectiveDuration.inMilliseconds,
      MaxEffectivenessDurationKey:
          params.maxEffectivenessDuration.inMilliseconds,
      Type: params.type,
    });
  }

  @override
  bool operator ==(Object other) {
    if (other is EffectiveCacheData) {
      return jsonEncode(other.params.data) == jsonEncode(params.data);
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}

//需要缓存的相关参数
class EffectiveCacheDataParams {
  //接口的data
  final Map<String, dynamic> data;

  //请求接口的名字
  final String adapterName;

  //缓存id
  final String id;

  //分类
  final String type;

  //请求参数，非包含id请求参数
  final Map<String, dynamic> requestParams;

  //每个缓存允许存活的有效时间
  final Duration effectiveDuration;

  //超过有有效期后，最大还可以获取到数据的时间.用来清楚缓存
  final Duration maxEffectivenessDuration;

  //记录是否自动更新缓存
  final bool autoUpdate;

  EffectiveCacheDataParams.create(
      {@required this.data,
      this.effectiveDuration = DefaultEffectiveDuration,
      this.autoUpdate = true,
      this.maxEffectivenessDuration = DefaultMaxEffectivenessDuration,
      @required this.id,
      @required this.type,
      @required this.adapterName,
      @required this.requestParams});
}
