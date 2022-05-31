import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/gift/gift_num_item.dart';
import 'package:fast_ai/pages/detail/gift/gift_num_other_item.dart';
import 'package:flutter/cupertino.dart';

class GiftNumList extends StatelessWidget {

  final ValueChanged<GiftNumModel> onSelectGiftNum;
  GiftNumList({this.onSelectGiftNum});

  @override
  Widget build(BuildContext context) {

    List<String> list = [];
    List<String> nums = ['','520','188','99','66','10'];
    List<GiftNumModel> giftNumModels = [];
    var giftOther = config.langMap['baseLang']['detail']['chatGift']['giftOther'];
    var gift520 = config.langMap['baseLang']['detail']['chatGift']['gift520'];
    var gift188 = config.langMap['baseLang']['detail']['chatGift']['gift188'];
    var gift99 = config.langMap['baseLang']['detail']['chatGift']['gift99'];
    var gift66 = config.langMap['baseLang']['detail']['chatGift']['gift66'];
    var gift10 = config.langMap['baseLang']['detail']['chatGift']['gift10'];
    list.add(giftOther);
    list.add(gift520);
    list.add(gift188);
    list.add(gift99);
    list.add(gift66);
    list.add(gift10);
    for(int index = 0; index < list.length; index ++){
      GiftNumModel model = GiftNumModel();
      model.num = nums[index];
      model.title = list[index];
      giftNumModels.add(model);
    }
    return Container(
      width: 146.0,
      height: 180.0,
      decoration: BoxDecoration(
        color: Color(0xFF213644),
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      child: ListView.builder(
          itemCount: giftNumModels.length,
          itemBuilder: (BuildContext ctx, int index){
            if(index >= giftNumModels.length) return Container();
            GiftNumModel model = giftNumModels[index];
            if(index == 0){
              return GiftNumOtherItem(model: model,onSelectOtherGiftNum: onSelectGiftNum,);
            }
            else{
              return GiftNumItem(model: model,onSelectGiftNum: onSelectGiftNum,);
            }
          }
      ),
    );
  }
}

class GiftNumModel{
  String num;
  String title;
  GiftNumModel({this.num,this.title});
}
