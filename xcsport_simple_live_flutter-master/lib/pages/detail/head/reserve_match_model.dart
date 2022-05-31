//**********************************************************************
//* author:Sam
//* date:2020-08-25
//**********************************************************************

//预约比赛model
import 'package:fast_ai/api/protocols/detail/collect_game_protocol.dart';
//import 'package:fast_ai/api/protocols/matches/game_anchor_reserve_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/overlay/loading_overlay.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/material.dart';

class ReserveMatchModel with ChangeNotifier {
  MatchesDetailModel _matchesDetailModel = MatchesDetailModel();
  String get homeLogo => string(_matchesDetailModel.data?.homeLogo);

  String get awayLogo => string(_matchesDetailModel.data?.awayLogo);

  String get homeName => string(_matchesDetailModel.data?.homeTeamAbbr,
      defaultVal: _matchesDetailModel.data?.homeTeam);

  String get awayName => string(_matchesDetailModel.data?.awayTeamAbbr,
      defaultVal: _matchesDetailModel.data?.awayTeam);

  String get time => MM_dd_HH_mm(_matchesDetailModel.data?.gameDate);

  bool get hasReserve => _detailSet?.detailParams?.isReserve == "1"||config.userInfo.hasFollowGame(_matchesDetailModel.data?.gidm);

  DetailSet _detailSet;
  void updateData(MatchesDetailModel model, DetailSet detailSet) {
    _matchesDetailModel = model;
    _detailSet = detailSet;

  }

  //预约或取消比赛
  Future<void> reverseOrCancel(BuildContext context) async {
    if (isEmpty(_matchesDetailModel.data?.gidm)) return;
    if (hasReserve) {
      var rsp = await CollectGameReqProtocol(
          gidm: _matchesDetailModel.data?.gidm,
          option: CollectedOption.cancel)
          .request();
      if (rsp.isSuccess) {
        showToas(config.langMap['baseLang']['detail']['cancelMatchSuccess']);
        config.userInfo.followGames.remove(_matchesDetailModel.data.gidm);
        notifyListeners();

      }
    }else{
      var rsp = await CollectGameReqProtocol(
          gidm: _matchesDetailModel.data?.gidm,
          option: CollectedOption.collected)
          .request();
      if (rsp.isSuccess) {
        showToas(config.langMap['baseLang']['detail']['reserveMatchSuccess']);

        config.userInfo.followGames.add(_matchesDetailModel.data.gidm);
        notifyListeners();

      }
    }
  }


  //预约视频
  Future<void> reverseOrCancelVideo(BuildContext context) async {
//    if (isEmpty(_matchesDetailModel.data?.gidm)) return;
//    bool isReserve = _detailSet?.detailParams?.isReserve == "1";
//    isReserve = !isReserve;
//    GameAnchorReserveReqProtocol reserveReq = GameAnchorReserveReqProtocol();
//    var body = {
//      'anchorId': '',
//      'gidm': _matchesDetailModel.data?.gidm ?? '',
//      'videoUrl': _detailSet?.detailParams?.reverseVideoUrl ?? '',
//      'videoType': "2",
//      'reserve':  isReserve?"1":"2",
//    };
//    var rsp = await reserveReq.request(body);
//    if(rsp.code == 200){
//      _detailSet.detailParams.isReserve = body["reserve"];
//      showToas(isReserve ? config.langMap['baseLang']['detail']['reserveMatchLiveSuccess'] : config.langMap['baseLang']['detail']['cancelMatchLiveSuccess']);
//      Event.eventBus.fire(AnchorReserveEvent());
//      notifyListeners();
//    }else{
//      showToas(config.langMap['baseLang']['detail']['reserveFailed']);
//    }

  }
}
