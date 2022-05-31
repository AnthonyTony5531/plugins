import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：时期选择
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/



import 'package:fast_ai/config/config.dart';
import 'package:flutter/painting.dart';

class DateSelectorStyle {
  bool olnyBody = false;
  double headerHeight = 54;
  double mouthHeight = 35;
  double dateLineHeight = 55; //日期行的高度
  double datePanddingSize = 15; //选中时空的大小

  //星期日...星期六的格式
  TextStyle dateTitleStyle = AiTextStyle(color: Color(0xFFAAAAAA));
  TextStyle dateStyle = AiTextStyle(
    color: Color(0xFF000000),
    fontWeight: config.skin.fontWeight.medium,
    fontFamily: config.skin.fontFimaly.liGothicMed
  );
  TextStyle subTitleStyle = AiTextStyle(
                                  fontFamily: config.skin.fontFimaly.pingFang,
                                  fontSize: 9,
                                  color: Color(0x9919263B),
                                  letterSpacing: 0.17);
  TextStyle dateDisableStyle = AiTextStyle(color: Color(0x33000000));
  TextStyle subDisableTitleStyle = AiTextStyle(
                                  fontFamily: config.skin.fontFimaly.pingFang,
                                  fontSize: 9,
                                  color: Color(0x3319263B),
                                  letterSpacing: 0.17);
}

//比较小的
class DateSelectorStyleSmall extends DateSelectorStyle {
  bool olnyBody = false;
  //头部高度
  double headerHeight = 54;
  //月份选择高度
  double mouthHeight = 50;
  //日期行的高度
  double dateLineHeight = 38; 
  //选中时空的大小
  double datePanddingSize = 2; 

  //星期日...星期六的格式
  TextStyle dateTitleStyle = AiTextStyle(color: Color(0xFFAAAAAA));
  TextStyle dateStyle = AiTextStyle(color: Color(0xFF000000));
  TextStyle subTitleStyle = AiTextStyle(
                                  fontFamily: config.skin.fontFimaly.pingFang,
                                  fontSize: 9,
                                  color: Color(0x9919263B),
                                  letterSpacing: 0.17);
}
