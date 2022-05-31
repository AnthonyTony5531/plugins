import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/gift/gift_num_list.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiftNumItem extends StatelessWidget {
  final GiftNumModel model;
  final ValueChanged<GiftNumModel> onSelectGiftNum;

  GiftNumItem({this.model, this.onSelectGiftNum});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onSelectGiftNum != null) {
          onSelectGiftNum(model);
        }
      },
      child: Container(
        width: 146.0,
        height: 30.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(model.num, style: numStyle()),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(model.title, style: textStyle()),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle numStyle() {
    return AiTextStyle(
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang,
        color: Colors.white);
  }

  TextStyle textStyle() {
    return AiTextStyle(
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang,
        color: Colors.white.withOpacity(0.5));
  }
}
