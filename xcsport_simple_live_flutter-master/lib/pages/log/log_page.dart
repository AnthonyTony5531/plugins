import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/log/log_data_center.dart';
import 'package:fast_ai/pages/log/log_float_page.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {

  List<String> logTexts = [];

  @override
  void initState() {
    LogDataCenter.subscription(logsub,true);
    super.initState();
  }

  @override
  void dispose() {
    LogDataCenter.unSubscription(logsub);
    super.dispose();
  }


  void logsub(String log){
    logTexts?.add(log);
    if(mounted){
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AiAppBar(
        title: Text('${config.langMap['baseLang']['log']['name']}'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              if(LogDataCenter.logOverlayEntry == null){
                LogDataCenter.logOverlayEntry?.remove();
                LogDataCenter.logOverlayEntry = null;
                LogDataCenter.logOverlayEntry = OverlayEntry(builder: (context){
                  return LogFloatPage();
                });
                if(mounted){
                  setState(() {});
                }
                Overlay.of(context).insert(LogDataCenter.logOverlayEntry);
                AiRouter.pop(context);
              }
            },
            child: Text('${config.langMap['baseLang']['log']['float']}',style: AiTextStyle(color: Colors.white),),
          ),
          FlatButton(
            onPressed: (){
              LogDataCenter?.clear();
              logTexts?.clear();
              if(mounted){
                setState(() {});
              }
            },
            child: Text('${config.langMap['baseLang']['log']['clear']}',style: AiTextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 10,left: 10,bottom: 10),
        child: ListView.builder(itemBuilder: (BuildContext context, int index){
          return Text('${index+1}:${logTexts[index]}');
        },itemCount: logTexts?.length ?? 0,),
      ),
    );
  }
}
