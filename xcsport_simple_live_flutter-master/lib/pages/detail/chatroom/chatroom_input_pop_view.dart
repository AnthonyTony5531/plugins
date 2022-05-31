import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/widget/dialog/base_dialog_view.dart';
import 'package:fast_ai/pages/detail/chatroom/common/emoji_config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/emoji_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/text_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/send_message_filter.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/inputbar/emoji_info_widget.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

//import 'chat_room_share_bet/chat_room_share_bet_view.dart';
//import 'chat_room_share_bet/chat_room_share_bet_view_model.dart';

class ChatRoomInputDialog extends BaseDialogView {
  final Function(Message msg) onCallBack;
  final String roomNo;
  ChatRoomInputDialog({this.onCallBack, this.roomNo});

  final filter = SendMessageFilter();

  @override
  Widget builder(BaseDialogView widget, BuildContext context) {
    return ChatRoomInputPopView(
      roomNo: roomNo,
      onDraftCallBack: (value) {
        dismiss(context: context);
      },
      onInputSendCallBack: (value) {
        final String content = filter.filters(context, value);
        if (null != content) {
          final txtMsg = Message<TextMessageBody>(
              messageType: MessageType.conversation_chatroom,
              messageBody: TextMessageBody(value, chatUser: ChatUser(showName: config.userInfo.account.data.nickName ?? "")));
          onCallBack?.call(txtMsg);
          dismiss(context: context);
        }
      },
      onEmojiSendCallBack: (emoji, conTxt) {
        final String content = filter.filters(context, emoji);
        if (null != content) {
          final emojiMsg = Message<EmojiMessageBody>(
              messageType: MessageType.conversation_chatroom,
              messageBody: EmojiMessageBody(conTxt + emoji,chatUser: ChatUser(showName: config.userInfo.account.data.nickName ?? "")));
          onCallBack?.call(emojiMsg);
          dismiss(context: context);
        }
      },
      onQuitCallBak: () => dismiss(context: context),
    );
  }

  @protected
  Widget transitionBuilder(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
      child: child,
    );
  }
}

enum BottomViewType {
  /// 键盘
  keyboard,
  /// 表情
  emoji,
  /// 注单分享
  betShare,
}

class ChatRoomInputPopView extends StatefulWidget {
  final ValueChanged<String> onDraftCallBack;
  final ValueChanged<String> onInputSendCallBack;
  final Function(String, String) onEmojiSendCallBack;
  final VoidCallback onQuitCallBak;
  final String roomNo;

  ChatRoomInputPopView({
    this.roomNo,
    this.onDraftCallBack,
    this.onInputSendCallBack,
    this.onEmojiSendCallBack,
    this.onQuitCallBak,
  });

  @override
  State<StatefulWidget> createState() => _ChatRoomInputPopState();
}

class _ChatRoomInputPopState extends State<ChatRoomInputPopView> with SingleTickerProviderStateMixin {
  final String _keyboardIcon = 'assets/images/detail/chatroom/icon_details_keyboard.png';
  final String _emojiIcon = 'assets/images/detail/chatroom/icon_details_emoji.png';
  final String _shareSvgIcon = 'assets/images/detail/chatroom/icon_details_show.png';
  final String _shareSvgIconEn = 'assets/images/detail/chatroom/icon_details_show_us.png';
  final double _emojiTypeHeight = 50.0;
  final double _emojiHeight = 250.0;

  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocus = FocusNode();

  AnimationController _emojiHeightAnimationController;
  Animation<int> _emojiHeightAnimation;

  BottomViewType _bottomViewType = BottomViewType.keyboard;
  bool get isEmoji => _bottomViewType == BottomViewType.emoji;
  bool get isKeyboard => _bottomViewType == BottomViewType.keyboard;
  bool get isBetShare => _bottomViewType == BottomViewType.betShare;

  StreamController<bool> _sendStateStream;

  Timer _timer;

  double get _changeHeight => (_emojiTypeHeight + _emojiHeight + (isBetShare ? 100 : 0)) * _emojiHeightAnimation.value;

  @override
  void initState() {
    super.initState();
    _emojiHeightAnimationController = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _emojiHeightAnimation = IntTween(begin: 0, end: 1).animate(_emojiHeightAnimationController);

    _sendStateStream = StreamController<bool>.broadcast();

    _initKeyBoard();
  }

