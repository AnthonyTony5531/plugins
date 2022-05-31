import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/pages/detail/play_group_nav/play_group_nav_ping_controller.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'horizontal_play_nav_style.dart';
import 'play_group_nav_style.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';

//详情玩法导航tabbar
class PlayGroupNav extends StatefulWidget {
  final PlayGroupNavStyle style;
  final String type;
  final List<DPagePlayNavModel> playNavModelList;
  final ValueChanged<dynamic> onSelectGroup;
  final bool allExpand;
  final VoidCallback onTapExpand;
  final double backgroundColorOpacity;
  final PlayGroupNavPingController playGroupNavPingController;

  PlayGroupNav({
    Key key,
    this.style,
    this.playNavModelList,
    this.onSelectGroup,
    this.type,
    this.allExpand = true,
    this.backgroundColorOpacity = 0.2,
    this.onTapExpand,
    this.playGroupNavPingController,
  }) : super(key: key);

  @override
  _PlayGroupNav createState() => _PlayGroupNav(style: style);
}

class _PlayGroupNav extends State<PlayGroupNav> {
  List<DPagePlayNavModel> get playNavModelList {
    return widget.playNavModelList;
  }

  ValueChanged<dynamic> onSelectGroup;

  String get type {
    return widget.type;
  }

  var style;
  final selectName = '';

  _PlayGroupNav({PlayGroupNavStyle style})
      : this.style = style ?? PlayGroupNavStyle();

