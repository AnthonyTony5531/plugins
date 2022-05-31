import 'package:common_component/mvvm/view/view_observer.dart';
import 'package:common_component/util/disposable.dart';
import 'package:common_component/util/disposable_reference.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/detail_rate_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/models/play_group_model.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/detail/anchor_room_info/live_Room_Info.dart';
//import 'package:fast_ai/pages/detail/follow_order/follow_order_viewmodel.dart';
//import 'package:fast_ai/pages/detail/head/rbInfo/scoreModel.dart';
//import 'package:fast_ai/pages/detail/push_order/push_order_viewmodel.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/widgets.dart';

//详情页玩法导航id
class DPageId {
  //推单id
  static const PushOrder = "PushOrder";

  //跟单id
  static const FollowOrder = "FollowOrder";

  //全部玩法id
  static const AllPlays = "0";

  //自定义玩法
  static const CustomPlays = "cust";
}

enum DPageType {
  Normal,
  Anchor, //主播
  Killer, //大神
}

class DPageModel extends IDisposable {
  DisposableReference<ViewObserver> viewObserver;

  void notifyStateChanged() {
    viewObserver.ins?.updateState();
  }

  String selectGroupId = DPageId.AllPlays;
  bool isFirstLoading = true;
  MatchesDetailModel matchesDetailModel;
  DetailRateModel detailRateModel;
  PlayGroupModel playGroupModel;
//  ScoreModel scoreModel;
//  PushOrderViewModel pushOrderViewModel;
//  FollowOrderViewModel followOrderViewModel;

  Map get baseLang => config.langMap['baseLang'];
  var radioTypeLang = config.langMap['radioTypeLang'];

  //赔率跳动键值对
  //key: (gidm + gameType + gameId + playType + ratioType)
  //value: ior
  Map<String, double> varietyIorMap = {};

  //玩法导航数据
  List<DPagePlayNavModel> playNavModelList = [];

  //盘口
  List<DPageHandicapModel> handicapModelList = [];

  //盘口推送快速定位盘口
  Map<String, HandicapModel> handicapRatioDataMap = {};

  String matchBgImage() {
    String leagueBg = matchesDetailModel?.data?.leagueBackgroundImage;

    if (leagueBg != '' && leagueBg != null) {}

    String sport = matchesDetailModel?.data?.gameType ?? 'FT';

    if (sport == 'FT') {
      return 'bg_detail_football.png';
    } else if (sport == 'BK') {
      return 'bg_detail_basketball.png';
    }
    // else if (sport == 'OP_DJ') {
    //   return 'bg_detail_esports.png';
    // }
    return 'bg_detail_other.png';
  }

  bool isShowLeagueBg() {
    String leagueBg = matchesDetailModel?.data?.leagueBackgroundImage;
    return leagueBg != null && leagueBg != '';
  }

  DPageModel.create(
      {@required MatchesDetailModel matchesDetailModel,
      @required PlayGroupModel playGroupModel,
      @required DetailRateModel detailRateModel,
      @required dynamic varietyIorMap,
      @required ViewObserver observer}) {
    this.matchesDetailModel = matchesDetailModel;
    this.playGroupModel = playGroupModel;
    this.detailRateModel = detailRateModel;
    this.varietyIorMap = varietyIorMap;
    viewObserver = new DisposableReference<ViewObserver>(observer);
  }

  void update({Map<String, HandicapModel> handicapRatioData}) {
//    this.handicapRatioDataMap = handicapRatioData ?? this.handicapRatioDataMap;
//    this.pushOrderViewModel = pushOrderViewModel ?? this.pushOrderViewModel;
//    this.followOrderViewModel =
//        followOrderViewModel ?? this.followOrderViewModel;
  }

  Game game;

  void addPushOrderNav(List<PlayModel> allPlayModel, int index) {
    allPlayModel.removeWhere((element) => element.id == DPageId.PushOrder);

    if (null != allPlayModel && allPlayModel.isNotEmpty) {
      //移除已存在的推单
      PlayModel model = PlayModel();
      model.name = baseLang['detail']['betShare']['anchor'];

      model.id = DPageId.PushOrder;
      model.playData = [];
      allPlayModel.insert(index, model);
    }
  }

  void addFollowOrder(List<PlayModel> allPlayModel, int index) {
    //移除已存在的跟单
    allPlayModel.removeWhere((element) => element.id == DPageId.FollowOrder);
    if (null != allPlayModel && allPlayModel.isNotEmpty) {
      PlayModel model = PlayModel();
      model.name = baseLang['detail']['betShare']['killer'];
      model.id = DPageId.FollowOrder;
      model.playData = [];
      allPlayModel.insert(index, model);
    }
  }

