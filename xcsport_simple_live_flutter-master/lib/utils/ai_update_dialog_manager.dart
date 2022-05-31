import "package:fast_ai/utils/ai_image.dart";
import 'dart:io';

import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/member/about_us/version/version_dao.dart';
import 'package:fast_ai/router.dart';
//import 'package:fast_ai/utils/app_util.dart';
import 'package:fast_ai/widgets/flush_helper.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import 'ai_image.dart';

/*
 * @author eureka
 * Dialog（串关详情Dialog, 版本更新Dialog......）
 */
class AiUpgradeDialogManager {
  //版本更新Dialog
  static void _showUpgradeDialog(
      BuildContext parentContext,
      List<Widget> changeContent,
      String appVersion,
      VoidCallback onUpgradePressed,
      bool isForceUpdate, // 是否强制更新
      ) {
    
    List<Widget> listWidget = List();
    // 强制更新
    if (isForceUpdate) {
     Widget buttonWidget = Container(
       width: 150,
       child: AiUpgradeDialogManager.getRaisedButton(parentContext: parentContext,onUpgradePressed: onUpgradePressed,text: '${config.langMap['baseLang']['utils']['forceUpdate']}',isForceUpdate: true),
     );
     listWidget.add(buttonWidget);
    }
    // 稍后更新/立即体验
    else{
      Widget leftButtonWidget = Expanded(
        flex: 1,
        child: AiUpgradeDialogManager.getRaisedButton(parentContext: parentContext,onUpgradePressed: onUpgradePressed,text: '${config.langMap['baseLang']['utils']['updateLater']}',isForceUpdate: false),
      );
      Widget marginWidget = Padding(
        padding: EdgeInsets.all(5.0),
      );
      Widget rightButtonWidget = Expanded(
        flex: 1,
        child: AiUpgradeDialogManager.getRaisedButton(parentContext: parentContext,onUpgradePressed: onUpgradePressed,text: '${config.langMap['baseLang']['utils']['experience']}',isForceUpdate: false,isExperience: true),
      );
      listWidget.add(leftButtonWidget);
      listWidget.add(marginWidget);
      listWidget.add(rightButtonWidget);
    }
    showDialog<Null>(
        context: parentContext,
        barrierDismissible: !isForceUpdate,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: (){
              return Future.value(isForceUpdate ? false : true);
            },
            child: AlertDialog(
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    image: DecorationImage(
                        image: AiImage.assetImage(
                            'assets/images/public/img_update_bg_normal.png'),
                        fit: BoxFit.cover)),
                height: 90.0,
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${config.langMap['baseLang']['utils']['findNewVersion']}',
                          style: AiTextStyle(
                            fontFamily: FontFamily.number,
                            fontSize: 24,
                          ),
                        ),
                        Text('$appVersion')
                      ]),
                ),
              ),
              content: Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        child:
                            ListView(children: changeContent, shrinkWrap: true),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listWidget,
                          )
                        )
                    ]),
              )),
          );
        });        
  }

  static Widget getRaisedButton({BuildContext parentContext,VoidCallback onUpgradePressed,String text,bool isForceUpdate = false,bool isExperience = false}){
      return RaisedButton(
        color: config.customStyle.themeColor,
        splashColor: Color(0xFFF5F5F5),
        highlightColor: Color(0xFFF5F5F5),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        child: Container(
          padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              right: 10.0,
              left: 10.0),
          child: Text("$text",
              style: AiTextStyle(fontSize: 15)),
        ),
        onPressed: () {
          if (isForceUpdate) {
            if (Platform.isAndroid) {
              AiRouter.pop(parentContext);
            }
            // if(!isRelease()){
            //   showToas("当前不是Release包，初始化出错啦~");
            // }
            onUpgradePressed();
          }
          else{
            AiRouter.pop(parentContext);
            if (isExperience) {
              onUpgradePressed();
            }
            else{
//              var dao = VersionDao();
//              dao.signCurrentCheckTime();
            }
          }
        });
  }

  static void showUpgradeDialogStyle1(BuildContext parentContext,
      {String title,
      List<String> versionContent,
      String appVersion,
      VoidCallback onUpgradePressed,
      bool isForceUpdate = false, // 是否强制更新
      }) {
    List<Widget> cells = [];
    cells.add(TextHelper.buildBarTitle(title));
    cells.add(InterValHelper.h(4));
    versionContent.forEach((f) {
      cells.add(TextHelper.buildNormal(f, textColor: 0x40000000));
      cells.add(InterValHelper.h(2));
    });
    _showUpgradeDialog(parentContext, cells, appVersion, onUpgradePressed,isForceUpdate);
  }

  static void showUpgradeDialogStyle2(BuildContext parentContext,
      {String title,
      String versionContent,
      String appVersion,
      VoidCallback onUpgradePressed,
      bool isForceUpdate = false, // 是否强制更新
      }) {
    List<Widget> cells = [];
    cells.add(TextHelper.buildBarTitle(title));
    cells.add(InterValHelper.h(4));
    cells.add(Text(versionContent, style: AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: 12,
      color: const Color(0x40000000)
    ),));
    _showUpgradeDialog(parentContext, cells, appVersion, onUpgradePressed,isForceUpdate);
  }
}
