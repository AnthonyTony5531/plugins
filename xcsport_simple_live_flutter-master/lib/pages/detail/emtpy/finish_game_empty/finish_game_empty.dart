import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishGameEmpty extends StatefulWidget {
  @override
  _FinishGameEmptyState createState() => _FinishGameEmptyState();
}

class _FinishGameEmptyState extends State<FinishGameEmpty> {

  bool isRequest = false;

  @override
  Widget build(BuildContext context) {
    double topMargin = AiMeasure.topOffset(context) + 15;
    return Scaffold(
      body: Container(
        color: Color(0xFF0A2536),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    AiRouter.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(top: topMargin,right: 1),
                    child: AiSvgPicture.asset(
                        'assets/images/detail/head/icon_detail_x_white.svg',
                        width: 22,
                        height: 22,
                        fit: BoxFit.cover
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Center(
                  child: DefaultView(
                    name: 'finishMatch',
                    onTap: onRefresh,
                    textColor: Colors.white.withOpacity(0.6),
                    enableBtn: true,
                    btnTextColor: Color(0xFF19263B),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  void onRefresh(){
    if(isRequest){
      return;
    }
    isRequest = true;
    Future.delayed(Duration(milliseconds: 60), () {
      Event.eventBus.fire(OnGoPage(name:'home'));
    }).then((value){
      AiRouter.pop(context);
    });
  }
}
