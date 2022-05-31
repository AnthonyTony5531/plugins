
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class WishGiftModel{

  String giftId;
  String giftName;
  String giftImage;
  num number;   // 总的礼物数
  num implementationNumber; // 已送的礼物数
  WishGiftLang wishGiftLang;
  double giftWidth = 0.0;

  WishGiftModel fromWishGiftReqProtocol(Map<String,dynamic> g){

    var json = AiJson(g);
    giftId = json.getString('giftId');
    giftImage = json.getString('giftImage');
    number = json.getNum('number');
    implementationNumber = json.getNum('implementationNumber');
    var name = json.getMap('giftName');
    wishGiftLang = WishGiftLang().fromWishGiftReqProtocol(name);
    if(config.isCnLang){
      giftName = wishGiftLang.cn;
    }
    else if(config.isCnTwLang){
      giftName = wishGiftLang.tw;
    }
    else if(config.isEnLang){
      giftName = wishGiftLang.us;
    }
    else if(config.isVnLang){
      giftName = wishGiftLang.vn;
    }
    else if(config.isThLang){
      giftName = wishGiftLang.th;
    }
    return this;
  }
}

class WishGiftLang{
  String us;
  String tw;
  String cn;
  String vn;
  String th;
  WishGiftLang fromWishGiftReqProtocol(Map<String,dynamic> g){
    var json = AiJson(g);
    us = json.getString('en-us.name');
    tw = json.getString('zh-tw.name');
    cn = json.getString('zh-cn.name');
    vn = json.getString('vi-vn.name');
    th = json.getString('th-th.name');
    return this;
  }
}