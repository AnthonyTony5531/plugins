import 'dart:async';

import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
//import 'package:fast_ai/pages/detail/league_match_selector/league_match_selector.dart';
//import 'package:fast_ai/pages/detail/league_match_selector/league_match_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/live_player.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
//import 'package:fast_ai/pages/member/anchorHomePage/anchor_home_page.dart';
import 'package:fast_ai/router.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
//import 'package:fast_ai/widgets/float_widget.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/popup_slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../detail_page.dart';
import '../detail_page_model.dart';

//头部（自建appBar）
@immutable
class TitleSection extends StatefulWidget {
  TitleSection({Key key, this.playerController, this.matchesDetailModel, this.extendModel, this.isBlackShowHead, this.onHeadExpansiond, @required this.isExpanded,this.anchorId})
      : super(key: key);
  MatchesDetailModel matchesDetailModel;
  CommonVideoPlayerController playerController;
  ExtendModel extendModel;
  bool isBlackShowHead = false;
  final ValueChanged<bool> onHeadExpansiond;
  final bool isExpanded;
  // 默认主播Id
  final String anchorId;
  @override
  _TitleSection createState() => _TitleSection();
}

class _TitleSection extends State<TitleSection>{
  MatchesDetailModel get matchesDetailModel {
    return widget.matchesDetailModel;
  }

  ExtendModel get extendModel {
    return widget.extendModel;
  }

  String get leagueName {
    return widget.matchesDetailModel.data.leagueShortName;
  }

  String get leagueId {
    return widget.matchesDetailModel.data.leagueId;
  }

  bool get isBlackShowHead {
    return widget.isBlackShowHead;
  }

  DetailSet detailSet;
  @override
  void initState() {
    //this.listenHeadFixedHideEvent();
    // listenInit();
    super.initState();
  }

