// @author king
// @date 2021-06-21

import 'dart:async';

import 'package:common_component/component/cache.dart';
import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/util/effective_time_data_cache.dart';
import 'package:flutter/cupertino.dart';

import 'http_protocol_adapter.dart';

//请求网络数据缓存服务
class NetworkDataCacheService extends IService {
  EffectiveTimeDataCache _timeDataCache;
  Duration checkTime;
  String key;
  NetworkDataCacheService.create(
      {this.key = "0",
        @required Cache cache,
        this.checkTime}) {
    _timeDataCache = EffectiveTimeDataCache(
      cache: cache,
    );
  }

  EffectiveTimeDataCache get etdCache => _timeDataCache;

  void addListener(String id, ValueChanged<EffectiveCacheData> valueChanged) {
    _timeDataCache.addListener(id, valueChanged);
  }

  void remove(String id, ValueChanged<EffectiveCacheData> valueChanged) {
    _timeDataCache.removeListener(id, valueChanged);
  }

  final _httpProtocolAdapterMap = <String, HttpProtocolAdapter>{};

  @override
  String get name => "common_component.HttpCacheService$key";

  Timer timer;

  @override
  Future<void> init() {
    timer = Timer.periodic(
        checkTime ?? Duration(minutes: 5), onTimed);
    return super.init();
  }

  void onTimed(timer) async {
    List<dynamic> keys = await this._timeDataCache.cache.getKeys();
    List<EffectiveCacheData> data = keys
        .where((element) => element.contains(EffectiveTimeDataCache.KeyPre))
        .map((e) {
      return _timeDataCache.getCache(e);
    }).toList();
    if (null != data && data.isNotEmpty) {
      data.forEach((element) {
        //超长失效的数据，清理掉,然后更新
        if(_timeDataCache.hasOverMaxEffectivenessTime(element)){
          _timeDataCache.cache.remove(key);
          if(element.params.autoUpdate){
            //缓冲服务器压力,免得服务器接口废物了。
            Future.delayed(Duration(milliseconds: 1*1000),(){
              loadHttpCache(
                ids: [element.params.id],
                params: element.params.requestParams,
                adapterName: key,
              );
            });
          }
        }
      });

    }
  }

  void addAdapter(List<HttpProtocolAdapter> adapter) {
    assert(adapter != null, "type must be not null");
    assert(adapter.isNotEmpty, "HttpProtocolAdapter must be not empty");
    adapter.forEach((element) {
      _httpProtocolAdapterMap[element.adapterName] = element;
    });
  }

  void removeAdapter(String adapterName) {
    _httpProtocolAdapterMap.remove(adapterName);
  }

  Future<void> removeByType(String type)async{
    await _timeDataCache.removeByType(type);
  }

  Future<List<EffectiveCacheData>> loadHttpCache({
    @required String adapterName,
    @required List<String> ids,
     Map<String, dynamic> params,
  }) async {
    final adapter = _httpProtocolAdapterMap[adapterName];
    assert(adapter != null, "$adapterName not found");
    assert(ids != null, "ids should be not num");
    params ??= {};
    List<EffectiveCacheData> ecd = [];
    //收集过期的id
    List<String> invalidateIds = [];
    //收集新数据的id
    List<String> newIds = [];
    ids.forEach((element) {
      var cdata = _timeDataCache.getCache(element);
      //如果缓存有数据，返回
      if (null != cdata) {
        ecd.add(cdata);
        //过期的加进去，下面需要异步更新
        if (_timeDataCache.isInvalidate(cdata)) {
          invalidateIds.add(element);
        }
      } else {
        //把本地没数据的id，加进去，请求获取
        newIds.add(element);
      }
    });
    if(invalidateIds.isNotEmpty){
      adapter.request(invalidateIds, params).then((value) => _update(value));
    }
    if (newIds.isNotEmpty) {
      final List<EffectiveCacheDataParams> list =
      await adapter.request(ids, params);
      if (null != list && list.isNotEmpty) {
        List<EffectiveCacheData> data = _update(list);
        ecd.addAll(data);
      }
    }
    return ecd;
  }

  List<EffectiveCacheData> _update(List<EffectiveCacheDataParams> list) {
    if(null== list){
      return [];
    }
    final List<EffectiveCacheData> cacheList = [];
    list?.forEach((element) {
      if (null != element) {
        cacheList.add(_timeDataCache.saveOrUpdate(element));
      }
    });
    return cacheList;
  }

  void saveOrUpdate(EffectiveCacheDataParams params) {
    _timeDataCache.saveOrUpdate(params);
  }
}
