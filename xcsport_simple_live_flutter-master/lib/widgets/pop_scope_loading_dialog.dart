//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/21
//--------------------------------------------------------------------------


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import 'loading_widget/loading_circular.dart';

// ignore: must_be_immutable
class LoadingWillPopScopeDialog extends Dialog {
  String text;
  bool cancel;
  bool _isShowing = false;

  bool get isShowing => _isShowing;

  LoadingWillPopScopeDialog.create(this.text, {this.cancel = true, this.onForceClose});

  BuildContext _context;

  //手动按掉dialog回调
  VoidCallback onForceClose;

  show(BuildContext context) {
    Dialog dialog = this;
    _isShowing = true;
    _context = context;
    // 加await是为了防止还没打开dialog就调用了dismiss
    showDialog(
        context: context,
        barrierDismissible: cancel,
        builder: (context) {
          return dialog;
        }
    );
  }


  void dismiss() {
    if(_isShowing){
      _isShowing = false;
      if(null != _context){
        AiRouter.pop(_context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: ()async{
          if(cancel){
            dismiss();
            if(null  != onForceClose){
              onForceClose();
            }
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LoadingCircular(),
                    InterValHelper.h(20),
                    Container(
                      child: TextHelper.buildNormal(text??"${config.langMap['baseLang']['message']['loading']}"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ), onWillPop: () async {
      return false;
    });
  }
}
