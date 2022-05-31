

import 'package:fast_ai/pages/guide/detail_guild_view.dart';
import 'package:fast_ai/pages/guide/index_guide_view.dart';
import 'package:flutter/material.dart';

enum GuidePageKey{
  HotPage,MatchPage,DetailPage
}

class GuideView extends StatefulWidget {

  final GuidePageKey pageName;
  final VoidCallback finishCallback;

  GuideView({Key key,this.pageName, this.finishCallback}) : super(key: key);

  @override
  _GuideViewState createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {

  bool showIndexGuide = false;
  bool showMatchGuide = false;
  bool showDetailGuide = false;

  @override
  void initState() {
    if(widget.pageName == GuidePageKey.HotPage){
      showIndexGuide = true;
    } else if(widget.pageName == GuidePageKey.MatchPage){
      showMatchGuide = true;
    } else if(widget.pageName == GuidePageKey.DetailPage){
      showDetailGuide = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(showIndexGuide){
      return IndexGuideView(
        finishCallback: (){
          showIndexGuide = false;
          if(widget.finishCallback != null){
            widget.finishCallback();
          }
          if(mounted){setState(() {});}
        },
      );
    } 
    // else if(showMatchGuide){
    //   return MatchGuideView(
    //     finishCallback: (){
    //       showMatchGuide = false;
    //       if(widget.finishCallback != null){
    //         widget.finishCallback();
    //       }
    //       if(mounted){setState(() {});}
    //     },
    //   );
    // } 
    else if(showDetailGuide){
      return DetailGuideView(
        finishCallback: (){
          showDetailGuide = false;
          if(widget.finishCallback != null){
            widget.finishCallback();
          }
          if(mounted){setState(() {});}
        },
      );
    } else {
      return SizedBox();
    }
  }
}
