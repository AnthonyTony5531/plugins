import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/order_game_bet_record_model.dart';
import 'package:fast_ai/pages/bet/game/bet_search_page.dart';
import 'package:fast_ai/pages/bet/game/member_game_bet_item_view.dart';
//import 'package:fast_ai/pages/member/betting/bet_search_page.dart';
//import 'package:fast_ai/pages/member/betting/game/member_game_bet_item_view.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:flutter/material.dart';


///
///
///
class MemberGameBetSearchPage extends BetSearchPage {
  final List<GameOrder> data;
  final Color bgColor;

  MemberGameBetSearchPage({Key key,this.data,this.bgColor=Colors.transparent,}):super(key : key,bgColor: bgColor);

  MemberGameBetSearchPageState createState() => MemberGameBetSearchPageState();
}

class MemberGameBetSearchPageState extends BetSearchPageState {
  var baseLang = config.langMap['baseLang'];
  ListResult ret = ListResult();

  @override
  void filterData(String text){
    ret = ListResult();
    if(!isNullOrEmpty(text)){
      if(widget.data != null){
        var d = widget.data as List<GameOrder>;
        List<GameOrder> matchItem = [];
        d.forEach((e){
          if(e.gameName.contains(text)){
            matchItem.add(e);
          }
        });

        OrderGameBetRecordModel item = OrderGameBetRecordModel();
        GameBetRecordModel model1 = GameBetRecordModel(matchItem.length,matchItem);
        item.data = model1;
        item.code = 200;

        ret.listCount = matchItem.length;
        ret.totalCount = matchItem.length;
        ret.data = item;
      }
    }

    reloadData(null);
  }

  @override
  Future<ListResult> loadData(i,s)async{
    return ret;
  }


  @override
  Widget drawItemWidget(ListResult listResult, int index) {
    GameOrder item = (listResult.data as OrderGameBetRecordModel).data.pageDTOList[index];
    return MemberGameBetItemView(
      item:item,
      itemIsCard:true,
      showTimeLine:false,
      bgColor:Colors.transparent,
      timeLineOnTap:(){},
      onTapGo2Detail:(){},
      staticsByData:null,
    );
  }
}
