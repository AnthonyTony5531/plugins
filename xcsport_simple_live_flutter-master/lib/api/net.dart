import 'dart:convert' as _convert;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/http.dart';
import 'package:fast_ai/config/api_config.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/MerchantAppConfigModel.dart';
import 'package:fast_ai/models/MerchantConfigDetailModel.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/bet_record_ticket_info.dart';
import 'package:fast_ai/models/bet_win_notice_model.dart';
import 'package:fast_ai/models/cashout_order_model.dart';
import 'package:fast_ai/models/cashout_result_model.dart';
import 'package:fast_ai/models/cashout_status_model.dart';
import 'package:fast_ai/models/condition_model.dart';
import 'package:fast_ai/models/detail_rate_model.dart';
import 'package:fast_ai/models/dynamic_list_model.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/login_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/models/merchant_info_model.dart';
import 'package:fast_ai/models/order_combo_betting.dart';
import 'package:fast_ai/models/order_combo_order.dart';
import 'package:fast_ai/models/order_game_bet_record_detail_model.dart';
import 'package:fast_ai/models/order_game_bet_record_model.dart';
import 'package:fast_ai/models/order_morepw.dart';
import 'package:fast_ai/models/order_bet_list_num_model.dart';
import 'package:fast_ai/models/personal/play_info.dart';
import 'package:fast_ai/models/personal/season_win_statistic.dart';
import 'package:fast_ai/models/platform_counts.dart';
import 'package:fast_ai/models/play_group_model.dart';
import 'package:fast_ai/models/player_account_model.dart';
import 'package:fast_ai/models/player_balance_model.dart';
import 'package:fast_ai/models/player_capital_records_model.dart';
import 'package:fast_ai/models/player_message_list.dart';
import 'package:fast_ai/models/player_trade_type_enums.dart';
import 'package:fast_ai/models/search_model.dart';
import 'package:fast_ai/models/suggest_model.dart';
import 'package:fast_ai/models/support_model.dart';
import 'package:fast_ai/models/order_record_model.dart';
import 'package:fast_ai/models/dynamic_flag_model.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/pages/bet/game_type_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_info_message_data_model/anchor_info_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_info_message_data_model/anchor_player_info_model.dart';
//import 'package:fast_ai/pages/found/share_bet_order/model/share_bet_order_list_resp_model.dart';
//import 'package:fast_ai/pages/found/share_bet_order_detail/model/share_bet_order_detail_resp_model.dart';
//import 'package:fast_ai/pages/member/about_us/version/version_desc_viewmodel.dart';
//import 'package:fast_ai/pages/member/user_info/user_info_model.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/file_util.dart';
//import 'package:fast_ai/utils/lang/ai_lang_handler.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/match_collect_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_ai/models/virtual_sport_type_model.dart';
import 'package:fast_ai/config/vm_sport_config.dart';
import 'package:fast_ai/models/currency_exchange_model.dart';

typedef DLProgressCallback = void Function(int count, int total);

class Net {
  static final _request = HttpRequest(Api.LANG);

  static HttpRequest get request => _request;

  static CancelToken cancelToken = CancelToken();

  //详情玩法分组
  static Future<PlayGroupModel> getPlayGroup(
      {Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.PLAY_GROUP, params: params);
    var rstM = PlayGroupModel.fromMap(rst);
    return rstM;
  }

  //详情玩法分组
  static Future<dynamic> getPlayGroupString(
      {Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.PLAY_GROUP, params: params);
    return rst;
  }

//  // 修改用户信息
//  static Future<UserInfoModel> getUpdateUserInfo(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.UPDATEPLAYERINFO, params: params);
//    var rstM = UserInfoModel.fromMap(rst);
//    return rstM;
//  }

  //详情matches
  static Future<MatchesDetailModel> getMatchesDetail(
      {Map<String, dynamic> params, CancelToken cancelToken}) async {
    String groupId = '${config.userInfo.sportPlatformId}';
    params['groupId'] = groupId;
//    var sourceCompany = config.getSourceCompanyGidm(params["gidm"]);
//    if (config.userInfo.currentSaveHitOptionType == HitOptionType.combo &&
//        (sourceCompany == SourceCompany.IBO || sourceCompany == SourceCompany.BTI)) {
//      params['isCombo'] = '1';
//    }
    var rst = await _request.get(Api.DETAIL_MATCHES,
        params: params, cancelToken: cancelToken);
    var rstM = MatchesDetailModel();
    await rstM.parse(rst);
    return rstM;
  }

//  // TODO 188 详情接口
//  static Future<MatchesDetailModel> getMatchesDetail188({String gidm, bool isCombo = false}) async {
//    Map<String, dynamic> params = {
//      'gidm': gidm,
//      'groupId': 1,
//    };
//    if(isCombo){
//      //params['isCombo'] = 1;
//    }
//    var rst = await _request.get(Api.DETAIL_MATCHES, params: params, cancelToken: cancelToken);
//    var rstM = MatchesDetailModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

  // static Future<MatchesDetailModel> getMatchesDetail({ Map<String, dynamic> params }) async {
  //   String groupId = '${config.userInfo.sportPlatformId}';
  //   params['groupId'] = groupId;
  //   if(config.userInfo.currentSaveHitOptionType == HitOptionType.combo && config.userInfo.sportPlatformId == SportPlatform.AI){
  //     params['isCombo'] = '1';
  //   }
  //   var rst = await _request.get(Api.DETAIL_MATCHES,params:params);
  //   var rstM = MatchesDetailModel.fromMap(rst);
  //   return rstM;
  // }

//  //赛果matches
//  static Future<MatchesDetailModel> getMatchesResult(
//      {Map<String, dynamic> params}) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    params['groupId'] = groupId;
//    var rst = await _request.get(Api.MATH_RESULTS, params: params);
//    var rstM = MatchesDetailModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