  @override
  void initState() {
    if (type == 'h') {
      style = HorizontalPlayNavStyle();
    }
    super.initState();
    onSelectGroup = widget.onSelectGroup;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var menuItemViews = <Widget>[];
    if(config.isDeleteInternationalAppointModule){
      if((playNavModelList ?? []).isNotEmpty){
        playNavModelList.removeWhere((element){
          return element.type == DPageType.Anchor || element.type == DPageType.Killer;
        });
      }
    }
    if (type == 'h') {
      var titleMargin = EdgeInsets.fromLTRB(0.0, 0.0, 14.0, 0.0);
      playNavModelList.forEach((f) {
        var titleStyle = style.titleStyle;
        var countStyle = style.countStyle;
        var opacity = style.opacity;

        Widget line = Container();
        if (f.isSelect == true) {
          titleStyle = style.titleStyleSelectd;
          countStyle = style.countStyleSelected;
          opacity = style.opacitySelected;
          // line = Container(
          //   width: 16,
          //   height: 2,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: style.lineColor)),
          // );
        }
        double width =
            AiMeasure.measureTextWidth(f.count.toString(), countStyle.style);
        width = width < 14.0 ? 14.0 : (width += 2);
        menuItemViews.add(Opacity(
          opacity: opacity,
          child: GestureDetector(
            onTap: () => onTap(f),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 12, bottom: 5),
              child: Row(
                children: <Widget>[
                  (f.type == DPageType.Anchor || f.type == DPageType.Killer) &&
                          type == "h"
                      ? SizedBox()
                      : Column(
                          children: <Widget>[
                            Container(
                              margin: titleMargin,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    f.name,
                                    textAlign: titleStyle.textAlign,
                                    overflow: titleStyle.overflow,
                                    maxLines: titleStyle.maxLines,
                                    textScaleFactor: titleStyle.textScaleFactor,
                                    style: titleStyle.style,
                                  ),
                                  f.isSelect && type == 'h'
                                      ? Container(
                                          margin: EdgeInsets.only(top: 2),
                                          width: 25,
                                          height: 2.5,
                                          color: config.customStyle.themeColor,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            line,
                          ],
                        ),
                  Visibility(
                    visible: type != 'h',
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14 / 2.0),
                        child: Container(
                          width: width,
                          height: 14,
                          alignment: Alignment.center,
                          color: countStyle.flagColor,
                          child: Text(f.count.toString(),
                              textAlign: countStyle.textAlign,
                              overflow: countStyle.overflow,
                              maxLines: countStyle.maxLines,
                              textScaleFactor: countStyle.textScaleFactor,
                              style: countStyle.style),
                        ),
                      ),
                    ),
                    replacement: Container(),
                  )
                ],
              ),
            ),
          ),
        ));
      });
      return Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          //margin: style.margin,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: style.width,
          height: style.height,
          child: Stack(
            children: <Widget>[
              ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                //padding: EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 8.0),
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                children: menuItemViews,
              ),
            ],
          ));
    } else {
      var titleMargin = EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0);
      playNavModelList.forEach((f) {
        var titleStyle = style.titleStyle;
        var countStyle = style.countStyle;
        var opacity = style.opacity;

        if (f.isSelect == true) {
          titleStyle = style.titleStyleSelectd;
          countStyle = style.countStyleSelected;
          opacity = style.opacitySelected;
        }
        String rightSub = f.type == DPageType.Anchor && f.isSelect
            ? "推介"
            : f.count.toString();
        var anchorStyle = AiTextStyle(
            color: Colors.white,
            fontSize: 6,
            fontFamily: config.skin.fontFimaly.liGothicMed,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic);

        double width = AiMeasure.measureTextWidth(
            rightSub,
            f.type == DPageType.Anchor && f.isSelect
                ? anchorStyle
                : countStyle.style);
        double titleWidth =
            AiMeasure.measureTextWidth(f.name, titleStyle.style);

        width = width < 14.0 ? 14.0 : (width += 2);
        menuItemViews.add(Opacity(
          opacity: opacity,
          child: GestureDetector(
            onTap: () => onTap(f),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        margin: titleMargin,
                        alignment: Alignment.center,
                        child: Text(
                          f.name,
                          textAlign: titleStyle.textAlign,
                          overflow: titleStyle.overflow,
                          maxLines: titleStyle.maxLines,
                          textScaleFactor: titleStyle.textScaleFactor,
                          style: titleStyle.style,
                        ),
                      ),
                      (f.type == DPageType.Anchor ||
                                  f.type == DPageType.Killer) &&
                              f.isSelect
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: titleWidth - 2, right: 12),
                              child: AiSvgPicture.asset(
                                  'assets/images/detail/${f.type == DPageType.Anchor ? 'icon_tag_anchor' : 'icon_tag_killer'}.svg',
                                  width: 16.0,
                                  height: 10.0,
                                  fit: BoxFit.fill,
                                  userInternational:true
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  (f.type == DPageType.Anchor || f.type == DPageType.Killer) &&
                          f.isSelect
                      ? SizedBox()
                      : Container(
                          padding: EdgeInsets.only(top: f.isSelect?0:1, right: 4),
                          alignment: Alignment.topRight,
                          child: ClipPath(
                            clipper: _CountClipper(),
                            child: Container(
                              width: f.isSelect?14:width,
                              height: 14,
                              padding: EdgeInsets.only(top: f.isSelect?1:0),
                              alignment: Alignment.center,
                              color: countStyle.flagColor,
                              child: Center(
                                child: Text(f.count.toString(),
                                    textAlign: countStyle.textAlign,
                                    overflow: countStyle.overflow,
                                    maxLines: countStyle.maxLines,
                                    textScaleFactor: countStyle.textScaleFactor,
                                    style: f.count>100&&f.isSelect?
                                    countStyle.style.copyWith(fontSize: countStyle.style.fontSize-3):(f.count>=10&&f.isSelect? countStyle.style.copyWith(fontSize: countStyle.style.fontSize-1):countStyle.style)),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ));
      });

      return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: style.width,
          height: style.height - 9,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    margin: /*EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0)*/ EdgeInsets
                        .only(left: 10, right: 10, top: 10, bottom: 1),
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(widget.backgroundColorOpacity),
                        borderRadius: BorderRadius.circular(8.0),
//                      color: Color(0xFF0A2536),
                        color: Colors.white.withOpacity(0.1)),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: widget.onTapExpand,
                          child: Container(
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0)),
//                              color: Color(0xFF223B4A),
                                color: Colors.white.withOpacity(0.1)),
                            child: AiSvgPicture.asset(
                              widget.allExpand
                                  ? 'assets/images/detail/icon_detail_arrow_all.svg'
                                  : 'assets/images/detail/icon_detail_arrowdown_all.svg',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
//                        color: Color(0xFF3A3A41),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: menuItemViews,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              type != 'h'
                  ? InkWell(
                      onTap: () {
                        widget.playGroupNavPingController.setPingStatus(
                            !widget.playGroupNavPingController.getPingStatus());
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        margin: EdgeInsets.only(right: 10, top: 10, bottom: 1),
                        decoration: BoxDecoration(
//                    color: Color(0xFF394E5C),
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: AiSvgPicture.asset(
                            !widget.playGroupNavPingController.getPingStatus()
                                ? 'assets/images/liveplayer/icon_pushpin_un.svg'
                                : 'assets/images/liveplayer/icon_pushpin.svg',
                            width: 20,
                            height: 20),
                      ),
                    )
                  : SizedBox()
            ],
          ));
    }
  }

  void onTap(DPagePlayNavModel model) {
    if (model.isSelect == true) return;
    this.onSelectGroup(model.id);
    if (model.type == DPageType.Anchor) {
//      ModuleStatistics.ins
//          .statisticsEvent(StatisticsType.StatisticsBetPlayAnchor);
    }
    if (model.type == DPageType.Killer) {
//      ModuleStatistics.ins
//          .statisticsEvent(StatisticsType.StatisticsBetPlayStar);
    }
  }
}

class _CountClipper extends CustomClipper<Path> {


  _CountClipper();

  @override
  Path getClip(Size clipSize) {
    var path = Path();
    path.moveTo(0, clipSize.height*(2/10));
    path.lineTo(clipSize.width*(6/10),0 );
    path.lineTo(clipSize.width, clipSize.height*(4/10));
    path.lineTo(clipSize.width*(7/10), clipSize.height);
    path.lineTo(clipSize.width*(1/10), clipSize.height*(9/10));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}