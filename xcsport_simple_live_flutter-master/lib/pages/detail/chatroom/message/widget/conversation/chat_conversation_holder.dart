import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/utils/string_util.dart';


/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */


//聊天会话视图模型
class ChatConversationHolder{
  final Message message;


  ChatConversationHolder(this.message); //获取聊天用户
  ChatUser  get chatUser{
    final body = message?.messageBody;
    return body?.chatUser;
  }


  //获取消息体类型
  MessageBodyType  get messageBodyType{
    final body = message?.messageBody;
    return body?.messageBodyType;
  }

  //获取消息类型
  MessageType  get messageType{
    return message?.messageType;
  }

  //消息体数据
  String get messageBodyData{
    final  body = message?.messageBody;
    return body?.data;
  }

  //获取会话头像
  String get chatUserHeader{
    final body = message?.messageBody;
    final chatUser = body?.chatUser;
    return chatUser?.headerUrl??"";
  }

  //是否主播发言
  bool get isAnchorMessage {
    final body = message?.messageBody;
//    bool isCurrentAnchor = false;
//    if (isNotEmpty(config?.userInfo?.detailSet?.detailParams?.anchorId)) {
//      isCurrentAnchor = message?.messageBody?.chatUser?.anchorId == config?.userInfo?.detailSet?.detailParams?.anchorId;
//    }
    int playerType = body?.chatUser?.playerType ?? 0;
    return playerType == 6 && isAnchor;
  }

  bool get isAnchor {
    return isNotEmpty(message?.messageBody?.chatUser?.anchorId);
  }

  String get anchorId {
    if (!isAnchor) return '';
    return message?.messageBody?.chatUser?.anchorId ?? '';
  }

  //获取会话头像
  String get showName{
    final body = message?.messageBody;
    final chatUser = body?.chatUser;
    return chatUser?.showName??"";
  }

}

