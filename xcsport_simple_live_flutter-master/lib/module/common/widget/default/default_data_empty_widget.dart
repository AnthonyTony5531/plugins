import 'package:common_component/package/package.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class DefaultDataEmptyWidget extends StatelessWidget {
  final double width;
  final double height;
  final String emptyMsg;
  final TextStyle emptyMsgStyle;
  final String btnName;
  String image;
  final bool showBtn;
  final VoidCallback onRefreshTap;
  IPackage package;

  DefaultDataEmptyWidget(
      {this.width,
      this.showBtn = true,
      this.height,
      this.image,
      this.emptyMsgStyle,
      this.emptyMsg,
      this.btnName,
      this.onRefreshTap,
      IPackage package}) {
    this.package = package ?? cmPackage;
  }

  @override
  Widget build(BuildContext context) {
    image = image ?? 'assets/images/img_empty_no.png';
    Widget imageWidget;
    if (image.endsWith('png')) {
      imageWidget = package.res.imageCreator
          .assetImage(image ?? 'assets/images/img_empty_no.png');
    } else {
      imageWidget = package.res.imageCreator
          .assetSvgImage(image ?? 'assets/images/img_empty_no.png');
    }
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 80.0),
          SizedBox(
            width: 120.0,
            height: 115.0,
            child: imageWidget,
          ),
          const SizedBox(height: 20.0),
          Text(
            emptyMsg ?? '暂无数据',
            textAlign: TextAlign.center,
            style: package.res.textCreator
                .style(color: Color(0xff666666), fontSize: 14.0),
          ),
          Visibility(visible: showBtn, child: const SizedBox(height: 20.0)),
          Visibility(
            visible: showBtn,
            child: GestureDetector(
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
                child: Text(btnName ?? '试一试,刷新',
                    style: emptyMsgStyle ??
                        cmPackage.res.textCreator
                            .style(color: Colors.white, fontSize: 13.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
