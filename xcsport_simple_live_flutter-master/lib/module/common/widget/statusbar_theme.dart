import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget LightTheme({Widget child}) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: child,
  );
}

Widget DartTheme({Widget child}) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: child,
  );
}
