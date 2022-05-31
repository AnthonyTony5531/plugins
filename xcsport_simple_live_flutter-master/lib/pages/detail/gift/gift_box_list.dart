import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_item.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiftBoxList extends StatefulWidget {

  final List<GiftInfoModel> gifts;
  final ValueChanged<GiftInfoModel> onSelectItem;
  GiftBoxList({Key key,this.gifts,this.onSelectItem}): super(key: key);

  @override
  _GiftBoxListState createState() => _GiftBoxListState();
}

class _GiftBoxListState extends State<GiftBoxList> {


  String wishesLabel = '';
  @override
  void initState() {
    wishesLabel = AiJson(config.langMap['baseLang']).getString('detail.wishesLabel');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int count = widget?.gifts?.length ?? 0;
    double itemWidth = MediaQuery.of(context).size.width / 4.0;
    double itemHeight = 100.0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210.0,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: count,
          itemBuilder: (BuildContext ctx, int index){
            if(index >= widget?.gifts?.length) return Container();
            GiftInfoModel model = widget?.gifts[index];
            return Stack(
              children: [
                Container(
                  child: GiftItem(
                    model: model,
                    onSelectItem: widget.onSelectItem,
                  ),
                ),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    width: 24.0,
                    height: 13.0,
                    child: Show(
                        isShow: model.isWishGift ??  false,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                            color: Color(0xFF5078FF),
                          ),
                          alignment: Alignment.center,
                          child: Text(wishesLabel, style: wishStyle(),),
                        )
                    )
                ),
              ],
            );
          }
      ),
    );
  }

  TextStyle wishStyle() {
    return AiTextStyle(
      fontSize: config.skin.fontSize.h6,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      color: Colors.white,
    );
  }

}

