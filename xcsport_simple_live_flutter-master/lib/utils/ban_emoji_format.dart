import 'package:flutter/services.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-10
 **********************************************************************
 */


//禁止输入表情黑名单
class BanEmojiTextInputFormatter extends BlacklistingTextInputFormatter {
  BanEmojiTextInputFormatter() : super(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'));


}



