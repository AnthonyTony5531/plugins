import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//支持按钮
class SupportSection extends StatefulWidget {
  SupportSection({Key key, this.matchesDetailModel, this.extendModel}) : super(key: key);
  MatchesDetailModel matchesDetailModel;
  ExtendModel extendModel;
  @override
  SupportSectionState createState() {
    return new SupportSectionState();
  }
}

class SupportSectionState extends State<SupportSection> {
  MatchesDetailModel get matchesDetailModel {
    return widget.matchesDetailModel;
  }

  ExtendModel get extendModel {
    return widget.extendModel;
  }

  @override
  void initState() {
    super.initState();
  }

  Map get baseLang => config.langMap['baseLang'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          supportItem('H'),
          supportItem('N'),
          supportItem('C'),
        ],
      ),
    );
    //padding: const EdgeInsets.all(12),
  }

  LoadingDialog lodingDialog;
  void onClickItem(String type) async {
    if (this.extendModel.data?.isSupport != 'N') {
      Future.delayed(const Duration(milliseconds: 100), () async {
        String gidm = matchesDetailModel.data.gidm;
        var res = await Net.updateSupport(gidm: gidm, support: type);
        if (res.code == 200) {
          lodingDialog = LoadingDialog.create(config.langMap['baseLang']['virtual']['loadingContent']);
          lodingDialog.show(context);

          String groupId = '${config.userInfo.sportPlatformId}';
          var resExtend = await Net.getExtend(params: {'gidm': gidm, 'groupId': groupId});
          lodingDialog.dismiss();
          if (resExtend.code == 200) {
            Event.eventBus.fire(ExtendEvent(resExtend));
            Event.eventBus.fire(OnSupportEvent());
          }
        }
      });
    }
  }

  Widget supportItem(type) {
    if (type == 'N' && config.fiexd.gameType1X2.indexOf(matchesDetailModel.data.gameType) < 0) {
      return Container();
    }
    String supportText = '';
    String rate = '0';

    if (type == 'H') {
      supportText = baseLang['detail']['hWin'];
      if ((null != extendModel.data?.supportRate) && (extendModel.data?.supportRate?.length ?? 0) > 0) {
        rate = (extendModel.data.supportRate[0] / 100).toString();
      }
    } else if (type == 'C') {
      supportText = baseLang['detail']['cWin'];
      if ((null != extendModel.data?.supportRate) && (3 == extendModel.data?.supportRate?.length)) {
        rate = (extendModel.data.supportRate[2] / 100).toString();
      }
    } else if (type == 'N') {
      supportText = baseLang['detail']['xWin'];
      if ((null != extendModel.data?.supportRate) && (extendModel.data?.supportRate?.length ?? 0) > 1) {
        rate = (extendModel.data.supportRate[1] / 100).toString();
      }
    }
    supportText = supportText + rate + '%';

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => onClickItem(type),
              child: Container(
                width: 70.0,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AiSvgPicture.asset('assets/images/detail/bet_good.d955c2c8.svg'),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                      child: Text(
                        this.extendModel.data?.isSupport == 'N'
                            ? baseLang['detail']['supportSectionAlreday']
                            : baseLang['detail']['supportSection'],
                        style: AiTextStyle(fontSize: 12.0, color: Color.fromRGBO(255, 255, 255, 0.8)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    //添加边框
                    width: 0.5, //边框宽度
                    color: Color.fromRGBO(255, 255, 255, 0.5), //边框颜色
                  ),
                  borderRadius: new BorderRadius.all(Radius.circular(5.0)), //设置圆角
                ),
              ),
            ),
            Container(
              child: Text(
                supportText,
                style: AiTextStyle(fontSize: 12.0, color: Color.fromRGBO(255, 255, 255, 0.8)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
