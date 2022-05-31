import 'dart:async';

import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/head/reserve_match_model.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

//预约比赛
class ReserveMatch extends StatefulWidget {
  final MatchesDetailModel matchesDetailModel;
  final DetailSet detailSet;

  const ReserveMatch({Key key, this.matchesDetailModel, this.detailSet})
      : super(key: key);

  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<ReserveMatch> {
  final ReserveMatchModel reserveMatchModel = new ReserveMatchModel();
  StreamSubscription<MatchAttentionEvent> matchAttentionEvent;

  @override
  void didChangeDependencies() {
    reserveMatchModel.updateData(widget.matchesDetailModel, widget.detailSet);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    matchAttentionEvent =
        Event.eventBus.on<MatchAttentionEvent>().listen(onMatchAttentionEvent);
  }

  @override
  void dispose() {
    super.dispose();
    matchAttentionEvent?.cancel();
  }

  onMatchAttentionEvent(e) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReserveMatchModel>.value(
      value: reserveMatchModel,
      child: Consumer<ReserveMatchModel>(
        builder: (_, model, ___) {
          return body(model);
        },
      ),
    );
  }

  Widget body(ReserveMatchModel model) {
    return Column(
      children: <Widget>[
        h(20),
        time(model),
        Row(
          children: <Widget>[
            Expanded(
              child: teamInfo(
                  mustShrink(model), model.homeName, model.homeLogo, true),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextHelper.build("vs",
                    textColor: Colors.white.withOpacity(0.7).value,
                    fontSize:
                        !widget.matchesDetailModel.isDataFromNative ? 16 : 20,
                    fontFamily: FontFamily.number),
                h(12),
                Visibility(
                  visible: !widget.matchesDetailModel.isDataFromNative,
                  child: GestureDetector(
                    onTap: widget.detailSet.detailParams.allLoadFinished
                        ? () {
                            if (Hooks.ins.isBlocked(
                                HookName.StartBookingGame, {})) return;

//                            ModuleStatistics.ins.statisticsEvent(
//                                StatisticsType.StatisticsDetailAppointmentGame);
                            if (widget.detailSet?.detailParams?.type == "2") {
                              model.reverseOrCancelVideo(context);
                            } else {
                              model.reverseOrCancel(context);
                            }
                          }
                        : null,
                    child: Container(
                      width: 80,
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1,
                          )),
                      child: Align(
                          child: TextHelper.buildNormal(
                              model.hasReserve
                                  ? config.langMap['baseLang']['anchor']
                                      ['reserve']
                                  : widget.detailSet?.detailParams?.type == "2"
                                      ? config.langMap['baseLang']['anchor']
                                          ['reserveVideo']
                                      : config.langMap['baseLang']['anchor']
                                          ['reserveMatch'],
                              textColor: Colors.white.value)),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: teamInfo(
                  mustShrink(model), model.awayName, model.awayLogo, false),
            ),
          ],
        ),
      ],
    );
  }

  Widget teamInfo(
      bool mustShrink, String teamName, String logo, bool isHomeTeam) {
    var styleN = AiTextStyle(
      fontSize: 14.0,
    );
    if (AiMeasure.measureTextLineIsExceed(teamName, styleN, 150, 1)) {
      teamName =
          '${teamName.substring(0, teamName.length ~/ 2)}\n${teamName.substring(teamName.length ~/ 2 + 1, teamName.length)}';
    }
    if(isStrNullOrEmpty(teamName)){
      teamName = '';
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AiImage.teamLogo(logo, size: 48, isHomeTeam: isHomeTeam),
        h(12),
        TextHelper.build(teamName,
            textColor: Colors.white.value, fontSize: mustShrink ? 10 : 14.0),
      ],
    );
  }

  Widget time(ReserveMatchModel model) {
    return TextHelper.buildNormal(!isStrNullOrEmpty(model?.time) ? model?.time : '',
        textColor: Colors.white.withOpacity(0.7).value);
  }

  bool mustShrink(ReserveMatchModel model) {
    var style = AiTextStyle(
      fontSize: 14.0,
      color: Color(0xFFD2E4FF),
    );
    return AiMeasure.measureTextLineIsExceed(model.homeName, style, 100, 1) ||
        AiMeasure.measureTextLineIsExceed(model.awayName, style, 100, 1);
  }
}
