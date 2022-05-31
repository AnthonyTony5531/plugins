import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';



class BetRecordTimeLineView extends StatelessWidget {

  final Color bgColor;
  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback onTap;
  final int betNum;
  final double winLoss;
  final String ymd;

  BetRecordTimeLineView({
    this.bgColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.onTap,
    this.betNum,
    this.winLoss,
    this.ymd,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      color: bgColor ?? Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10.0, horizontal: horizontalPadding),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: Container(
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('$ymd',style: AiTextStyle(
                    fontFamily: config.skin.fontFimaly.pingFang,
                    fontWeight: config.skin.fontWeight.regular,
                    fontSize: config.skin.fontSize.h5,
                    color: config.skin.colors.fontColorDark40,
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_drop_down,color: Colors.black.withOpacity(0.4)),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Text('${config.langMap['baseLang']['total']}${betNum ?? 0}${config.langMap['baseLang']['betting']['bet']}  ${config.langMap['baseLang']['order']['profitLoss']}:${winLoss?.toStringAsFixed(2) ?? 0}',style: AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontWeight: config.skin.fontWeight.regular,
            fontSize: config.skin.fontSize.h5,
            color: Color(0xFF19263B),
          )),
        ],
      ),
    );
  }
}
