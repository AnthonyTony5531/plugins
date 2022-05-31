/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-1
 * 没有数据
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:flutter/material.dart';
import 'default_view.dart';

class MatchEmtpy extends DefaultView {

  MatchEmtpy({
    Key key, 
    String name, 
    String type, 
    VoidCallback onTap, 
    String msg, 
    bool enableBtn = false, 
    double height, 
    Color backgroundColor = Colors.transparent, 
    String btnText,
    bool onlyText = false,
    bool isShowTitle = false,
    double imageTopMargin = 0.0,
    Color textColor,
    AlignmentGeometry alignment,
    String title = ''})
      : super(
        key: key, 
        name: name, 
        type: type, 
        onTap: onTap, 
        msg: msg, 
        enableBtn: enableBtn, 
        height: height, 
        backgroundColor: backgroundColor,
        btnText:btnText,onlyText:onlyText,
        isShowTitle:isShowTitle,
        title:title,
        textColor:textColor,
        alignment:alignment,
        imageTopMargin:imageTopMargin,
      );
}
