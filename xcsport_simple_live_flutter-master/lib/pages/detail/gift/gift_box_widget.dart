import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/utils/ai_image.dart';

class GiftBoxWidget extends StatelessWidget {

  double width;
  double height;
  final GiftInfoModel giftInfoModel;
  final bool selected;

  GiftBoxWidget({Key key, @required this.giftInfoModel, this.width, this.height, this.selected = false});


  @override
  Widget build(BuildContext context) {
    if(width == null){
      width = MediaQuery.of(context).size.width/4;
    }
    if(height == null){
      height = MediaQuery.of(context).size.width/4;
    }
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: giftInfoModel == null ? _emptyLoadingView() : _giftDescView(),
    );
  }


  Widget _emptyLoadingView(){
    return Container(
      child: AiImage.asset('assets/images/gift/empty_detail_gift.png'),
    );
  }


  Widget _giftDescView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        selected ? AiImage.asset('assets/images/gift/empty_detail_gift.gif') : AiImage.asset('assets/images/gift/empty_detail_gift.png'),
        Text("666"),
        Row(
          children: [
            Text("1"),
            SizedBox(width: 10,),
            AiImage.asset('assets/images/gift/icon_detail_money.png'),
          ],
        ),
      ],
    );
  }
}
