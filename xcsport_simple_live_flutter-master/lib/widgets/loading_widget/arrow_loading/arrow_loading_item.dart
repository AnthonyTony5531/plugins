//import 'package:fast_ai/pages/betting_2p0/betting_bottom_dialog.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

///带箭头加载项
class ArrowLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              color: Colors.white.withOpacity(0.05),
              height: 36,
              child: Row(
                children: [
                  AiSvgPicture.asset(
                    'assets/images/detail/icon_detail_arrow_item.svg'
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 64,
                    height: 16,
                    child: strip(),
                  ),
                ],
              ),
            ),
            LineHelper.buildHLine(bold: 1, color: Colors.black.withOpacity(0.05).value),
            SizedBox(
              height: 71,
              child: Row(
                children: [
                  Expanded(child: rowItem()),
                  LineHelper.buildVLine(bold: 1, color: Colors.black.withOpacity(0.05).value),
                  Expanded(child: rowItem()),
                  LineHelper.buildVLine(bold: 1, color: Colors.black.withOpacity(0.05).value),
                  Expanded(child: rowItem()),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget rowItem() {
    return Container(
      color: Colors.white.withOpacity(0.05),
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: double.infinity, height: 12, child: strip()),
          sh(6),
          Container(width: double.infinity, height: 17, child: strip()),
        ],
      ),
    );
  }

  //条状
  Widget strip() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
