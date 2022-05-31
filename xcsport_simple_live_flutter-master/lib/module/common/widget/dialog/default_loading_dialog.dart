import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/widget/dialog/base_dialog_view.dart';

// 默认loading弹框
class DefaultLoadingDialog extends BaseDialogView {
  final String msg;

  DefaultLoadingDialog({this.msg});

  @override
  Widget builder(BaseDialogView widget, BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red.shade300)),
            SizedBox(height: 16.0),
            Text(msg ?? '请求中...',
                style: TextStyle(color: Color(0xff666666), fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}