  //详情扩展
  static Future<ExtendModel> getExtend({Map<String, dynamic> params, CancelToken cancelToken}) async {
    var rst = await _request.get(Api.EXTEND, params: params, cancelToken: cancelToken);
    var rstM = ExtendModel.fromMap(rst);
    return rstM;
  }

  //详情扩展
  static Future<int> getChatroomPhotoFreeFunCount({String liveId, CancelToken cancelToken}) async {
    var rst = await _request.get(Api.CHATROOM_FREE_FUN, params: {'liveId':liveId}, cancelToken: cancelToken);
    AiJson aiJson = AiJson(rst);
    num data = aiJson.getNum('data');
    return data;
  }

  //详情扩展
  static Future<ExtendModel> getExtend188({String gidm}) async {
    Map<String, dynamic> params = {
      'gidm': gidm,
      'groupId': 1,
    };
    var rst = await _request.get(Api.EXTEND, params: params);
    var rstM = ExtendModel.fromMap(rst);
    return rstM;
  }


//  //详情跟投列表
//  static Future<FollowBetRecordModel> getDetailBetRecord(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.DETAIL_BETRECORD, params: params);
//    var rstM = FollowBetRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

//  //详情最热投注项全部
//  static Future<FollowBetRecordModel> getDetailBetRecordAll(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.DETAIL_BETRECORD_ALL, params: params);
//    var rstM = FollowBetRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

  //详情点击支持
  static Future<SupportModel> updateSupport({String gidm, support}) async {
    var rst = await _request.post(Api.SUPPORT,
        body: '{ "gidm": "$gidm", "support": "$support" }');
    var rstM = SupportModel.fromMap(rst);
    return rstM;
  }

  //详情投注项比率
  static Future<DetailRateModel> getDetailRate(
      {Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.RATIORATEINFO, params: params);
    var rstM = DetailRateModel.fromMap(rst);
    return rstM;
  }

  //搜索
  static Future<SearchModel> search({Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.SEARCH, params: params);
    var rstM = SearchModel.fromMap(rst);
    return rstM;
  }

//喜好—更新我的喜好
  static Future<BaseModel> followLeague({Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.UPDATEHOBBY, params: params);
    var rstM = BaseModel.fromMap(rst);
    return rstM;
  }

//  //获取商户APP应用更新上线历史记录
//  static Future<VersionlHistoryViewModel> appOnlineHistory(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.APPHISTORY, params: params);
//    var rstM = VersionlHistoryViewModel.fromMap(rst);
//    return rstM;
//  }

  //
  static Future<ConditionModel> getRBCondition() async {
    String groupId = '${config.userInfo.sportPlatformId}';
    var rst =
        await _request.get(Api.RB_CONDITION, params: {'groupId': groupId});
    var con = ConditionModel.fromMap(rst);
    return con;
    //Net.getRBCondition().then((m)=> print(m.code));
  }

//  //设置隐身模式
//  static Future<UserPrivacyModel> settingUserPrivacy(String type) async {
//    String url = Api.PRIVACY + '/' + type;
//    var rst = await _request.get(url);
//    var rstM = UserPrivacyModel.fromMap(rst);
//    return rstM;
//  }

  static Future<dynamic> post(String uri,
      {Map<String, String> headers,
      body,
      String preUrl,
      int timeout,
      CancelToken cancelToken}) async {
    return await _request.post(uri,
        headers: headers,
        body: body,
        preUrl: preUrl,
        timeout: timeout,
        cancelToken: cancelToken);
  }

  static Future<dynamic> get(String uri,
      {Map<String, String> headers,
      String preUrl,
      int timeout,
      CancelToken cancelToken}) async {
    return await _request.get(uri,
        headers: headers,
        preUrl: preUrl,
        timeout: timeout,
        cancelToken: cancelToken);
  }

  static Future<String> downloadFile(
      String path, String name, ProgressCallback progressCallback,
      {ValueChanged<String> onError}) async {
    Dio dio = new Dio();
    dio.options.headers = config.apiConfig.headers;
    dio.options.connectTimeout = 10 * 30 * 1000;
    dio.options.receiveTimeout = 10 * 30 * 1000;
    var file = await getExternalStorageDirectory();
    var apkFile = File("${file.path}/$name");
    apkFile.createSync();
    print(apkFile.absolute.path);
    print(file.existsSync());
    print(apkFile.existsSync());

    print("url:$path");
    await dio
        .download(path, apkFile.absolute.path,
            onReceiveProgress: progressCallback)
        .then((value) {}, onError: (e) {
      onError(e.toString());
    });
    return apkFile.absolute.path;
  }

  //Login
  static Future<LoginModel> login(String loginName, String password) async {
    Map<String, dynamic> rst;
    dynamic temp = await _request.post(Api.LOGIN,
        body:
            '{"merchantId":"${ApiConfig.MerchantId}","loginName":"$loginName","passWord":"${convert2Md5(password)}"}');
    if (temp is String) {
      rst = _convert.jsonDecode(temp);
    } else {
      rst = temp;
    }
    var rstM = LoginModel.fromMap(rst);
    config.userInfo.token = rstM.data;

    return rstM;
  }

