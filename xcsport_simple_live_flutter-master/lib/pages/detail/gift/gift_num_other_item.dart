import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/gift/gift_num_list.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiftNumOtherItem extends StatelessWidget {

  final GiftNumModel model;
  final ValueChanged<GiftNumModel> onSelectOtherGiftNum;
  GiftNumOtherItem({this.model,this.onSelectOtherGiftNum});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        print('其他数额');
        if(onSelectOtherGiftNum != null){
          onSelectOtherGiftNum(model);
        }
      },
      child: Container(
        width: 146.0,
        height: 30.0,
        child: Column(
          children: [
            Container(
              height: 29.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3.0,right: 2.0),
                    child: AiImage.asset('assets/images/gift/icon_gift_number_keyboard.png',width: 16.0,height: 16.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0),
                    child: Text(model.title,style: textStyle(),),
                  )
                ],
              ),
            ),
            Divider(height: 1.0,color: Color(0xFFF5F5F5).withOpacity(0.1),)
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(){
    return AiTextStyle(
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang,
        color: Colors.white.withOpacity(0.5)
    );
  }
}
