//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/14
//--------------------------------------------------------------------------

import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

//导航栏
class XCAppbarHelper extends AiAppBar {
  static AiAppBar build(BuildContext context,
      {String titleName,
        PreferredSizeWidget bottom,
        List<Widget> menuItems,
        double elevation = 1,
        Brightness brightness = Brightness.light,
      }) {
    return AiAppBar(
      brightness: brightness,
      leading: GestureDetector(
        onTap: () {
          AiRouter.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(top: 17, bottom: 15),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withAlpha(200),
            size: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: elevation,
      bottom: bottom,
      title: TextHelper.buildBarTitle(
        titleName ?? "",
      ),
      actions: menuItems ?? [],
    );
  }

  static AppBar buildSimple(BuildContext context,
      {String title, Icon backIcon, VoidCallback onPressed, Widget action, Brightness brightness}) {
    return AppBar(
      brightness: brightness,
      leading: IconButton(
        onPressed: onPressed ??
                () {
                  AiRouter.pop(context);
            },
        icon: backIcon ??
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withAlpha(200),
              size: 17,
            ),
      ),

      title: TextHelper.buildBarTitle(
        title,
      ),
      actions: <Widget>[
        action??Container()
      ],
      backgroundColor: Colors.white,
    );
  }
}