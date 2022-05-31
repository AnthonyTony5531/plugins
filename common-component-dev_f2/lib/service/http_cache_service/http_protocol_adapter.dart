// @author king
// @date 2021-06-21

import 'package:common_component/util/effective_time_data_cache.dart';


//缓存请求适配类，适配各种服务器的接口请求
abstract class HttpProtocolAdapter{
  String get adapterName;
  Future<List<EffectiveCacheDataParams>> request(List<String> ids,  Map<String, dynamic> requestParams);

}