import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class RefreshFirstLoadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(Color(0xffff7870)),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            '数据加载中...',
            style: cmPackage.res.textCreator
                .style(fontSize: 13.0, color: Color(0xFF888888)),
          ),
        ],
      ),
    );
  }
}
