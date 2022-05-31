// import "package:fast_ai/utils/ai_image.dart";
// import 'package:fast_ai/config/config.dart';
// import 'package:fast_ai/utils/ai_measure.dart';
// import 'package:fast_ai/utils/util.dart';
// import 'package:fast_ai/widgets/view_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../chatroom_widget.dart';
// import 'chat_input_with_emoji_widget.dart';
//
// //输入框高
// const ChatInputBarHeight = 85.0;
//
// typedef InputFocusStatus = void Function(bool focus);
//
// //聊天输入栏
// class ChatInputWithSend extends StatefulWidget {
//   //发送点击
//   final ValueChanged<String> onSendClickListener;
//
//   //表情点击
//   final VoidCallback onEmojiClickListener;
//   final ChatInputWithEmojiController controller;
//   final ChatroomController chatroomController;
//   final TextEditingController editingController;
//   final InputFocusStatus inputFocusStatus;
//
//   ChatInputWithSend({
//     Key key,
//     this.onSendClickListener,
//     this.onEmojiClickListener,
//     @required this.controller,
//     @required this.chatroomController,
//     this.editingController,
//     this.inputFocusStatus,
//   }) : super(key: key);
//
//   @override
//   ChatInputWithSendState createState() => ChatInputWithSendState();
// }
//
// class ChatInputWithSendState extends State<ChatInputWithSend>
//     with WidgetsBindingObserver {
//   TextEditingController _messgeController;
//
//   //记录第一帧渲染时间，防止第一次弹起输入框又马上收起
//   int _firstRenderTime = 0;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     _messgeController = widget.editingController ?? TextEditingController();
//     WidgetsBinding.instance.addPostFrameCallback((cb) {
//       _firstRenderTime = DateTime.now().millisecondsSinceEpoch;
//       focusNode.requestFocus();
//     });
//     focusNode.addListener(() {
//       if (widget.inputFocusStatus != null) {
//         widget.inputFocusStatus(focusNode.hasFocus);
//       }
//     });
//
//     //用于输入框显示键盘时，边沿左右手势退出收下键盘情况，隐藏输入框
// //    KeyboardVisibility.onChange.listen((visible){
// //      if(visible){
// //      } else {
// //        _keyboardHide();
// //      }
// //    });
//     super.initState();
//   }
//
//   ///
//   void _keyboardHide() {
//     if (DateTime.now().millisecondsSinceEpoch - _firstRenderTime > 1000) {
//       Future.delayed(Duration(milliseconds: 200), () {
//         if (!widget.controller.isShowEmojiWidget) {
//           widget.chatroomController.notifyInputBarChange(InputBarStatus.hide);
//         }
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     if (widget.editingController == null) {
//       _messgeController?.dispose();
//     }
//     super.dispose();
//   }
//
//   bool _needShowEmojiList = false;
//   bool show = false;
//   fireKeyBoardChanged() {
//     if (show == focusNode.hasFocus) return;
//
//     show = focusNode.hasFocus;
//     print('keyboard is showed $show');
//     if (!show && _needShowEmojiList) {
//       _needShowEmojiList = false;
//       widget.controller.showEmojiList();
//     }
//     widget.controller.fireOnChanged();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _body();
//   }
//
//   void setText(String text) {
//     _messgeController.text = text;
//     _messgeController.selection =
//         TextSelection.fromPosition(TextPosition(offset: text.length));
//   }
//
//   void addText(String text) {
//     String inputText = _messgeController.text + text;
//     _messgeController.text = inputText;
//     _messgeController.selection = TextSelection.fromPosition(TextPosition(
//         offset: inputText.length, affinity: TextAffinity.downstream));
//   }
//
//   num time;
//   bool enableShowTip = true;
//   FocusNode focusNode = FocusNode();
//
//   // var txtSelected =
//   //     'assets/images/detail/chatroom/icon_detail_chat_text_seleced.svg';
//   var txtNormal =
//       'assets/images/detail/chatroom/icon_detail_chat_text.svg';
//   // var emojiSelected =
//   //     'assets/images/detail/chatroom/icon_detail_chat_emoji_selected.svg';
//   var emojiNormal =
//       'assets/images/detail/chatroom/icon_detail_chat_emoji.svg';
//
//   //输入框
//   Widget _body() {
//     bool showBottomSpan =
//         !(focusNode.hasFocus || widget.controller.isShowEmojiWidget);
//     return InkWell(
//         onTap: () {
//           showKeyBoard();
//         },
//         child: Container(
//           alignment: Alignment.topCenter,
//           color: Color(0xFFE7E7E7),
//           height: ChatInputBarHeight -
//               (widget.controller.isShowEmojiWidget ? 0 : 32) +
//               (showBottomSpan ? AiMeasure.bottomOffset(context) : 0),
//           child: Column(
//             children: <Widget>[
//               // Container(
//               //   height: 32,
//               //   child: Row(
//               //     children: <Widget>[
//               //       InkWell(
//               //         onTap: showKeyBoard,
//               //         child: Container(
//               //           width: 42,
//               //           child: AiSvgPicture.asset(!widget.controller.isShowEmojiWidget ? txtSelected : txtNormal),
//               //         ),
//               //       ),
//               //       InkWell(
//               //         onTap: showEmojiPad,
//               //         child: Container(
//               //           width: 42,
//               //           child: AiSvgPicture.asset(widget.controller.isShowEmojiWidget ? emojiSelected : emojiNormal),
//               //         ),
//               //       ),
//               //       Expanded(child: SizedBox(),),
//               //       Container(
//               //         alignment: Alignment.center,
//               //         padding: EdgeInsets.only(right: 12.0),
//               //         child: Text(config.langMap['baseLang']['detail']['chatroom']['civilizedCommunication'],style: AiTextStyle(
//               //         fontFamily: config.skin.fontFimaly.pingFang,
//               //         fontWeight: config.skin.fontWeight.regular,
//               //         fontSize: config.skin.fontSize.h5,
//               //         color: Color(0xFFCCCCCC),
//               //       ),),)
//               //     ],
//               //   ),
//               // ),
//               // LineHelper.buildHLine(),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Container(
//                       height: 32,
//                       margin: EdgeInsets.only(
//                           left: 12, right: 0, top: 10, bottom: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         color: const Color(0xFFF4F5F8),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Expanded(
//                             child: TextField(
//                               textAlign: TextAlign.start,
//                               enabled: !widget.controller.isShowEmojiWidget,
//                               focusNode: focusNode,
//                               maxLines: 1,
//                               controller: _messgeController,
//                               keyboardType: TextInputType.text,
//                               textInputAction: TextInputAction.send,
//                               decoration: InputDecoration(
//                                 contentPadding:
//                                     const EdgeInsets.fromLTRB(10, 0, 10, 14),
//                                 hintText: config.langMap['baseLang']['detail']
//                                     ['saySomething'],
//                                 hintStyle: AiTextStyle(
//                                   color: config.skin.colors.fontColorDisable,
//                                   fontSize: TextSize.contentTitle,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                               onChanged: (s) {},
//                               onSubmitted: (s) {
//                                 if (null != widget.onSendClickListener &&
//                                     !isNullOrEmpty(s.trim())) {
//                                   widget.onSendClickListener(s);
//                                 }
//                                 _messgeController.text = "";
//                                 widget.chatroomController
//                                     .notifyInputBarChange(InputBarStatus.hide);
//                                 //保留键盘
//                                 // focusNode.requestFocus();
//                               },
//                               style: AiTextStyle(
//                                 color: config.skin.colors.fontColorDark,
//                                 fontSize: TextSize.contentTitle,
//                                 fontWeight: FontWeight.normal,
//                                 textBaseline: TextBaseline.alphabetic,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   widget.controller.isShowEmojiWidget
//                       ? InkWell(
//                           onTap: showKeyBoard,
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             width: 50,
//                             height: 50,
//                             child: AiSvgPicture.asset(txtNormal),
//                           ),
//                         )
//                       : InkWell(
//                           onTap: showEmojiPad,
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             width: 50,
//                             height: 50,
//                             child: AiSvgPicture.asset(
//                               emojiNormal,
//                             ),
//                           ),
//                         ),
//                   // InkWell(
//                   //   onTap: _sendMsg,
//                   //   child: Container(
//                   //     width: 70,
//                   //     height: 52,
//                   //     alignment: Alignment.center,
//                   //     child: Text(config.langMap['baseLang']['detail']['livePlayer']['send'],style: AiTextStyle(
//                   //       fontFamily: config.skin.fontFimaly.pingFang,
//                   //       fontWeight: config.skin.fontWeight.medium,
//                   //       fontSize: config.skin.fontSize.h3,
//                   //       color: config.skin.colors.fontColorDark50,
//                   //     ),),
//                   //   ),
//                   // )
//                 ],
//               ),
//               Row(
//                 children: [
//                   widget.controller.isShowEmojiWidget
//                       ? Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.white,
//                           ),
//                           margin: EdgeInsets.only(left: 12),
//                           padding: EdgeInsets.all(5),
//                           width: 30,
//                           height: 30,
//                           child: AiSvgPicture.asset(
//                             emojiNormal,
//                           ),
//                         )
//                       : Container()
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   void _sendMsg() {
//     if (_messgeController.text.trim().isNotEmpty) {
//       if (null != widget.onSendClickListener) {
//         widget.onSendClickListener(_messgeController.text);
//       }
//       _messgeController.text = "";
//       widget?.chatroomController?.notifyInputBarChange(InputBarStatus.hide);
//     }
//   }
//
//   void showEmojiPad() {
//     ///隐藏键盘
//     if (!widget.controller.isShowEmojiWidget) {
//       if (focusNode.hasFocus) {
//         focusNode.unfocus();
//       }
//       Future.delayed(Duration(milliseconds: 100), () {
//         widget.controller.showEmojiList();
//       });
//     }
//   }
//
//   void showKeyBoard() {
//     ///隐藏键盘
//     if (widget.controller.isShowEmojiWidget) {
//       widget.controller.hideEmojiList();
//       Future.delayed(Duration(milliseconds: 100), () {
//         focusNode.requestFocus();
//       });
//     }
//   }
// }
