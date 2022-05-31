import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-07
///*********************************************************************


void showFlush(BuildContext context, {@required String msg, String title })async
{
 await Flushbar(
    title: title??"${config.langMap['baseLang']['message']['title']}",
    message: msg,
    duration: Duration(seconds: 1),
  ).show(context);
}