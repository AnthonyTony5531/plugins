import 'package:dio/dio.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

class AiBannerSingleModel {
  num bannerType = 0;
  num bannerId = 0;
  String gameType = '';
  String gameTypeSon = '';
  num iconType = 0;
  num urlType = 0;
  String url = '';
  String videoUrl = '';
  String gidm = '';
  String playType = '';
  String title = '';
  String content = '';
  String iconBig = '';
  String iconSmall = '';
  String anchorId = '';
  num orders = 0;
  String adPosition = ''; // 1：直播页 2：冠军页 3：论坛首页

  Color bannerColor = Colors.black;

  AiBannerSingleModel fromBannersRspProtocol(dynamic bannerItem) {
    bannerType = AiJson(bannerItem).getNum('bannerType');
    bannerId = AiJson(bannerItem).getNum('bannerId');
    gameType = AiJson(bannerItem).getString('gameType');
    gameTypeSon = AiJson(bannerItem).getString('gameTypeSon');
    iconType = AiJson(bannerItem).getNum('iconType');
    urlType = AiJson(bannerItem).getNum('urlType');
    url = AiJson(bannerItem).getString('url');
    videoUrl = AiJson(bannerItem).getString('videoUrl');
    gidm = AiJson(bannerItem).getString('gidm');
    playType = AiJson(bannerItem).getString('playType');
    title = AiJson(bannerItem).getString('title');
    content = AiJson(bannerItem).getString('content');
    iconBig = AiJson(bannerItem).getString('iconBig');
    iconSmall = AiJson(bannerItem).getString('iconSmall');
    adPosition = AiJson(bannerItem).getString('adPosition');
    anchorId = AiJson(bannerItem).getString('anchorId');
    
    var color = AiJson(bannerItem).getString('bannerColor');
    if (color.startsWith("#")) {
      color = color.replaceAll("#", "FF");
      bannerColor = Color(int.tryParse(color, radix: 16));
    } else {
      bannerColor = Colors.black;
    }
    orders = AiJson(bannerItem).getNum('orders');

    return this;
  }

  String get overTitle {
    if (actionType == ActionType.HttpUrl) return "";
    if (actionType == ActionType.Action) return "";
    if (actionType == ActionType.League) return "";

    return title;
  }

  bool get enable {
    return true;
  }

  ActionType get actionType {
    if (!isNullOrEmpty(videoUrl)) return ActionType.Video;
    if (urlType == 1) return ActionType.HttpUrl;
    if (urlType == 2) return ActionType.League;
    if (urlType == 3) return ActionType.Game;
    if (urlType == 4) return ActionType.Action;
    return ActionType.None;
  }


}

enum ActionType {
  None,
  //视频
  Video,
  //外部链接
  HttpUrl,
  //转联赛
  League,
  //转比赛
  Game,
  //转活动页,需要拼接域名
  Action
}
