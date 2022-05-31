import 'package:fast_ai/module/common/util/sizebox_util.dart';
import 'package:flutter/material.dart';

//空识图
class EmptyView extends StatelessWidget {
  final EmptyType emptyType;
  final VoidCallback onTap;
  final double marginTop;
  const EmptyView(
      {Key key, this.emptyType = EmptyType.NoData, this.onTap, this.marginTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 150),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              this.emptyType == EmptyType.NetError ? '网络开小差了，请稍候再试' : '暂无数据',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFFFF999)
              ),
            ),
            sh(20),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF9A9696), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '刷新',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFFFF999)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum EmptyType {
  NetError, //网络错误
  NoData, //暂无数据
}
