import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card.dart';
import 'package:fast_ai/utils/ai_level.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_conversation_holder.dart';
import 'chat_conversation_widget.dart';
import 'package:fast_ai/utils/ai_measure.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//普通用户消息视图
class ChatConversationUserWidget extends ChatConversationWidget {
  final Message message;
  final String anchorId;
  final bool isLiveMessage; // 详情滚球投注页视频上显示消息标识
  final bool isFreeAnchorListMessage;
  final bool isShowLeftMessage; // 大幕竖屏消息是左对齐还是右对齐
  ChatConversationUserWidget(this.message, double uiMaxWidth, this.anchorId, {this.isLiveMessage = false,  this.isFreeAnchorListMessage = false, this.isShowLeftMessage = false}) : super(message, uiMaxWidth: uiMaxWidth);


  @override
  Widget build(BuildContext context) {
    var childContent = <ChildContent>[];
    var holder = ChatConversationHolder(message);
    bool canShowUserCard = holder.messageType == MessageType.conversation_chatroom;
//    childContent.add(ChildContent(
//        text: message.messageType == MessageType.enterChatRoom ? '$showName ':'$showName: ',
//        style: holder.isAnchorMessage ? anchorNameStyle : nameStyle,
//        canSplit: true,
//        padding: EdgeInsets.only(top: 3)
//    ));
    String messageTxt = messageBodyTxt;
    if(!isStrNullOrEmpty(messageTxt) && (messageTxt is String)){
      if(isLiveMessage || isFreeAnchorListMessage){
        if(messageTxt.length > 20){
          messageTxt = messageTxt.substring(0, 20) + '...';
        }
      }
      else{
        if(messageTxt.length > 50){
          messageTxt = messageTxt.substring(0, 50) + '...';
        }
      }
    }
    childContent.add(ChildContent(
        text: messageTxt,
        style: holder.anchorId == anchorId && !isStrNullOrEmpty(anchorId) ? anchorMsgBodyStyle : msgBodyStyle,
        canSplit: true,
    ));

    var layout;

    Widget headerWigdet = !canShowUserCard ? headerImg : InkWell(child: headerImg, onTap: (){
      if(Hooks.ins.isBlocked(HookName.ClickChatRoomUser , {})) return;
      // PopupShareService.ins.pause('_chatRoomUserCard');
      // showPopup1(context, UserCard(playerId: holder.chatUser.chatId,)).then((value) {
      //   PopupShareService.ins.resume('_chatRoomUserCard');
      // });
    },);


    var height = (AiMeasure.measureText("中文", holder.anchorId == anchorId && !isStrNullOrEmpty(anchorId) ? anchorNameStyle : nameStyle).height*MediaQuery.of(context).textScaleFactor );
    var nameWidget = Container(
      height: height,
      child: Text('${holder.chatUser.showName}：', style: holder.anchorId == anchorId && !isStrNullOrEmpty(anchorId) ? anchorNameStyle : nameStyle,),
    );

    Widget header2Wigdet = (!canShowUserCard || isLiveMessage) ? nameWidget : InkWell(child: nameWidget, onTap: (){
      if(Hooks.ins.isBlocked(HookName.ClickChatRoomUser , {}))return;
      // PopupShareService.ins.pause('_chatRoomUserCard');
      // showPopup1(context, UserCard(playerId: holder.chatUser.chatId,)).then((value) {
      //   PopupShareService.ins.resume('_chatRoomUserCard');
      // });
    },);
    Color bgColor = AiLevel.getColorByLevel(holder?.chatUser?.level ?? 0);
    if(isLiveMessage || isFreeAnchorListMessage){
      bgColor = Colors.black;
      header2Wigdet = SizedBox.shrink();
      headerWigdet = SizedBox.shrink();
    }

    BoxDecoration decoration;
    
    if ((holder?.chatUser?.level ?? 0) > 4) {
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bgColor.withOpacity(0.1),
            bgColor.withOpacity(0.2),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      );
    } else {
      decoration = BoxDecoration(
        color: isLiveMessage || isFreeAnchorListMessage ? Colors.black.withOpacity(0.2) : bgColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.0),
      );
    }

    double marginLeft = 12.0;
    double marginRight = 12.0;
    double paddingLeft = 8.0;
    double paddingRight = 8.0;
    double maxWidth = uiMaxWidth;
    double msgWidth = msgViewWidth;
    if(maxWidth == null || maxWidth <= 0){
      maxWidth = MediaQuery.of(context).size.width * 0.8;
    }
    if(isFreeAnchorListMessage){
      msgWidth = getMessageTxtWidth(messageTxt);
      marginLeft = 5.0;
      marginRight = 5.0;
      paddingLeft = 5.0;
    }
    if(msgWidth > maxWidth - 20){
      layout = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: isFreeAnchorListMessage ? (isShowLeftMessage ? CrossAxisAlignment.start : CrossAxisAlignment.end) : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: maxWidth,
            alignment: Alignment.centerLeft,
            decoration: decoration,
            padding: EdgeInsets.only(top: 6, bottom: 6, left: paddingLeft, right: paddingRight),
            margin: EdgeInsets.only(bottom: 3, left: marginLeft, right: marginRight),
            child: AiWrap(
              alignment: WrapAlignment.start,
              header: headerWigdet,
              header2: header2Wigdet,
              childContent: childContent,
              tail: messageBodyEmoji,
            ),
          ),
        ],
      );
    } else {
      layout = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isFreeAnchorListMessage ? (isShowLeftMessage ? MainAxisAlignment.start : MainAxisAlignment.end) : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: decoration,
            padding: EdgeInsets.only(top: 6, bottom: 6, left: paddingLeft, right: paddingRight),
            margin: EdgeInsets.only(bottom: 3, left: marginLeft, right: marginRight),
            child: AiWrap(
              alignment: WrapAlignment.start,
              header: headerWigdet,
              header2: header2Wigdet,
              childContent: childContent,
              tail: messageBodyEmoji,
            ),
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: layout,
    );
  }
}

