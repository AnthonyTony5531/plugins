
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class DetailGuideView extends StatefulWidget {

  final VoidCallback finishCallback;

  DetailGuideView({Key key,this.finishCallback}):super(key:key);

  @override
  _DetailGuideViewState createState() => _DetailGuideViewState();
}

class _DetailGuideViewState extends State<DetailGuideView> {

  int step  = 1;
  bool needShowDetailGuide = false;

  @override
  void initState() {
    needShowDetailGuide = AiCache.get().getBool(AiCache.NEED_SHOW_DETAIL_PAGE_GUIDE) ?? true;
    super.initState();
  }

  @override
  void dispose() {
    AiCache.get().setBool(AiCache.NEED_SHOW_DETAIL_PAGE_GUIDE, false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return needShowDetailGuide ? Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: step != 1,
            child: GestureDetector(
              onTap: (){
                step = 2;
                if(mounted){setState(() {});}
              },
              child: oneStep(),
            ),
          ),
          Offstage(
            offstage: step != 2,
            child: GestureDetector(
              onTap: (){
                AiCache.get().setBool(AiCache.NEED_SHOW_DETAIL_PAGE_GUIDE, false);
                needShowDetailGuide = false;
                if(widget.finishCallback != null){
                  widget.finishCallback();
                }
                if(mounted){setState(() {});}
              },
              child: twoStep(),
            ),
          ),
        ],
      ),
    ) : SizedBox();

  }


  Widget oneStep(){
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            child: AiSvgPicture.asset('assets/images/guide/img_detail_1st_into.svg',fit: BoxFit.contain),
          )
        ],
      ),
    );
  }


  Widget twoStep(){
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 1,
            right: 1,
            child: AiSvgPicture.asset('assets/images/guide/img_detail_2nd_into.svg',fit: BoxFit.fitWidth),
          )
        ],
      ),
    );
  }
}
