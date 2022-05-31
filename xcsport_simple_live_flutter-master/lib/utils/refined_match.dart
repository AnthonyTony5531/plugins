import 'package:dio/dio.dart';
import 'package:fast_ai/api/protocols/common/home_page_settings_protocol.dart';
import 'package:fast_ai/api/protocols/common/refined_match_protocol.dart';
import 'package:fast_ai/api/protocols/common/refined_protocol.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

class RefinedMatch{

  static RefinedMatchModel refinedMatchModel;
  static RefinedConfigModel refinedConfigModel;
  static String homePageSettings;  // 0:热门  1:精选
  // 商户配置精选是否为空
  static bool get merchantRefinedGameIsEmpty => homePageSettings == null;
  // 精选是否有比赛
  static bool get refinedGameIsEmpty => (refinedConfigModel?.refinedId == null || (refinedConfigModel?.refinedId ?? 0) <= 0);
  // 精选名称是否为空
  static bool get refinedNameIsEmpty => (isStrNullOrEmpty(refinedConfigModel?.refinedName));
  // 精选是否赛果比赛
  static bool get isFinishGame => (!isStrNullOrEmpty(refinedMatchModel?.isFinish) && refinedMatchModel?.isFinish == 'Y');
  // 精选没有比赛
  static bool get isNoGame => (isStrNullOrEmpty(refinedMatchModel?.systemId) && isStrNullOrEmpty(refinedMatchModel?.gidm));
  // 显示数据源配置精选页-首页默认选中(热门,精选)，true:首页默认选中精选 false:首页默认选中热门
  // isOptimal: 字段已经废弃掉
//  static bool get isShowRefinedGame => (refinedConfigModel?.isOptimal != null && refinedConfigModel?.isOptimal == 1);
  // 热门比赛
//  static bool get isShowHotGame => (refinedConfigModel?.isOptimal != null && refinedConfigModel?.isOptimal == 2);
  // 精选显示比赛详情
  static bool get isShowGameDetail => (refinedConfigModel?.isManual != null && refinedConfigModel?.isManual == 1);
  // 精选显示联赛详情
  static bool get isShowLeagueDetail => (refinedConfigModel?.isManual != null && refinedConfigModel?.isManual == 2);
  // 是否是欧洲杯
//  static bool get isEuro =>  isShowHotGame && isShowLeagueDetail && refinedConfigModel.leagueId == "41";//别删
  static bool get isEuro =>  isShowLeagueDetail;
  // 显示商户配置精选页 0:热门  1:精选
  static bool get isShowMerchantRefinedGame{
    if(homePageSettings != null){
      return homePageSettings == '1' && !refinedGameIsEmpty;
    }
    return false;
  }

  // 精选赛事配置名称
  static Future requestRefinedConfig({VoidCallback callback})async{
//    if(!RefinedMatch.refinedNameIsEmpty){
//      return;
//    }
    try{
      RefinedReqProtocol req = RefinedReqProtocol();
      var value = await req.request();
      Map<String, dynamic> map = value.data;
      final aiJson = AiJson(map);
      int refinedId = aiJson.getNum('refinedId');
      int sportPlatformId = aiJson.getNum('sportPlatformId');
      String refinedName = aiJson.getString('refinedName');
      int isOptimal = aiJson.getNum('isOptimal');
      String startTime = aiJson.getTimestampStr('startTime');
      String endTime = aiJson.getTimestampStr('endTime');
      int isManual = aiJson.getNum('isManual');
      String leagueId = aiJson.getString('leagueId');
      String icon = aiJson.getString('icon');
      String leagueColour = aiJson.getString('leagueColour');
      String leagueNameEn = aiJson.getString('leagueNameEn');
      String leagueNameCn = aiJson.getString('leagueNameCn');
      String leagueNameTw = aiJson.getString('leagueNameTw');
      String leagueNameAbbrEn = aiJson.getString('leagueNameAbbrEn');
      String leagueNameAbbrCn = aiJson.getString('leagueNameAbbrCn');
      String leagueNameAbbrTw = aiJson.getString('leagueNameAbbrTw');
      String gameType = aiJson.getString('gameType');

//      print('精选标识----:$isOptimal');
//      print('详情标识----:$isManual');
//      isOptimal = 1;
//      isManual = 2;
//      icon = 'images/base/league/20200211/20200211161302586_170x170.png';
//      leagueId = '475';

      refinedConfigModel = RefinedConfigModel(
          refinedId: refinedId,
          sportPlatformId: sportPlatformId,
          refinedName: refinedName,
          isOptimal: isOptimal,
          startTime: startTime,
          endTime: endTime,
          isManual: isManual,
          leagueId: leagueId,
          icon: icon,
          leagueColour: leagueColour,
          leagueNameEn: leagueNameEn,
          leagueNameCn:leagueNameCn,
          leagueNameTw: leagueNameTw,
          leagueNameAbbrEn: leagueNameAbbrEn,
          leagueNameAbbrCn: leagueNameAbbrCn,
          leagueNameAbbrTw: leagueNameAbbrTw,
          gameType: gameType,
          leagueBgColour: leagueNameColor(leagueColour),
      );
    }
    catch(e){
      print('获取精选名称错误');
    }
    finally{
      if(callback != null){
        callback();
      }
    }
    return Future.value(true);
  }

