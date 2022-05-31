import 'dart:math';

import 'package:common_component/mvvm/model/service/service.dart';

/// @author king
/// @date 2021/6/1

///随机获取图片服务
class IconsRandomService extends IService {
  @override
  String get name => "IconsRandomService";

  final userHeaderCache = <String, _IConsCache>{};

  //按获取头像数目和时间缓存获取假头像，超过制定的时间会获取新的假头像。
  List<String> loadRandomUserHeaders(String key, int len, int maxTime) {
    if(userHeaderCache.length >1000){
      userHeaderCache.removeWhere((key, value) => key == userHeaderCache.entries.first.key);
    }
    _IConsCache cache = userHeaderCache["$key$len"];
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (null == cache || nowTime - cache.createTime > maxTime ) {
      cache = _IConsCache.create(headers: randomCreateFollowPlayers( len),
        createTime:nowTime, );
      userHeaderCache  ["$key$len"] = cache;
    }
    return cache.headers;
  }

  static const Max = 48;

  List<String> randomCreateFollowPlayers(int len) {
    len = min(len,Max );
    List<String> userHeadList = [];
    for (int index = 0; index < len; index++) {
      int i = Random().nextInt(Max);
      String headUrl = '/FE/common/head/' + '$i' + '_s_100x100.jpg';
      userHeadList.add(headUrl);
    }
    return userHeadList;
  }


  @override
  Future<dynamic> init() async {

  }
}

class _IConsCache{
  final List<String> headers;
  final int createTime;
  final int len;
  _IConsCache.create( {
    this.headers,
    this.createTime,
    this.len,
});
}
