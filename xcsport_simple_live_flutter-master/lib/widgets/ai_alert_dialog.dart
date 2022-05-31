import "package:fast_ai/utils/ai_image.dart";

import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/router.dart';


class AIAlertDialog {
  // final GlobalKey<NavigatorState>navigator = new GlobalKey<NavigatorState>();
  //navigator.currentContext
  // navigator.currentstate.Overlay.
  static void showCupertinoAlertDialog(BuildContext context) {
    //print('000showCupertinoAlertDialog---${GlobalKey<NavigatorState>().currentState.overlay.context}, ${GlobalKey<NavigatorState>().currentState}');
    showDialog(
      context: context,//GlobalKey<NavigatorState>().currentState.overlay.context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text('${config.langMap['baseLang']['msgBar']['repeatLogin']['content']}'),
          title: Center(
              child: Text("${config.langMap['baseLang']['message']['title']}", style: AiTextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          )),
          actions: <Widget>[
            CupertinoDialogAction(
                onPressed: () {
//                  AiRouter.pushReplacementNamed('loginPage');
                  AiRouter.pushReplacementNamed(AiRouter.AiLoginPage);
                },
                child: Text('${config.langMap['baseLang']['login']['IKnow']}')),
          ],
        );
      });
  }
}