  Future initData(
      {dynamic selectGroupId = '',
      bool isVirtualBetOver,
      Map<String, HandicapModel> handicapRatioData}) async {
    if (matchesDetailModel.data == null ||
        matchesDetailModel.data.detail == null ||
        (matchesDetailModel.data.detail.length == 0 &&
            (matchesDetailModel.data.subGameDetails == null ||
                matchesDetailModel.data.subGameDetails.length == 0))) {
      return;
    }
    this.selectGroupId = selectGroupId;
    if (handicapRatioData != null && handicapRatioData.isNotEmpty) {
      this.handicapRatioDataMap = handicapRatioData;
    }
    game = matchesDetailModel.data.getGame;

    String gameType = matchesDetailModel.data.gameType;
    String gameTypeSon = matchesDetailModel.data.gameTypeSon ?? '';
    if (!isNullOrEmpty(gameTypeSon)) {
      gameTypeSon = '_' + gameTypeSon;
    }
    //投注项比率
    dynamic rateMap = detailRateModel?.data?.rate ?? Map();

    // 版式偏好，0=小白版，1=老鸟版
    dynamic verType = config.userInfo.themeStyle;
    List<PlayModel> playModelsThemeStyle = verType == 0
        ? (playGroupModel.data?.novice ?? List<PlayModel>())
        : (playGroupModel.data?.veteran ?? List<PlayModel>());

    List<PlayModel> playModels = playModelsThemeStyle;

    //接口返回的全部玩法
    List<dynamic> allPlayTypeData =
        playModels.isNotEmpty ? playModels[0].playData : List<dynamic>();
    List<PlayModel> allPlayModel = [];
    List<PlayModel> playModelListFlag = playModelsThemeStyle; //临时使用，用于添加收藏

    bool hasCustomPlays = false;
    //收藏玩法添加
    if (playModelListFlag.length > 0) {
      List<String> collectPlayTypeList =
          AiCache.get().getStringList('collectPlayTypes') ?? [];
      if (collectPlayTypeList.length > 0) {
        PlayModel collPlayModel = PlayModel();
        collPlayModel.name = baseLang['detail']['custPlay'];
        collPlayModel.id = DPageId.CustomPlays;
        collPlayModel.playData = collectPlayTypeList;

        List<PlayModel> newPlayModelList = [];
        playModelListFlag.forEach((playModel) {
          newPlayModelList.add(playModel);
        });
        newPlayModelList.insert(1, collPlayModel);
        hasCustomPlays = newPlayModelList.isNotEmpty;
        allPlayModel = newPlayModelList;
      } else {
        allPlayModel = playModelsThemeStyle;
      }
    }

    //确保自定义玩法要加到全部玩法的后面
    // addPushOrderNav(allPlayModel, hasCustomPlays ? 2 : 1);
    // addFollowOrder(allPlayModel, hasCustomPlays ? 3 : 2);
addFollowOrder(allPlayModel, hasCustomPlays ? 2 : 1);
    //去除接口设置的重复玩法
    if (allPlayModel.length > 0) {
      allPlayModel = allPlayModel.where((playModel) {
        if (playModel != null) {
          List<dynamic> playDataList = [];
          playModel?.playData?.forEach((playData) {
            if (playDataList.indexOf(playData) == -1) {
              playDataList.add(playData);
            }
          });
          playModel.playData = playDataList;
        }
        return playModel != null && isNotEmpty(playModel.playData);
      }).toList();
    }

    //过滤数据
    List<Detail> detailList = [];
    String mainGidm = '';
    String mainGameId = '';
    detailList = matchesDetailModel.data.detail.where((detail) {
      mainGidm = detail.game.gidm;
      mainGameId = detail.game.mainGameId;
      bool detailFlag = detail.game.gOpen == 'Y';
      if (detailFlag) {
        detail.playData = detail.playData.where((playData) {
          dynamic newPlayType = playData.playType +
              (detail.game.session ?? '') +
              (detail.game.suffix ?? '');
          //bool playDataFlag = true;
          bool playDataFlag =
              playData.sw == 'Y' && allPlayTypeData.indexOf(newPlayType) > -1;

          //过滤1X2玩法不显示N
          if (config.fiexd.playType1X2.contains(playData.playType) &&
              !config.fiexd.gameType1X2.contains(gameType)) {
            playData.ratioData = playData.ratioData.where((ratioData) {
              return !config.fiexd.playType1X2RatioTypeN
                  .contains(ratioData.ratioType);
            }).toList();
          }
          //当SW=Y，ior!=''时，玩法显示
          playData.ratioData = playData.ratioData.where((ratioData) {
            return ratioData.ior != '';
          }).toList();

          //IBO锁盘逻辑处理：当SW=Y，ior='0.000'时，可做锁盘处理
          //当SW=Y，ior='0'时，玩法应不显示，需要隐藏
          // playData.ratioData = playData.ratioData.where((ratioData) {
          //   if (config.userInfo.sportPlatformId == SportPlatform.AI) {
          //     return ratioData.ior != '' && ratioData.ior != '0';
          //   } else {
          //     if (game.gidm.toString().startsWith('ic')) {
          //       return ratioData.ior != '';
          //     } else {
          //       return ratioData.ior != '' &&
          //           double.parse(ratioData.ior?.toString() ?? '0') > 0;
          //     }
          //   }
          // }).toList();

          //小白 大小/让球 非整数处理处理
          bool flag = true;
          // if (verType == 0 && config.fiexd.verType2OU.contains(playData.playType)) {
          //   flag = false;
          //   if (playData.ratioData.length > 0 && playData.ratioData[0].ratio != '') {
          //     String ratioStr = playData.ratioData[0].ratio.toString();
          //     if (ratioStr.contains('/') == false) {
          //       double ratio = double.parse(ratioStr);
          //       if (ratio % 1 == 0) {
          //         flag = true;
          //       }
          //     }
          //   }
          // }
          return playDataFlag && playData.ratioData.length > 0 && flag;
        }).toList();
      }
      return detailFlag && detail.playData.length > 0;
    }).toList();

    List<Detail> detailSuffixList = [];
    if (matchesDetailModel.data.subGameDetails != null) {
      matchesDetailModel.data.subGameDetails.forEach((subGameDetail) {
        List<Detail> flagList = [];
        String suffix =
            config.fiexd.suffixNameToSuffixPlay(subGameDetail.homeTeamSuffix);

        // if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['conner']) > -1) {
        //   suffix = '_conner'; //角球
        // } else if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['card']) > -1) {
        //   suffix = '_card'; //罚牌
        // } else if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['OT']) > -1) {
        //   suffix = '_OT'; //加时赛
        // } else if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['PS']) > -1) {
        //   suffix = '_PS'; // 点球
        // } else if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['promote']) > -1) {
        //   suffix = '_promote'; //会晋级
        // }
        // else if (subGameDetail.homeTeamSuffix.indexOf(baseLang['detail']['champion']) > -1) {
        //   suffix = '_champion'; //冠军
        // }

        flagList = subGameDetail.detail.where((detail) {
          detail.game.suffix = suffix;
          detail.game.gidm = subGameDetail.gidm;
          bool detailFlag = detail.game.gOpen == 'Y';
          if (detailFlag) {
            detail.playData = detail.playData.where((playData) {
              dynamic newPlayType = playData.playType +
                  (detail.game.session ?? '') +
                  (detail.game.suffix ?? '');
              //bool playDataFlag = true;
              bool playDataFlag = playData.sw == 'Y' &&
                  allPlayTypeData.indexOf(newPlayType) > -1;

              //过滤1X2玩法不显示N
              if (config.fiexd.playType1X2.contains(playData.playType) &&
                  !config.fiexd.gameType1X2.contains(gameType)) {
                playData.ratioData = playData.ratioData.where((ratioData) {
                  return !config.fiexd.playType1X2RatioTypeN
                      .contains(ratioData.ratioType);
                }).toList();
              }

              //当SW=Y，ior!=''时，玩法显示
              playData.ratioData = playData.ratioData.where((ratioData) {
                return ratioData.ior != '';
              }).toList();

              //IBO锁盘逻辑处理：当SW=Y，ior='0.000'时，可做锁盘处理
              //当SW=Y，ior='0'时，玩法应不显示，需要隐藏
              // playData.ratioData = playData.ratioData.where((ratioData) {
              //   if (config.userInfo.sportPlatformId == SportPlatform.AI) {
              //     return ratioData.ior != '' && ratioData.ior != '0';
              //   } else {
              //     if (game.gidm.toString().startsWith('ic')) {
              //       return ratioData.ior != '';
              //     } else {
              //       return ratioData.ior != '' &&
              //           double.parse(ratioData.ior?.toString() ?? '0') > 0;
              //     }
              //   }
              // }).toList();

              //小白 大小/让球 非整数处理处理
              bool flag = true;
              // if (verType == 0 && config.fiexd.verType2OU.contains(playData.playType)) {
              //   flag = false;
              //   if (playData.ratioData.length > 0 && playData.ratioData[0].ratio != '') {
              //     String ratioStr = playData.ratioData[0].ratio.toString();
              //     if (ratioStr.contains('/') == false) {
              //       double ratio = double.parse(ratioStr);
              //       if (ratio % 1 == 0) {
              //         flag = true;
              //       }
              //     }
              //   }
              // }
              return playDataFlag && playData.ratioData.length > 0 && flag;
            }).toList();
          }
          return detailFlag && detail.playData.length > 0;
        }).toList();

        detailSuffixList.addAll(flagList);
      });
      if (detailSuffixList.length > 0) {
        detailList.addAll(detailSuffixList);
      }
    }

    Map<String, DPageHandicapModel> mapHandicapMode = {};

    //重组需要显示的数据
    detailList.forEach((detail) {
      detail.playData.forEach((playData) {
        dynamic newPlayType = playData.playType +
            (detail.game.session ?? '') +
            (detail.game.suffix ?? '');
        DPageHandicapModel handicapModel;

        //dynamic gameId, gidm, hgid, hstrong, strong, sw;
        DPagePlayDataModel playDataModel = DPagePlayDataModel();
//        SourceCompany sc = config.getSourceCompanyGidm(detail.game.gidm);
//        if (sc == SourceCompany.SD) {
//          playDataModel.gidm = matchesDetailModel.data.gidm;
//        } else {
//          playDataModel.gidm = detail.game.gidm ?? matchesDetailModel.data.gidm;
//        }

        playDataModel.mainGameId = mainGameId;
        playDataModel.mainGidm = mainGidm;
        playDataModel.gameId = detail.game.gameId;
        playDataModel.hgid = detail.game.hgid;
        playDataModel.strong = detail.game.strong;
        playDataModel.hstrong = detail.game.hstrong;
        playDataModel.sw = playData.sw;
        playDataModel.rt = playData.rt;
        playDataModel.playType = playData.playType;
        playDataModel.specifiers = playData.specifiers;

        //playDataModel
        if (isStrNullOrEmpty(detail.game.suffix)) {
          List<String> showRatePlayType = [];
          if (gameType == 'FT') {
            showRatePlayType = config.fiexd.showRatePlayType['FT'];
          } else {
            showRatePlayType = config.fiexd.showRatePlayType['OTHER'];
          }

          if (['BK', 'TN', 'BK_AFT'].contains(gameType)) {
            if (showRatePlayType.contains(playData.playType) &&
                detail.game.session == '0') {
              playDataModel.isShowRate = true;
            }
          } else if (showRatePlayType.contains(playData.playType)) {
            playDataModel.isShowRate = true;
          }
        }

        String playType1 = playData.playType;
        // if (playType1.indexOf('_') > -1) {
        //   List<String> plArr = playType1.split('_');
        //   String suffix1 = '_' + plArr[1];
        //   if (config.fiexd.suffixPlayType.indexOf(suffix1) > -1) {
        //     playType1 = plArr[0];
        //   }
        // }

        var colKey = "${gameType + gameTypeSon}.$playType1.col";
        var colKey2 = "$playType1.col";

        var sortKey = '${gameType + gameTypeSon}.$playType1.sort';
        var sortKey2 = '$playType1.sort';

        playDataModel.col =
            AiJson(radioTypeLang).getNum(colKey, defaultValue: -1);
        if (playDataModel.col == -1) {
          playDataModel.col =
              AiJson(radioTypeLang).getNum(colKey2, defaultValue: -1);
        }
        //处理兼容去除suffix: _conner,_PS等读取（IBO子比赛）
        if (playDataModel.col == -1) {
          playDataModel.col = 2;
          if (playType1.indexOf('_') > -1) {
            List<String> plArr = playType1.split('_');
            String suffix1 = '_' + plArr[1];
            if (config.fiexd.suffixPlayType.indexOf(suffix1) > -1) {
              colKey = colKey.replaceAll(suffix1, '');
              colKey2 = colKey2.replaceAll(suffix1, '');
              sortKey = sortKey.replaceAll(suffix1, '');
              sortKey2 = sortKey2.replaceAll(suffix1, '');
            }
            playDataModel.col =
                AiJson(radioTypeLang).getNum(colKey, defaultValue: -1);
            if (playDataModel.col == -1) {
              playDataModel.col =
                  AiJson(radioTypeLang).getNum(colKey2, defaultValue: 2);
            }
          }
        }

        if (playDataModel.ratioDataModelList == null) {
          playDataModel.ratioDataModelList = [];
        }

        List<String> sortArr = AiJson(radioTypeLang)
            .getArray(sortKey)
            .map((f) => f.toString())
            .toList();
        if (sortArr.length == 0) {
          sortKey = sortKey2;
          sortArr = AiJson(radioTypeLang)
              .getArray(sortKey)
              .map((f) => f.toString())
              .toList();
        }
        playData.ratioData.forEach((ratioData) {
          String rateKey =
              '${playDataModel.gameId}.${playData.playType}.${ratioData.ratioType}';
          String rate = AiJson(rateMap).getString(rateKey, defaultValue: '0');
          var tmpRate = double.parse(rate);
          rate = tmpRate.toStringAsFixed(1);
          //playData.playType

          DPageRatioDataModel ratioDataModel = DPageRatioDataModel();
          ratioDataModel.ior = ratioData.ior;
          ratioDataModel.sw = ratioData.sw;
          ratioDataModel.ratio = ratioData.ratio;
          ratioDataModel.ratioType = ratioData.ratioType;
          ratioDataModel.rate =
              detailRateModel?.data?.rate == null ? '-' : rate;

          ratioDataModel.isHide = false;
          ratioDataModel.optionId = ratioData.optionId;
          ratioDataModel.pgidm = detail?.game?.gidm;
          //print('playDataModel.gidm:${playDataModel.gidm}----------------detail.game.gidm:${detail.game.gidm}');

          ratioDataModel.ratioTypeSort =
              sortArr.indexOf(ratioDataModel.ratioType);
          if (config.fiexd.gameType1X2.indexOf(gameType) == -1) {
            playDataModel.col = 2;
          }

          //gidm + gameType + gameId + playType + ratioType
          String varietyKey =
              '${playDataModel.gidm}$gameType${playDataModel.gameId}${playData.playType}${ratioData.ratioType}';
          double varietyValue = varietyIorMap[varietyKey];
          double ior = double.parse(ratioData.ior.toString() ?? '0');
          if (varietyValue != null) {
            double vIor = varietyValue;
            if (vIor == ior) {
              ratioDataModel.variety = '';
            } else if (vIor > ior) {
              ratioDataModel.variety = 'down';
            } else if (vIor < ior) {
              ratioDataModel.variety = 'up';
            }
            varietyIorMap[varietyKey] = ior;
          } else {
            ratioDataModel.variety = '';
            varietyIorMap[varietyKey] = ior;
          }
          playDataModel.ratioDataModelList.add(ratioDataModel);
        });
        //投注项排序
        if (playData.rt != '1') {
          playDataModel.ratioDataModelList
              .sort((a, b) => a.ratioTypeSort.compareTo(b.ratioTypeSort));
        } else {
          playDataModel.ratioDataModelList
              .sort((a, b) => a.ratioType.compareTo(b.ratioType));
        }

//        //波胆处理
//        if (config.fiexd.playTypePD.indexOf(playData.playType) > -1 &&
//            !config.fiexd.gameTypeNoPlayPD.contains(gameType)) {
//          playDataModel.pdRatioDataModelList =
//              pdSort(playDataModel.ratioDataModelList, scoreModel);
//        }

        if (!mapHandicapMode.containsKey(newPlayType)) {
          handicapModel = DPageHandicapModel();
          handicapModel.newPlayType = newPlayType;
          handicapModel.playType = playData.playType;
          handicapModel.session = detail.game.session ?? '';
          handicapModel.suffix = detail.game.suffix ?? '';
          handicapModel.sw = playData.sw;
          handicapModel.rt = playData.rt;
          handicapModel.specifiers = playData.specifiers;
          mapHandicapMode[newPlayType] = handicapModel;
        } else {
          handicapModel = mapHandicapMode[newPlayType];
        }
        if (handicapModel.playDataModelList == null) {
          handicapModel.playDataModelList = [];
        }
        handicapModel.playDataModelList.add(playDataModel);
        // 推送盘口时快速定位
        String handicapKey =
            playDataModel.gidm + playDataModel.gameId + playDataModel.playType;
        handicapModel.handicapPlayDataMap[handicapKey] = playDataModel;
        if (handicapRatioDataMap != null && handicapRatioDataMap.isNotEmpty) {
          // 推送盘口开关
          HandicapModel handicapModel = handicapRatioDataMap[handicapKey];
          if (handicapModel != null) {
            playDataModel?.handicapModel = handicapModel;
            for (DPageRatioDataModel ratioData
                in playDataModel.ratioDataModelList) {
              ratioData.sw = handicapModel.sw;
            }
          }
        }
      });
    });

    List<DPageHandicapModel> flagHandicapModelList = [];
    List<String> allShowPlayType = []; //所有可以显示的playtype

    //处理 自动刷新、切换比赛 选中nav口问题
    if (selectGroupId != '') {
      List<PlayModel> playModelList = allPlayModel.where((playModel) {
        //推单和跟单用全部玩法数据
        if (DPageId.PushOrder == selectGroupId ||
            DPageId.FollowOrder == selectGroupId) {
          return playModel.id == DPageId.AllPlays;
        }
        return playModel.id == selectGroupId;
      }).toList();
      if (playModelList.length > 0) {
        List<String> flagPlayList = mapHandicapMode.keys.where((key) {
          return playModelList[0].playData.indexOf(key) > -1;
        }).toList();
        if (flagPlayList.length == 0) {
          selectGroupId = '';
        }
      } else {
        selectGroupId = '';
      }
    }

    mapHandicapMode.keys.forEach((playType) {
      allShowPlayType.add(playType);

      DPageHandicapModel dPageHandicapModelFlag = mapHandicapMode[playType];
      dPageHandicapModelFlag.playTypeSort =
          allPlayTypeData.indexOf(mapHandicapMode[playType].newPlayType);

      String playKey =
          "${gameType + gameTypeSon}_$playType${dPageHandicapModelFlag.session ?? ''}${dPageHandicapModelFlag.suffix ?? ''}";
      String playTypeName =
          AiJson(config.userInfo.getPlayNameData).getString(playKey);
      if (isStrNullOrEmpty(playTypeName)) {
        playKey =
            "wf.${gameType + gameTypeSon}_$playType${dPageHandicapModelFlag.session ?? ''}${dPageHandicapModelFlag.suffix ?? ''}";
        playTypeName = AiJson(baseLang).getString(playKey);
      }

      const regExpSearch = r"{(.*?)}";
      RegExp exp = RegExp(regExpSearch);
      var matchs = exp.allMatches(playTypeName);

      if (matchs.isEmpty == false) {
        if (dPageHandicapModelFlag.playDataModelList.length == 1) {
          flagHandicapModelList.add(dPageHandicapModelFlag);
        } else {
          String specifiersStr = '';

          Map<String, List<DPagePlayDataModel>> mapPlayDataModelList = {};
          dPageHandicapModelFlag.playDataModelList
              .forEach((dPagePlayDataModelFlag) {
            specifiersStr = dPagePlayDataModelFlag.specifiers.toString();
            String key =
                dPageHandicapModelFlag.newPlayType + '@@' + specifiersStr;
            if (mapPlayDataModelList[key] == null) {
              List<DPagePlayDataModel> playDataModelList = [];
              playDataModelList.add(dPagePlayDataModelFlag);
              mapPlayDataModelList[key] = playDataModelList;
            } else {
              mapPlayDataModelList[key].add(dPagePlayDataModelFlag);
            }
          });
          print(mapPlayDataModelList);

          List<DPageHandicapModel> flagHandicapModelListKey = [];
          mapPlayDataModelList.keys.forEach((key) {
            DPageHandicapModel dPageHandicapModelFlag1 = DPageHandicapModel();
            dPageHandicapModelFlag1.playType = dPageHandicapModelFlag.playType;
            dPageHandicapModelFlag1.session = dPageHandicapModelFlag.session;
            dPageHandicapModelFlag1.sw = dPageHandicapModelFlag.sw;
            dPageHandicapModelFlag1.suffix = dPageHandicapModelFlag.suffix;
            dPageHandicapModelFlag1.newPlayType =
                dPageHandicapModelFlag.newPlayType;
            dPageHandicapModelFlag1.playTypeSort =
                dPageHandicapModelFlag.playTypeSort;
            dPageHandicapModelFlag1.playDataModelList =
                mapPlayDataModelList[key];
            dPageHandicapModelFlag1.specifiers =
                mapPlayDataModelList[key][0].specifiers;
            flagHandicapModelListKey.add(dPageHandicapModelFlag1);
          });

          //第N地图，N局数 排序
          flagHandicapModelListKey.sort((a, b) {
            dynamic flag1 =
                a.specifiers['framenr'] ?? a.specifiers['mapnr'] ?? 0;
            dynamic flag2 =
                b.specifiers['framenr'] ?? b.specifiers['mapnr'] ?? 0;

            dynamic roundnr1 = 0; // a.specifiers['roundnr'] ?? 0;
            dynamic roundnr2 = 0; //b.specifiers['roundnr'] ?? 0;
            num num1 =
                num.parse(flag1.toString()) + num.parse(roundnr1.toString());
            num num2 =
                num.parse(flag2.toString()) + num.parse(roundnr2.toString());
            return num1.compareTo(num2);
          });
          flagHandicapModelList.addAll(flagHandicapModelListKey);
        }
      } else {
        flagHandicapModelList.add(dPageHandicapModelFlag);
      }
    });

    //玩法导航数据处理
    List<DPagePlayNavModel> flagPlayNavModelList = [];

    int flagCount = 0;
    List<dynamic> currPlayData = [];
    allPlayModel.forEach((playModel) {
      DPagePlayNavModel flagDPagePlayNavModel = DPagePlayNavModel();
      flagDPagePlayNavModel.name = playModel.name;
      flagDPagePlayNavModel.id = playModel.id;
      if (playModel.id == DPageId.FollowOrder ||
          playModel.id == DPageId.PushOrder) {
        if (playModel.id == DPageId.PushOrder) {
          flagDPagePlayNavModel.type = DPageType.Anchor;
        } else {
          flagDPagePlayNavModel.type = DPageType.Killer;
        }
        //推单和跟单用全部玩法数据
        flagDPagePlayNavModel.isSelect =
            selectGroupId.toString() == playModel.id;
        playModel.playData = allPlayModel
            .firstWhere((element) => element.id == DPageId.AllPlays)
            .playData;
      }
      if (selectGroupId == '') {
        if (flagCount == 0) {
          flagDPagePlayNavModel.isSelect = true;
        } else {
          flagDPagePlayNavModel.isSelect = false;
        }
      } else {
        flagDPagePlayNavModel.isSelect =
            selectGroupId.toString() == playModel.id;
      }
      flagDPagePlayNavModel.count = 0;
//      //计算导航的数目
//      if (flagDPagePlayNavModel.id == DPageId.PushOrder) {
//        flagDPagePlayNavModel.count = pushOrderViewModel?.total ?? 0;
//      } else if (flagDPagePlayNavModel.id == DPageId.FollowOrder) {
//        flagDPagePlayNavModel.count = followOrderViewModel?.total ?? 0;
//      } else {
//        playModel.playData.forEach((key) {
//          List<DPageHandicapModel> countList =
//              flagHandicapModelList.where((dPageHandicapModel) {
//            return dPageHandicapModel.newPlayType == key;
//          }).toList();
//          flagDPagePlayNavModel.count += countList.length;
//          // if (allShowPlayType.indexOf(key) > -1) {
//          //   flagDPagePlayNavModel.count += 1;
//          // }
//        });
//      }

      if (flagDPagePlayNavModel.count > 0) {
        flagPlayNavModelList.add(flagDPagePlayNavModel);
      }
      if (flagDPagePlayNavModel.isSelect) {
        currPlayData = playModel.playData;
      }
      flagCount += 1;
    });

    //玩法导航
    playNavModelList = flagPlayNavModelList;

    flagHandicapModelList = flagHandicapModelList.where((handicapModel) {
      return currPlayData.indexOf(handicapModel.newPlayType) > -1;
    }).toList();

//    //多盘口排序
//    flagHandicapModelList.forEach((item) {
//      if (config.fiexd.verType2OU.contains(item.playType) ||
//          config.fiexd.letBallMap.contains(item.playType)) {
//        item.playDataModelList.sort((a, b) {
//          DPageRatioDataModel aRotiaModel;
//          List<DPageRatioDataModel> aRotiaListModel =
//              a.ratioDataModelList.where((model) {
//            return model.ratioType.toString().endsWith('H');
//          }).toList();
//          if (aRotiaListModel.length > 0) {
//            aRotiaModel = aRotiaListModel[0];
//          } else {
//            aRotiaModel = a.ratioDataModelList[0];
//          }
//
//          DPageRatioDataModel bRotiaModel;
//          List<DPageRatioDataModel> bRotiaListModel =
//              b.ratioDataModelList.where((model) {
//            return model.ratioType.toString().endsWith('H');
//          }).toList();
//          if (bRotiaListModel.length > 0) {
//            bRotiaModel = bRotiaListModel[0];
//          } else {
//            bRotiaModel = b.ratioDataModelList[0];
//          }
//
////          String aRatio = config.match.getStrongRatio(
////              isChangeRatioNum: true,
////              ratio: aRotiaModel.ratio,
////              ratioType: aRotiaModel.ratioType,
////              playType: item.playType,
////              strong: a.strong,
////              hstrong: a.hstrong,
////              formatType: '1',
////              gidm: a.gidm);
////          var aRatioNum = isStrNullOrEmpty(aRatio) ? 0 : double.parse(aRatio);
//
////          String bRatio = config.match.getStrongRatio(
////              isChangeRatioNum: true,
////              ratio: bRotiaModel.ratio,
////              ratioType: bRotiaModel.ratioType,
////              playType: item.playType,
////              strong: b.strong,
////              hstrong: b.hstrong,
////              formatType: '1',
////              gidm: b.gidm);
//          var bRatioNum = isStrNullOrEmpty(bRatio) ? 0 : double.parse(bRatio);
//          return aRatioNum.compareTo(bRatioNum);
//        });
//      }
//    });
    handicapModelList = flagHandicapModelList;
    //玩法排序
    handicapModelList.sort((a, b) => a.playTypeSort.compareTo(b.playTypeSort));
    notifyStateChanged();
  }

