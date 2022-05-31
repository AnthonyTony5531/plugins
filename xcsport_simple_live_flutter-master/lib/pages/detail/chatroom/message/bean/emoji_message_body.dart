import '../../common/emoji_config.dart';
import 'chat_user.dart';
import 'message.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */


//表情
class EmojiMessageBody  extends MessageBody {
  final  String conTxt;
  EmojiMessageBody(String emoji,{this.conTxt,ChatUser chatUser}) : super(emoji, chatUser:chatUser, messageBodyType:MessageBodyType.emoji);

  //获取表情assets路径
  String get emoji{
    return defualtEmojiMessage2EmojiAssetSwitcher[data];
  }
  String get text{
    return conTxt;
  }
}
