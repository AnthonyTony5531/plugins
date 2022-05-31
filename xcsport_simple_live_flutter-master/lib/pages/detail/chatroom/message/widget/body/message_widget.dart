import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:flutter/cupertino.dart';


/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */


//消息内容视图，如发送的字符串内容，表情等
abstract class MessageBodyWidget<T extends MessageBody> extends StatelessWidget {
    Message<T> message;
    MessageBodyWidget(this.message);
}




