import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class RefreshLoadingMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '正在加载...',
            style: cmPackage.res.textCreator
                .style(fontSize: 13.0, color: Color(0xFF888888)),
          ),
          const SizedBox(width: 15.0),
          SizedBox(
            width: 12.0,
            height: 12.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(Color(0xffff7870)),
            ),
          ),
        ],
      ),
    );
  }
}
