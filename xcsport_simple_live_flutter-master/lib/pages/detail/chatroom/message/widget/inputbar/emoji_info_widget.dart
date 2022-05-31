import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */


//表情信息
class EmojiInfoWidget extends StatelessWidget {

  String emojiFile;
  String emojiName;
  EmojiInfoWidget({this.emojiFile, this.emojiName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AiImage.asset(emojiFile, width: 80, height: 80,),
          InterValHelper.h(10),
          TextHelper.buildNormal(emojiName),
        ],
      ),
    );
  }
}