  //loginAnonymous
  static Future loginAnonymous([bool forceQueryToken = false]) async {
    // 匿名token全站都用同一个，仅在服务器重启的时候更新
    try {
      if (forceQueryToken || config.userInfo.anonymousToken.isEmpty) {
        Map<String, dynamic> rst;
        dynamic temp = await _request.get(
            // config.isFastAiSdk ? Api.AnonymousToken2 : Api.AnonymousToken,
            Api.AnonyToken,
            needLogin: false);
        if (temp is String) {
          rst = _convert.jsonDecode(temp);
        } else {
          rst = temp;
        }
        print('00-loginAnonymous rst=$rst');
        var rstM = LoginModel.fromMap(rst);
        config.userInfo.token = rstM.data;
        cmPackageConfig.live188tokenConfig.saveToken(config.userInfo.token);
        config.userInfo.isAnonymousToken = true;
        print(
            '11-loginAnonymous rstM=$rstM, token=${config.userInfo.token}, anonymousToken=${config.userInfo.anonymousToken}');
        return rstM;
      } else {
        config.userInfo.token = config.userInfo.anonymousToken;
        cmPackageConfig.live188tokenConfig.saveToken(config.userInfo.token);
        config.userInfo.isAnonymousToken = true;
        print(
            '22-loginAnonymous token=${config.userInfo.token}, anonymousToken=${config.userInfo.anonymousToken}');
        return null;
      }
    } catch (e) {
      print('33-loginAnonymous-error=${{"level": "error", "error": e}}');
    }
  }

  static Future<void> logout() async {
    var rst = await _request.get(Api.LOGOUT);
    return;
  }

  static Future<PlayerAccountModel> playAccount({String preUrl}) async {
    var rst = await _request.get(Api.PLAYERACCOUNT,preUrl: preUrl);
    var rstM = PlayerAccountModel.fromMap(rst);
    //print("00-playAccount-rstM=${rst.toString()}");
    return rstM;
  }

