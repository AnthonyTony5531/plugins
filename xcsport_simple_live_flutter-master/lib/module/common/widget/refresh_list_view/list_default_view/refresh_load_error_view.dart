import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class RefreshLoadErrorView extends StatelessWidget {
  final int errorCount;
  final bool isReconnectFail;
  final VoidCallback onTapCallBack;

  RefreshLoadErrorView(
      {this.errorCount, this.isReconnectFail, this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCallBack?.call(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        alignment: Alignment.center,
        child: Text(
          isReconnectFail ? "请求失败，点击重试..." : "请求失败，尝试重新请求$errorCount次",
          style: cmPackage.res.textCreator
              .style(fontSize: 13.0, color: Color(0xFF888888)),
        ),
      ),
    );
  }
}
