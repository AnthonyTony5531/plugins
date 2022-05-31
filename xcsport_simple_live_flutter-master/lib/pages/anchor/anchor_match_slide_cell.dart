import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_match_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_style.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnchorMatchSlideCell extends StatefulWidget {

  final RBLiveType liveType;
  final AnchorSubCellModel model;
  final ValueChanged<AnchorSubCellModel> onSelectVideo;
  final ValueChanged<bool> onHiddenSame;
  AnchorMatchSlideCell({Key key,this.model,this.liveType,this.onSelectVideo,this.onHiddenSame}): super(key:key);

  @override
  _AnchorMatchSlideCellState createState() => _AnchorMatchSlideCellState();
}

class _AnchorMatchSlideCellState extends State<AnchorMatchSlideCell> {

  final defaultModel = AnchorSubCellModel();
  AnchorSubCellModel get model => widget?.model ?? defaultModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          sectionTitle(),
          leagueTimeWidget(model),
          contentWidget(),
          splitLine(),
        ],
      ),
    );
  }

  Widget splitLine(){
    return Container(
      height: 0.5,
      margin: EdgeInsets.only(left: 10.0,top: 7.0,right: 0.0),
      color: Colors.white.withOpacity(0.1),
    );
  }

  Widget sectionTitle(){
    String title = (model?.groupTitle ?? '');
    return Offstage(
      offstage: title.isEmpty,
      child: Container(
        height: 20.0,
        padding: EdgeInsets.only(left: 10.0),
        margin: EdgeInsets.only(bottom: 10),
        color: Color(0xFF0A2B3F),
//        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,style: AiTextStyle(
                color: Colors.white.withOpacity(0.4),
                fontWeight: config.skin.fontWeight.regular,
                fontSize: config.skin.fontSize.h5,
                fontFamily: config.skin.fontFimaly.pingFang,
              ),
            ),
            (model?.isShowHiddenSame ?? false)
            ? getHiddenSameWidget()
            : Container()
          ],
        )
      ),
    );
  }

  Widget contentWidget(){
//    String homeLogo = model.homeLogo;
//    String homeName = model.homeName;
//    String homeScore = model.homeGoal;
//    String homeId = model.homeId;
//
//    String awayLogo = model.awayLogo;
//    String awayName = model.awayName;
//    String awayScore = model.awayGoal;
//    String awayId = model.awayId;

    return GestureDetector(
      onTap: (){
        if(widget?.onSelectVideo != null){
          widget?.onSelectVideo(model);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.0,top: 5.0,right: 10.0),
        child: Row(
          children: <Widget>[
            Show(
              isShow: model.isShowFreeAnchor,
              replacement: anchorImage(model),
              child: anchorImage(model)
            ),
            Expanded(
              child: Show(
                isShow: !model.isShowFreeAnchor,
                replacement: Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    model.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AiTextStyle(
                      color: ColorsE8,
                      fontSize: 12
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                    Container(
//                        margin: EdgeInsets.only(left: model.showType == 'RB' ? 8.0 : 0.0,),
//                        child: teamNameWidget(homeLogo, homeName, homeScore, homeId,true)),
//                    Container(
//                        margin: EdgeInsets.only(left: model.showType == 'RB' ? 8.0 : 0.0, top: 5,),
//                        child: teamNameWidget(awayLogo, awayName, awayScore, awayId,false)
//                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// 联赛名,时间
  Widget leagueTimeWidget(AnchorSubCellModel matchModel) {
    TextStyle leagueStyle = config.skin.game.leagueStyle;
    TextStyle timeStyle = config.skin.game.timeStyle;
    leagueStyle = config.skin.game.leagueStyle.copyWith(color: Colors.white.withOpacity(0.4),fontSize: config.skin.fontSize.h6);
    timeStyle = config.skin.game.timeStyle.copyWith(color: Colors.white.withOpacity(0.4),fontSize: config.skin.fontSize.h6);

    String leagueName = '';
    bool isAnchorLive = (matchModel?.anchorId ?? '').isNotEmpty;
    return Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                isAnchorLive ? '${matchModel.name}' : '$leagueName',
                style: leagueStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Show(
              isShow: !model.isShowFreeAnchor,
              child: Container(
                alignment: Alignment(1, 0),
                child: TitleText(
                  spanSize: 2,
                  position: TitlePosition.Left,
                  title: Container(
                    child: Text(
                      '',
                      style: timeStyle,
                    ),
                  ),
//                  text: Container(
//                    child: TimeView(
//                      model: TimeViewModel()
//                          .fromCommonMatchsProtocolWithGame(matchModel.rawGame),
//                      style: TimeViewStyle(
//                        textStyle: timeStyle,
//                      ),
//                    ),
//                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 主播图片
  Widget anchorImage(AnchorSubCellModel subCellModel) {
    // 视频
    String bgImageUrl = "";
    // 主播
    if (widget.liveType == RBLiveType.AnchorType) {
      //bgImageUrl = subCellModel.icon;
      bgImageUrl = subCellModel.anchorCover;
    } else{
      bgImageUrl = string(subCellModel.gameImage,defaultVal: subCellModel.anchorCover);
    }
    if(model.isShowFreeAnchor){
      bgImageUrl = subCellModel.mobileCover;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: 50.0,
        height: 42.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AiImage.fromUrl(bgImageUrl, model.anchorDefaultIcon, BoxFit.cover),
          ],
        ),
      ),
    );
  }

  // 球队名，比分
  Widget teamNameWidget(teamLogo, teamName, teamScore, teamId,bool isHomeTeam) {
    // teamName = 'haha--';
    // teamScore = 12;
    // teamId = '11';
    Color teamColor = Color(0xFFE8E8E8);

    TextStyle teamNameStyle = AiTextStyle(
      color: teamColor,
      fontFamily: config.skin.game.strongTeamStyle.fontFamily,
      fontSize: config.skin.fontSize.h5,
      fontWeight: FontWeight.normal,
    );
    TextStyle teamScoreStyle = AiTextStyle(
      color: Color(0xFFFF4000),
      fontFamily: config.skin.game.goalStyle.fontFamily,
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.medium,
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
               margin: EdgeInsets.only(left: 2),
              child: TitleText(
                  spanSize: 8,
                  position: TitlePosition.Left,
                  textExpanded: true,
                  title: Container(
                    width: 16,
                    height: 16,
                    child: AiImage.teamLogo(teamLogo, teamId: teamId,isHomeTeam: isHomeTeam),
                  ),
                  text: Container(
                    child: Text(
                      '$teamName',
                      style: model.isSelectCurrentLive
                          ? teamNameStyle.copyWith(color: Color(0xFFFF4000))
                          : isHomeTeam ? teamNameStyle : teamNameStyle.copyWith(color: Color(0xFFE8E8E8).withOpacity(0.7)),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
               margin: EdgeInsets.only(top: 3.0),
              child: Text(
                '$teamScore',
                style: teamScoreStyle,
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHiddenSameWidget(){
    return Container(
        color: Colors.transparent,
        child: StatefulBuilder(builder: (BuildContext context,StateSetter stateSetter){
          String icon = config.userInfo.isHiddenSameLive ? 'form_radio_selected_yellow' : 'form_radio_selected_ccc';
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
                width: 80,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AiImage.svgLogo("assets/images/liveplayer/$icon.svg",size: 12,),
                    Expanded(child:Container(
                      margin: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: Text(config.langMap['baseLang']['detail']['hideSame'],style: AiTextStyle(
                        color: Colors.white,
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: config.skin.fontSize.h5,
                        fontWeight: config.skin.fontWeight.regular,
                      ),
                        maxLines: 1,
                      ),
                    ),
                    ),
                  ],
                )
            ),
            onTap: (){
              config.userInfo.isHiddenSameLive = !config.userInfo.isHiddenSameLive;
              stateSetter(() {});
              if(widget?.onHiddenSame != null){
                widget?.onHiddenSame(config.userInfo.isHiddenSameLive);
              }
            },
          );
        })
    );
  }

  TextStyle leagueNameStyle(){
    return AiTextStyle(
      color: Colors.white.withOpacity(0.4),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  String getAnchorBgImage(AnchorSubCellModel subCellModel) {
    if (widget.liveType == RBLiveType.AnchorType) {
      return "assets/images/default/default_anchor.png";
    }
//    else if(subCellModel. == 'BK'){
//      return "assets/images/default/default_bk_video.png";
//    }
    else{
      return "assets/images/default/default_video.png";
    }
    // if (gameType == "BK") {
    //   return "assets/images/detail/detail_basketball.png";
    // } else if (gameType == "BS") {
    //   return "assets/images/detail/detail_baseball.png";
    // } else if (gameType == "OP_DJ") {
    //   return "assets/images/detail/detail_electronic.png";
    // } else if (gameType == "TN") {
    //   return "assets/images/detail/detail_tennis.png";
    // } else if (gameType == "FT") {
    //   return "assets/images/detail/detail_football.png";
    // } else {
    //   return "assets/images/detail/detail_other_ball.png";
    // }
  }
}
