import 'package:flutter/cupertino.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-10
 **********************************************************************
 */

//隐藏键盘
void hideKeyBoard(BuildContext context) {
  if(null == context)
    return;
  FocusScope.of(context).requestFocus(FocusNode());
}

