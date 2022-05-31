import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/service/http_cache_service/network_data_cache_service.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/package/service/icons_random_service.dart';
import 'package:fast_ai/package/service/lan_cache_service.dart';

/// @author king
/// @date 2021/6/1

//服务的注册中心

class FastAiService extends IService {
  @override
  String get name => "fast_ai.MainCenterService";

  IconsRandomService iconsRandom = new IconsRandomService();
  LanCacheService lanCacheService = new LanCacheService();
  NetworkDataCacheService networkDataCache;

  UserInfo get userInfoService => config.userInfo;

  @override
  Future<dynamic> init() async {
    //不要在任何服务里面做堵塞网络处理或长耗时的业务，否则抓出来游街。
    networkDataCache =
        NetworkDataCacheService.create(cache: ccPackage.components.cache);
    networkDataCache.init();
    iconsRandom.init();
    lanCacheService.init();
    userInfoService.init();
  }
}
