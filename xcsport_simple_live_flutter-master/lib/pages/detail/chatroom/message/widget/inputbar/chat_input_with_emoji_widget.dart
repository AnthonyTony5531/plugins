// import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
// import 'package:fast_ai/pages/detail/chatroom/common/emoji_config.dart';
// import 'package:fast_ai/pages/detail/chatroom/message/widget/inputbar/chat_input_with_send.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../chatroom_widget.dart';
// import 'chat_input_bar.dart';
// import 'emoji_info_list_widget.dart';
//
// /*
// *********************************************************************
//  * author:Sam
//  * date:2019-11-28
//  **********************************************************************
//  */
//
// //带表情的输入发送视图
// class ChatInputWithEmojiWidget extends StatefulWidget {
//   final ChatInputWithEmojiController controller;
//   final ChatroomController chatroomController;
//   final TextEditingController editingController;
//
//   //发送点击事件
//   final ValueChanged<String> onSendMessageClickListener;
//   //发送表情
//   final ValueChanged<String> onEmojiSelectedListener;
//   final VoidCallback onEmojiClickListener;
//   final InputFocusStatus inputFocusStatus;
//
//   ChatInputWithEmojiWidget({
//     this.controller,
//     this.onEmojiClickListener,
//     this.onSendMessageClickListener,
//     this.onEmojiSelectedListener,
//     this.editingController,
//     @required this.chatroomController,
//     this.inputFocusStatus,
//   }):super(key:controller?._key);
//
//   @override
//   _ChatInputWithEmojiWidgetState createState() => _ChatInputWithEmojiWidgetState();
// }
//
// class ChatInputWithEmojiController{
//
//   final VoidCallback onChanged;
//   ChatInputWithEmojiController({ @required this.onChanged});
//
//   void fireOnChanged(){
//     if(onChanged != null){
//       onChanged();
//     }
//   }
//
//   final _key =  GlobalKey<_ChatInputWithEmojiWidgetState>();
//   void hideEmojiList(){
//     _key.currentState?.hideEmojiList();
//   }
//
//   void showEmojiList(){
//     _key.currentState?.showEmojiList();
//   }
//
//   bool get isShowEmojiWidget{
//     return _key.currentState?.isShowEmojiWidget ?? false;
//   }
// }
//
// class _ChatInputWithEmojiWidgetState extends State<ChatInputWithEmojiWidget> {
//
//   void hideEmojiList(){
//     this.isShowEmojiWidget = false;
//     widget.controller.fireOnChanged();
//   }
//
//   void showEmojiList(){
//     this.isShowEmojiWidget = true;
//     widget.controller.fireOnChanged();
//   }
//
//   bool isShowEmojiWidget = false;
//   GlobalKey<ChatInputBarState>  inputKey = new GlobalKey();
//
//   InputBarStatus _status = InputBarStatus.hide;
//
//
//   @override
//   void initState() {
//     widget?.chatroomController?.listenerInputBarChange(inputBarStatsListener);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     widget?.chatroomController?.removeInputBarChange(inputBarStatsListener);
//     super.dispose();
//   }
//
//   void inputBarStatsListener(InputBarStatus status){
//     if(mounted && _status != status){
//       setState(() {
//         _status = status;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return _body();
//   }
//
//   Widget _body(){
//     if(_status == InputBarStatus.hide){
//       PopupShareService.ins.resume('showChatInputKeyboard');
//       return SizedBox();
//     }
//     PopupShareService.ins.pause('showChatInputKeyboard');
//     return  IntrinsicHeight(
//       child: Column(
//         children: <Widget>[
//           ChatInputWithSend(key:inputKey, onSendClickListener:widget.onSendMessageClickListener,
//             onEmojiClickListener: widget.onEmojiClickListener,
//             controller: widget.controller,
//             chatroomController: widget.chatroomController,
//             editingController:widget?.editingController,
//             inputFocusStatus: widget.inputFocusStatus,
//           ),
//           !isShowEmojiWidget?Container(): EmojiInfoListWidget(onEmojiSelectedListener:widget.onEmojiSelectedListener, emojiSwitcher: defualtEmojiName2EmojiMessageSwitcher,),
// //          Container(
// //            height:MediaQuery.of(context).viewInsets.bottom,
// //          ),
//         ],
//       ) ,
//     ) ;
//   }
// }
//
//
