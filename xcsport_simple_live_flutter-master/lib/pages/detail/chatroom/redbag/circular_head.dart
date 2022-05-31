

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

// 圆形头像 netImg 与 assetImg选其一参数赋值
class XCCircularHeadView extends StatelessWidget {
  final double width;
  final double borderWidth;
  final String netImg;
  final String assetImg;
  final Color borderColor;
  XCCircularHeadView({Key key,this.width,this.borderWidth = 0,this.netImg,this.assetImg,this.borderColor = Colors.transparent}) : super(key:key);

  ///占位图
  static String _placeholderImg = 'assets/images/detail/chatroom/redbag/img_mine_avatar_empty.svg';

  Widget childView(){
    if(assetImg != null){
      ///加载本地图片
      return assetImg.endsWith('.svg') ? AiImage.svgLogo(assetImg,size: width) : AiImage.asset(
        assetImg,
        width: width,
        height: width,
        fit: BoxFit.cover,
      );

    }else if(netImg != null){
      ///加载网络图片
      return AiImage.fromUrlHasSize(
        netImg.startsWith('http') ? netImg : '${Api.baseImgUrl}$netImg',
        _placeholderImg,
        width: width,
        height: width,
      );
    }else{
      ///占位图
      return AiImage.svgLogo(_placeholderImg,size: width);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + borderWidth,
      height: width + borderWidth,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor,width: borderWidth),
          borderRadius: BorderRadius.circular((width + borderWidth)/2)
      ),
      child:ClipOval(
        child: childView(),
      ),
    );
  }

}