import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'chat_user.dart';
import 'message.dart';

/*
*********************************************************************
 * author:wilson
 * date:2020-12-10
 **********************************************************************
 */

//纯文本文本内容
class ShareBetMessageBody extends MessageBody {

  Map _dataMap;
  String _talkMsg;

  ShareBetMessageBody(this._dataMap, this._talkMsg,{ChatUser chatUser}) : super('', chatUser:chatUser,messageBodyType:MessageBodyType.shareBet);
//  //获取文本内容
//  BettingData get bettingData {
//    BettingData d = BettingData.fromMap(_dataMap);
//    if(chatUser.anchorId != null && chatUser.anchorId != ""){
//      d.anchorId = chatUser.anchorId;
//    }
//    return d;
//  }

  String get txtMsg => _talkMsg;

  void hideLike(){
    _dataMap['like'] = true;
  }

  bool isLike(){
    return !(IntoChatRoomStatus.ins.likeOrderIds?.contains('') ?? true);
    //return _dataMap['like'] != true;
  }
}
