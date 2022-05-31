

import 'package:flutter/cupertino.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/api/api.dart';

class GiftInfoModel {

  String playerId;    //发送礼物的玩家ID
  String playerLevel; //玩家等级
  String nickName;    //昵称

  String giftNo;      //礼物编号
  int count;          //礼物数量
  int times;          //送礼次数

  GiftType type;      //礼物动效类型
  String svga;        //svga动效类型，数据文件
  String gif;         //gif动效数据文件
  String image;       //图片动效数据文件

  int msgTime;        //消息接收时间

  int playCount;      //播放次数
  int playTime;       //播放时长
  bool isSelect;      //是否选中
  int section;        //第几组
  int row;            //第几个
  // 服务器定义字段
  String id;          //礼物id
  String giftId;      //礼物id
  String giftName;    //礼物名称
  num price;          //礼物价格
  String giftImage;   //礼物动图(isGif:true是gif，false是svga格式)
  String pngImage;    //礼物静态图
  int status;         //状态 1上线、2未上线
  int sorts;          //排序(后台用)
  int isGif;          //是否gif图片非svga 0否1是
  String freeVip;
  // 新增加
  String anchorName;  //主播名字
  String seasonLevelName;  //主播名字
  num seasonLevel;    //等级
  String headImg;     //头像
  bool isWishGift;    //是否有心愿礼物标签

  GiftInfoModel({
    @required this.playerId,
    @required this.nickName,
    @required this.giftName,
    @required this.type,
    this.playerLevel,
    this.giftNo,
    this.svga,
    this.gif,
    this.image,
    this.count = 1,
    this.times = 1,
    this.msgTime,
    this.playCount,
    this.playTime,
    this.id,
    this.giftId,
    this.price,
    this.giftImage,
    this.pngImage,
    this.status,
    this.sorts,
    this.freeVip,
    this.isGif,
    this.isSelect = false,
    this.anchorName,
    this.seasonLevel,
    this.seasonLevelName,
    this.headImg,
    this.isWishGift = false,
  });

  GiftInfoModel.fromMap(Map<String, dynamic> map) {
    var giftJson = AiJson(map);
    id = giftJson.getString('id');
    giftId = id;
    count = giftJson.getNum('buyCounts') ?? 1;
    times = 1;
    isSelect = false;
    giftName = giftJson.getString('giftName');
    pngImage = giftJson.getString('pngImage');
    price = giftJson.getNum('price');
    giftImage = giftJson.getString('giftImage');
    status = giftJson.getNum('status');
    isGif = giftJson.getNum('isGif');
    msgTime = DateTime.now().millisecondsSinceEpoch;
    if (!pngImage.startsWith("http")) {
      if (pngImage.startsWith('/'))
        pngImage = "${Api.baseImgUrl}$pngImage";
      else
        pngImage = "${Api.baseImgUrl}/$pngImage";
    }
    if (!giftImage.startsWith("http")) {
      if (giftImage.startsWith('/'))
        giftImage = "${Api.baseImgUrl}$giftImage";
      else
        giftImage = "${Api.baseImgUrl}/$giftImage";
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playerId'] = this.playerId;
    data['playerLevel'] = this.playerLevel;
    data['nickName'] = this.nickName;
    data['giftNo'] = this.giftNo;
    data['count'] = this.count;
    data['buyCounts'] = this.count;
    data['times'] = this.times;
    data['type'] = this.type;
    data['svga'] = this.svga;
    data['image'] = this.image;
    data['msgTime'] = this.msgTime;
    data['playCount'] = this.playCount;

    data['playTime'] = this.playTime;
    data['isSelect'] = this.isSelect;
    data['section'] = this.section;
    data['id'] = this.id;
    data['giftId'] = this.giftId;
    data['giftName'] = this.giftName;
    data['price'] = this.price;
    data['giftImage'] = this.giftImage;
    data['pngImage'] = this.pngImage;
    data['status'] = this.status;
    data['sorts'] = this.sorts;
    data['isGif'] = this.isGif;
    data['freeVip'] = this.freeVip;
    return data;
  }
}

enum GiftType{
  svga,
  gif,
  image,
}