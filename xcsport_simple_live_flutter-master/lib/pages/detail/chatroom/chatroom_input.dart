// import 'dart:async';
//
// import 'package:fast_ai/config/config.dart';
// import 'package:fast_ai/event/event.dart';
// import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
// import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
// import 'package:fast_ai/utils/util.dart';
// import 'package:fast_ai/widgets/keybord.dart';
// import 'package:fast_ai/widgets/show_toast/show_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
//
// import 'message/bean/chat_user.dart';
// import 'message/bean/emoji_message_body.dart';
// import 'message/bean/message.dart';
// import 'message/bean/text_message_body.dart';
// import 'message/widget/chatroom_bloc.dart';
// import 'message/widget/filter/send_message_filter.dart';
// import 'message/widget/inputbar/chat_input_with_emoji_widget.dart';
// import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
//
// class ChatRoomInput extends StatefulWidget {
//   final ChatroomController controller;
//
//   ChatRoomInput({Key key, @required this.controller,}) : super(key: key);
//
//   @override
//   _ChatRoomInputState createState() => _ChatRoomInputState();
// }
//
// class _ChatRoomInputState extends State<ChatRoomInput> {
//   ChatInputWithEmojiController _chatInputController;
//   TextEditingController _editingController;
//
//   StreamSubscription<HideInput> hideInput;
//
//   double keyboardMarginBottom = 0;
//
//   @override
//   void initState() {
//     widget.controller.onStateChange(onStateChange);
//     _editingController = TextEditingController();
//     _chatInputController = ChatInputWithEmojiController(onChanged: () {
//       Future.delayed(Duration(milliseconds: 10), () {
//         if (mounted)
//           setState(() {
//             Future.delayed(Duration(milliseconds: 10), () {
//               widget.controller.scrollToBottom();
//             });
//           });
//       });
//     });
//     hideInput = Event.eventBus.on<HideInput>().listen(onHideInput);
// //    KeyboardVisibility.onChange.listen((visible){
// //      if(visible){
// //        _keyboardShow();
// //      } else {
// //        _keyboardHide();
// //      }
// //    },);
//     var keyboardVisibilityController = KeyboardVisibilityController();
//     keyboardVisibilityController.onChange.listen((bool visible) {
//       if(visible){
//         _keyboardShow();
//       } else {
//         _keyboardHide();
//       }
//     });
//     super.initState();
//   }
//
//   ///
//   void _keyboardHide(){
//     if(mounted){
//       setState(() {
//         keyboardMarginBottom = 0;
//       });
//     }
//   }
//
//   ///
//   void _keyboardShow(){
//     sleep(100,(){
//       if(mounted){
//         setState(() {
//           keyboardMarginBottom = MediaQuery.of(context).viewInsets.bottom;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     widget.controller.cleanStateChange(onStateChange);
//     hideInput?.cancel();
//     _editingController?.dispose();
//     hideKeyboardTimer?.cancel();
//     super.dispose();
//   }
//
//   ChatroomState _state = ChatroomState.None;
//
//   void onStateChange(ChatroomState state) async {
//     await sleep(10);
//     if (mounted)
//       setState(() {
//         _state = state;
//       });
//   }
//
//   onHideInput(HideInput ev) {
//     try{
//       _chatInputController.hideEmojiList();
//       FocusScope.of(context).requestFocus(FocusNode());
//     }catch(_){}
//
//   }
//
//   /// 文本输入框焦点事件-解决tab sdk KeyboardVisibility 在fragment flutter无法捕获键盘事件bug
//   void inputFocusStatus(bool focus){
//
//     if(focus){
//       Future.delayed(Duration(milliseconds: 200),(){
//         hideKeyboardTimer?.cancel();
//         hideKeyboardTimer = Timer.periodic(Duration(milliseconds: 100), (timer){
//           double oldKeyboardMarginBottom = keyboardMarginBottom;
//           keyboardMarginBottom = MediaQuery.of(context).viewInsets.bottom;
//           print('键盘高度--------:$keyboardMarginBottom');
// //          showToas('高度$keyboardMarginBottom');
//           // 精选页进来详情 MediaQuery.of(context).viewInsets.bottom; 查询就查不到  很奇怪  暂时过滤下
// //          if(keyboardMarginBottom == 0 && !config.userInfo.isShowRefinedDetail){
//           if(!config.userInfo.isShowRefinedDetail){
//             if(!_chatInputController.isShowEmojiWidget){
//               // BUG:23799【TAB版聊天室】点击输入框立即回缩，无法聊天
//               if(config.isTabSDK){
//                 widget.controller.notifyInputBarChange(InputBarStatus.show);
//               }
//               else{
//                 if(keyboardMarginBottom == 0){
//                   FocusScope.of(context).requestFocus(FocusNode());
//                   widget.controller.notifyInputBarChange(InputBarStatus.hide);
//                 }
//               }
//             }
//             if(!config.isTabSDK){
//               hideKeyboardTimer?.cancel();
//             }
//             if(mounted){setState(() {});}
//           } else if (oldKeyboardMarginBottom != keyboardMarginBottom) {
//             if (mounted) { setState(() {}); }
//           }
//           if(keyboardMarginBottom > 0 && config.isTabSDK){
//             hideKeyboardTimer?.cancel();
//             if(mounted){setState(() {});}
//           }
//         });
//         if(focus && keyboardMarginBottom == 0){
//           keyboardMarginBottom = MediaQuery.of(context).viewInsets.bottom;
//         }
//         if(mounted){setState(() {});}
//       });
//     } else {
//       Future.delayed(Duration(milliseconds: 10),(){
//         hideKeyboardTimer?.cancel();
//         keyboardMarginBottom = 0;
//         if(mounted){setState(() {});}
//       });
//     }
//   }
//
//
//   Timer hideKeyboardTimer;
//
//
//   @override
//   Widget build(BuildContext context) {
//     if (_state == ChatroomState.Locked) return SizedBox();
//     return Container(
//       margin: EdgeInsets.only(bottom: keyboardMarginBottom),
//         child: chatInputWithEmojiWidget());
//   }
//
//   final filter = SendMessageFilter();
//
//   //消息输入框
//   Widget chatInputWithEmojiWidget() {
//     // if (!isChatOpen)
//     //   return Container(
//     //     height: 1,
//     //   );
//     return ChatInputWithEmojiWidget(
//       chatroomController: widget.controller,
//       controller: _chatInputController,
//       editingController: _editingController,
//       inputFocusStatus: inputFocusStatus,
//       onSendMessageClickListener: (message) {
//         final String content = filter.filters(context, message);
//         String inputTxt = _editingController?.text ?? "";
//         if (null != content) {
//           widget.controller.sendMessage(Message<TextMessageBody>(
//               messageType: MessageType.conversation_chatroom,
//               messageBody: TextMessageBody(message,
//                   chatUser: ChatUser(
//                     showName: config.userInfo.account.data.nickName ?? "",
//                   ))));
//         } else if(!XCStompClient.ins.isConnected || config.isNotConnect){//发送失败不清空
//           Future.delayed(Duration(milliseconds: 100),(){
//             _editingController.text = inputTxt;
//           });
//         }
//         // _hideKeyBroad();
//       },
//       onEmojiSelectedListener: (emoji) {
//         final String content = filter.filters(context, emoji);
//         String inputTxt = _editingController?.text ?? "";
//         _editingController?.text = "";
//         if (null != content) {
//           widget.controller.sendMessage(Message<EmojiMessageBody>(
//               messageType: MessageType.conversation_chatroom,
//               messageBody: EmojiMessageBody(inputTxt + emoji,
//                   chatUser: ChatUser(
//                     showName: config.userInfo.account.data.nickName ?? "",
//                   ))));
//         }
//          //_hideKeyBroad();
//         //_chatInputController.hideEmojiList();
//         widget.controller.notifyInputBarChange(InputBarStatus.hide);
//       },
//       onEmojiClickListener: () {
//         _chatInputController.showEmojiList();
//       },
//     );
//   }
// }