  int getCol() {
    int col = -1;

    return col;
  }

//  //波胆处理
//  List<DPagePDRatioDataModel> pdSort(
//      List<DPageRatioDataModel> ratioDataModelList, ScoreModel scoreModel) {
//    List<DPageRatioDataModel> leftRatioDataModelList = [];
//    List<DPageRatioDataModel> drawRatioDataModelList = [];
//    List<DPageRatioDataModel> rightRatioDataModelList = [];
//    // List<String> otherRatioType = ['ROVH', 'OVH', 'HROVH', 'HOVH'];
//
//    ratioDataModelList.forEach((ratioData) {
//      if (ratioData.ratioType.toString().indexOf('OV') == -1) {
//        int length = ratioData.ratioType.toString().length;
//        int a = int.parse(
//            ratioData.ratioType.toString().substring(length - 3, length - 2));
//        int b = int.parse(
//            ratioData.ratioType.toString().substring(length - 1, length));
//        ratioData.sort1 = a;
//        ratioData.sort2 = b;
//        //非滚球
//        if (isStrNullOrEmpty(scoreModel.awayScore)) {
//          if (a > b) {
//            leftRatioDataModelList.add(ratioData);
//          } else if (a < b) {
//            rightRatioDataModelList.add(ratioData);
//          } else {
//            drawRatioDataModelList.add(ratioData);
//          }
//        } else {
//          int homeScore = int.parse(scoreModel?.homeScore);
//          int awayScore = int.parse(scoreModel?.awayScore);
//          if (homeScore > a) {
//          } else if (awayScore > b) {
//          } else {
//            if (a > b) {
//              leftRatioDataModelList.add(ratioData);
//            } else if (a < b) {
//              rightRatioDataModelList.add(ratioData);
//            } else {
//              drawRatioDataModelList.add(ratioData);
//            }
//          }
//        }
//      } else if (!isStrNullOrEmpty(ratioData.ratioType)) {
//        if (config.fiexd.playTypePDRatioType.indexOf(ratioData.ratioType) >
//            -1) {
//          ratioData.sort1 = 100;
//          ratioData.sort2 = 100;
//          ratioData.ratio = baseLang['detail']['other'];
//          leftRatioDataModelList.add(ratioData);
//        }
//      }
//    });
//
//    List<DPagePDRatioDataModel> pdRatioDataModelList = [];
//
//    pdRatioDataModelList.add(DPagePDRatioDataModel(leftRatioDataModelList));
//    if (drawRatioDataModelList.length > 0) {
//      pdRatioDataModelList.add(DPagePDRatioDataModel(drawRatioDataModelList));
//    }
//    pdRatioDataModelList.add(DPagePDRatioDataModel(rightRatioDataModelList));
//
//    pdRatioDataModelList.forEach((item) {
//      item.ratioDataModelList.sort((a, b) {
//        return a.sort2.compareTo(b.sort2);
//      });
//      item.ratioDataModelList.sort((a, b) {
//        return a.sort1.compareTo(b.sort1);
//      });
//    });
//
//    return pdRatioDataModelList;
//  }

