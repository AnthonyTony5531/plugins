import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class Styles {
    static ThemeData aiTheme = ThemeData(
        platform: TargetPlatform.iOS,
        fontFamily: config.skin.fontFimaly.pingFang,
        disabledColor: config.customStyle.themeColorDisable,
        primaryColor: Color(0xFF000000),
        backgroundColor: Color(0xfff4f5f8),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0.0
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: AiTextStyle(
            fontSize: 16.0,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500
          ),
          unselectedLabelStyle: AiTextStyle(
            fontSize: 16.0,
            color: Color(0xA0ffffff)
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0xfff4f5f8)
        ),
        textTheme: TextTheme(
          subtitle1: AiTextStyle(
            color: Color(0xff0000000),
            fontSize: 16.0,
            fontWeight: FontWeight.w600
          ),
          headline6: AiTextStyle(
            color: Color(0xff000000),
            fontSize: 14.0,
            fontWeight: FontWeight.w500
          ),
          subtitle2: AiTextStyle(
            fontSize: 14.0,
            color: Color(0xff999999),
            fontWeight: FontWeight.w200,
          ),
          bodyText2: AiTextStyle(
            fontSize: 14.0,
            color: Color(0xff666666),
            fontWeight: FontWeight.w400
          ),
          caption: AiTextStyle(
            fontSize: 12.0,
            color: Color(0xff999999),
            fontWeight: FontWeight.w400,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Color(0x40999999),
          thickness: 0.0
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: config.customStyle.themeColor),
    );

    static ListTileTheme aiListTileTheme = ListTileTheme(
      
    );
}
