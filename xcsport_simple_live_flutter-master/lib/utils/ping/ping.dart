import 'dart:async';
import 'dart:io';

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_date.dart';

class Ping {

  static final HK = "HK";
  static final CN2 = "CN2";


  //默认选择香港线路
  static String CHANNEL_SELECT = HK;
  static String CHANNEL_KEY = "CHANNEL_KEY";


  static final String pattern = '[?]';
  static Map<String, String> domains = {
//    'cn2.m.aisports.io': 'cn2.$pattern.aisports.io',
//    'm.aisports.io' : '$pattern.aisports.io'
    HK : 'm.aisports.io',
    CN2 : 'cn2.m.aisports.io'
  };

  //返回各个线路的链接建立的时间
  static Future<Map<String,int>> millSecond(){
    var futureResult = new Completer<Map<String,int>>();
    Map<String,int> hostDelay = new Map();

    Future.wait(domains.keys.map((v) => ping(domains[v]))).then((v) {
      hostDelay.putIfAbsent(HK, ()=>v[0]);
      hostDelay.putIfAbsent(CN2, ()=>v[1]);
      futureResult.complete(hostDelay);
    }).catchError((v) => print(v));

    return futureResult.future;
  }

  static Future<int> ping(String host, {times}) {
    var completer = new Completer<int>();
    times = times ?? 3;
    List<Future<int>> futures = List();
    for (var i = 0; i < times; i++) {
      futures.add(_connect(host, 80));
    }
    Future.wait(futures).then((v) {
      completer.complete(v.reduce((p, n) => p + n) ~/ times);
    });
    return completer.future;
  }
  static Future _connect(host, port){
    var completer = new Completer<int>();
    DateTime dt = DateTime.now();
    Socket.connect(host, 80, timeout: Duration(seconds: 2)).then((v) {
      print("我ping回来啦");
      completer.complete(DateTime.now().difference(dt).inMilliseconds);
    }).catchError((v) {
      completer.complete(DateTime.now().difference(dt).inMilliseconds);
    });
    return completer.future;
  }

  //一天缓存一次，同一天不会重复检测,只在release模式下生效
//  static config() {
//    if(Api.autoSelectDomain != true) return;
//    final String pattern = '[?]';
//    Map<String, String> domains = {
//      'cn2.m.aisports.io': 'cn2.$pattern.aisports.io',
//      'm.aisports.io' : '$pattern.aisports.io'
//    };
//    var now = AiDate.now('yyyyMMdd');
//    String cacheDomain = AiCache.get().getString('aisport_domain_route_$now');
//    //本地不切换
//    if(Api.baseImUrl.indexOf('dev.xc.com') >= 0) {
//      var yestoday = AiDate.now('yyyyMMdd', dateTime: DateTime.now().add(Duration(days: -1)));
//      AiCache.get().remove('aisport_domain_route_$now');
//      AiCache.get().remove('aisport_domain_route_$yestoday');
//      return;
//    }
//    if(cacheDomain != null && domains.containsKey(cacheDomain)) {
//      _resetUrl(domains[cacheDomain], cacheDomain);
//      return;
//    }
//    Future.wait(domains.keys.map((v) => Ping.ping(v))).then((v) {
//      print(v);
//      if(v.length == domains.length) {
//        var m = v.reduce(min);
//        var index = v.indexWhere((c) => c == m);
//        var domain = domains[domains.keys.elementAt(index)];
//        _resetUrl(domain, domains.keys.elementAt(index));
//      }
//    }).catchError((v) => print(v));
//  }

  static void resetUrl(String key) {
    var yestoday = AiDate.now('yyyyMMdd', dateTime: DateTime.now().add(Duration(days: -1)));
    var now = AiDate.now('yyyyMMdd');
    AiCache.get().setString('aisport_domain_route_$now', key);
    AiCache.get().remove('aisport_domain_route_$yestoday');
//    final String pattern = '[?]';
//    Api.baseImUrl = 'ws://${domain.replaceAll(pattern, 'm')}';
//    Api.baseMainUrl = 'http://${domain.replaceAll(pattern, 'm')}';
//    Api.baseImgUrl = 'http://${domain.replaceAll(pattern, 'img')}/';
//    Api.baseMainUrl = 'http://${domain.replaceAll(pattern, 'pc')}/';

    Api.baseUrlManualSet = 'http://${domains[key]}/ai/mobile/';
    config.apiConfig.headers['Referer'] = Api.baseUrl;
    NetHost.BASE_MAIN_URL = 'http://${domains[key]}';
    //TODO 后续优化。 先暂放
    if(CHANNEL_SELECT.toLowerCase() == "cn2")
      NetHost.BASE_IMG_URL = 'http://${CHANNEL_SELECT.toLowerCase()}.img.aisports.io';
    else
      NetHost.BASE_IMG_URL = 'http://cn2.img.aisports.io';
    NetHost.BASE_IM_URL = 'ws://${domains[key]}';
    //客服聊天地址
    Api.customerServiceManualSet = 'http://${domains[key]}/ai-service/?token=';
    //赛果详情查看地址:注单记录中使用
    Api.matchResultManualSet = 'http://${domains[key]}/gameOver/';
    print('自动选择最优路由：$key');
  }
}