  static clearRefinedMatch(){
    try{
      refinedMatchModel?.systemId = '';
      refinedMatchModel?.gidm = '';
      refinedMatchModel?.showType = '';
      refinedMatchModel?.isFinish = '';
      refinedMatchModel?.anchorId = '';
    }
    catch(e){
      print('获取精选名称错误---------11');
    }
  }

  static clearRefinedName(){
    try{
      refinedConfigModel?.refinedName = '';
    }
    catch(e){}
  }

  // 精选赛事列表数据Id
  static Future requestRefinedMatch(
      { int refinedId,
        String gidm,
        String direction,
        int sportPlatformId ,
        String anchorId,
        int anchorOrders,
        VoidCallback callback})async{

    try{
      RefinedMatchReqProtocol req = RefinedMatchReqProtocol();
      req.refinedId = refinedId ?? '';
      req.gidm = gidm ?? '';
      req.direction = direction ?? '';
      req.sportPlatformId = sportPlatformId;
      req.anchorId = anchorId;
      req.anchorOrders = anchorOrders;
      var value = await req.request();
      Map<String, dynamic> map = value.data;
      final aiJson = AiJson(map);
      String refinedGidm = aiJson.getString('gidm');
      String showType = aiJson.getString('showType');
      String isFinish = aiJson.getString('isFinish');
      String systemId = aiJson.getString('systemId');
      String rAnchorId = aiJson.getString('anchorId');
      int rAnchorOrders = aiJson.getNum('anchorOrders');
      refinedMatchModel = RefinedMatchModel(
        gidm: refinedGidm,
        showType: showType,
        isFinish: isFinish,
        systemId: systemId,
        anchorId: rAnchorId,
        anchorOrders: rAnchorOrders
      );
    }
    catch(e){
      print('精选列表错误');
    }
    finally{
      if(callback != null){
        callback();
      }
    }
    return Future.value(true);
  }

  static Color leagueNameColor(String leagueColour, {Color defaultColor = const Color(0xFF43003F)}){
    if ((leagueColour?.length ?? 0) > 0) {
      String replaceStr = leagueColour;
      if (leagueColour.contains('#')) {
        replaceStr = leagueColour.replaceFirst('#', 'ff');
      }
      int value = int.tryParse(replaceStr,radix: 16) ?? 0;
      return Color(value);
    }
    return  defaultColor;
  }


  // 根据商户配置显示精选页，热门页 0:热门  1:精选
  static Future requestMerchantRefinedMatch({VoidCallback callback}) async{
    try {
      HomePageSettingsReqProtocol req = HomePageSettingsReqProtocol();
      var value = await req.request();
      if(value.isSuccess){
        homePageSettings = value.homePageSettings ?? '0';
      }
    }
    catch(e){
      print('精选列表错误--:${e.toString()}');
    }
    finally{
      if(callback != null){
        callback();
      }
    }
    return Future.value(true);
  }
}

class RefinedConfigModel{
  int refinedId;          //精选id
  int sportPlatformId;    //体育平台id
  String refinedName;     //精选名称
  // 2021-11-21该字段废弃了(跟着平台配置走)
  int isOptimal;          //是否优先展示，1是:精选(展示比赛详情)，2否:热门(isManual:1比赛详情 :2联赛详情)
  String startTime;       //优先展示开始时间
  String endTime;         //优先展示结束时间
  int isManual;           //是否手动，1，手动选择(比赛详情)，2关联联赛(联赛详情)
  String leagueId;        //联赛id
  String icon;            //联赛图片
  String leagueColour;    //联赛颜色
  String leagueNameEn;    //联赛英文全称
  String leagueNameCn;    //联赛中文全称
  String leagueNameTw;    //联赛繁文全称
  String leagueNameAbbrEn;//联赛英文简称
  String leagueNameAbbrCn;//联赛中文简称
  String leagueNameAbbrTw;//联赛繁文简称
  String gameType;        //体育项
  Color leagueBgColour;   //解析过后的颜色

  RefinedConfigModel({
    this.refinedId = 0,
    this.sportPlatformId = 0,
    this.refinedName = '',
    this.isOptimal = 2,
    this.startTime = '',
    this.endTime = '',
    this.isManual = 1,
    this.leagueId = '',
    this.icon = '',
    this.leagueColour = '',
    this.leagueNameEn = '',
    this.leagueNameCn = '',
    this.leagueNameTw = '',
    this.leagueNameAbbrEn =' ',
    this.leagueNameAbbrCn = '',
    this.leagueNameAbbrTw = '',
    this.gameType = '',
    this.leagueBgColour,
  });
}

class RefinedMatchModel{
  String systemId;  //系统id
  String gidm;      //赛程id
  String showType;  //FU:早盤/FT:今日/RB:滾球
  String isFinish;  //是否完场,Y已完场,N没有完场
  String anchorId;  //主播id
  int anchorOrders;//精选比赛详情一场比赛多个主播位置
  RefinedMatchModel({
    this.gidm,
    this.showType,
    this.isFinish,
    this.systemId,
    this.anchorId,
    this.anchorOrders,
  });
}