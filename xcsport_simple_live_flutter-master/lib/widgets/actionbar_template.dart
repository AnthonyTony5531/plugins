import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/common_appbar.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-12
 **********************************************************************
 */

//actionbar 模板



//透明的actionbar
PreferredSize actionbarTransparency(BuildContext context, {String title='',Color titleColor,double height = 50.0, Icon leadIcon,double fontSize = CommonAppbarTitleSize}) {
  return PreferredSize(
    child: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: CommonAppbarLeading(color: Colors.white,),
          ),
          Align(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*(2.0/3.0)
              ),
              child: TextHelper.build(centerStringIfNeed(title,fontSize: fontSize, width:MediaQuery.of(context).size.width*(2.0/3.0) ),
              textColor: titleColor?.value??Colors.white.value, maxLine: 2, textAlign: TextAlign.center, fontSize: fontSize),
            ),
          )
        ],
      ),
    ), preferredSize: Size.fromHeight(height),
  );
}
