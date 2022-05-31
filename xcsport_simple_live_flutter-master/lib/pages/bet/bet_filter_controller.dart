import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/models/bet_order_record/game_type_model.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_page.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:intl/intl.dart';
import 'package:fast_ai/utils/ai_common.dart';
import 'dart:convert' as _convert;
//eureka
class BetFilterController{

  BetFilterController();

  //控制隐藏昨天，本周，本月的筛选按钮
  bool isHideDate = false;

  //注单状态
  String orderState = "";

  //体育项
  String gameType = "";

  //投注类型，单注还是串关
  String parlayNum = "";

  //开始时间
  String beginTime = "";

  //结束时间
  String endTime = "";

  String monthTmp = "";
  
  //判断属于哪个筛选项
  bool isSport = false;

//  FilterBetType filterBetType = FilterBetType.all;

  static final DateFormat DD_FORMAT = new DateFormat(YYYYMMDD);
  static final DateFormat MM_FORMAT = new DateFormat(YYYYMM);
  static final DateFormat MMDD_FORMAT = new DateFormat("MM-dd");

  static final String YYYYMMDD = "yyyy-MM-dd";
  static final String YYYYMM = "yyyy-MM";

  static final String DAY = "DAY";
  static final String MONTH = "MONTH";
  var baseLang = config.langMap['baseLang'];
  //按（日-月）选择
  String filterChange = DAY;

  get startDate{
    if(beginTime.isEmpty)
      return null;
    DateTime dateTime  = DateTime.fromMillisecondsSinceEpoch(int.parse(beginTime));
    String dateStr = filterChange == DAY ? DD_FORMAT.format(dateTime) : MM_FORMAT.format(dateTime);
    return dateStr;
  }

  get endDate{
    if(endTime.isEmpty)
      return;
    DateTime dateTime  = DateTime.fromMillisecondsSinceEpoch(int.parse(endTime));
    String dateStr = filterChange == DAY ? DD_FORMAT.format(dateTime) : MM_FORMAT.format(dateTime);
    return dateStr;
  }

  bool get isQuery{
    if(filterChange==DAY)
      return (beginTime.isEmpty && endTime.isEmpty);
    else
      return monthTmp.isEmpty;
  }

  get gameTypeStr{
    if(gameType.isEmpty)
      return;
    if(gameType == 'XC_GAME'){
      return baseLang['games']['name'];
    }
    Map json = AiCommon.sportTypes[this.gameType];
    return AiJson(json).getString('name');
  }

  get filterTypeStr{
    String state;
    if(this.orderState=="1"){
      state = baseLang['order']['settled'];
    } else if(this.orderState=="0"){
      state = baseLang['order']['unsettled'];
    } else if(this.orderState=="4"){
      state = baseLang['order']['earlysettled'];
    } else {
      state = baseLang['order']['cancel'];
    }

    String combo = this.parlayNum == "1" ? baseLang['order']['singleNote'] : baseLang['order']['combo'];

//    if(this.orderState.isNotEmpty && this.parlayNum.isNotEmpty && filterBetType == FilterBetType.all)
//      return "$state.$combo";

    if(this.orderState.isNotEmpty)
      return state;
//    if(this.parlayNum.isNotEmpty && filterBetType == FilterBetType.all)
//      return combo;
    return config.langMap['baseLang']['member']['bet']['filterType'];
  }

  get filterGameTypeStr {
    if(gameType.isEmpty){
      return AiJson(config.langMap).getString('baseLang.member.bet.filterType');
    } else {
      var jsonStr = ccCache.getString('game.type.info', null);
      if (jsonStr != null) {
//        var list = _convert.jsonDecode(jsonStr) as List;
//        var gameTypeInfoList = list?.map((e) => GameTypeInfo.fromMap(e))?.toList() ?? [];
//        if(isNotEmpty(gameType)){
//          var type = gameTypeInfoList?.firstWhere((e) => e.gameKey == gameType,orElse: ()=>null);
//          if(type != null){
//            return type.gameName;
//          }
//        }
      }
      return AiJson(config.langMap).getString('baseLang.member.bet.filterType');
    }

  }

  get dateFilterStr{
    if(filterChange==DAY){
      if(this.beginTime.isNotEmpty && this.endTime.isNotEmpty)
        return "${MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.beginTime)))} ${config.langMap['baseLang']['member']['bet']['to']} ${MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.endTime)))}";
      if(this.beginTime.isNotEmpty)
        return MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.beginTime)));
      if(this.endTime.isNotEmpty)
        return MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.endTime)));
    }else{
      if(this.monthTmp.isNotEmpty)
        return monthTmp;
    }
    return config.langMap['baseLang']['member']['bet']['filterTime'];
  }

  get itemDateFilterStr{
    if(filterChange==DAY){
      if(this.beginTime.isNotEmpty && this.endTime.isNotEmpty)
        return "${MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.beginTime)))} ${baseLang['member']['bet']['to']} ${MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.endTime)))}";
      if(this.beginTime.isNotEmpty)
        return MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.beginTime)));
      if(this.endTime.isNotEmpty)
        return MMDD_FORMAT.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this.endTime)));
    }else{
      if(this.monthTmp.isNotEmpty)
        return monthTmp;
    }
    return "";
  }

}