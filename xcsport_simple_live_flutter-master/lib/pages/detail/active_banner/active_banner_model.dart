import 'package:fast_ai/utils/ai_json.dart';

class ActiveBannerModel{

  int bannerId;
  int bannerType;
  String gameType;
  int iconType;
  int urlType;
  int orders;
  String bannerColor;
  String url;
  String videoUrl;
  String gidm;
  String playType;
  String title;
  String content;
  String iconBig;
  String iconSmall;

  ActiveBannerModel();

  ActiveBannerModel.fromMap(Map<String,dynamic>map){
    if(map == null || map.isEmpty) return;
    bannerId = AiJson(map).getNum('bannerId');
    bannerType = AiJson(map).getNum('bannerType');
    gameType = AiJson(map).getString('gameType');
    iconType = AiJson(map).getNum('iconType');
    urlType = AiJson(map).getNum('urlType');
    orders = AiJson(map).getNum('orders');
    bannerColor = AiJson(map).getString('bannerColor');
    url = AiJson(map).getString('url');
    videoUrl = AiJson(map).getString('videoUrl');
    gidm = AiJson(map).getString('gidm');
    playType = AiJson(map).getString('playType');
    title = AiJson(map).getString('title');
    content = AiJson(map).getString('content');
    iconBig = AiJson(map).getString('iconBig');
    iconSmall = AiJson(map).getString('iconSmall');
  }
}