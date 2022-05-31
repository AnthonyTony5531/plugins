import 'package:fast_ai/config/config.dart';
import 'chat_user.dart';
import 'message.dart';

/*
*********************************************************************
 * author:wilson
 * date:2020-12-10
 **********************************************************************
 */

//纯文本文本内容
class EnterChatRoomMessageBody extends MessageBody {

  EnterChatRoomMessageBody(String data, {ChatUser chatUser}) : super(data, chatUser:chatUser,messageBodyType:MessageBodyType.enterChatRoom);
  //获取文本内容
  String get text {
    return config.langMap['baseLang']['detail']['chatroom']['enterChatRoom'];
  }
}
