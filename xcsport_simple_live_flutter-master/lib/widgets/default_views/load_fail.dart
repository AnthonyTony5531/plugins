

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-1
 * 加载失败
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:flutter/material.dart';

import 'default_view.dart';

class LoadFail extends StatelessWidget {
  final RefreshCallback onRefresh;
  final String error;
  final Color backgroundColor;
  final bool onlyText;
  final String name;
  final bool isEnableClickScreenRefresh;
  final bool isShowTitle;
  final bool enableBtn;
  const LoadFail({Key key, this.onRefresh, this.error = "", this.backgroundColor = Colors.transparent,this.onlyText = false,this.name,this.isEnableClickScreenRefresh = true,this.isShowTitle = false, this.enableBtn=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.isEnableClickScreenRefresh) {
      return GestureDetector(
        onTap: onRefresh,
        behavior: HitTestBehavior.opaque,
        child:DefaultView(name:name ?? 'net', onTap: onRefresh, msg: this.error, backgroundColor: backgroundColor,onlyText: onlyText,isShowTitle: isShowTitle, enableBtn: enableBtn,),
      );
    }
    return DefaultView(name:name ?? 'net', onTap: onRefresh, msg: this.error, backgroundColor: backgroundColor,onlyText: onlyText,isShowTitle: isShowTitle, enableBtn: enableBtn,);
  }
}

