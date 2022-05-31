import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class DefaultNetErrorWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String image;
  final String buttonTitle;
  final VoidCallback onRefreshTap;

  DefaultNetErrorWidget(
      {this.width,
      this.height,
      this.onRefreshTap,
      this.title,
      this.image,
      this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 80.0),
          SizedBox(
            width: 140.0,
            height: 140.0,
            child: cmPackageImageCreator.assetImage(
                image ?? 'assets/images/img_empty_wifi.png',
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 30.0),
          Text(
            title ?? '没有网络，请刷新重试',
            style: cmPackage.res.textCreator
                .style(color: Color(0xff666666), fontSize: 14.0),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => onRefreshTap?.call(),
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
              child: Text(buttonTitle ?? '刷新',
                  style: const TextStyle(color: Colors.white, fontSize: 13.0)),
            ),
          ),
        ],
      ),
    );
  }
}
