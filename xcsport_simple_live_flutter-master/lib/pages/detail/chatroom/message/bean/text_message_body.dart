import 'package:fast_ai/config/config.dart';

import 'chat_user.dart';
import 'message.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//纯文本文本内容
class TextMessageBody extends MessageBody {
  TextMessageBody.unknown({ChatUser chatUser}) : super("[${config.langMap['baseLang']['detail']['chatroom']['unknownMessage']}]",chatUser:chatUser,messageBodyType:MessageBodyType.text){
    messageBodyType = MessageBodyType.text;

  }

  TextMessageBody(String data, {ChatUser chatUser}) : super(data, chatUser:chatUser,messageBodyType:MessageBodyType.text);
  //获取文本内容
  String get text {
    return data ?? "";
  }
}
