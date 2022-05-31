import 'package:flutter/material.dart';

import '../route.dart';

class NonePageAnim extends PageRouteBuilder {
  
  NonePageAnim(
      {@required PageBuilder pageBuilder,
      @required RouteSettings settings})
      : super(
          transitionDuration: Duration(milliseconds: 0),
         
         pageBuilder: (context, _,__)=>pageBuilder(context),
          settings: settings,
        );
}
