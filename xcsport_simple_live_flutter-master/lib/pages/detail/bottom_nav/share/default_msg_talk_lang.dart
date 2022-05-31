import 'package:fast_ai/config/config.dart';

//大神分享默认话术
List<String> defaultMsgTalkLang = [
  "大神在晒单，速度来围观",//简体中文
  "大神在曬單，速度來圍觀",//繁体中文
  "The great god is posting orders, speed comes to watch",//英文
  "Đại thần đang đăng đơn hàng, tốc độ tới xem nào !",//越南语
  "ผู้ยอดเยี่ยมกำลีงโพส์ตคำสั่งซื้อ จะได้ชมเร็วๆนี้",//泰语
];

String msgTalkLang(String msg){
  bool has = false;
  defaultMsgTalkLang.forEach((str) {
    if(msg.startsWith(str)){
      has = true;
    }
  });
  if(has){
    return config.langMap['baseLang']['detail']['betShare']['defaultMsgTalk'];
  }
  return msg;
}