import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

import 'live_view_model.dart';

class LiveViewBig extends StatelessWidget {
  final LiveViewModel model;
  const LiveViewBig({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    var liveType = model.liveType;
    // liveType = LiveType.video;
    bool hasAnchor = false;
    switch (liveType) {
      case LiveType.video:
        widget = AiImage.asset(
            'assets/images/matchStatus/img_bet_video_early.png',
            fit: BoxFit.cover);
        break;
      case LiveType.videoColor:
        widget = AiImage.asset(
            'assets/images/matchStatus/com_video_live_anchor_nor1@3x.gif',
            fit: BoxFit.cover);
        break;
      case LiveType.anchorColor:
        widget = AiImage.asset(
            'assets/images/matchStatus/com_video_live_anchor_nor1@3x.gif',
            fit: BoxFit.cover);
        hasAnchor = true;
        break;
      case LiveType.anchor:
        widget = AiImage.asset(
            'assets/images/matchStatus/img_bet_anchor_early.png',
            fit: BoxFit.cover);
        hasAnchor = true;
        break;
      default:
        break;
    }
    if (hasAnchor) {
      var body = Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 20,
              child: widget,
            ),
            Positioned(
                left: 1,
                top: 1,
                child: ClipOval(
                    child: Container(
                      height: 18,
                      width: 18,
                      child: AiImage.fromUrl(
                          model.anchorLogo,
                          "assets/images/matchStatus/com_video_live_anchor_nor1@3x.png",
                          BoxFit.cover),
                    )))
          ],
        ),
      );
      return body;
    } else {
      var body = Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 20,
              child: widget,
            ),
            Positioned(
              left: 1,
              top: 1,
              child: ClipOval(
                  child: Container(
                    height: 18,
                    width: 18,
                  )))
          ],
        ),
      );
      return body;
    }
  }
}
