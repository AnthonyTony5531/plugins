import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class RefreshErrorView extends StatelessWidget {
  final VoidCallback onTapCallBack;

  RefreshErrorView({this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 80.0),
          SizedBox(
            width: 140.0,
            height: 95.0,
            child: cmPackage.res.imageCreator
                .assetImage('assets/images/img_empty_wifi.png'),
          ),
          const SizedBox(height: 30.0),
          Text(
            '没有网络，请刷新重试',
            style: cmPackage.res.textCreator
                .style(color: Color(0xff666666), fontSize: 14.0),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => onTapCallBack?.call(),
            child: Container(
              width: 120.0,
              height: 36.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFF8E70),
                    Color(0xffFF8BFB),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Text('刷新',
                  style: const TextStyle(color: Colors.white, fontSize: 13.0)),
            ),
          ),
        ],
      ),
    );
  }
}
