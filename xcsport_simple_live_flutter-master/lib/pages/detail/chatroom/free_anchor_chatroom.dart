import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/pages/detail/chatroom/banner/chatroom_banner.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeAnchorChatroom extends StatelessWidget {

  final DetailSet detailSet;
  FreeAnchorChatroom({Key key, this.detailSet}): super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFreeLiveGameAnchor = detailSet.detailParams?.isFreeLiveGameAnchor;
    bool isListDetail = detailSet.detailParams?.isListDetail;
    String anchorId = detailSet.detailParams?.anchorId;
    String systemAdministrator = AiJson(config.langMap['baseLang']).getString('detail.systemAdministrator');
    String chatRoomNotOpen = AiJson(config.langMap['baseLang']).getString('detail.chatRoomNotOpen');

    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: 8.0,
              left: 8.0,
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Row(children: [
                  Text('$systemAdministrator：', style: titleStyle(),),
                  sw(3.0),
                  Text(chatRoomNotOpen, style: desStyle(),)
                ],),
              )
            ),
            Positioned(
              bottom: 40.0,
              right: 10.0,
              child: ChatRoomBanner(
                detailSet: detailSet,
                isListDetail: isListDetail,
                anchorId: anchorId,
                isFreeAnchor: true,
              )
            )
          ],
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Color(0xFF5078FF),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5
    );
  }

  TextStyle desStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontWeight: config.skin.fontWeight.regular,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontSize: config.skin.fontSize.h5
    );
  }
}