  @override
  void dispose() {
    super.dispose();
    _sendStateStream?.close();
    _inputController.dispose();
    _inputFocus.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => widget.onDraftCallBack?.call(_inputController.text),
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildInputKeyBoardView(context),
                _buildBottomView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputKeyBoardView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      color: const Color(0xFFE7E7E7),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 12.0),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  top: 11.0,
                  bottom: 11.0,
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      autofocus: true,
                      enabled: !isEmoji,
                      focusNode: _inputFocus,
                      maxLines: 1,
                      controller: _inputController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 14),
                        hintText: config.textByPath(isBetShare ? 'detail.followTalkMsg' : 'detail.saySomething'),
                        hintStyle: AiTextStyle(
                          color: config.skin.colors.fontColorDisable,
                          fontSize: TextSize.contentTitle,
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        if(isKeyboard) return;
                        _showKeyboard();
                        print('----TextField.onTap----');
                      },
                      onChanged: (s) {
//                        chatRoomShareBetVM.talkMsg = s;
                      },
                      onSubmitted: (s) => widget.onInputSendCallBack?.call(s),
                      style: AiTextStyle(
                        color: config.skin.colors.fontColorDark,
                        fontSize: TextSize.contentTitle,
                        fontWeight: FontWeight.normal,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ),
                ),
                if(isEmoji)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => _showKeyboard(),
                      behavior: HitTestBehavior.translucent,
                      child: Container(color: Colors.transparent),
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if(!isKeyboard) {
                _showKeyboard();
              } else {
                _showEmojiBoard(context);
              }
            },
            child: Container(
              height: 54.0,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: AiImage.asset(isBetShare ? _emojiIcon : !isKeyboard ? _keyboardIcon : _emojiIcon, width: 24, height: 24),
            ),
          ),
          // // 游戏播、国际版不展示晒单
          // if(!config.isGameAnchor && !config.isInternational) GestureDetector(
          //   onTap: () async {
          //     if (isBetShare) {
          //       _showKeyboard();
          //     } else {
          //       _showBetShareList(context);
          //     }
          //   },
          //   child: Container(
          //     height: 54.0,
          //     padding: EdgeInsets.only(left: 4, right: 12),
          //     child: AiImage.asset(isBetShare ? _keyboardIcon : config.isCnTwLang ? _shareSvgIcon : _shareSvgIconEn, width: 24, height: 24),
          //   ),
          // ),
        ],
      ),
    );
  }

//  ChatRoomShareBetViewModel _chatRoomShareBetVM;
//  ChatRoomShareBetViewModel get chatRoomShareBetVM => _chatRoomShareBetVM ??= ChatRoomShareBetViewModel.create(roomNo: widget.roomNo, onShareSuccess: () {
//    widget?.onQuitCallBak?.call();
//  });

  // 表情框或注单分享列表
  Widget _buildBottomView() {
    return AnimatedBuilder(
      animation: _emojiHeightAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: _changeHeight,
          color: Color(0xFFEEEEEE),
          child: !isBetShare ? Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildEmojiTypeListView(),
              _buildEmojiContentView(),
            ],
          ) : Container(
            color: Color(0xFFF5F5F5),
            height: _emojiTypeHeight + _emojiHeight,
//            child: ChatRoomShareBetView(model: chatRoomShareBetVM,),
          ),
        );
      },
    );
  }

  // 表情包类型选择
  Widget _buildEmojiTypeListView() {
    return Container(
      height: _emojiTypeHeight,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (cxt, index) {
          return SizedBox(
            height: 50.0,
            child: AiImage.asset(_emojiIcon),
          );
        },
        separatorBuilder: (cxt, index) => const SizedBox(width: 22.0),
        itemCount: 1,
      ),
    );
  }

  // 表情包内容
  Widget _buildEmojiContentView() {
    return Container(
      height: _emojiHeight,
      width: double.infinity,
      child: _EmojiInfoListWidget(
        height: _emojiHeight,
        onEmojiSelectedListener: (emoji) {
          final input = _inputController?.text ?? '';
          widget.onEmojiSendCallBack(emoji, input);
        },
        emojiSwitcher: defualtEmojiName2EmojiMessageSwitcher,
      ),
    );
  }

  void _updateView() {
    if (mounted) setState(() {});
  }

  void _initKeyBoard() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 50), () {
      _showKeyboard();
    });
  }

  // 展示键盘
  void _showKeyboard() {
    _bottomViewType = BottomViewType.keyboard;
    _updateView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _emojiHeightAnimationController.reverse();
      _inputFocus?.requestFocus();
    });
  }

  // 展示表情键盘
  void _showEmojiBoard(BuildContext context) {
    _bottomViewType = BottomViewType.emoji;
    FocusScope.of(context).requestFocus(FocusNode());
    _updateView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _emojiHeightAnimationController.forward();
    });
  }

  void _showBetShareList(BuildContext context) {
    _bottomViewType = BottomViewType.betShare;
    FocusScope.of(context).requestFocus(FocusNode());
    _updateView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _emojiHeightAnimationController.forward();
    });
  }
}

class _EmojiInfoListWidget extends StatelessWidget {
  final double height;

  //点击选择回调
  final ValueChanged<String> onEmojiSelectedListener;

  //文件目录
  final String emojiDir;

  //文件名，不含后缀名
  final Map<String, dynamic> emojis;
  final Map<String, String> emojiSwitcher;

  _EmojiInfoListWidget({
    Map<String, String> emojis,
    emojiDir,
    @required this.height,
    this.onEmojiSelectedListener,
    this.emojiSwitcher,
  })  : this.emojiDir = emojiDir ?? defualtEmojiPath,
        this.emojis = emojis ??
            (config.isDeleteInternationalAppointModule
                ? config.langMap['baseLang']['detail']['internationChatEmojiConfig']
                : config.langMap['baseLang']['detail']['chatEmojiConfig']);

  @override
  Widget build(BuildContext context) {
    List<Widget> emojiWidgets = [];
    emojis.forEach((fileName, emojiName) {
      final emojiFile = "$emojiDir/$fileName.gif";
      emojiWidgets.add(InkWell(
        onTap: () {
          final emojiStr = defualtEmojiName2EmojiMessageSwitcher[fileName] ?? config.langMap['baseLang']['detail']['emoji'];
          onEmojiSelectedListener?.call(emojiStr);
        },
        child: EmojiInfoWidget(emojiFile: emojiFile, emojiName: emojiName),
      ));
    });
    return Container(
      height: height,
      color: Color(0xFFF5F5F5),
      child: GridView(
          padding: EdgeInsets.only(top: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          children: emojiWidgets),
    );
  }
}
