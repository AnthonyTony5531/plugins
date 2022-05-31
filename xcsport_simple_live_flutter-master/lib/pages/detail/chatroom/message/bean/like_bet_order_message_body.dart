import 'package:fast_ai/config/config.dart';
import 'chat_user.dart';
import 'message.dart';

/*
*********************************************************************
 * author:wilson
 * date:2020-12-14
 **********************************************************************
 */

//纯文本文本内容
class LikeBetOrderMessageBody extends MessageBody {

  Map map;

  LikeBetOrderMessageBody(String data, this.map,{ChatUser chatUser}) : super(data, chatUser:chatUser,messageBodyType:MessageBodyType.likeBetOrder);
  //获取文本内容
  String get text {
    return ' ${config.langMap['baseLang']['detail']['chatroom']['liked']} ';
  }

  int get type {
    return map['type'];
  }

  String get targetName{
    return map['toNickName'];
  }
}
