import 'package:fast_ai/api/protocols/detail/gift_query_protocol.dart';
import 'package:fast_ai/pages/detail/free_anchor/free_anchor_model/wish_gift_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_pan_page.dart';
import 'package:fast_ai/utils/util.dart';

class GiftModel{
  int total = 0;
  // 指示牌
  List<IndicatorModel> indicatorModels = [];
  List<GiftInfoModel> giftList = [];
  // 分组礼物
  List<List<GiftInfoModel>> sectionGifts = [];

  List<GiftInfoModel> fromGiftRspProtocol(GiftQueryRspProtocol rsp,{List<WishGiftModel> wishGiftModels}){
    List<GiftInfoModel> gifts = [];
    giftList.clear();
    sectionGifts.clear();
    indicatorModels.clear();
    total = rsp.total;
    for(int index = 0; index < rsp.giftList.length; index ++){
      var giftMap = rsp.giftList[index];
      GiftInfoModel model = GiftInfoModel.fromMap(giftMap);
      model.isWishGift = false;
      if(wishGiftModels != null && wishGiftModels.isNotEmpty){
        for(int i = 0; i < wishGiftModels.length; i ++){
          WishGiftModel wishGiftModel = wishGiftModels[i];
          if(!isStrNullOrEmpty(wishGiftModel.giftId ) && model.giftId == wishGiftModel.giftId){
            model.isWishGift = true;
            break;
          }
        }
      }
      gifts.add(model);
      giftList.add(model);
    }
//    // 礼物价格按照从大到小排序
//    giftList.sort((model1,model2)=>model2.price.compareTo(model1.price));
//    gifts.clear();
//    gifts.addAll(giftList);
    
    // 礼物分组
    if(giftList.isNotEmpty){
      int count = giftList.length;
      int section = 1;
      if(count % 8 == 0 && count > 1){
        section = count ~/ 8;
      }
      else if(count > 8 && count % 8 != 0){
        section = count ~/8 + 1;
      }
      for(int index = 0; index < section; index ++){
        int startPosition = index * 8;
        if(giftList.length >= startPosition + 8){
          List<GiftInfoModel> list = giftList.sublist(startPosition,startPosition + 8);
          sectionGifts.add(list);
        }
        else{
          List<GiftInfoModel> list = giftList.sublist(startPosition,giftList.length);
          sectionGifts.add(list);
        }
      }
      // 指示器
      for(int index = 0; index < sectionGifts.length; index ++){
        IndicatorModel model = IndicatorModel();
        model.isSelect = index == 0;
        indicatorModels.add(model);
      }
    }
    return gifts;
  }

}