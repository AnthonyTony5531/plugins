import 'chat_user.dart';
import 'message.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';

/*
*********************************************************************
 * author:wilson
 * date:2020-12-10
 **********************************************************************
 */

//礼物消息内容
class GiftMessageBody extends MessageBody {
  GiftInfoModel giftInfoModel;
  GiftMessageBody(this.giftInfoModel, { ChatUser chatUser }) : super('', chatUser: chatUser, messageBodyType:MessageBodyType.gift);

  bool get isGif => giftInfoModel.isGif == 1;
  String get messageImage => giftInfoModel.isGif == 1 ? giftInfoModel.giftImage : giftInfoModel.pngImage;
  String get giftDesc => "${giftInfoModel.giftName} x ${giftInfoModel.count}";
}
