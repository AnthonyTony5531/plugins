import 'package:fast_ai/api/protocols/common/click_statistics_protocol.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';
import 'aibanner_single_model.dart';
import 'aibanner_single_style.dart';

class AiBannerSingle extends StatefulWidget {
  final AiBannerSingleStyle style;
  final AiBannerSingleModel model;
  final bool isDetailShowBanner;
  final bool isDetailActiveBanner;
  final bool isHomeBanner;
  final VoidCallback onClickBanner;
  final VoidCallback goBack;
  final ValueChanged<AiBannerSingleModel> onClickCallback;

  AiBannerSingle(
      {Key key,
      this.style,
      this.model,
      this.onClickBanner,
      this.onClickCallback,
      this.isDetailShowBanner = false,
      this.isDetailActiveBanner = false,
      this.goBack,
      this.isHomeBanner = false})
      : super(key: key);

  @override
  AiBannerSingleState createState() => AiBannerSingleState();
}

class AiBannerSingleState extends State<AiBannerSingle> {
  final defaultStyle = AiBannerSingleStyle();
  final defaultModel = AiBannerSingleModel();
  AiBannerSingleStyle get style {
    return widget?.style ?? defaultStyle;
  }

  AiBannerSingleModel get model {
    return widget?.model ?? defaultModel;
  }

  Widget createBigIcon() {
    if (widget?.isDetailActiveBanner ?? false) {
      String icon = model.iconSmall ?? '';
      if (icon.isEmpty) icon = model.iconBig;
      return AiImage.fromUrl(icon, 'assets/images/detail/more/img_detail_game_empty.png', BoxFit.cover);
    } else {
      return isNullOrEmpty(model.iconBig)
          ? AiImage.fromUrl(
              "", 'assets/images/hot/img_banner_empty_normal.png', BoxFit.cover)
          : AiImage.fromUrl(model.iconBig,
              'assets/images/hot/img_banner_default_normal.png', BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          createBigIcon(),
          Positioned(
            left: config.skin.list.cellPanddingSize,
            bottom: config.skin.list.cellPanddingSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.overTitle,
                  style: AiTextStyle(
                      color: config.skin.colors.bgColorLocal,
                      fontFamily: config.skin.fontFimaly.pingFang,
                      fontWeight: config.skin.fontWeight.medium,
                      fontSize: config.skin.fontSize.h3,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(-1, -1),
                            blurRadius: 1),
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(1, 1),
                            blurRadius: 1)
                      ]),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                Container(
                  height: 5,
                ),
                Container(
//                  height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 15.0),
                    child: Wrap(
                        spacing: 3.0,
                        runSpacing: 3.0,
                        children: [model.content].map((content) {
                          return Text(content,
                              style: AiTextStyle(
                                  color: config.skin.colors.bgColorLocal,
                                  fontFamily: config.skin.fontFimaly.pingFang,
                                  fontWeight: config.skin.fontWeight.regular,
                                  fontSize: config.skin.fontSize.h6,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black12,
                                        offset: Offset(-1, -1),
                                        blurRadius: 1),
                                    Shadow(
                                        color: Colors.black54,
                                        offset: Offset(1, 1),
                                        blurRadius: 1)
                                  ]));
                        }).toList())),
                Container(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onTap() {
    if (widget?.onClickBanner != null) {
      widget?.onClickBanner();
      // 详情活动banner
      if (!(widget?.isDetailShowBanner ?? true)) {
        return;
      }
    }
    if (widget?.onClickCallback != null) {
      widget?.onClickCallback(widget?.model);
    }
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsHomeBanner);
    if (model.actionType == ActionType.HttpUrl ||
        model.actionType == ActionType.Action) {
      goWebView(context, url: model.url, title: model.title, goBack: widget.goBack);
    } else if (model.actionType == ActionType.Game) {
      DetailPage.show(
          context,
          DetailPage(
              params:
                  DetailParams(gidm: model.gidm, gameType: model.gameType,anchorId: model.anchorId,type : isStrNullOrEmpty(model.anchorId) ? "2" : "1")), goBack: widget.goBack);
    } else if (model.actionType == ActionType.League) {
      var params = {
        "leagueName": "",
        "leagueLogo": "",
        "leagueIds": model.url,
        "gameType": model.gameType,
        'bannerEntry': !(widget?.isHomeBanner ?? false)
      };
    } else if (model.actionType == ActionType.Video) {
      DetailPage.show(
          context,
          DetailPage(
              params:
                  DetailParams(gidm: model.gidm, gameType: model.gameType,anchorId: model.anchorId,type : isStrNullOrEmpty(model.anchorId) ? "2" : "1")), goBack: widget.goBack);
    }

    if(model.actionType != ActionType.Video){
      /// 点击统计(除视频焦点图)
      ClickStatisticsReqProtocol('1', model.bannerId.toString(), config.userInfo.playerId).request();
    }

  }
}
