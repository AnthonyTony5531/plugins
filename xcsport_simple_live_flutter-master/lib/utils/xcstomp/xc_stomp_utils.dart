import 'dart:math';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-05
 **********************************************************************
 */

class XCStompUtils {

  //创建一个唯一的字符
  static String createUniqueId() {
    return "${randomLetter()}${DateTime.now().millisecondsSinceEpoch}";
  }

  //随机字母
  static String randomLetter({int len = 5}) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < len; i++) {
      int code = Random().nextInt(25) + 97;
      stringBuffer.write(String.fromCharCode(code));
    }
    return stringBuffer.toString();
  }

  //随机数字
  static String randomNumber({int len = 5}) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < len; i++) {
      int number;
      //首位不能为零
      if(0 == i){
        number = Random().nextInt(8)+1;
      }else{
        number = Random().nextInt(9);
      }
      stringBuffer.write(number);
    }
    return stringBuffer.toString();
  }


  //生成websocket url后缀
  static String  createWebsocketUrlUniqueSuffix(){
    return "${XCStompUtils.randomNumber(len: 3)}/${XCStompUtils.randomLetter(len: 8)}/websocket";
  }


  //转成stomp协议带\的json字符
  static String buildStompJson(Map<String, dynamic> map) {
    StringBuffer buffer = new StringBuffer();
    buffer.write("{");
    int index = 0;
    map.forEach((key, value) {
      if (index++ != map.length - 1) {
        buffer.write(
            "${wrapString(key)}:${value is String ? wrapString(value) : value},");
      } else {
        buffer.write(
            "${wrapString(key)}:${value is String ? wrapString(value) : value}");
      }
    });
    buffer.write("}");
    return buffer.toString();
  }

  //包装成string
  static String wrapString(String value) {
    return "\\\"$value\\\"";
  }

  //获取json数据
  static String gainJsonData(String data) {
    return data.substring(data.indexOf("{"), data.lastIndexOf("}") + 1);
  }

  //是否是json 消息
  static bool isJsonMessage(String data) {
    //print("收到消息:$data");
    return data.contains("\\ncontent-type:application/json");
  }
}
