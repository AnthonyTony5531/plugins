import 'package:fast_ai/module/common/util/empty_util.dart';
import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-1
 * 没有数据
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultView extends StatelessWidget {
  final String name;
  final String type;
  final VoidCallback onTap;
  final String msg;
  final bool enableBtn;
  final Color backgroundColor;
  final double height;
  final bool onlyText;
  final String btnText;
  final String title;
  final String imageAssetFile;
  final bool isShowTitle; // 仅onlyText为true时有效
  final double imageTopMargin;
  final Color textColor;
  final AlignmentGeometry alignment;
  final Color btnTextColor;
  final Color contentColor;
  DefaultView(
      {Key key,
      this.name,
      this.type,
      this.imageAssetFile, 
      this.onTap,
      this.msg,
      this.enableBtn = false,
      this.height,
      this.backgroundColor = Colors.transparent,
      this.onlyText = false,
      this.btnText,
      this.isShowTitle = false,
      this.title = '',
      this.textColor,
      this.alignment,
      this.btnTextColor,
      this.imageTopMargin = 0.0,
      this.contentColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameType = (name ?? '').isEmpty ? 'FT' : name;
    var disp = config.nodata.discription(gameType) ??
        config.nodata.discription('other');
    if(isNotEmpty(imageAssetFile)){
      disp.img = imageAssetFile;
    }    
    Widget img;
    if(isNotEmpty(disp.img)){
      if (disp.img.endsWith('svg')) {
        img = AiSvgPicture.asset(disp.img);
      } else {
        img = AiImage.asset(disp.img);
      }
    }else{
      img = SizedBox.shrink();
    }
    return Container(
      height: this.height == null ? MediaQuery.of(context).size.height : height,
      alignment: alignment ?? Alignment(0, -0.37),
      color: backgroundColor,
      child:
          onlyText ? _onlyText(context, disp) : _picAndText(context, img, disp),
    );
  }

  Widget _picAndText(BuildContext context, dynamic img, dynamic disp) {
    Color contColor;
    if (contentColor == null) {
      contColor = (textColor ?? Color(0x7719263B));
    } else {
      contColor = contentColor;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: this.imageTopMargin),
          child: img,
          width: 130,
        ),
        Container(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            title.isNotEmpty ? title : disp.title,
            style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontSize: 14,
                color: textColor ?? Color(0xFF19263B),
                letterSpacing: 0.27),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 3,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            // this.msg ?? disp.content,
            disp.content,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontSize: 12,
                color: contColor ?? Color(0x7719263B),
                letterSpacing: 0.27),
          ),
        ),
        Container(
          height: isStrNullOrEmpty(disp?.content) ? 10.0 : 21.0,
        ),
        !enableBtn || isNullOrEmpty(disp.btn)
            ? Container()
            : GestureDetector(
                onTap: onTap ?? () => onGoHomeTap(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: config.customStyle.themeLinearColor),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Text(
                    this.btnText ?? disp.btn,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: 12,
                        color: btnTextColor ?? textColor ?? config.customStyle.themeIncludeFontColor,
                        letterSpacing: 0.23),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _onlyText(BuildContext context, dynamic disp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 仅显示文字时是否显title文字
        isShowTitle
            ? Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                    title.isNotEmpty ? title : disp.title,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: 14,
                        color: textColor ?? Color(0xFFFFFFFF),
                        letterSpacing: 0.27),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                ),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            disp.content,
            style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontSize: 12,
                color: textColor ?? Color(0xFFFFFFFF),
                letterSpacing: 0.27),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: isStrNullOrEmpty(disp?.content) ? 10.0 : 21.0,
        ),
        !enableBtn || isNullOrEmpty(disp.btn)
            ? Container()
            : GestureDetector(
                onTap: onTap ?? () => onGoHomeTap(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: config.customStyle.themeLinearColor),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Text(
                    this.btnText ?? disp.btn,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: 12,
                        color: btnTextColor ?? textColor ?? Color(0xFF19263B),
                        letterSpacing: 0.23),
                  ),
                ),
              ),
      ],
    );
  }

  onGoHomeTap(context) {
    if (type == 'detail') {
      // config.userInfo.detailSet = DetailSet();
      // AiRouter.pushReplacementNamed(TabSdkPage.main);
      AiRouter.pop(context);
    } else {
      Event.eventBus.fire(OnGoPage());
    }
  }
}
