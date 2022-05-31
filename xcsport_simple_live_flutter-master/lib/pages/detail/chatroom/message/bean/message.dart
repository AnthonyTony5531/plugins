import 'chat_user.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//消息
class Message<T extends MessageBody>{
  MessageType messageType;
  String createDate;
  T messageBody;

  double messageBodyTxtWidth;//用于显示加速ui
  double playNameWidth;//用于显示加速ui

  Message({this.messageType, this.messageBody, this.createDate});
}





//消息类型
enum MessageType{
  system,//系统通知
  conversation,//普通会话
  conversation_chatroom,//多人聊天
  unknown,//为支持的消息类型
  localAdmin,
  enterChatRoom,//用户进入聊天室
  shareBet,//分享注单-跟投
  likeBetOrder,//点赞注单
  gift,//送礼物消息
}


//消息体数据类型
enum MessageBodyType{
  text,//纯文本
  emoji,//表情
  enterChatRoom,//进入聊天室系统消息
  shareBet,//分享注单
  likeBetOrder,//点赞注单
  gift,//送礼物消息
}

//消息内容
abstract class MessageBody{
  ChatUser chatUser;
  MessageBodyType messageBodyType;
  final String data;
  MessageBody(this.data, {this.messageBodyType, this.chatUser});
}





