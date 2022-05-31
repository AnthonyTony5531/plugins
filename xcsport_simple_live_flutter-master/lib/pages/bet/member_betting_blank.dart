import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/event/event.dart';
//import 'package:fast_ai/pages/ai_module/ai_page.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberBettingBlank extends StatelessWidget {
  MemberBettingBlank({
    this.parentContext,
    this.height,
    this.needPop = true,
    this.isShowEmptyBtn = false,
    this.name,
    this.isRefresh = false,
    this.onRefresh,
    this.btnText,
  });
  final BuildContext parentContext;
  final double height;
  final bool needPop;
  final bool isShowEmptyBtn;
  final String name;
  final bool isRefresh;
  final VoidCallback onRefresh;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    var baseLang = config.langMap['baseLang'];
    return DefaultView(
        btnText: btnText,
        name: isNullOrEmpty(name) ? 'betHistory' : name,
        height: this.height,
        enableBtn: this.isShowEmptyBtn,
        //btnText: this.isShowEmptyBtn ? baseLang['attention']['goFollow'] : '',
        onTap: (){
//          if(needPop){
//            AiRouter.pop(this.parentContext);
//          } else {
//            Event.eventBus.fire(BottomNavigationPageChange(SeletedItem.sport));
//          }
          if(isRefresh) {
            onRefresh?.call();
          }
          else {
//            Event.eventBus.fire(BottomNavigationPageChange(SeletedItem.sport));
            AiRouter.pop(this.parentContext);
          }
        }
    );
  }

}