  static Future<PlayBalance> getBalance({@required String walletId,String preUrl}) async {
    try {
      var rst = await _request.get(Api.GETBALANCE,
          params: isNullOrEmpty(walletId) ? null : {'wid': walletId},preUrl: preUrl);
      var rstM = PlayBalance.fromMap(rst);
      // 越南币取整
      if(!isStrNullOrEmpty(rstM?.data?.balance) && walletId == '4'){
        rstM?.data?.balance = double.tryParse(rstM?.data?.balance).toStringAsFixed(0);
      }
      return rstM;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//  //动态信息
//  static Future<DynamicListModel> getDynamicListModel(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.DYNAMICLIST, params: params);
//    List msgList = AiJson(rst).getArray('data.dynamicMsgList');
//    await AiLangHandler.setLangMatch(msgList);
//    var rstM = DynamicListModel.fromMap(rst);
//    return rstM;
//  }

  //收米列表
  static Future<BetWinNoticeModel> getBetWinNoticeModel(
      {Map<String, dynamic> params}) async {
    var rst = await _request.get(Api.BetWinNotice, params: params);
    var rstM = BetWinNoticeModel.fromMap(rst);
    return rstM;
  }

//  //收米详情
//  static Future<BetWinDetailRank> getBetWinDetailRankModel(
//      {Map<String, dynamic> params}) async {
//    var rst = await _request.get(Api.BetWinDetailRank, params: params);
//    var rstM = BetWinDetailRank();
//    await rstM.parse(rst);
//    return rstM;
//  }

  static Future<PlayMessageList> messageList({int page, pageSize}) async {
    page = page ?? 1;
    pageSize = pageSize ?? 20;
//    var rst = await _request.post(Api.MESSAGELIST, body: '{ "page": $page, "pageSize": $pageSize }');
    var rst = await _request
        .get(Api.MESSAGELIST, params: {"page": page, "pageSize": pageSize});
    var rstM = PlayMessageList.fromMap(rst);
    return rstM;
  }

  static Future<BaseModel> readMsg(String msgIds) async {
    var rst = await _request.get(Api.READMSG + "/" + msgIds);
    var rs = BaseModel.fromMap(rst);
    return rs;
  }

  static Future<BaseModel> allReadMsg() async {
    var rst = await _request.get(Api.ALLREADMSG);
    var rs = BaseModel.fromMap(rst);
    return rs;
  }

  static Future<BaseModel> attentionFriend(
      {Map<String, dynamic> params, CancelToken cancelToken}) async {
    var rst = await _request.get(Api.PLAYERFOLLOW,
        params: params, cancelToken: cancelToken);
    var rs = BaseModel.fromMap(rst);
    return rs;
  }

  static Future<PlayerCapitalRecordModel> getCapitalRecords(
      {page, pageSize, payWay, String endDate, String beginDate}) async {
    var rst = await _request.get(Api.GETCAPITALRECORDS, params: {
      'page': page,
      'pageSize': pageSize,
      "payWay": payWay,
      'endDate': endDate,
      "beginDate": beginDate
    });
//    print('响应: ' + rst);
    var rstM = PlayerCapitalRecordModel.fromMap(rst);
    return rstM;
  }

  static Future<PlayerTradeTypeEnumsModel> getTradeTypeEnums() async {
    var rst = await _request.get(
      Api.GET_TRADE_TYPE_ENUMS,
    );
    var rstM = PlayerTradeTypeEnumsModel.fromMap(rst);
    return rstM;
  }

//  static List _betItems = [];
//  static Future parseBetRecord(map) async {
//    AiJson json = AiJson(map);
//    Map src = json.getMap('data');
//
//    List betRecord = AiJson(src).getArray('betRecord');
//
//    _betItems.clear();
//    betRecord.forEach((e) {
//      AiJson matchJson = AiJson(e);
//      List orderDTOList = matchJson.getArray('orderDTOList');
//      orderDTOList.forEach((f) {
//        _betItems.addAll(AiJson(f).getArray('betDTOList'));
//      });
//    });
////    await AiLangHandler.setLangMatch(_betItems);
//  }

//  static Future parseNewBetRecord(map) async {
//    AiJson json = AiJson(map);
//    Map src = json.getMap('data');
//
//    List betRecord = AiJson(src).getArray('userOrderList');
//
//    _betItems.clear();
//
//    betRecord.forEach((e) {
//      AiJson orderDTO = AiJson(e);
//     _betItems.addAll( orderDTO.getArray('betDTOList'));
//    });
////    await AiLangHandler.setLangMatch(_betItems);
//  }

//  /// 投注记录多语言
//  static List _matches = [];
//  static Future parsePageDTO(map) async {
//    AiJson json = AiJson(map);
//    Map src = json.getMap('data');
//
//    List pageDTOList = AiJson(src).getArray('pageDTOList');
//
//    _matches.clear();
//    pageDTOList.forEach((e) {
//      AiJson matchJson = AiJson(e);
//      List orderDTOList = matchJson.getArray('orderDTOList');
//      orderDTOList.forEach((f) {
//        _matches.addAll(AiJson(f).getArray('betDTOList'));
//      });
//    });
//
//    await AiLangHandler.setLangMatch(_matches);
//  }

//  static Future parseOrderDTO(map) async {
//    AiJson json = AiJson(map);
//
//    List orderDTOList = json.getArray('data');
//    _matches.clear();
//    orderDTOList.forEach((f) {
//      _matches.addAll(AiJson(f).getArray('betDTOList'));
//    });
//
//    await AiLangHandler.setLangMatch(_matches);
//  }

//  static Future<OrderBetRecordModel> betRecordTab(
//      {CancelToken cancelToken,
//      int page,
//      pageSize,
//      String orderState,
//      String gameType,
//      String parlayNum,
//      String beginTime,
//      String endTime,
//      String groupId,
//      String minGold = '',
//      String sourceCompany = ''}) async {
//    //String groupId = '${config.userInfo.sportPlatformId}';
//    try {
//      var rst = await _request.post(
//        Api.BETRECORDTAB,
//        cancelToken: cancelToken,
//        body:
//            '{"groupId":$groupId,"page": $page, "pageSize": $pageSize, "orderState": "$orderState","gameType":"$gameType","parlayNum":"$parlayNum","beginTime":"$beginTime","endTime":"$endTime","minGold":"$minGold","sourceCompany":"$sourceCompany"}',
//      );
//      await parsePageDTO(rst);
//      var rstM = OrderBetRecordModel.fromMap(rst, matchList: _matches);
//      await AiLangHandler.dealLangChampionBetRecord(rstM);
//      if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
//      return rstM;
//    } catch (e) {
//      print("e:$e");
//    }
//    return null;
//  }

//  static Future<OrderBetRecordNewModel> newBetRecordTab(
//      {CancelToken cancelToken,
//      int page,
//      pageSize,
//      String orderState,
//      String gameType,
//      String parlayNum,
//      String beginTime,
//      String endTime,
//      String groupId,
//      String minGold = '',
//      String sourceCompany = ''}) async {
//    //String groupId = '${config.userInfo.sportPlatformId}';
//    try {
//      var rst = await _request.post(
//        Api.ALLBETRECORDTAB,
//        cancelToken: cancelToken,
//        body:
//            '{"groupId":$groupId,"page": $page, "pageSize": $pageSize, "orderState": "$orderState","gameType":"$gameType","parlayNum":"$parlayNum","beginTime":"$beginTime","endTime":"$endTime","minGold":"$minGold","sourceCompany":"$sourceCompany"}',
//      );
//      await parseOrderDTO(rst);
//      var rstM = OrderBetRecordNewModel.fromMap(rst, matchList: _matches);
//      await AiLangHandler.dealLangChampionNewBetRecord(rstM);
//      if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
//      return rstM;
//    } catch (e) {
//      print("e:$e");
//    }
//    return null;
//  }

  static Future<CashoutResultModel> confirmCashout(
      {@required String orderId, @required num amount}) async {
    var rst = await _request.post(Api.CONFIRMCASHOUT,
        body: '{"orderId":"$orderId","amount": $amount}', timeout: 15000);
    var rstM = CashoutResultModel.fromMap(rst);
    return rstM;
  }

  static Future<CashoutOrderModel> refreshCashoutOrder(
      {@required String orderId}) async {
    var rst = await _request.post(Api.REFRESSCASHOUTORDER,
        body: '{"orderId": "$orderId"}');
    var rstM = CashoutOrderModel.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }

//  static Future<AllShareOrderBetRecordModel> allowShareOrderList(
//      {int page,
//      pageSize,
//      String orderState,
//      String gameType,
//      String parlayNum,
//      String beginTime,
//      String endTime,
//      String groupId,
//      String minGold,
//      String selectType,
//      }) async {
//    /*
//    orderState  订单状态,空=全部，0=未结算，1=已结算，2=已取消
//    selectType  查询类型  1=爆料   其他值为 晒单
//    */
//    //String groupId = '${config.userInfo.sportPlatformId}';
//    var rst = await _request.post(
//      Api.ALLOWSHAREORDERLIST,
//      body: '{"groupId":$groupId,"page": $page, "pageSize": $pageSize, "orderState": "$orderState","gameType":"$gameType","parlayNum":"$parlayNum","beginTime":"$beginTime","endTime":"$endTime","minGold":"$minGold","selectType":"$selectType"}'
//    );
//    var rstM = AllShareOrderBetRecordModel.fromMap(rst);
//    await AiLangHandler.getLangShareInfo(rstM);
//    if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
//    return rstM;
//  }

  static Future<CashoutStatusModel> getCashoutStatus({String ticketIds}) async {
    var rst = await _request.post(Api.GETCASHOUTSTATUS,
        body: '{"ticketIds": $ticketIds}');
    var rstM = CashoutStatusModel.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }

  static Future<CashoutOrdersModel> getCashoutInfo(
      {List<TicketInfo> ticketInfos, CancelToken cancelToken}) async {
    try {
      var rst = await _request.post(Api.GETCASHOUTINFO,
          body: '{"cashoutInfoReq": ${_convert.jsonEncode(ticketInfos)}}',
          cancelToken: cancelToken);
      var rstM = CashoutOrdersModel.fromMap(rst);
      if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
      return rstM;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<OrderGameBetRecordModel> gameBetRecordTab(
      {int page,
      pageSize,
      String orderState,
      String supplierId,
      String gameKey,
      String startDate,
      String endDate}) async {
    Map<String, dynamic> params = {};
    if (page != null) params["page"] = page;
    if (pageSize != null) params["row"] = pageSize;
    if (!isNullOrEmpty(orderState)) params["orderState"] = orderState;
    if (!isNullOrEmpty(supplierId)) params["supplierId"] = supplierId;
    if (!isNullOrEmpty(gameKey)) params["gameKey"] = gameKey;
    params["startDate"] = startDate ?? '';
    params["endDate"] = endDate ?? '';

    var rst = await _request.get(Api.GAME_BET_RECORD_TAB, params: params);
    var rstM = OrderGameBetRecordModel.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }

  static Future<OrderGameBetRecordDetailModel> gameBetRecordDetail(
      {String tradeNo}) async {
    Map<String, dynamic> params = {};
    if (tradeNo != null) params["ticketId"] = tradeNo;
    var rst = await _request.get(Api.GAME_BET_RECORD_DETAIL, params: params);
    var rstM = OrderGameBetRecordDetailModel.fromMap(rst);
    return rstM;
  }

  static Future<OrderRecordModel> byOrderId(String orderId) async {
    try {
      var rst =
          await _request.get(Api.BYORDERIDNEW, params: {"orderId": orderId});
      print('wqwqw');
      var rstM = OrderRecordModel.fromMap(rst);
      return rstM;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<OrderRecordModel> byTradeNo(String tradeNo) async {
    try {
      var rst =
          await _request.get(Api.BY_TRADE_No, params: {"tradeNo": tradeNo});
      var rstM = OrderRecordModel.fromMap(rst);
      return rstM;
    } catch (e,s) {
      print(s);
      print(e.toString());
    }
    return null;
  }

  static Future<String> getBetToken() async {
    //http://192.168.20.151:9701/bet/getToken?sourceCompany=sd&playerId=9d77ffffee2a493e1938c146eb8d0f80
    var rst = await _request.get('',
        params: {'sourceCompany': 'sd', 'playerId': config.userInfo.playerId},
        preUrl: 'http://192.168.20.151:9701/bet/getToken');
    //var rst = await _request.get(Api.GETBETTOKEN, params: {'sourceCompany': 'sd'});
    var rstM = BaseModel.fromMap(rst);
    if (rstM.code != 200) {
      return null;
    }

    return AiJson(rst).getString('data');
  }

  static Future<dynamic> betMorePwSD(
    String preUrl,
    String token,
    Map body,
  ) async {
    var rst = await _request.postUseCookie('', token,
        body: _convert.jsonEncode(body), preUrl: preUrl);
    return rst;
  }

  static Future<OrderMorePw> betMorePw(Map body,{CancelToken cancelToken}) async {
    var rst = await _request.post(
      Api.BETMOREPW,
      body: _convert.jsonEncode(body), /*preUrl: 'http://192.168.20.21:9301/ai/mobile/'*/
      cancelToken: cancelToken
    );
    var rstM = OrderMorePw.fromMap(rst);
    return rstM;
  }

//  static Future<OrderMoreBetting> betMoreBetting(Map body) async {
//    var rst = await _request.post(
//      Api.MOREBETTING,
//      body: _convert.jsonEncode(body), /*preUrl: 'http://192.168.20.21:9301/ai/mobile/'*/
//    );
//    //var rst = {"code": 500, "msg": "Http status error [500]", "systemTime": 0};
//    var rstM = OrderMoreBetting.fromMap(rst);
//    // 冠军盘单独处理
//    await AiLangHandler.dealLangChampionBet(rstM);
//    return rstM;
//  }

  static Future<OrderComboOrder> betComboOrder(
      Map body, CancelToken cancelToken) async {
    var rst = await _request.post(Api.BETCOMBOORDER,
        body: _convert.jsonEncode(body), cancelToken: cancelToken);
    var rstM = OrderComboOrder.fromMap(rst);
    return rstM;
  }

  static Future<OrderComboBetting> betComboBetting(Map body) async {
    var rst = await _request.post(
      Api.COMBOBETTING,
      body: _convert
          .jsonEncode(body), /*preUrl: 'http://192.168.20.21:9301/ai/mobile/'*/
    );
    var rstM = OrderComboBetting.fromMap(rst);
    return rstM;
  }

//  static Future<OrderStateModel> getOrderState(List<String> orderIds) async {
//    num sTime = DateTime.now().millisecondsSinceEpoch;
//    var rst = await _request.post(Api.GETORDERSTATE,
//        body: '{"orderIds": ${orderIds.toString()}}');
//    num eTime = DateTime.now().millisecondsSinceEpoch;
//    var rstM = OrderStateModel.fromMap(rst);
//
//    num requestTime = eTime - sTime;
//    String msg =
//        "请求耗时(ms) : $requestTime \n订单号 : ${orderIds.join(',')}  \n请求数据 : ${rstM.toMap()}";
//
//    return rstM;
//  }

  static Future<BaseModel> suggesttions(Map body) async {
    body["appVersion"] = config.isApp
        ? "${config.appInfo.appVersion}+${config.appInfo.appVersionCode}"
        : config.sdkAssetsModel.sdkVersion;
    var rst = await _request.post(Api.SUBMITQUESTION,
        body: _convert.jsonEncode(body));
    var rstM = BaseModel.fromMap(rst);
    return rstM;
  }

// 收藏比赛
  static Future<BaseModel> gameCollect(Map body) async {
    var rst =
        await _request.post(Api.DETAILCOLLECT, body: _convert.jsonEncode(body));
    var rstM = BaseModel.fromMap(rst);
    return rstM;
  }

//  //喜好—更新我的喜好
//  static Future<MatchCollectModel> updateHobby(Map body) async {
//    var rst = await _request.post(Api.PLAYERUPDATEHOBBY,
//        body: _convert.jsonEncode(body));
//    var rstM = MatchCollectModel.fromMap(rst);
//    return rstM;
//  }

//  static Future<CommonTopMenu> topMenu({CancelToken cancelRequestToken}) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    var rst = await _request.get(Api.TOPMENU + '?groupId=$groupId',
//        cancelToken: cancelRequestToken);
//    var rstM = CommonTopMenu.fromMap(rst);
//    return rstM;
//  }

  static Future<DynamicFlag> queryDynamicFlag(
      {CancelToken cancelRequestToken}) async {
    var rst = await _request.get(Api.QueryDynamicFlag,
        cancelToken: cancelRequestToken);
    return DynamicFlag.fromMap(rst);
  }

  static Future<SuggestModel> uploadImage(String imagePath) async {
    var rst = await _request.uploadImage(Api.UPLOADHEAD, imagePath);
    var rstM = SuggestModel.fromMap(rst);
    return rstM;
  }

  // static Future<BaseModel> updatePlayerHobby(PlayerHobbyListModel model) async {
  //   var rst = await _request.post(Api.PLAYERUPDATEHOBBY, body: model.toReqParams());

  //   print('PLAYERUPDATEHOBBY Resp=${rst.toString()}');
  //   var rstM = BaseModel.fromMap(rst);
  //   return rstM;
  // }

//  static Future<CompetitionSeason> getSeasonInfo() async {
//    var rst = await _request.get(Api.GetSeasonInfo, preUrl: Api.baseMainUrl);
//    var rstM = CompetitionSeason.fromMap(rst);
//    return rstM;
//  }

//  static Future<CompetitionSeasonItems> seasonItems() async {
//    var rst = await _request.get(Api.SeasonItems, preUrl: Api.baseMainUrl);
//    var rstM = CompetitionSeasonItems.fromMap(rst);
//    return rstM;
//  }

//  static Future<CompetitionSeasonTypeInfo> seasonTopTypeInfo(
//      Map<String, dynamic> body) async {
//    var rst = await _request.get(Api.SeasonTopTypeInfo,
//        preUrl: Api.baseMainUrl, params: body);
//    var rstM = CompetitionSeasonTypeInfo.fromMap(rst);
//    return rstM;
//  }

  static Future<PlayInfo> mobilePlayerInfo(String playId) async {
    var rst = await _request.get(Api.MobilePlayerInfo,
        preUrl: Api.baseMainUrl, params: {'fPlayerId': playId});
    var rstM = PlayInfo.fromMap(rst);
    return rstM;
  }

//  static Future<OrderBetRecordModel> followBetRecord(String playId) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    var rst = await _request.get(Api.PlayerFollowBetRecord,
//        preUrl: Api.baseMainUrl,
//        params: {'playerId': playId, 'groupId': groupId});
//    var rstM = OrderBetRecordModel.fromMap(rst);
//    return rstM;
//  }

//  static Future<BetShareRecordModel> findShareByPlayer(
//      String page, String pageSize, String playerId) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    var rst = await _request.get(Api.FindShareByPlayer,
//        preUrl: Api.baseMainUrl,
//        params: {
//          'page': page,
//          'pageSize': pageSize,
//          'groupId': groupId,
//          'playerId': playerId
//        });
//    var rstM = BetShareRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

//  static Future<PlayerBet> playerBet(Map<String, dynamic> body) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    body['groupId'] = groupId;
//    var rst = await _request.get(Api.MobilePlayerBet,
//        preUrl: Api.baseMainUrl, params: body);
//    await parseBetRecord(rst);
//    var rstM = PlayerBet.fromMap(rst, betItems: _betItems);
//    return rstM;
//  }
//
//  static Future<NewPlayerBet> newPlayerBet(Map<String, dynamic> body) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    body['groupId'] = groupId;
//    var rst = await _request.get(Api.MobileNewPlayerBet,
//        preUrl: Api.baseMainUrl, params: body);
//    await parseNewBetRecord(rst);
//    var rstM = NewPlayerBet.fromMap(rst, betItems: _betItems);
//    return rstM;
//  }
//
//   static Future<AnchorPlayerBet> anchorPlayerBet(Map<String, dynamic> body) async {
//    String groupId = '${config.userInfo.sportPlatformId}';
//    body['groupId'] = groupId;
//    var rst = await _request.get(Api.MobileAnchorPlayerBet,
//        preUrl: Api.baseMainUrl, params: body);
//    await parseNewBetRecord(rst);
//    var rstM = AnchorPlayerBet.fromMap(rst, betItems: _betItems);
//    return rstM;
//  }


//  //gameType,seasonId
//  static Future<SeasonBetLove> seasonBetLove(Map<String, dynamic> body) async {
//    var rst = await _request.get(Api.SeasonBetLove,
//        preUrl: Api.baseMainUrl, params: body);
//    var rstM = SeasonBetLove.fromMap(rst);
//    return rstM;
//  }
//
//  static Future<SeasonWinStatistic> seasonWinStatistic(
//      Map<String, dynamic> body) async {
//    var rst = await _request.get(Api.SeasonWinStatistic,
//        preUrl: Api.baseMainUrl, params: body);
//    var rstM = SeasonWinStatistic.fromMap(rst);
//    return rstM;
//  }

  static Future<BaseModel> setPlayerFollow(Map<String, dynamic> body) async {
    var rst = await _request.get(Api.PlayerFollow, params: body);
    var rstM = SeasonWinStatistic.fromMap(rst);
    return rstM;
  }

  //获取商户信息(3.10之后版本废弃该接口)
  static Future<MerchantInfoModel> getMerchantInfo() async {
    var rst = await _request.get(Api.QueryMerchantInfo, params: null);
    var rstM = MerchantInfoModel.fromMap(rst);
    return rstM;
  }

  //获取商户信息(3.10之后版本使用该接口)
  static Future<Map> getMerchantInfoNew() async {
    var rst = await _request.get(Api.QueryMerchantInfoNew, params: null);
    //MerchantInfoNewModel.fromMap(rst);
    return rst;
  }

  static Future<MerchantConfigDetailModel> getMerchantConfigDetail() async {
    var rst = await _request.get(Api.MerchantConfigDetail, params: null);
    var rstM = MerchantConfigDetailModel.fromMap(rst);
    return rstM;
  }

//  static Future<SubmitOrder> shareToChatRoom(Map body) async {
//    var rst = await _request.post(
//      Api.ShareToChatRoom,
//      body: _convert
//          .jsonEncode(body), /*preUrl: 'http://192.168.20.21:9301/ai/mobile/'*/
//    );
//    var rstM = SubmitOrder.fromMap(rst);
//    return rstM;
//  }
//
//  static Future<BetShareRecordModel> betShareList(
//      Map<String, dynamic> body) async {
//    if(body != null){
//      body['channelType'] =  config.merchantChannel;
//    }
//    else{
//      body = {'channelType' : config.merchantChannel};
//    }
//    var rst = await _request.get(
//      Api.BetShareList,
//      params: body,
//    );
//    var rstM = BetShareRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

//  static Future<AnchorBetShareRecordModel> anchorBetShareList(
//      Map<String, dynamic> body) async {
//    var rst = await _request.get(
//      Api.AnchorBetShareList,
//      params: body,
//    );
//    var rstM = AnchorBetShareRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

  //      item = await Net.anchorBetShareList({'anchorId':'${widget.anchorId}','systemId': '${widget.systemId}', 'page': currentPage, 'size': pageSize, 'groupId': groupId});
//  static Future<AnchorBetShareRecordModel> anchorBetShareList2(
//      {@required String anchorId,
//      @required String systemId,
//      num page = 1,
//      String roomNo,
//      num pageSize = 20,
//      @required String groupId}) async {
//    var rst = await _request.get(
//      Api.AnchorBetShareList,
//      params: {
//        'anchorId': '$anchorId',
//        'systemId': '$systemId',
//        'page': page,
//        'roomNo': roomNo,
//        'size': pageSize,
//        'groupId': groupId
//      },
//    );
//    var rstM = AnchorBetShareRecordModel();
//    await rstM.parse(rst);
//    return rstM;
//  }

//  static Future<AnchorBetShareRankModel> anchorBetShareFollowRankList(
//      Map<String, dynamic> body) async {
//    var rst = await _request.get(
//      Api.AnchorShareRankList,
//      params: body,
//    );
//    var rstM = AnchorBetShareRankModel.fromMap(rst);
//    return rstM;
//  }

  static Future<MerchantAppConfigModel> queryMerchantAppConfig() async {
    var rst = await _request.get(Api.MerchantAppConfig, params: null);
    var rstM = MerchantAppConfigModel.fromMap(rst);
    return rstM;
  }

  static Future<PlatformCounts> queryGameCount() async {
    var rst = await _request.get(Api.QueryGameCount);
    var rstM = PlatformCounts.fromMap(rst);
    return rstM;
  }

  static Future<String> queryUserIp() async {
    String ipAddress = '';
    try {
      Response res = await Dio().get('http://ip.fengzeen.com',
          options: Options(
              contentType: "multipart/form-data",
              receiveTimeout: 5000,
              sendTimeout: 3000));
      if (res.statusCode == 200) ipAddress = res.data.toString();
      //String ipAddress = await _request.get('http://ip.fengzeen.com/', preUrl: '', params: null);
      print('00-queryUserIp-ipAddress=$ipAddress');
    } catch (e) {
      print('queryUserIp error = $e');
    }

    return ipAddress;
  }

  /// 点赞注单
  static Future<BaseModel> likeBetOrder(String orderId, String type,
      {String roomNo}) async {
    //orderId:
    //type:1点赞 2取消点赞 3踩 4取消踩
    //roomNo
    Map<String, dynamic> params = Map<String, dynamic>();
    params['orderId'] = orderId;
    params['type'] = type;
    if (!isNullOrEmpty(roomNo)) {
      params['roomNo'] = roomNo;
    }
    var rst = await _request.get(
      Api.LikeBetOrder,
      params: params,
    );
    var rstM = BaseModel.fromMap(rst);
    return rstM;
  }

  /// SaveUserResponse
  static Future<BaseModel> saveUserResponse(Map body) async {
    print('saveUserResponse-00');
    var rst = await _request.post(
      Api.SaveUserResponse,
      preUrl: 'http://192.168.20.30:31409/',
      body: _convert.jsonEncode(body),
    );
    print('saveUserResponse-11, rst=$rst');
    var rstM = BaseModel.fromMap(rst);
    print('saveUserResponse-22');
    return rstM;
  }

  static Future sdkWillExit() async {
    config.sdkWillExit = true;
    _request.close();
  }

  //关闭所有请求
  static Future close() async {
    _request.close();
  }

  /// 订单不同状态数量统计
  static Future<OrderBetListNumModel> betListNum() async {
    var rst = await _request.get(
      Api.betListNum, /*preUrl: 'http://192.168.20.21:9301/ai/mobile/'*/
    );
    var rstM = OrderBetListNumModel.fromMap(rst);
    return rstM;
  }

//  /// 订单滚球比赛动态信息
//  static Future<RbGameDynamicInfoModel> getRBGameDynamicInfo(
//      {List<String> gidms, CancelToken cancelToken}) async {
//    try {
//      var rst = await _request.post(Api.getRBGameDynamicInfo,
//          body: '{"gidms": ${_convert.jsonEncode(gidms)}}',
//          cancelToken: cancelToken);
//      var rstM = RbGameDynamicInfoModel.fromMap(rst);
//      if (rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
//      return rstM;
//    } catch (e) {
//      print(e);
//    }
//    return null;
//  }

  /// 钱包列表
  static Future<void> getPlayLimit() async {
    var rst = await _request.get(
      Api.playLimit,
    );
    config.userInfo.rLimit = AiJson(rst).getString('data.rLimit');
    config.userInfo.ouLimit = AiJson(rst).getString('data.ouLimit');
  }

//  /// 钱包列表
//  static Future<WalletDataModel> getWalletList() async {
//    var rst = await _request.get(
//      Api.walletList,
//    );
//    var rstM = WalletDataModel.fromMap(rst);
//    return rstM;
//  }

//  /// 获取所有钱包列表
//  static Future<WalletDataModel> getAllWalletList() async {
//    var rstAll = await _request.get(Api.walletAllList);
//    var rstM = WalletDataModel.fromMapAll(rstAll);
//    return rstM;
//  }

  /// 获取用户信息-有效lottery
  static Future<List<AnchorRankInfoModel>> getUserInfo(
      List<String> playerIdList) async {
    var rst = await _request.post(Api.PlayerAccountList,
        body: '{"playerIdList": ${_convert.jsonEncode(playerIdList)}}');
    List list = AiJson(rst).getArray('data');
    var tempList = <AnchorRankInfoModel>[];
    if (list.isNotEmpty) {
      list.forEach((element) {
        tempList.add(AnchorRankInfoModel.fromJson(element));
      });
    }
    return tempList;
  }

  /// 本场豪气榜提示显示
  static Future<AnchorPlayerInfoModel> getAnchorRankPlayerInfo() async {
    var rst = await _request.get(Api.RankOddsMessage);
    if (rst['code'] != 200 && rst['code'] != 404)
      throw Exception('${rst['msg']}');
    AnchorPlayerBaseInfoModel infoModel =
        AnchorPlayerBaseInfoModel.fromMap(rst);
    return infoModel.anchorPlayerInfoModel;
  }

  //https://configstaging.aitcloud.de/navigation?client_id=4803
  static Future<VirtualSportTypeModel> getVmSportTypes() async {
    if (isNullOrEmpty(config.vmApiConfig.vmSportNavHost)) {
      return null;
    }
    var rst = {};
    try {
      rst = await _request.get(
        config.vmApiConfig.vmSportNavPath,
        params: {'client_id': '${config.vmApiConfig.clientId}'},
        preUrl: config.vmApiConfig.vmSportNavHost,
      );
    } catch (_) {}

    VirtualSportTypeModel model = VirtualSportTypeModel.fromMap(rst);
    return model;
  }

  //https://vgcommonstaging.aitcloud.de/srvg-launcher/stable/bwg.html?clientId=4803&lang=zh&product=vflm&id=26a605041f924985bf0d51417ca4fc59
  static Future<VmSportApiConfig> getVmSportApiConfig() async {
    var rst = await _request.get(Api.vmSportEntry, preUrl: Api.baseMainUrl);
    var model = VmSportApiConfig.from(rst);
    return model;
  }

  static Future<CurrencyExchangeModel> getCurrencyExchange() async {
    var rst = await _request.get(Api.selectCurrencyExchange);
    var model = CurrencyExchangeModel.fromMap(rst);
    return model;
  }

//  static Future<OrderConfirmRspModel> orderConfirm(Map body) async {
//    var rst = await _request.post(Api.orderConfirm,body: _convert.jsonEncode(body),);
//    var model = OrderConfirmRspModel.fromMap(rst);
//    return model;
//  }

//  /// 爆料列表
//  static Future<ShareBetOrderListRespModel> queryShareBetOrderList(Map<String, dynamic> params) async {
//    Map<String, dynamic> rst;
//    try{
//      rst = await _request.get(Api.shareBetOrderList, params: params);
//      // rst = await FileUtil.localJson('share_bet_list');
//      // sleep(2);
//    }
//    catch(e) {
//      print('queryShareBetOrderList-error=${e?.toString()}');
//    }
//    var model = ShareBetOrderListRespModel.fromMap(rst);
//    return model;
//  }

//  /// 爆料详情
//  static Future<ShareBetOrderDetailRespModel> queryShareBetOrderDetail({int shareId, String roomNo}) async {
//    Map<String, dynamic> rst;
//    try{
//      rst = await _request.get(Api.shareBetOrderDetail, params: {'id': shareId, 'channelType' : 1, 'roomNo':roomNo??'',  'wid' : config?.userInfo?.walletId ?? '1'});
//      // rst = await FileUtil.localJson('share_bet_detail');
//      // sleep(2);
//    }
//    catch(e) {
//      print('queryShareBetOrderDetail-error=${e?.toString()}');
//    }
//    var model = ShareBetOrderDetailRespModel.fromMap(rst);
//    return model;
//  }

//  /// 爆料历史
//  static Future<ShareBetOrderListRespModel> queryShareHistoryList(Map<String, dynamic> params) async {
//    Map<String, dynamic> rst;
//    try{
//      rst = await _request.get(Api.myBrokeOrder, params: params);
//    }
//    catch(e) {
//      print('queryShareHistoryList-error=${e?.toString()}');
//    }
//    var model = ShareBetOrderListRespModel.fromMap(rst);
//    return model;
//  }

  /// 爆料历史
  static Future<GameTypeModel> getGameType(Map<String, dynamic> params) async {
    Map<String, dynamic> rst;
    try{
      rst = await _request.get(Api.getGameType, params: params);
    }
    catch(_) {}
    var model = GameTypeModel.fromMap(rst);
    return model;
  }

}
