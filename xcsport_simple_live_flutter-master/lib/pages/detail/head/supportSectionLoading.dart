import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fast_ai/config/config.dart';

class SupportSectionLoading extends StatefulWidget {
  SupportSectionLoading({Key key, this.gameType}) : super(key: key);
  String gameType;
  @override
  _SupportSectionLoading createState() {
    return new _SupportSectionLoading();
  }
}

class _SupportSectionLoading extends State<SupportSectionLoading> {
  String get gameType {
    return widget.gameType;
  }

  Map get baseLang => config.langMap['baseLang'];
  @override
  void initState() {
    super.initState();
  }

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

  Widget supportItem(type) {
    if (type == 'N' && config.fiexd.gameType1X2.indexOf(gameType) < 0) {
      return Container();
    }
    String supportText = '';
    String rate = '0';

    if (type == 'H') {
      supportText = baseLang['detail']['hWin'];
    } else if (type == 'C') {
      supportText = baseLang['detail']['cWin'];
    } else if (type == 'N') {
      supportText = baseLang['detail']['xWin'];
    }
    supportText = supportText + rate + '%';

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => {},
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
                        baseLang['detail']['supportSection'],
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
