import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

/// 全局弹出alertView
///
/// 默认：title-提示，msg-null，左侧button-取消，右侧button-确认
///
Future showCommonAlert(
  BuildContext context, {
  String title,
  String msg,
  TextStyle defaultBtnStyle,
  TextStyle confirmBtnStyle,
 TextStyle messageStyle,

  
  Function cancelCallBack,
  Function confirmCallBack,
  List<AlertAction> actions,
})async {
 await showDialog(
    context: context,
    builder: (_) {
      return AlertView(
        title: title,
        message: msg,
        defaultBtnStyle: defaultBtnStyle,
        confirmBtnStyle: confirmBtnStyle,
        actions: actions,
        messageStyle:messageStyle,
        cancel: cancelCallBack,
        confirm: confirmCallBack,
      );
    },
  );
}

class AlertView extends StatelessWidget {
  final String title;
  final String message;
  final TextStyle messageStyle;
  final TextStyle defaultBtnStyle;
  final TextStyle confirmBtnStyle;
  final Function cancel;
  final Function confirm;
  final List<AlertAction> actions;
  AlertView({
    Key key,
    this.title,
    this.message,
    this.defaultBtnStyle,
    this.confirmBtnStyle,
    this.messageStyle, 
    this.cancel,
    this.confirm,
    this.actions,
  })  : assert((actions?.length ?? 0) <= 2, '不支持多于2个按钮'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _buildContent(context),
      color: Colors.transparent,
    );
  }

  _buildContent(BuildContext context) {
    double w = MediaQuery.of(context).size.width - 100;

    return Center(
      child: Container(
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitleAndMsg(),
            Divider(
              indent: 20,
              endIndent: 20,
              height: 1,
              thickness: 1,
              color: dividerColor,
            ),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  _buildTitleAndMsg() {
    return Container(
      padding: EdgeInsets.all(14),
      child: Column(
        children: [
          Text(
            title ?? _defaultTitle,
            style: _titleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          message != null
              ? ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 55,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      message,
                      style: messageStyle??_msgStyle,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              : SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }

  _buildButtons(BuildContext context) {
    List<AlertAction> currentActions = actions ??
        [
          AlertAction(
            title: '取消',
            isOk: false,
          ),
          AlertAction(
            title: '确认',
            isOk: true,
          ),
        ];
    List<Widget> children = currentActions.map((action) {
      return Container(
        child: Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.maybePop(context).then((value) {
                action.isOk ? confirm?.call() : cancel?.call();
              });
            },
            child: Align(
              child: Text(
                action.title,
                style: action.isOk
                    ? (confirmBtnStyle ?? _confirmBtnStyle)
                    : (defaultBtnStyle ?? _defaultBtnStyle),
              ),
            ),
          ),
        ),
      );
    }).toList();

    if (currentActions.length > 1) {
      children.insert(
          1,
          Container(
            child: VerticalDivider(
              endIndent: 10,
              indent: 10,
              width: 1,
              thickness: 1,
              color: dividerColor,
            ),
          ));
    }

    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  String get _defaultTitle => '提示';
  Color get dividerColor => Color(0xFFF5F6FA);

  final TextStyle _titleStyle = cmPackage.res.textCreator.style(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  final TextStyle _msgStyle = cmPackage.res.textCreator.style(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF888888),
  );

  final TextStyle _defaultBtnStyle = cmPackage.res.textCreator.style(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xFF888888),
  );

  final TextStyle _confirmBtnStyle = cmPackage.res.textCreator.style(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xFFFF7870),
  );
}

class AlertAction {
  final String title;
  final bool isOk;
  AlertAction({
    this.title = '取消',
    this.isOk = false,
  });
}
