import 'package:common_component/util/ai_measure.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeAnchorHead extends StatefulWidget {

  final String anchorName;
  final String anchorIcon;
  FreeAnchorHead({Key key, this.anchorIcon = '', this.anchorName = ''}): super(key: key);

  @override
  _FreeAnchorHeadState createState() => _FreeAnchorHeadState();
}

class _FreeAnchorHeadState extends State<FreeAnchorHead> {

  String broadcastEnded = '';
  String liveRecommendation = '';

  @override
  void initState() {
    broadcastEnded = AiJson(config.langMap['baseLang']).getString('detail.broadcastEnded');
    liveRecommendation = AiJson(config.langMap['baseLang']).getString('detail.liveRecommendation');
    super.initState();
  }

  @override
  void dispose() {
    Event?.eventBus?.fire(FreeAnchorCloseDetailEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topOffset = AiMeasure.topOffset(context);
    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: topOffset),
        height: 260.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 25.0,),
                    onPressed: (){
                      AiRouter.pop(context);
                    })
              ],
            ),
            Container(
              width: 66.0,
              height: 66.0,
              child: AiImage.userLogo(widget.anchorIcon, size: 66.0),
            ),
            sh(10.0),
            Text(widget.anchorName, style: nameStyle(),),
            sh(8.0),
            Text(broadcastEnded, style: titleStyle(),),
            Expanded(child: Container()),
            Row(
              children: [
                Text(liveRecommendation, style: sectionTitleStyle(),),
              ],
            ),
            sh(8.0),
          ],
        )
    );
  }


  TextStyle nameStyle(){
    return AiTextStyle(
        color: Colors.black,
        fontSize: config.skin.fontSize.h4,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular
    );
  }

  TextStyle titleStyle(){
    return AiTextStyle(
        color: Color(0xFF5078FF),
        fontSize: config.skin.fontSize.h3,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular
    );
  }

  TextStyle sectionTitleStyle(){
    return AiTextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: config.skin.fontSize.h5,
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular
    );
  }
}
