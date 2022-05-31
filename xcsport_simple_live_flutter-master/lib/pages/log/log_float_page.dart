import "package:fast_ai/utils/ai_image.dart";

import 'package:fast_ai/pages/log/log_data_center.dart';
import 'package:fast_ai/pages/log/log_page.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

class LogFloatPage extends StatefulWidget {

  @override
  _LogFloatPageState createState() => _LogFloatPageState();
}

class _LogFloatPageState extends State<LogFloatPage> {


  List<String> logTexts = [];
  ScrollController _scrollController;

  @override
  void initState() {
    LogDataCenter.subscription(logsub,true);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    LogDataCenter.unSubscription(logsub);
    _scrollController?.dispose();
    super.dispose();
  }


  void logsub(String log){
    logTexts?.add(log);
    if(mounted){
      if(_scrollController != null && _scrollController.position != null){
        _scrollController?.jumpTo(_scrollController?.position?.maxScrollExtent);
      }
      setState(() {});
    }
  }


  Offset offset = Offset(10,kToolbarHeight + 100);

  Offset _calOffset(Size size,Offset offset,Offset newOffset){
    double dx = 0;
    if(offset.dx + newOffset.dx <=0){
      dx = 0;
    } else if(offset.dx+newOffset.dx >= (size.width-50)){
      dx = size.width - 50;
    } else {
      dx = offset.dx + newOffset.dx;
    }
    double dy = 0;
    if(offset.dy + newOffset.dy >= (size.height - 100)){
      dy = size.height - 100;
    } else if(offset.dy+newOffset.dy <= kToolbarHeight){
      dy = kToolbarHeight + 50;
    } else {
      dy = offset.dy + newOffset.dy;
    }
    return Offset(dx,dy);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme.of(context).copyWith(
          brightness: Brightness.dark
        )
      ),
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (detail){
            offset = _calOffset(MediaQuery.of(context).size, offset, detail.delta);
            setState(() {

            });
          },
          onTap: (){},
          onPanEnd: (detail){},
          onLongPress: (){
            LogDataCenter.logOverlayEntry?.remove();
            LogDataCenter.logOverlayEntry = null;
            showMaterialPageRoute(context, LogPage());
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 150,
              height: 200,
              color: Colors.lightBlueAccent.withOpacity(0.6),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 3,right: 3,bottom: 3),
                color: Colors.white.withOpacity(0.8),
                child: ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index){
                  return Text('${index+1}:${logTexts[index]}',style: AiTextStyle(fontSize: 6),);
                },itemCount: logTexts?.length ?? 0,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
