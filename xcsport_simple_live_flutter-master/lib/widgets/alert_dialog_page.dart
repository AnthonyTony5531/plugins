import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/router.dart';


class AlertDialogPage extends StatefulWidget {
  AlertDialogPage({Key key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  void _showCupertinoAlertDialog(BuildContext context) {
    showDialog(
      context: context,
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

  @override
  Widget build(BuildContext context) {
    //_showCupertinoAlertDialog(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(child: Text(''),),
    );
  }
}
