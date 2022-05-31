//**********************************************************************
//* author:Sam
//* date:2020-03-06
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/common/emoji_config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/frequency_limit.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveHotHelperEmoji extends StatefulWidget {
  final Map<String, dynamic> emojis;
  final String emojiDir;
  //点击选择回调
  ValueChanged<String> onEmojiSelectedListener;
  LiveHotHelperEmoji({Map<String, String> emojis, this.emojiDir = defualtEmojiPath, this.onEmojiSelectedListener})
      : this.emojis = emojis ?? (config.isDeleteInternationalAppointModule ? config.langMap['baseLang']['detail']['internationChatEmojiConfig'] : config.langMap['baseLang']['detail']['chatEmojiConfig']);

  @override
  _LiveHotHelperEmojiState createState() => _LiveHotHelperEmojiState();
}

class _LiveHotHelperEmojiState extends State<LiveHotHelperEmoji> {

  PreventMultiTap preventMultiTap = PreventMultiTap();

  @override
  Widget build(BuildContext context) {
    List<Widget> emojiwidgets = [];
    widget.emojis.forEach((fileName, emojiName) {
      final emojiFile = "${widget.emojiDir}/$fileName.gif";
      emojiwidgets.add(InkWell(
        onTap: () {
          preventMultiTap.onTask(task: (){
            if (null != widget.onEmojiSelectedListener) {
              widget.onEmojiSelectedListener("${defualtEmojiName2EmojiMessageSwitcher[fileName] ?? "[${config.langMap['baseLang']['detail']['emoji']}]"}");
            }
          },);
        },
        child: EmojiInfoCell(
          emojiFile: emojiFile,
          emojiName: emojiName,
        ),
      ));
    });
    return Container(
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          children: emojiwidgets),
    );
  }
}

class EmojiInfoCell extends StatelessWidget {
  String emojiFile;
  String emojiName;
  EmojiInfoCell({this.emojiFile, this.emojiName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AiImage.asset(
            emojiFile,
            width: 49,
            height: 49,
          ),
          InterValHelper.h(10),
          TextHelper.buildNormal(emojiName),
        ],
      ),
    );
  }
}
