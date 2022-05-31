import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class PlayMessageList extends BaseModel {

  //已读
  static final READ_Y = "Y";
  //未读
  static final READ_N = "N";

  PlayMessageListModel data;
  PlayMessageList.fromMap(Map<String, dynamic> map): super.fromMap(map) {
    this.data = PlayMessageListModel.fromMap(map['data']);
  }
}

class PlayMessageListModel {
  int totalCount;
  List<Messages> messages;
  PlayMessageListModel.fromMap(Map<String, dynamic> map) {
    this.totalCount = map['totalCount'];
    if(totalCount>0){
      this.messages = map['messages'].map<Messages>((item)=>Messages.fromMap(item)).toList();
    }

    if(isNotEmpty(messages)){
      messages = messages.where((f){
        try{
          if( (config.userInfo.account?.data?.createTime??0) > (f.optTime??0) ){
            return false;
          }
        }catch(e){

        }
        return true;
      }).toList();
    }
  }
}

class Messages {
  String id;
  String isRead;
  String title;
  String msgType; // 1-系统消息 2-优惠活动 3-赛事公告
  String content;
  int optTime;
  Messages();
  Messages.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.isRead = map['isRead'];
    this.title = map['title'];
    this.content = map['content'];
    this.optTime = new AiJson(map).getTimestamp('optTime');
    this.msgType = map['msgType'];
    if (config.isTwLang) {
      this.title = config.langConfig.transToTwText(cnString: this.title);
      this.content = config.langConfig.transToTwText(cnString: this.content);
      this.msgType = config.langConfig.transToTwText(cnString: this.msgType);
    }
  }
  
}