import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/sc_cupertino_activity_indicator.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'chatroom_connectstatus_model.dart';
import 'chatroom_connectstatus_style.dart';
import 'package:flutter/material.dart';

class ChatroomConnectStatusView extends StatefulView<ChatroomConnectstatusStyle,
    ChatroomConnectstatusModel> {
  final ChatroomConnectstatusModel model;

  const ChatroomConnectStatusView({Key key, this.model})
      : super(key: key, model: model);

  @override
  _ChatroomConnectstatusPageState createState() =>
      _ChatroomConnectstatusPageState();
}

class _ChatroomConnectstatusPageState extends ViewState<
    ChatroomConnectstatusStyle,
    ChatroomConnectstatusModel,
    ChatroomConnectStatusView> {
  final _defaultModel = ChatroomConnectstatusModel();

  @override
  ChatroomConnectstatusModel get defaultModel => _defaultModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget render(BuildContext context) {
    return Visibility(
//      visible: model.isRefreshing(),
      visible: false,
      child: Container(
          height: 36,
          width: AiMeasure.screenWidth(context),
          color: Color(0xFF27404A).withOpacity(0.9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InterValHelper.w(17),
              ScCupertinoActivityIndicator(
                radius: 6,
                color: Color(0xFFFE4028).withOpacity(0.1),
                darkColor: Color(0xFFFE4028),
              ),
              InterValHelper.w(7),
              Text(model.statusPrompt,style: style.statusPromptTextStyle, ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  List<ChatroomConnectstatusStyle> get styleList =>
      [ChatroomConnectstatusStyle()];
}
