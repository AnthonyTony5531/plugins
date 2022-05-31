import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class DefaultImgErrorWidget extends StatelessWidget {
  DefaultImgErrorWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Color(0xffF1F1F5),
      child: cmPackage.res.imageCreator
          .assetSvgImage('assets/images/img_home_lose.svg'),
    );
  }
}