  @override
  void dispose() {
    viewObserver.dispose();
  }

//  void refreshFollowOrder() {
//    followOrderViewModel?.refresh();
//  }

//  void refreshPushOrder() {
//    pushOrderViewModel?.refresh();
//  }
}

class DPageHandicapModel {
  dynamic playType, session, suffix, sw, rt, newPlayType;
  int playTypeSort = -1;
  Map specifiers = {};
  List<DPagePlayDataModel> playDataModelList;

  //用于推送时快速定位盘口：Key：gidm+gameId+playType;
  Map<String, DPagePlayDataModel> handicapPlayDataMap = {};
}

class DPagePlayDataModel {
  dynamic gameId,
      gidm,
      hgid,
      hstrong,
      strong,
      sw,
      col,
      rt,
      mainGidm,
      mainGameId,
      playType;
  Map specifiers = {};
  bool isShowRate = false;
  List<DPageRatioDataModel> ratioDataModelList;
  List<DPagePDRatioDataModel> pdRatioDataModelList;

  //推送盘口
  HandicapModel handicapModel = HandicapModel();
}

//波胆
class DPagePDRatioDataModel {
  DPagePDRatioDataModel(ratioDataModelList) {
    this.ratioDataModelList = ratioDataModelList;
  }

  List<DPageRatioDataModel> ratioDataModelList;
}

