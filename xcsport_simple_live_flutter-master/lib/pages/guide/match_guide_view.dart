
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class MatchGuideView extends StatefulWidget {

  final VoidCallback finishCallback;

  MatchGuideView({Key key, this.finishCallback}):super(key:key);

  @override
  _MatchGuideViewState createState() => _MatchGuideViewState();
}

class _MatchGuideViewState extends State<MatchGuideView> {

  int step  = 1;
  bool needShowMatchGuide = false;

  @override
  void initState() {
    needShowMatchGuide = AiCache.get().getBool('NEED_SHOW_MATCH_GUIDE') ?? true;
    super.initState();
  }

  @override
  void dispose() {
    AiCache.get().setBool('NEED_SHOW_MATCH_GUIDE', false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return needShowMatchGuide ? Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: step != 1,
            child: GestureDetector(
              onTap: ()async{
                step = 2;
                needShowMatchGuide = false;
                AiCache.get().setBool('NEED_SHOW_MATCH_GUIDE', needShowMatchGuide);
                if(widget.finishCallback != null){
                  widget.finishCallback();
                }
                if(mounted){setState(() {});}
              },
              child: oneStep(),
            ),
          ),
        ],
      ),
    ) : SizedBox();
  }


  Widget oneStep(){
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 1,
            right: 1,
            top: 100,
            child: AiSvgPicture.asset('assets/images/guide/img_match_1st_into.svg',fit: BoxFit.contain),
          )
        ],
      ),
    );
  }

}
