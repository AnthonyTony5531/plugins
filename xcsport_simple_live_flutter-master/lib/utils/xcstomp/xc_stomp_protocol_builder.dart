


/*
*********************************************************************
 * author:Sam
 * date:2019-12-05
 **********************************************************************
 */

//stomp协议构造器
class XCStompProtocolBuilder{

  //登录
  static String login(String loginName, String password, int heartbeatTime, String token){
    return '["CONNECT\\ntoken:$token\\nloginName:$loginName\\npassword:$password\\naccept-version:1.1,1.0\\nheart-beat:$heartbeatTime,$heartbeatTime\\n\\n\\u0000"]	';
  }

  //心跳包
  static String  get heartbeat{
    return '["\\n"]';
  }


  //订阅
  static String subscribe({String subscribeId, String topic}){
    // print(topic);
    return '["SUBSCRIBE\\nid:$subscribeId\\ndestination:$topic\\n\\n\\u0000"]';
  }

  //发送json字符粗
  static String sendMessage(String target, String message){
    var dataPreLen =  '["SEND\\ndestination:$target\\nncontent-length:\\n\\n$message\\n\\u0000"]'.length;
    return '["SEND\\ndestination:$target\\nncontent-length:${dataPreLen+dataPreLen.toString().length}\\n\\n$message\\n\\u0000"]';
  }


  //取消订阅
  static String unsubscribe(String subcribeId){
    return '["UNSUBSCRIBE\\nid:$subcribeId\\n\\n\\u0000"]';
  }
//["SEND\ndestination:/chat/sendMsg\ncontent-length:108\n\n{\"token\":\"1\",\"msgType\":\"1\",\"roomNo\":\"485808\",\"content\":\"asdf\",\"playerId\":\"2e93bb4fe8c60fdc136088923f69c10d\"}\u0000"]
}