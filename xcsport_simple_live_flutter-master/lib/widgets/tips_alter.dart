import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipsAlter{

  static showCenterTipsAlter(BuildContext context,{String title = '', String content = '',String cancel,String confirm ,confirmCallback}) {
    showDialog(
        context: context,
        builder: (BuildContext ctx){
          return CupertinoAlertDialog(
            title: Text(title),
            content: Align(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(content,)
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(cancel ?? '取消',style: alterCancelStyle(),),
                onPressed: (){
                  Navigator.pop(ctx);
                },
              ),
              CupertinoDialogAction(
                child: Text(confirm ?? '确定',style: alterConfirmStyle(),),
                onPressed: (){
                  if(confirmCallback != null){
                    confirmCallback();
                  }
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
        }
    );
  }

  static showCenterCancelTipsAlter(BuildContext context,{String title = '', String content = '',String cancel,String confirm ,confirmCallback}) {
    showDialog(
      context: context,
      builder: (BuildContext ctx){
        return CupertinoAlertDialog(
          title: Text(title),
          content: Align(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text(content,)
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(cancel ?? '取消',style: alterCancelStyle(),),
              onPressed: (){
                if(confirmCallback != null){
                  confirmCallback();
                }
                Navigator.pop(ctx);
              },
            ),
          ],
        );
      }
    );
  }

  static TextStyle alterConfirmStyle(){
    return AiTextStyle(
      color: Colors.black,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h3,
      fontWeight: config.skin.fontWeight.medium
    );
  }

  static TextStyle alterCancelStyle(){
    return AiTextStyle(
        color: Colors.black.withOpacity(0.3),
        fontFamily: config.skin.fontFimaly.pingFang,
        fontSize: config.skin.fontSize.h3,
        fontWeight: config.skin.fontWeight.medium
    );
  }





  }