class DPageRatioDataModel {
  dynamic ior, ratio, ratioType, variety, rate, isHide, sw, optionId, pgidm;
  int ratioTypeSort = -1;

  //波胆排序
  int sort1 = -1;
  int sort2 = -1;
}

class DPagePlayNavModel {
  dynamic id, name, count, isSelect;
  DPageType type = DPageType.Normal;

  DPagePlayNavModel();

  DPagePlayNavModel.create(
      {@required this.id,
      @required this.name,
      this.count = 0,
      this.type = DPageType.Normal,
      this.isSelect = false});
}

//详情参数
class DetailParams {
  DetailParams({
    this.gidm,
    this.pid = '',
    this.gameType,
    this.showtype,
    this.homeTeam,
    this.awayTeam,
    this.homeLogo,
    this.awayLogo,
    this.leagueName,
    this.gameDate,
    this.anchorId,
    this.anchorName,
    this.anchorIcon,
    this.anchorCover,
    this.anchorUrl,
    this.isReserve,
    this.liveParams,
    this.reverseVideoUrl, //预约视频链接
    this.playPriority = PlayPriority.anchor,
    this.type,
    this.fromPage,
    this.groupId, ////如果params中包含groupId使用该id进入赛果-用于投注单记录显示比赛未完场状态下进入比赛详情，但比赛实际已经结束状态
    this.packetId,
    this.systemId,
    this.startTime,
    this.systemTime,
    this.isDetailMoreLiveChange,
    this.intoDetailPath = IntoDetailPath.normal,
    this.isListDetail = false,
    this.isFreeAnchor = false,
    this.isFreeAnchorListEntry = false,
    this.data,
    this.anchorLiveStatus = 0,
    this.watchTotal = 0,
    this.liveGame,
    this.liveId,
    this.liveStatus,
    this.isFreeLiveGameAnchor = false,
    this.wishGiftSwitch,
    this.announcement,
    this.livePopularity = 200,
    this.gameKey,
    this.gameMessage,
    this.freeLiveRoomInfo,
    this.isFreeAnchorListChatRoom = false,
  });
  Map<String, dynamic> data; //复用列表或其他地方的json，用来马上显示头部信息
  String gidm;
  String pid;
  String gameType;
  String showtype;
  String homeTeam;
  String awayTeam;
  String homeLogo;
  String awayLogo;
  bool isFreeAnchor;//自由播
  bool isFreeAnchorListEntry = false; // 自由主播列表进入
  String leagueName;
  int gameDate;
  String anchorId;
  String anchorIcon; // 主播头像
  String anchorCover; // 主播封面图
  String anchorName; // 主播名字
  String anchorUrl; // 视频url
  String isReserve; // 是否预约主播或直播视频
  String reverseVideoUrl;
  Map<String, dynamic> liveParams;
  PlayPriority playPriority;
  String type; //1主播直播。2。视频直播
  String groupId;
  String fromPage;
  String packetId;
  String systemId;
  int startTime;
  int systemTime;
  bool allLoadFinished = false;
  bool isDetailMoreLiveChange = false; // 详情更多直播切换比赛
  IntoDetailPath intoDetailPath; //进入详情页路径
  bool isListDetail = false; // 列表精选赛事
  int anchorLiveStatus = 0; // 1:开播 0:未开播 主播开播状态(赛事播)
  num watchTotal = 0; // 观看人数
  String liveGame;  // 游戏类型
  String liveId; // 自由播房间号
  num liveStatus; // 直播间状态 0=未开播 1=开播中(自由播)
  bool isFreeLiveGameAnchor; // 游戏自由播正在播
  num wishGiftSwitch;   // 心愿礼物开关(0=关闭 1=开启)
  String announcement; // 后台配置消息公告
  num livePopularity;   // 自由播直播间人气
  String gameKey;     // 游戏Key
  AiGameCellModel gameMessage; // 详情推送接受游戏数据
  LiveRoomInfo freeLiveRoomInfo;  // 自由播房间信息
  bool isFreeAnchorListChatRoom;  //自由播列表聊天室
  @override
  String toString() {
    return 'DetailParams{gidm: $gidm, gameType: $gameType, showtype: $showtype, homeTeam: $homeTeam, awayTeam: $awayTeam, homeLogo: $homeLogo, awayLogo: $awayLogo, leagueName: $leagueName, gameDate: $gameDate, anchorId: $anchorId, playPriority: $playPriority, type: $type, groupId: $groupId, systemId=$systemId, packetId=$packetId}';
  } // 1表示主播，2表示视频

}

/// 主播类型
enum AnchorType {
  /// 没主播
  none,
  /// 赛事主播
  match,
  /// 游戏主播
  game,
  /// 自由主播
  free,
}

enum IntoDetailPath {
  normal,
  betRecordSingle,
  betRecordCombo,
}

//播放优先级
enum PlayPriority {
  live, //直播
  anchor //主播
}

///关闭盘口订阅数据
class HandicapModel {
  String gidm;
  String gameId;
  String sw;
  String wType;
  String key;

  HandicapModel({this.gidm, this.gameId, this.sw, this.wType, this.key});

  HandicapModel.fromMap(Map<String, dynamic> map) {
    if (map == null || map.isEmpty) return;
    List data = AiJson(map).getArray('data');
    if (data.length == 0) return;
    gidm = AiJson(data[0]).getString('gidm');
    List changeSW = AiJson(data[0]).getArray('changeSW');
    if (changeSW.length == 0) return;
    gameId = AiJson(changeSW[0]).getString('gameId');
    sw = AiJson(changeSW[0]).getString('sw');
    wType = AiJson(changeSW[0]).getString('wType');
    key = gidm + gameId + wType;
  }
}
