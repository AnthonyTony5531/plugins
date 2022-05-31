import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/widget/dialog/base_dialog_view.dart';

class PayPwdDialog extends BaseDialogView {
  final String title;
  final String content;
  final ValueChanged<String> inputCallback;
  final VoidCallback onCloseDialog;

  PayPwdDialog({
    this.title,
    this.content,
    this.inputCallback,
    this.onCloseDialog,
  });

  @override
  Widget builder(BaseDialogView widget, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PwdView(
        title: title,
        content: content,
        inputCallback: inputCallback,
        onCloseDialog: onCloseDialog,
      ),
    );
  }
}

class PwdView extends StatefulWidget {
  final String title;
  final String content;
  final ValueChanged<String> inputCallback;
  final VoidCallback onCloseDialog;

  PwdView({this.title, this.content, this.inputCallback, this.onCloseDialog});

  @override
  _PwdViewState createState() => _PwdViewState();
}

class _PwdViewState extends State<PwdView> {
  final FocusNode editNode = FocusNode();
  int _inputLen = 0;
  final _PayPwdDialogStyle style = _PayPwdDialogStyle();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(editNode);
          },
          child: Container(
            width: 275,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  width: 1,
                  height: 1,
                  child: TextField(
                    focusNode: editNode,
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(color: Colors.transparent),
                    textInputAction: TextInputAction.done,
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      hintText: '',
                      hintStyle:
                          TextStyle(color: Colors.transparent, fontSize: 14.0),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      border: InputBorder.none,
                      focusColor: Colors.transparent,
                      labelStyle: TextStyle(color: Colors.transparent),
                    ),
                    onChanged: (s) {
                      _inputLen = s.length;
                      //print('len:$_inputLen    $s');
                      if (mounted) {
                        setState(() {});
                      }
                      if (_inputLen == 6) {
                        widget?.inputCallback?.call(s);
                      }
                    },
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.title ?? '',
                      style: style.titleStyle,
                    ),
                    Text(
                      widget.content ?? '',
                      style: style.contentStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          charBox(_inputLen >= 1),
                          const SizedBox(
                            width: 2,
                          ),
                          charBox(_inputLen >= 2),
                          const SizedBox(
                            width: 2,
                          ),
                          charBox(_inputLen >= 3),
                          const SizedBox(
                            width: 2,
                          ),
                          charBox(_inputLen >= 4),
                          const SizedBox(
                            width: 2,
                          ),
                          charBox(_inputLen >= 5),
                          const SizedBox(
                            width: 2,
                          ),
                          charBox(_inputLen >= 6),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    left: 3,
                    top: 3,
                    child: InkWell(
                      onTap: () {
                        widget?.onCloseDialog?.call();
                        Navigator.pop(context);
                      },
                      child: cmPackageRes.imageCreator.assetSvgImage(
                          'assets/images/pay/img_mine_money_close.svg'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget charBox(bool show) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE7E7EB), width: 1),
      ),
      child: Text(show ? '●' : ''),
    );
  }
}

class _PayPwdDialogStyle {
  final TextStyle titleStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  final TextStyle contentStyle = cmPackage.res.textCreator.style(
    fontSize: 14.0,
    color: Color(0xFF888888),
  );
}
