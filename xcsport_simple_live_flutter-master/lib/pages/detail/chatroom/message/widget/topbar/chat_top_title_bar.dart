import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/migrate_plugins/marquee_flutter/marquee_flutter.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//聊天室顶部栏
class ChatTopTitleBar extends StatelessWidget {
  final VoidCallback onCloseTitle;

  const ChatTopTitleBar({Key key, @required this.onCloseTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  //聊天室顶部栏
  Widget _body() {
    return Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        color: const Color(0x90FCECEC),
        child: Row(
          children: <Widget>[
            AiSvgPicture.asset(
              "assets/images/detail/chatroom/chatroom_hint.svg",
              width: 14,
              height: 14,
            ),
            InterValHelper.w(4),
            Expanded(
              child: Container(
                height: 30,
                child: MarqueeWidget(
                  text: config.langMap['baseLang']['detail']['chatroom']['chatTopTitle'],
                  textStyle: AiTextStyle(
                    fontFamily: FontFamily.normal,
                    fontSize: 14,
                    color: Color(0xFFF05050),
                  ),
                  scrollAxis: Axis.horizontal,
                ),
              ),
            ),
            InterValHelper.w(4),
            Container(
              height: 30,
              alignment: Alignment.centerRight,
              child: InkWell(
                child: AiSvgPicture.asset(
                  "assets/images/detail/icon_chatroom_close_normal.svg",
                ),
                onTap: () {
                  if (onCloseTitle != null) {
                    onCloseTitle();
                  }
                },
              ),
            ),
          ],
        )
    );
  }
}
