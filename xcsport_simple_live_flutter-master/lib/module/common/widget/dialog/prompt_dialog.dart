import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/widget/dialog/base_dialog_view.dart';

class PromptDialog extends BaseDialogView {
  final _PromptDialogStyle _style = _PromptDialogStyle();
  final String title;
  final TextStyle titleStyle;
  final String msg;
  final TextStyle msgStyle;
  final String leftBtn;
  final TextStyle leftBtnStyle;
  final Function(BaseDialogView) onLeftTap;
  final String midBtn;
  final TextStyle midBtnStyle;
  final Function(BaseDialogView) onMidTap;
  final String rightBtn;
  final TextStyle rightBtnStyle;
  final Function(BaseDialogView) onRightTap;

  PromptDialog({
    this.title,
    this.titleStyle,
    this.msg,
    this.msgStyle,
    leftBtn,
    this.leftBtnStyle,
    this.onLeftTap,
    this.midBtn,
    this.midBtnStyle,
    this.onMidTap,
    rightBtn,
    this.rightBtnStyle,
    this.onRightTap,
  })  : leftBtn = leftBtn ?? '取消',
        rightBtn = rightBtn ?? '确定';

  @override
  Widget builder(BaseDialogView widget, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleView(),
                _buildMsgView(),
                _buildLineView(),
                _buildBtnRowView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleView() {
    return Padding(
      padding: EdgeInsets.only(top: 14.0, bottom: 10.0),
      child: Text(title ?? '提示', style: titleStyle ?? _style.titleStyle),
    );
  }

  Widget _buildMsgView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: Text(msg ?? '',
              style: msgStyle ?? _style.msgStyle, textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildLineView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      color: Color(0xfff5f6fa),
      width: double.infinity,
      height: 0.8,
    );
  }

  Widget _buildBtnRowView() {
    List<Widget> btnList = [];

    if (leftBtn != null && leftBtn.isNotEmpty) {
      btnList.add(_buildBtnView(
          leftBtn, leftBtnStyle ?? _style.leftBtnStyle, onLeftTap));
    }

    if (midBtn != null && midBtn.isNotEmpty) {
      if (btnList.length != 0) btnList.add(_buildBtnLine());
      btnList.add(
          _buildBtnView(midBtn, midBtnStyle ?? _style.midBtnStyle, onMidTap));
    }

    if (rightBtn != null && rightBtn.isNotEmpty) {
      if (btnList.length != 0) btnList.add(_buildBtnLine());
      btnList.add(_buildBtnView(
          rightBtn, rightBtnStyle ?? _style._rightBtnStyle, onRightTap));
    }

    return SizedBox(
      height: 48.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: btnList,
      ),
    );
  }

  Widget _buildBtnLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      color: Color(0xfff5f6fa),
      width: 1.0,
      height: double.infinity,
    );
  }

  Widget _buildBtnView(
      String name, TextStyle style, Function(BaseDialogView) onCallBack) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onCallBack != null) {
            onCallBack.call(this);
          } else {
            dismiss();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(name, style: style, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}

class _PromptDialogStyle {
  final TextStyle titleStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  final TextStyle msgStyle = cmPackage.res.textCreator.style(
    fontSize: 14.0,
    color: Color(0xFF888888),
  );

  final TextStyle leftBtnStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    color: Color(0xFF888888),
  );

  final TextStyle midBtnStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    color: Color(0xFF888888),
  );

  final TextStyle _rightBtnStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    color: Color(0xFFFF7870),
  );
}
