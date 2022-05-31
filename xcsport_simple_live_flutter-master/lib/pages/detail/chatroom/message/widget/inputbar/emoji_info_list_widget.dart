import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/emoji_config.dart';
import 'emoji_info_widget.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//表情选择列表高度
const EmojiInfoListWidgetHeight = 250.0;

//表情输入框, 表情文件名和表情描述必需一致,这样是避免名字和文件不对应
class EmojiInfoListWidget extends StatelessWidget {
  //点击选择回调
  ValueChanged<String> onEmojiSelectedListener;

  //文件目录
  final String emojiDir;

  //文件名，不含后缀名
  final Map<String, dynamic> emojis;

  Map<String, String> emojiSwitcher;

  EmojiInfoListWidget(
      {Map<String, String> emojis,
      this.emojiDir = defualtEmojiPath,
      this.onEmojiSelectedListener,
      this.emojiSwitcher})
      : this.emojis = emojis ?? (config.isDeleteInternationalAppointModule ? config.langMap['baseLang']['detail']['internationChatEmojiConfig'] : config.langMap['baseLang']['detail']['chatEmojiConfig']);

  @override
  Widget build(BuildContext context) {
    List<Widget> emojiwidgets = [];
    emojis.forEach((fileName, emojiName) {
      final emojiFile = "$emojiDir/$fileName.gif";
      emojiwidgets.add(InkWell(
        onTap: () {
          if (null != onEmojiSelectedListener) {
            onEmojiSelectedListener("${defualtEmojiName2EmojiMessageSwitcher[fileName] ?? "[${config.langMap['baseLang']['detail']['emoji']}]"}");
          }
        },
        child: EmojiInfoWidget(
          emojiFile: emojiFile,
          emojiName: emojiName,
        ),
      ));
    });
    return Container(
      height: EmojiInfoListWidgetHeight,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
      ),
      child: GridView(
        padding: EdgeInsets.only(top: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
        ),
        children: emojiwidgets),
    );
  }
}
