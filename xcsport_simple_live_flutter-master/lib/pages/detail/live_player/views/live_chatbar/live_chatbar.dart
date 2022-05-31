import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/config/timezone_config.dart';
import 'package:fast_ai/pages/detail/chatroom/common/message_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/send_message_filter.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/keyboard_utils.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_utils.dart';
import 'package:fast_ai/widgets/barrage/barrage_manager.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//横排
class LiveChatBar extends StatefulWidget {
  final ChatBarController chatBarController;
  LiveChatBar({@required this.chatBarController});

  @override
  _LiveChatBarState createState() => _LiveChatBarState();
}

class _LiveChatBarState extends State<LiveChatBar> {
  TextEditingController textEditingController = new TextEditingController();

  void setText(String text) {
    textEditingController.text = text;
    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  ToolPanelController get toolPanel {
    return widget.chatBarController.toolPanel;
  }

  final SendMessageFilter _filter = new SendMessageFilter();

  FocusNode focusNode = new FocusNode();

  void showBoard() {
    _isShow = true;
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
    print("showBoard start");
    setState(() {});
  }

  @override
  void dispose() {
    widget.chatBarController.onPanel = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // 设置Controller回调
    widget.chatBarController.onPanel = onPanel;
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.setText : {
        setText(action.value);
        break;
      }
      case PanelActionType.showKeyBoard : {
        showBoard();
        break;
      }
      case PanelActionType.sendMessage : {
        sendMessage();
        break;
      }
      case PanelActionType.hideKeyBoard : {
        FocusScope.of(context).requestFocus(FocusNode());
        break;
      }
      case PanelActionType.hide : {
        hide();
        break;
      }
    }
  }

  void frameCallback(duration) {
    print("showBoard end");
    FocusScope.of(context).requestFocus(focusNode);
  }

  void hide() {
    _isShow = false;
    setState(() {});
  }

  bool _isShow = false;

  bool get isShow => _isShow && toolPanel.bottomBar.model.screenDirection == ScreenDirection.LeftRight;

  @override
  Widget build(BuildContext context) {
    return isShow ? Positioned(
      left: 0,
      right: 0,
      bottom: isShow ? MediaQuery.of(context).viewInsets.bottom : -100,
      child: Container(
        height: 96,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 10),
        color: Colors.black.withOpacity(0.7),
        child: Container(child: _body()),
      ),
    ) : Container();
  }

  static var tips = config.langMap['baseLang']['detail']['chatHotWords'];

  Widget _body() {
    return Column(
      children: <Widget>[
        input(),
        Expanded(
          child: Row(
            children: <Widget>[
              TextHelper.buildNormal("${config.langMap['baseLang']['detail']['livePlayer']['hotWord']}:"),
              InterValHelper.w(8),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    return hotTipsCell(tips[index]);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget input() {
    return Container(
      height: 32,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          InterValHelper.w(12),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              controller: textEditingController,
              onSubmitted: (val) {
                sendMessage(text: textEditingController.text);
              },
              onChanged: (s) {
                toolPanel.bottomBarTextController.setText(s);
              },
              style: AiTextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: FontFamily.normal, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15.5, left: 10),
                hintText: config.langMap['baseLang']['detail']['livePlayer']['barrageGo'],
                hintStyle: AiTextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 12,
                    fontFamily: FontFamily.normal,
                    fontWeight: FontWeight.normal),
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              sendMessage(text: textEditingController.text);
            },
            child: Container(
              width: 63,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.secondary,
              ),
              height: double.infinity,
              child: Center(
                child: TextHelper.buildNormal(
                  config.langMap['baseLang']['detail']['livePlayer']['send'],
                  textColor: 0xFF4E2E09,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget hotTipsCell(String tips) {
    return InkWell(
      onTap: () {
        sendMessage(text: tips);
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailMessageHotWords);
      },
      child: IntrinsicHeight(
        child: Container(
          margin: EdgeInsets.only(right: 12),
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.white),
              color: Colors.transparent),
          child: Align(
            child: TextHelper.buildNormal(tips, textColor: Colors.white.value),
          ),
        ),
      ),
    );
  }

  void sendMessage({String text, bool needHide = true}) {
    if (null == text) text = textEditingController.text;

    String content = _filter.filters(context, text);
    if (null != content) {
      sendMessageInPanel(content);
    }
    textEditingController.text = "";
    toolPanel.bottomBarTextController.setText('');
    if (needHide) {
      hide();
      hideKeyBoard(context);
    }
    print("发送");
  }
}


void sendMessageInPanel(String content) {
  if (null == content) return;
  Map<String, dynamic> data = {
    "playerId": config.userInfo.account.data.playerId,
    "headImg": config.userInfo.account.data.headImg,
    "createDate": convert2ServerTime(DateTime.now()).toString(),
    "content": content,
    "nickName": config.userInfo.account.data.nickName,
  };
  Event.eventBus.fire(ChatMessageEvent(data,comeFrom: 'live_chatbar 267 sendMessageInPanel'));
  Event.eventBus.fire(ChatOwnMessageEvent(content));
  addOwnMessageToBarrage(content);
  XCStompClient.ins.sendMessage(
      "/chat/sendMsg",
      XCStompUtils.buildStompJson({
        'token': config?.userInfo?.token ?? "1",
        'msgType': '1',
        'roomNo': config.userInfo.detailSet.detailParams.gidm,
        'content': content,
        'playerId': config.userInfo.account.data.playerId,
      }));
}

void addOwnMessageToBarrage(String content) {
  var chatUser = ChatUser(
    showName: config.userInfo.account.data.nickName,
    chatId: config.userInfo.account.data.playerId,
    headerUrl: config.userInfo.account.data.headImg,
  );
  var convertString2BarrageData = MessageHelper.convertString2BarrageData(
    chatUser: chatUser,
    createDate: DateTime.now().toString(),
    messageBody: content,
    messageType: MessageType.conversation_chatroom,
  );
  BarrageManager.get().addAllRanderData(convertString2BarrageData);
}
