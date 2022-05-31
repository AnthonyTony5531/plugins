//**********************************************************************
//* author:Sam
//* date:2020-08-29
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

//详情页引导页
class DetailGuidePage extends StatefulWidget {

  final Widget child;

  const DetailGuidePage({Key key, this.child}) : super(key: key);

  @override
  _DetailGuidePageState createState() => _DetailGuidePageState();

}

class _DetailGuidePageState extends State<DetailGuidePage> {

  bool needGuide = false;
  @override
  void initState() {
    super.initState();
    needGuide = AiCache.get().getBool('match_detail_needGuide')??true;
  }


  @override
  Widget build(BuildContext context) {
    return needGuide?Stack(
      children: <Widget>[
        widget.child,
        GestureDetector(
          onTap: tap,
          child: Container(
            color: Colors.black.withOpacity(0.7),

          ),
        ),
        GestureDetector(
          onTap: tap,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AiImage.asset("assets/images/match_detail/img_detail_lead_pic.png", width: 180, height: 180, ),
                h(20),
                TextHelper.buildContentTitle(config.langMap['baseLang']['detail']['slideChangeMatch'],textColor: Colors.white.value),
                TextHelper.buildContentTitle(config.langMap['baseLang']['detail']['slideEnterChatroom'],textColor: Colors.white.value),
              ],
            ),
          ),
        )
      ],
    ):widget.child;
  }

  void tap() async {
    await Future((){
      AiCache.get().setBool('match_detail_needGuide', false);
      needGuide = false;
    });
    if(mounted){
      setState(() {
      });
    }
  }
}

