// import "package:fast_ai/utils/ai_image.dart";
// import 'package:fast_ai/config/config.dart';
// import 'package:fast_ai/utils/ai_image.dart';
// import 'package:fast_ai/utils/ai_measure.dart';
// import 'package:fast_ai/widgets/view_helper.dart';
// import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import '../chatroom_widget.dart';
// import 'chat_input_with_emoji_widget.dart';
//
// /*
// *********************************************************************
//  * author:Sam
//  * date:2019-11-28
//  **********************************************************************
//  */
//
//
// //输入框高
// const ChatInputBarHeight = 56.0;
//
//
// //聊天输入栏
// class ChatInputBar extends StatefulWidget {
//
//   //发送点击
//   final ValueChanged<String> onSendClickListener;
//
//   //表情点击
//   final VoidCallback onEmojiClickListener;
//   final ChatInputWithEmojiController controller;
//   final ChatroomController chatroomController;
//   final TextEditingController editingController;
//
//   ChatInputBar({Key key, this.onSendClickListener, this.onEmojiClickListener, @required this.controller,@required this.chatroomController,this.editingController}):super(key:key);
//
//
//   @override
//   ChatInputBarState createState() => ChatInputBarState();
// }
//
// class ChatInputBarState extends State<ChatInputBar> with WidgetsBindingObserver {
//
//
//   TextEditingController _messgeController;
//
//   bool _didChangeMetrics = false;
//   double _bottomInset = 0;
//   double _preBottomInset = 0;
//
//   @override
//   void didChangeMetrics() {
//     super.didChangeMetrics();
//     _didChangeMetrics = true;
//   }
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((Duration d){
//
//       WidgetsBinding.instance.addPersistentFrameCallback((Duration d){
//         if(context == null)return;
//         if(!_didChangeMetrics){
//           return;
//         }
//
//         _preBottomInset = _bottomInset;
//         try{
//           _bottomInset = MediaQuery.of(context).viewInsets?.bottom ?? 0;
//         }catch(_){
//           _bottomInset = 0;
//         }
//
//
//         if(_preBottomInset != _bottomInset){
//           WidgetsBinding.instance.scheduleFrame();
//           return;
//         }
//
//         _didChangeMetrics = false;
//         fireKeyBoardChanged();
//       });
//     });
//     _messgeController = widget.editingController ?? TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     if(widget.editingController == null){
//       _messgeController?.dispose();
//     }
//     super.dispose();
//   }
//
//   bool _needShowEmojiList = false;
//   bool show = false;
//   fireKeyBoardChanged(){
//     if(show == focusNode.hasFocus)
//       return;
//
//     show = focusNode.hasFocus;
//     print('keyboard is showed $show');
//     if(!show && _needShowEmojiList){
//       _needShowEmojiList = false;
//       widget.controller.showEmojiList();
//     }
//     widget.controller.fireOnChanged();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  _body();
//   }
//
//
//   void setText(String text){
//     _messgeController.text = text;
//     _messgeController.selection = TextSelection.fromPosition(TextPosition(offset:text.length));
//   }
//
//   void addText(String text){
//     String inputText = _messgeController.text +text;
//     _messgeController.text = inputText;
//     _messgeController.selection = TextSelection.fromPosition(TextPosition(offset:inputText.length, affinity: TextAffinity.downstream) );
//   }
//
//   num time;
//   bool enableShowTip  = true;
//   FocusNode focusNode = FocusNode();
//
//   //输入框
//   Widget _body() {
//     bool showBottomSpan = !(focusNode.hasFocus || widget.controller.isShowEmojiWidget);
//     return InkWell(
//         onTap: (){
//           focusNode.requestFocus();
//           widget.controller.hideEmojiList();
//         },
//         child: Container(
//           alignment: Alignment.topCenter,
//           color: Colors.white,
//           padding: EdgeInsets.only(left: 8, right: 8),
//           height: ChatInputBarHeight + (showBottomSpan? AiMeasure.bottomOffset(context) :0),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   height: 45,
//                   padding: EdgeInsets.only(
//                     left: 12,
//                     right: 12,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: const Color(0xFFF4F5F8),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Expanded(
//                         child: TextField(
//                             enabled: !widget.controller.isShowEmojiWidget,
//                             focusNode: focusNode,
//                             maxLines: 1,
//                             // inputFormatters: [BanEmojiTextInputFormatter(),],
//                             controller: _messgeController,
//                             keyboardType: TextInputType.text,
//                             textInputAction: TextInputAction.send,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                               hintText: config.langMap['baseLang']['detail']['chatroom']['chatHintText'],
//                               hintStyle: AiTextStyle(
//                                 color: config.skin.colors.fontColorDisable,
//                                 fontSize: TextSize.contentTitle,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                               border: InputBorder.none,
//
//                             ),
//                             onChanged: (s){
// //                              if(s.length>50){
// //                                s = s.substring(0, 50);
// //                                //限制提示次数过多导致一直显示
// //                                if(null == time ||  enableShowTip){
// //                                  enableShowTip = false;
// //                                  Flushbar(
// //                                    title: '温馨提示',
// //                                    message: "发送内容不能超过50个字符哦~",
// //                                    duration: Duration(seconds: 1),
// //                                  ).show(context);
// //
// //                                } else{
// //                                  if(DateTime.now().millisecondsSinceEpoch -time>1000){
// //                                    enableShowTip = true;
// //                                  }
// //                                }
// //                                time = DateTime.now().millisecondsSinceEpoch;
// //                                setState(() {
// //                                  _messgeController.text = s;
// //                                  _messgeController.selection = TextSelection.fromPosition(TextPosition(offset: s.length));
// //                                });
// //                              }
//                             },
//                             onSubmitted: (s){
//                               if(null != widget.onSendClickListener){
//                                 widget.onSendClickListener(s);
//                               }
//                               _messgeController.text = "";
//                               //保留键盘
//                               // focusNode.requestFocus();
//                             },
//                             style: AiTextStyle(
//                               color: config.skin.colors.fontColorDark,
//                               fontSize: TextSize.contentTitle,
//                               fontWeight: FontWeight.normal
//                             ),
//                           ),
//                         ),
//                       InkWell(
//                         onTap: (){
//                           ///隐藏键盘
//                           if(widget.controller.isShowEmojiWidget){
//                             widget.controller.hideEmojiList();
//                             Future.delayed(Duration(milliseconds: 300),(){
//                               focusNode.requestFocus();
//                             });
//                           }else{
//                             if(focusNode.hasFocus){
//                               focusNode.unfocus();
//                               _needShowEmojiList = true;
//                             }else{
//                               widget.controller.showEmojiList();
//                             }
//                           }
//                         },
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               width: 20,
//                             ),
//                             AiSvgPicture.asset(
//                               "assets/images/detail/chatroom/chatroom_face.svg",
//                               width: 20,
//                               height: 20,
//                             ),
//                           ],
//                         )
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }
//
