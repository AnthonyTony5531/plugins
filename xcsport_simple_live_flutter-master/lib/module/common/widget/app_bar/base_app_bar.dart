import 'package:flutter/material.dart';

/// * ClassName: base_app_bar
/// * Description: 提供统一的appBar
/// * CreateDate: 2020/11/8 14:59

/// TODO style , Icon需替换项目所需
/// 标题颜色默认跟随主题设置
Widget baseAppBar(
  BuildContext context, {
  String title,
  TextStyle titleStyle,
  double elevation,
  double toolbarHeight = 50,
  String leadingIcon,
  bool isBack = true,
  bool isCenterTitle = false,
  Function() onCallBack,
  List<Widget> actions,
  Color bgColor,
}) {
  if (actions == null) actions = [];

  IconThemeData iconTheme = AppBarTheme.of(context).iconTheme ?? Theme.of(context).primaryIconTheme;

  return AppBar(
    title: Text(title ?? '', style: titleStyle,),
    titleSpacing: -10.0,
    elevation: elevation ?? 0.0,
    automaticallyImplyLeading: isBack,
    centerTitle: isCenterTitle,
    toolbarHeight: toolbarHeight,
    backgroundColor: bgColor ?? Theme.of(context).primaryColor,
    leading: isBack
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Icon(Icons.arrow_back_ios, size: 16.0, color: iconTheme.color ?? Colors.white),
            onTap: () {
              onCallBack == null ? Navigator.of(context).pop() : onCallBack();
            },
          )
        : SizedBox.shrink(),
    actions: actions,
    brightness: Brightness.dark,
  );
}

Widget baseWhiteAppBar(
  BuildContext context, {
  String title,
  double elevation,
  String leadingIcon,
  bool isBack = true,
  bool isCenterTitle = false,
  Function() onCallBack,
  List<Widget> actions,
  Color bgColor,
}) {
  if (actions == null) actions = [];

  return AppBar(
    title: Text(
      title ?? '',
      style: TextStyle(fontSize: 16, color: Color(0xFF333333), fontWeight: FontWeight.normal),
    ),
    titleSpacing: -10.0,
    backgroundColor: bgColor ?? Colors.white,
    elevation: elevation ?? 0.0,
    automaticallyImplyLeading: isBack,
    centerTitle: isCenterTitle,
    leading: isBack
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Icon(Icons.arrow_back_ios, size: 16.0, color: Color(0xff333333)),
            onTap: () {
              onCallBack == null ? Navigator.of(context).pop() : onCallBack();
            },
          )
        : SizedBox.shrink(),
    actions: actions,
    brightness: Brightness.light,
  );
}

/// appbar action txt 文本
Widget buildActionTxt({BuildContext context, String txt, double fontSize, Function onTap}) {
  IconThemeData iconTheme = AppBarTheme.of(context).iconTheme ?? Theme.of(context).primaryIconTheme ?? Colors.white;
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    child: Container(
      height: kToolbarHeight,
      child: Center(
        child: Text(
          txt ?? 'null',
          style: TextStyle(color: iconTheme.color, fontSize: fontSize ?? 14.0),
        ),
      ),
    ),
    onTap: () => onTap?.call(),
  );
}

/// appBar action icon
///
/// iconView 实例:
///
///   IconThemeData iconTheme = AppBarTheme.of(context).iconTheme ?? Theme.of(context).primaryIconTheme ?? Colors.white;
///   Image.asset(
///            icon ?? '',
///            width: size ?? 16.0,
///            color: iconTheme.color ??  Colors.white,
///            package: 'lcs_instant_flutter',
///          )
///
Widget buildActionIcon({BuildContext context, Widget iconView, double size, Function onTap}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    child: Container(
      width: kToolbarHeight,
      height: kToolbarHeight,
      child: Center(
        child: iconView ?? Container(),
      ),
    ),
    onTap: () => onTap?.call(),
  );
}

// 自定义返回剪头、字体颜色
Widget buildCustomAppBar(
    BuildContext context, {
      String backIcon,
      String title,
      Color titleColor = Colors.black,
      double elevation,
      String leadingIcon,
      bool isBack = true,
      bool isCenterTitle = false,
      Function() onCallBack,
      List<Widget> actions,
      Color bgColor = Colors.white,
    }) {
  if (actions == null) actions = [];

  return AppBar(
    title: Text(title ?? '',style: TextStyle(
      fontSize: 16.0,
      color: titleColor ?? Colors.black
    ),),
    titleSpacing: -10.0,
    elevation: elevation ?? 0.0,
    automaticallyImplyLeading: isBack,
    centerTitle: isCenterTitle,
    backgroundColor: bgColor,
    leading: isBack
        ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: backIcon != null ? Image.asset(backIcon,width: 22.0,height: 22.0,) : Icon(Icons.arrow_back_ios, size: 16.0, color: Colors.black),
      onTap: () {
        onCallBack == null ? Navigator.of(context).pop() : onCallBack();
      },
    )
        : SizedBox.shrink(),
    actions: actions,
    brightness: Brightness.dark,
  );
}