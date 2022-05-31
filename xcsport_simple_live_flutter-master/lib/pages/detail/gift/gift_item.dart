import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fast_ai/pages/wallet/wallet_util.dart';

class GiftItem extends StatefulWidget {

  final GiftInfoModel model;
  final ValueChanged<GiftInfoModel> onSelectItem;
  GiftItem({Key key,this.model, this.onSelectItem}) : super(key: key);

  @override
  _GiftItemState createState() => _GiftItemState();
}

class _GiftItemState extends State<GiftItem> {
  GiftInfoModel get model => widget?.model ?? GiftInfoModel();
  double iconWidth =  54.0;
  double iconHeight = 54.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        if(widget?.onSelectItem != null){
          widget.onSelectItem(model);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: model.isSelect ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(model.isSelect ? 8.0 : 0.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Offstage(
              offstage: (model?.isSelect ?? false),
              child: SizedBox(
                width: iconWidth,
                height: iconHeight,
                child: AiImage.fromUrlWithXcFadeInImage(model?.pngImage, '', needAnimation: false),
              ),
            ),
            Offstage(
              offstage: !(model?.isSelect ?? false),
              child: SizedBox(
                width: iconWidth,
                height: iconHeight,
                child: AiImage.fromUrlWithXcFadeInImage(model?.isGif == 1 ? model?.giftImage : model?.pngImage, '', needAnimation: false),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4.0),
              width: width / 4.0,
              alignment: Alignment.center,
              child: Text(
                model.giftName,
                style: nameStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              width: width / 4.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AiImage.asset("assets/images/wallet/icon_detail_gift_cny.png",width: 10,height: 10),
                  SizedBox(width: 4,),
                  Text('${model.price}', style: nameStyle(), maxLines: 1, overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle nameStyle(){
    return AiTextStyle(
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      color: Colors.white
    );
  }

  TextStyle unitStyle(){
    return AiTextStyle(
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang,
        color: Colors.white.withOpacity(0.4)
    );
  }
}
