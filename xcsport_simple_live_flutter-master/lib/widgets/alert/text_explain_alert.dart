import "package:fast_ai/utils/ai_image.dart";


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


//文本提示窗口
class TextAlert {

  BuildContext _context;
  TextAlert.of(BuildContext context){
    _context = context;
  }
  OverlayEntry _entry;
  Future<dynamic> showAlert({
    String title,
    int titleMaxLine,
    @required String message,
    String buttonName ,
    String rightButtonName,
    ValueChanged<int> onButton,
    TextStyle titleStyle,
    TextStyle messageStyle,
    TextStyle btnNameStyle,
    TextStyle rightBtnNameStyle,
    VoidCallback callback,
    bool isDismissible = true,
    Widget messageWidget,
    double leftMargin,
    double rightMargin,
    double leftPadding,
    double rightPadding,
    double contentTopPadding,
    double contentBottomPadding,
  })async{
    Overlay.of(_context).insert(_entry = OverlayEntry(
        builder: (_){
          return _TextAlert( title: title,
            titleMaxLine: titleMaxLine,
            entry:_entry,
            message: message,
            buttonName: buttonName,
            rightButtonName:rightButtonName,
            onButton:onButton,
            callback: callback,
            titleStyle: titleStyle,
            messageStyle: messageStyle,
            btnNameStyle: btnNameStyle,
            rightBtnNameStyle: rightBtnNameStyle,
            isDismissible: isDismissible,
            messageWidget: messageWidget,
            leftMargin: leftMargin,
            rightMargin: rightMargin,
            leftPadding: leftPadding,
            rightPadding: rightPadding,
              contentTopPadding: contentTopPadding,
              contentBottomPadding: contentBottomPadding,
          );
        }
    ));
    _context  =null;

  }

  void dispose(){
    _context  =null;
//    if(_key.currentState?.context is BuildContext){
//      Navigator.of(_key.currentState?.context).pop();
//    }
    _entry?.remove();
  }

}



//推球说明
class _TextAlert extends StatelessWidget {
  final String title;
  final int titleMaxLine;
  final String message;
  final String buttonName;
  final OverlayEntry entry;
  final String rightButtonName;
  final ValueChanged<int> onButton;
  final TextStyle titleStyle;
  final TextStyle messageStyle;
  final TextStyle btnNameStyle;
  final TextStyle rightBtnNameStyle;
  final VoidCallback callback;
  final bool isDismissible;
  final Widget messageWidget;
  final double leftMargin;
  final double rightMargin;
  final double leftPadding;
  final double rightPadding;
  final double contentTopPadding;
  final double contentBottomPadding;

  const _TextAlert({
    Key key,
    this.title,
    this.titleMaxLine,
    this.message,
    this.entry,
    this.buttonName,
    this.rightButtonName,
    this.onButton,
    this.titleStyle,
    this.messageStyle,
    this.btnNameStyle,
    this.callback,
    this.isDismissible = true,
    this.rightBtnNameStyle,
    this.messageWidget,
    this.leftMargin,
    this.rightMargin,
    this.leftPadding,
    this.rightPadding,
    this.contentTopPadding,
    this.contentBottomPadding,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var messageStype = AiTextStyle(
      fontSize: 14,
      color: Colors.black.withOpacity(0.6),
      fontFamily: FontFamily.normal,
    );
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double padding = (MediaQuery.of(context).size.width-248)/2; // 很屏弹框宽248

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){
          if(isDismissible){
            entry?.remove();
            return;
          }
          if(this.onButton != null  ||  this.rightButtonName != null ) return;
          entry?.remove();
        },
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets .only(left: isPortrait ? (leftMargin ?? 46) : padding, right: isPortrait ? (rightMargin ?? 46) : padding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: <Widget>[
                      h(16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextHelper.buildContentTitle(
                            title??'${config.langMap['baseLang']['hint']}',
                            textColor: Colors.black.value,
                            style: titleStyle,
                            maxLine: titleMaxLine ?? -1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      h(contentTopPadding ?? 32),
                      Container(
                        child: messageWidget ?? Text(message??'', style: messageStyle ?? messageStype,textAlign: TextAlign.center,),
                        margin: EdgeInsets.only(left: (leftPadding ?? 36), right: (rightPadding ?? 36)),
                      ),
                      h(contentBottomPadding ?? 32),
                      LineHelper.buildHLine(),
                      onButton != null && rightButtonName != null ? Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                onButton(0);
                                entry?.remove();
                              },
                              child: Container(
                                height: 49,
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                child: TextHelper.build(buttonName??config.langMap['baseLang']['abort'],textColor: Colors.black.withOpacity(0.6).value, fontSize: 16, textAlign: TextAlign.center,style: btnNameStyle ),
                              )
                            )
                          ),
                          (buttonName != null && rightButtonName != null) ? Container(height: 38, width: 1, color: config.skin.colors.deviderColor, margin: EdgeInsets.only(bottom:4, top: 4),) : Container(),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                onButton(1);
                                entry?.remove();
                              },
                              child: Container(
                                height: 49,
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                child: TextHelper.build(rightButtonName??config.langMap['baseLang']['retry'],textColor: Colors.black.value,fontSize: 16, textAlign: TextAlign.center,style: rightBtnNameStyle ),
                              )
                            )
                          )
                        ],
                      ): InkWell(
                        onTap: (){
                          entry?.remove();
                          if(callback != null){
                            callback();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 49,
                          padding: EdgeInsets.only(top: 13,bottom: 13),
                          child: TextHelper.build(buttonName??'${config.langMap['baseLang']['confirm']}',textColor: Colors.black.value,fontSize: 16, textAlign: TextAlign.center ,style: btnNameStyle),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
