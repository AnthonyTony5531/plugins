import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-04
 **********************************************************************
 */

//Ai小助手
class AiRobot extends ChatUser{

  AiRobot():super(showName: config.langMap['baseLang']['detail']['chatroom']['aiAssistant']);

}