  @override
  void dispose() {
    //headFixedHideEvent?.cancel();
    super.dispose();
  }

  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    _isExpanded = widget.isExpanded;
    detailSet = config.userInfo.detailSet;
    return Container(
      color: isBlackShowHead == true ? Colors.black : null,
      //color: Colors.black,
      height: 60,
      padding: EdgeInsets.only(top: 10),
      // padding:
      //     isBlackShowHead == true ? EdgeInsets.fromLTRB(0.0, 12.0, 5.0, 8.0) : EdgeInsets.fromLTRB(0.0, 12.0, 5.0, 5.0),
      child: Row(
        children: [
          // InkWell(
          //   onTap: () {
          //     config.userInfo.detailSet = DetailSet();
          //     AiRouter.pop(context);
          //   },
          //   child: Container(
          //     width: isBlackShowHead == true ? 40 : 48,
          //     margin: isBlackShowHead == true ? EdgeInsets.only(right: 8) : EdgeInsets.only(right: 35),
          //     padding: EdgeInsets.only(left: 15),
          //     child: Row(
          //       children: <Widget>[
          //         AiImage.asset(
          //           "assets/images/detail/detail_back@2x.png",
          //           height: 18,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            //color: Colors.red,
            width: isBlackShowHead == true ? 40 : 48,
            margin: isBlackShowHead == true ? EdgeInsets.only(right: 8) : EdgeInsets.only(right: 35),
            padding: EdgeInsets.only(left: 0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.white,
              ),
              onPressed: () {
                config.userInfo.detailSet = DetailSet();
//                  changeFloatWidget(context);
                // AiRouter.pop(context);
              },
            ),
          ),
          centerText(),
          expandIcon(),
          //fiexdIcon(),
          widget.playerController.isVirtual?Container(width: 12,):
          InkWell(
            onTap: onMoreTap,
            child: Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(2, 5, 14, 5),
                margin: EdgeInsets.only(left: 5),
                child: AiSvgPicture.asset(
                  "assets/images/detail/detail_more.svg",
                  width: 24,
                )
                ),
          ),
        ],
      ),
    );
  }

  Widget expandIcon() {
    Widget content = Container();
    content = InkWell(
        onTap: () {
          _isExpanded = !_isExpanded;
          widget.onHeadExpansiond(_isExpanded);
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 9, 5, 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
          padding: EdgeInsets.only(bottom: 2),
                child: AiSvgPicture.asset(
                  "assets/images/detail/icon_detail_${_isExpanded?"retract":'push'}_normal.svg",
                  //icon_detail_push_normal
                  width: 15,
                ),
              ),
              Text(
                '${_isExpanded?"${config.langMap['baseLang']['collapse']}":"${config.langMap['baseLang']['expand']}"}',
                style: AiTextStyle(fontSize: 8,color: Colors.white),
              )
            ],
          ),
        ));

    return content;
  }

  Widget fiexdIcon() {
    Widget content = Container();
    //if (detailSet.selectViewType != 'default' || isBlackShowHead == true) {
    if (isBlackShowHead == true) {
      content = Container(
        child: Text(''),
      );
    } else {
      if (detailSet.isShowFixedIcon == false) {
        content = Container(
          width: 28,
          child: Text(''),
        );
      } else {
        content = InkWell(
          onTap: onFixed,
          child: Container(
            //color: Colors.blue,
            padding: EdgeInsets.fromLTRB(8, 9, 5, 9),
            child: AiImage.asset(
              detailSet.fixedDetailHeadType == 2 ? "assets/images/detail/detail_fixed@2x.png" : "assets/images/detail/detail_no_fixed@2x.png",
              width: 15,
            ),
          ),
        );
      }
    }

    return content;
  }

  Widget centerText() {
    Widget content = Container();
    if (isBlackShowHead == false) {
      content = Expanded(
        child: InkWell(
          onTap: onLeagueNameTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
                child: Text(
                  leagueName ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AiTextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: config.skin.disdance.dL5),
                child: AiImage.asset(
                  "assets/images/detail/detail_down_pull@2x.png",
                  height: 18,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      String homeTeam = string( matchesDetailModel.data.homeTeamAbbr, defaultVal:  matchesDetailModel.data.homeTeam);
      String awayTeam = string( matchesDetailModel.data.awayTeamAbbr, defaultVal:  matchesDetailModel.data.awayTeam);
      content = Expanded(
        child: Container(
          child: Text(
            homeTeam + ' vs ' + awayTeam,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AiTextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
      );
    }

    return content;
  }

  //点击 固定/不固定 头部
  onFixed() {
    int type = detailSet.fixedDetailHeadType == 2 ? 1 : 2;
    Event.eventBus.fire(DetailHeadFixedEvent(type, DateTime.now().millisecondsSinceEpoch));
    detailSet.fixedDetailHeadType = type;
    config.userInfo.detailSet = detailSet;
    setState(() {});
  }

  // //固定、隐藏头部icon
  // StreamSubscription<HeadFixedHideEvent> headFixedHideEvent;
  // void listenHeadFixedHideEvent() {
  //   headFixedHideEvent = Event.eventBus.on<HeadFixedHideEvent>().listen((event) {
  //     detailSet.fixedDetailHeadType = event.fixedDetailHeadType;
  //     detailSet.isShowFixedIcon = event.isShowFixedIcon;
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   });
  // }

  
  //选择比赛
  onLeagueNameTap() async {
    var selectAgent = SelectGameAgent(extendModel,widget.playerController, matchesDetailModel,detailSet,context,leagueId,leagueName);
//    selectAgent.showSelectLeagueGame();
  }

  void onMoreTap() async {
    var selectAgent = SelectGameAgent(extendModel,widget.playerController,matchesDetailModel,detailSet,context,leagueId,leagueName);
    selectAgent.showMatchViewChoose();
  }

}

class SelectGameAgent{
  final ExtendModel extendModel;
  final MatchesDetailModel matchesDetailModel;
  final DetailSet detailSet;
  final BuildContext context;
  final String leagueId;
  final String leagueName;
  final CommonVideoPlayerController playerController;
  final String selectAnchorId;  // 切换主播Id
  SelectGameAgent(this.extendModel, this.playerController, this.matchesDetailModel, this.detailSet, this.context, this.leagueId, this.leagueName,[this.selectAnchorId]);

//  showSelectLeagueGame() async {
//    var model = LeagueMatchSelectorModel(leagueIds: this.leagueId, leagueName: this.leagueName);
//    //设置当前日期
//    await showPopup(
//        context,
//        LeagueMatchSelector(
//          onConfirmChoosed: onConfirmChoosed,
//          model: model,
//        ),
//        true);
//  }


  //比赛视图切换
  void showMatchViewChoose() async {
    var model = MatchViewChooseModel();
    model.extendModel = extendModel;
    model.gidm = matchesDetailModel.data?.gidm;
    await showPopup(
      context,
      MatchViewChoose(
        onConfirmChoosed: onMoreConfirmChoosed,
        playerController: playerController,
        model: model,
        selectAnchorId: selectAnchorId,
      ),
    );
  }

//
//  //选择比赛回调
//  void onConfirmChoosed(LeagueMatchSelectorModel selModel) {
//    var selectedMatchIds = selModel.selectedMatchIds;
//    if (selectedMatchIds != null && selectedMatchIds.length > 0) {
//      Future(()async{
//        var selectedMatchId = selectedMatchIds[0];
//        var loadingDialog  = LoadingDialog.create(config.langMap['baseLang']['detail']['waitingForSwitch']);
//        loadingDialog.show(context);
//        var resDetail = await Net.getMatchesDetail(params: {'gidm': selectedMatchId});
//        loadingDialog.dismiss();
////        DetailPage.show(context, DetailPage(params: DetailParams(
////          gidm: selectedMatchId,
////          leagueName: resDetail.data.leagueName,
////          homeTeam: resDetail.data.homeTeam,
////          awayTeam: resDetail.data.awayTeam,
////          homeLogo: resDetail.data.homeLogo,
////          awayLogo: resDetail.data.awayLogo,
////          gameType: resDetail.data.gameType,
////          showtype: resDetail.data.showtype,
////        )));
//          Event.eventBus.fire(DetailParams(
//            gidm: selectedMatchId,
//            leagueName: resDetail.data.leagueName,
//            homeTeam: resDetail.data.homeTeam,
//            awayTeam: resDetail.data.awayTeam,
//            homeLogo: resDetail.data.homeLogo,
//            awayLogo: resDetail.data.awayLogo,
//            gameType: resDetail.data.gameType,
//            showtype: resDetail.data.showtype,
//          ));
//        // showSliderPageSheet2(context,DetailPage(params: ));
//      });
//
//    }
//  }

  //选中比赛视图回调
  void onMoreConfirmChoosed(MatchViewChooseModel model) {
    var selectItemName = model.selectItem;
    if (selectItemName == 'video' || selectItemName == 'animation' || selectItemName == 'default') {
      if (selectItemName != detailSet.selectViewType) {
        detailSet.selectViewType = selectItemName;
        detailSet.isChangeViewType = true;
        config.userInfo.detailSet = detailSet;
        Event.eventBus.fire(DetailViewEvent(model));

      }
    } else if (selectItemName == 'data') {
      AiRouter.push(context, "dataViewPage", params: {
        "match": matchesDetailModel,
      });
    } else if (selectItemName == 'anchor'){
      List videoLives = model?.extendModel?.data?.videoLives ?? [];
      String anchorId = '';
      if (videoLives.length > 0) {
        for(VideoLive videoLive in videoLives){
          String selectId = selectAnchorId ?? '';
          if (selectId.isNotEmpty && videoLive?.anchorId == selectId) {
            anchorId = selectId;
            break;
          }
        }
        if (anchorId.isNotEmpty) {
//          showMaterialPageRoute(context, AnchorHomePage(anchorId: anchorId,));
        }
      }
    }
    
  }
}
