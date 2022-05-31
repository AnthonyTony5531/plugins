import 'dart:ui';

import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:common_component/util/ai_measure.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/anchor/anchor_grade.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
//import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor/free_anchor_model.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page_view_model.dart';
import 'package:fast_ai/pages/anchor/live_view/live_view.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/live_view/live_view.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_model.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_style.dart';
import 'package:fast_ai/widgets/image/circle_image.dart';
import 'package:fast_ai/widgets/shape_button.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'free_anchor_sub_item_view_model.dart';
import 'free_anchor_sub_page_style.dart';

///
/// {notes}
///
class FreeAnchorSubItemView extends StatelessView<FreeAnchorSubItemViewStyle,
    FreeAnchorSubItemViewModel> {
  final FreeAnchorSubItemViewModel model;
  final ValueChanged<AnchorSubCellModel> onAnchorMore;
  final ValueChanged<AnchorSubCellModel> onLookAnchor;
  final FreeAnchorPosition freeAnchorPosition;

  const FreeAnchorSubItemView({
    Key key,
    @required this.model,
    this.onAnchorMore,
    this.onLookAnchor,
    this.freeAnchorPosition,
  }) : super(key: key, model: model);

  AnchorSubCellModel get subCellModel =>
      model?.anchorSubCellModel ?? AnchorSubCellModel();
  bool get isDetailShow => freeAnchorPosition == FreeAnchorPosition.detail;

  @override
  Widget render(BuildContext context, FreeAnchorSubItemViewModel viewModel) {

    Widget anchorWidget = Container();
    // 主播排行
    if (subCellModel.isAnchorRank) {
      return Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDAE0FF), Color(0xFFFDFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
//              height: 178.0,
              child: AiImage.fromUrl(subCellModel.gameImage,
                  'assets/images/matchlist/img_live_rank.png', BoxFit.cover),
            )
        ),
      );
    }
    if (subCellModel.liveStatus != null) {
      Color bottomBgColor = Colors.white;
      Color topBgColor = Colors.white;
      anchorWidget = Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
              color: isDetailShow ? Colors.white.withOpacity(0.06) : bottomBgColor,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 90.0,
                          child: anchorImage(subCellModel),
                        ),
                        Container(
//                          color: isDetailShow ? Colors.white.withOpacity(0.06) : bottomBgColor,
                          height: 64.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xFFDAE0FF), Color(0xFFFDFFFF)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              freeAnchor(),
                              Container(
                                margin: EdgeInsets.only(left: 10, bottom: 6.0, right: 0.0),
                                child: hotBottomWidget(subCellModel, context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    }
    return anchorWidget;
  }

  Widget freeAnchor() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 0.0),
      alignment: Alignment.centerLeft,
      child: Text(
        subCellModel?.title ?? '',
        style: anchorTitleStyle().copyWith(color: Color(0xFF202F4C)),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget cornerMarkWidget() {
    String text =
        '${config.langMap['baseLang']['widgets']['anchorMatchCellViews']['live']}';
    return Container(
      padding: EdgeInsets.only(left: 5, top: 1, right: 5, bottom: 1),
      decoration: BoxDecoration(
          color: Color(0xFFFF4000),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Text(
        text,
        style: AiTextStyle(
          color: Colors.white,
          fontFamily: config.skin.fontFimaly.pingFang,
          fontSize: config.skin.fontSize.h8,
          fontWeight: config.skin.fontWeight.regular,
        ),
      ),
    );
  }

// 球队名，比分
  Widget teamNameWidget(
      teamLogo, teamName, teamScore, teamId, bool isHomeTeam) {
    Color teamColor = Color(0xFF19263B);
    TextStyle teamNameStyle = AiTextStyle(
      color: teamColor,
      fontFamily: config.skin.game.strongTeamStyle.fontFamily,
      fontSize: config.skin.fontSize.h4,
      fontWeight: FontWeight.bold,
    );
    TextStyle teamScoreStyle = AiTextStyle(
      color: Color(0xFFFF4000),
      fontFamily: config.skin.game.goalStyle.fontFamily,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium,
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              // margin: EdgeInsets.only(left: 2),
              child: TitleText(
                spanSize: 8,
                position: TitlePosition.Left,
                textExpanded: true,
                title: Container(
                  width: 16,
                  height: 16,
                  child: AiImage.teamLogo(teamLogo,
                      teamId: teamId, isHomeTeam: isHomeTeam),
                ),
                text: Container(
                  child: Text(
                    '$teamName',
                    style: subCellModel.isSelectCurrentLive
                        ? teamNameStyle.copyWith(color: Color(0xFFFF4000))
                        : teamNameStyle.copyWith(color: isDetailShow ? Colors.white : teamColor),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // margin: EdgeInsets.only( top: 9,right: 10),
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

// 主播图片
  Widget anchorImage(AnchorSubCellModel subCellModel) {
    TextStyle textStyle = AiTextStyle(
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: Colors.white,
    );
    // RBLiveType liveType
    // 视频
    // String bgImageUrl = widget.liveType == RBLiveType.HotAnchorType ? subCellModel.cover : subCellModel.gameImageUrl;
    String bgImageUrl = "";
    String lookNumStr = '';
    int count = subCellModel.betNum ?? 0;
    Widget nameWidget = Container();
    // 主播
    count = subCellModel.watchTotal ?? 0;
    // bgImageUrl =
    //     string(subCellModel.gameImage, defaultVal: subCellModel.anchorCover);

    if(subCellModel.isShowFreeAnchor){
      bgImageUrl = subCellModel.cover;
    }else{
      bgImageUrl = subCellModel.mobileCover;
    }
    if(bgImageUrl == null || bgImageUrl.length == 0){
      bgImageUrl = subCellModel.anchorCover;
    }
    // 自由播人气数
    if(subCellModel.isShowFreeAnchor){
      count = subCellModel.livePopularity;
    }
    String freeLive =
        AiJson(config.langMap['baseLang']).getString('anchor.freeLive');
    int lookNum = count ?? 0;
    lookNumStr = lookNum >= 10000 ? '${(lookNum / 10000).toStringAsFixed(1)}w' : lookNum.toString();
    bool isLiveOpen = false;
    if (subCellModel.isShowFreeAnchor) {
      isLiveOpen = subCellModel.liveStatus == 1;
    }
    lookNumStr += (isLiveOpen
        ? '${config.langMap['baseLang']['widgets']['anchorMatchCellViews']['watch']}'
        : '${config.langMap['baseLang']['widgets']['anchorMatchCellViews']['reserve']}');

    String broadcast =
        AiJson(config.langMap['baseLang']).getString('anchor.broadcast');
    String playStr = AiJson(config.langMap['baseLang']).getString('anchor.play');
    var color1 = Colors.black.withOpacity(0.0);
    var color2 = Colors.black.withOpacity(0.3);
    bool isHiddenBlur = DetailPage.currentPageIsDetailPage;

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AiImage.fromUrl(
              bgImageUrl, subCellModel.anchorDefaultIcon, BoxFit.cover),
          Positioned.fill(
              child: Offstage(
                  offstage: (subCellModel?.isRBGame ?? true) || isHiddenBlur,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 6,
                        sigmaY: 4,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              ColorsBlack.withOpacity(0.1),
                              ColorsBlack.withOpacity(0.2),
                            ])),
                      ),
                    ),
                  ))),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 23,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[color1, color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF000000).withOpacity(0.1))
              ,
              alignment: Alignment.centerLeft,
              child: TitleText(
                position: TitlePosition.Left,
                spanSize: 0,
                title: subCellModel.isRBGame
                    ? Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Row(
                          children: [
                            shapeButton(
                              child: Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF70ADFE), Color(0xFF4B72FF)],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Center(
                                    child: AiImage.asset(
                                        'assets/images/square/gif_live_white.gif',
                                        width: 10.0,
                                        height: 10.0),
                                  )
                              ),
                            ),
                            LiveView(model: subCellModel.liveViewModel)
                          ],
                        ),
                      )
                    : Container(),
                text: Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: subCellModel.isShowFreeAnchor && !subCellModel.isRBGame
                      ? SizedBox.shrink()
                      : subCellModel.isShowFreeAnchor && subCellModel.isRBGame
                          ? Text(
                              freeLive,
                              style: textStyle,
                            )
                          : Row(
                              children: [
                                sw(2),
                                Offstage(
                                  offstage: subCellModel.isRBGame,
                                  child: Text(
                                    playStr,
                                    style: timeStyle(),
                                  )
                                )
                              ],
                            ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 8,
              bottom: subCellModel.isRBGame ? 9.0 : 7.0,
              child: Offstage(
                  offstage: lookNum <= 0,
                  child: Text(
                    lookNumStr,
                    style: textStyle,
                  ))),
          Positioned(
              top: 4,
              right: 4,
              child: subCellModel.isShowAnchorLabel
                  ? shapeButton(
                      child: Container(
                        height: 16.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF70ADFE), Color(0xFF4B72FF)])
                        ),
                        padding: EdgeInsets.only(left: 6.0, right: 4.0),
                        child: Text(
                          subCellModel?.label ?? '',
                          style: anchorLabelStyle(),
                        ),
                      )
                    )
                  : Offstage(
                      offstage: subCellModel.isRBGame,
                      child: Container(
                        height: 16.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.black.withOpacity(0.2)),
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Text(
                          broadcast,
                          style: anchorLabelStyle(),
                        ),
                      ))),
          Positioned(
              top: 4,
              left: 4,
              width: 64.0,
              height: 16.0,
              child: Offstage(
                  offstage: !subCellModel.isShowAnchorLevel,
                  child: AnchorGrade(
                    anchorLevelIcon: subCellModel?.anchorLevelIcon,
                    anchorLevelTitle: subCellModel?.anchorLevelTitle,
                  ))),
          Show(isShow: !(subCellModel.isRBGame ?? true),
            child: Center(
            child: CircleImage(
              size: 44,
              bold: 1,
              boldColor: Colors.white,
              backgroundColor: Colors.transparent,
              padding: 0,
              fit: BoxFit.cover,
              url: isStrNullOrEmpty(subCellModel.icon) ? null : subCellModel.icon,
              error: subCellModel.anchorDefaultIcon,
            ),
          ),)
        ],
      ),
    );
  }

  TextStyle timeStyle(){
    return AiTextStyle(
        color: Colors.white,
        fontSize: config.skin.fontSize.h6,
        fontFamily:
        config.skin.fontFimaly.pingFang,
        fontWeight:
        config.skin.fontWeight.regular,
        height: 1.1);
  }

  // 热门主播bottom
  Widget hotBottomWidget(AnchorSubCellModel matchModel, BuildContext context) {
    TextStyle nameStyle = AiTextStyle(
        color: freeAnchorPosition == FreeAnchorPosition.detail ? Colors.white.withOpacity(0.7) : Color(0xFF000000).withOpacity(0.6),
        fontSize: config.skin.fontSize.h5,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular);
    String name = matchModel.name ?? matchModel.nickname ?? '';
    bool isAnchorLive = !isStrNullOrEmpty(matchModel?.anchorId);
    if (!isAnchorLive) {
//      name = matchModel.leagueName;
    }
    String title = '';
    double width = AiMeasure.measureTextWidth(name, nameStyle) +
        ((isAnchorLive && title.isNotEmpty) ? 8 : 1.0);
    width = width > 90.0 ? 90.0 : width;
    if (isAnchorLive && title.isNotEmpty && width > 70.0) {
      width = 70.0;
    }

    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      child: Text(
        '$name',
        style: nameStyle.copyWith(color: Color(0xFF838EB8)),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

//    return GestureDetector(
//        behavior: HitTestBehavior.opaque,
//        onTap: () {
//          print('');
//        },
//        child: Container(
//          padding: EdgeInsets.only(bottom: 5),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                  flex: 4,
//                  child: GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    child: Container(
//                      // color: Colors.redAccent,
//                      alignment: Alignment.centerLeft,
//                      child: Row(
//                        children: <Widget>[
//                          Container(
//                            child: Row(
//                              children: <Widget>[
//                                Container(
//                                  alignment: Alignment.centerLeft,
//                                  width: width,
//                                  child: Text(
//                                    '$name',
//                                    style: nameStyle.copyWith(color: Color(0xFF838EB8)),
//                                    maxLines: 1,
//                                    overflow: TextOverflow.ellipsis,
//                                  ),
//                                ),
////                                Offstage(
////                                  offstage: !isAnchorLive,
////                                  child: title.isNotEmpty
////                                      ? Container(
////                                          height: 16.0,
////                                          padding: EdgeInsets.only(
////                                              left: 5.0,
////                                              right: 5.0,
////                                              bottom: 1.0),
////                                          decoration: BoxDecoration(
////                                              borderRadius:
////                                                  BorderRadius.circular(4.0),
////                                              color: config
////                                                  .skin.colors.rankBGRedColor),
////                                          alignment: Alignment.center,
////                                          child: Text(
////                                            title,
////                                            style: winTitleStyle(),
////                                          ),
////                                        )
////                                      : Container(
////                                          margin: EdgeInsets.only(top: 1.0),
////                                          alignment: Alignment.centerLeft,
////                                          width: 15,
////                                          height: 15,
//////                                          child: Icon(
//////                                            Icons.keyboard_arrow_right,
//////                                            size: 15,
//////                                            color: freeAnchorPosition == FreeAnchorPosition.detail
//////                                                ? Colors.white.withOpacity(0.7)
//////                                                : Color(0xFF222222).withOpacity(0.7),
//////                                          ),
////                                        ),
////                                )
//                              ],
//                            ),
//                          ),
//                          SizedBox()
//                        ],
//                      ),
//                    ),
//                    onTap: () {
//                      if (isAnchorLive) {
//                        if (Hooks.ins.isBlocked(HookName.AboutAnchor, {}))
//                          return;
//                        if (onLookAnchor != null) {
//                          onLookAnchor(subCellModel);
//                        }
////                        var params = {
////                          "anchorId": subCellModel.anchorId,
////                          "playerName": subCellModel.name,
////                          "anchorIcon": subCellModel.icon,
////                          "isAnchor": true,
////                          'liveParams': {
////                            'flv': subCellModel.flv,
////                            'm3u8': subCellModel.m3u8,
////                            'rtmp': subCellModel.rtmp,
////                            'url': subCellModel.url,
////                          }
////                        };
////                        showMaterialPageRoute(context, PersonalPage(params: params))
////                            .then((value) {
////                          List followPlayerIds = config
////                              ?.userInfo?.account?.data?.followPlayerIds ??
////                              [];
////                          subCellModel.isFollowAnchor =
////                              followPlayerIds.contains(subCellModel.anchorId);
////                        });
//                      }
//                    },
//                  )),
//              Expanded(
//                  flex: 1,
//                  child: Offstage(
//                    offstage: subCellModel.isShowFreeAnchor,
//                    child: GestureDetector(
//                      onTap: () {
//                        if (Hooks.ins.isBlocked(HookName.AboutAnchor, {}))
//                          return;
//                        if (onAnchorMore != null) {
//                          onAnchorMore(subCellModel);
//                        }
//                      },
//                      behavior: HitTestBehavior.opaque,
//                      child: Container(
//                        padding: EdgeInsets.only(bottom: 0, right: 9),
//                        alignment: Alignment.centerRight,
//                        child: AiImage.svgLogo(
//                            'assets/images/liveplayer/icon_anchor_list_more.svg',
//                            size: 18,
//                            color: freeAnchorPosition == FreeAnchorPosition.detail
//                              ? Colors.white.withOpacity(0.7)
//                              : Color(0xFF222222).withOpacity(0.7),
//                        ),
//                      ),
//                    ),
//                  )),
//            ],
//          ),
//        ));
  }

  TextStyle winTitleStyle() {
    return AiTextStyle(
        color: Color(0xFFFF0000),
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang);
  }

  TextStyle anchorLabelStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang);
  }

  TextStyle anchorLevelTitleStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h7,
        fontFamily: config.skin.fontFimaly.pingFang);
  }

  TextStyle anchorTitleStyle() {
    return AiTextStyle(
        color: freeAnchorPosition == FreeAnchorPosition.detail ? Colors.white : Color(0xFF202F4C),
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h4,
        fontFamily: config.skin.fontFimaly.pingFang,
        height: 1.2);
  }

//  String getAnchorBgImage(FreeAnchorModel subCellModel) {
//    return "assets/images/default/default_anchor.png";
//    // if (gameType == "BK") {
//    //   return "assets/images/detail/detail_basketball.png";
//    // } else if (gameType == "BS") {
//    //   return "assets/images/detail/detail_baseball.png";
//    // } else if (gameType == "OP_DJ") {
//    //   return "assets/images/detail/detail_electronic.png";
//    // } else if (gameType == "TN") {
//    //   return "assets/images/detail/detail_tennis.png";
//    // } else if (gameType == "FT") {
//    //   return "assets/images/detail/detail_football.png";
//    // } else {
//    //   return "assets/images/detail/detail_other_ball.png";
//    // }
//  }
}
