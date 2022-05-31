import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fast_ai/pages/wallet/wallet_util.dart';


class NewsCrossSlip extends StatefulWidget {

  final List<String> messages;
  final double width;
  final double height;
  final TextStyle textStyle;
  final int speed;
  final String walletId;
  NewsCrossSlip({
    Key key,
    this.messages,
    this.width = 50.0,
    this.height = 34.0,
    this.speed = 2,
    this.textStyle,
    this.walletId,
  }) : super(key: key);

  @override
  NewsCrossSlipState createState() =>NewsCrossSlipState();
}

class NewsCrossSlipState extends State<NewsCrossSlip> {

  ScrollController controller = ScrollController();
  String text = '';
  List<String> messages = [];
  bool isScroll = false;
  double contentSize = 0;
  double textWidth = 0;
  double messageWidth = 0;
  double offsetX = 0.0;
  List<Widget>dataSource = [];
  Timer _timer;

  @override
  void initState() {
    if((widget?.messages ?? []).isNotEmpty){
      messages = widget.messages;
    }
    messages.forEach((value){
      text += (value + '  ');
    });

    controller.addListener(() {
      if(controller.offset >= controller.position.maxScrollExtent){
        print("endendendend:::${controller.offset}      ${controller.position.maxScrollExtent}");
        offsetX = 0.0;
        controller.jumpTo(contentSize - viewPortWidth);
        if(mounted)setState(() {});
      }
    });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((cb) {
      startTimer();
    });

  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  void updateData(List<String> data){
    if(data != null && data.isNotEmpty){
      messages.clear();
      dataSource.clear();
      messages.addAll(data);
      messages.forEach((value){
        text += (value + '  ');
      });
      if(mounted)setState(() {});
    }
  }

  double viewPortWidth;
  @override
  Widget build(BuildContext context) {

    if(messages.isEmpty){
      return Container();
    }

    TextStyle textStyle = widget?.textStyle ?? defaultStyle();
    textWidth = AiMeasure.measureTextWidth(text, textStyle);
    messageWidth = AiMeasure.measureTextWidth(messages[0], textStyle);
    viewPortWidth = (widget?.width ?? 50.0);
    contentSize = textWidth * 2;
    dataSource.add(contentTextWidget());
    //dataSource.add(contentTextWidget());

    return NotificationListener<ScrollNotification>(
      onNotification: (notification){
        double extentBefore = notification.metrics.extentBefore;
        if(extentBefore >= textWidth){
          //offsetX = 0.0;
          //controller.jumpTo(0.0);
          //if(mounted)setState(() {});
        }
        return true;
      },
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (BuildContext context,int index){
         // print("BuildContextBuildContextBuildContext:::$index");
          if (dataSource.length > 0) {
            return dataSource[0];
          }
          return Container();
        },
        itemCount: /*dataSource.length*/15,
        physics: BouncingScrollPhysics(),
        cacheExtent: contentSize - viewPortWidth,
      ),
    );
  }

  Widget contentTextWidget(){
    TextStyle textStyle = widget?.textStyle ?? defaultStyle();
    double viewPortHeight = (widget?.height ?? 34.0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
//        WalletUtil.ins.getCoinTagWidget(
//          walletId: '${widget.walletId}',
//          height: 16,
//          bgColor: Color(0xFFFFFFFF).withOpacity(0.1),
//          topLeftRadius: 2,
//          topRightRadius: 2,
//          bottomLeftRadius: 2,
//          bottomRightRadius: 2,
//          textStyle: AiTextStyle(
//            fontFamily: config.skin.fontFimaly.pingFang,
//            fontWeight: config.skin.fontWeight.regular,
//            fontSize: config.skin.fontSize.h6,
//            color: config.skin.colors.fontColorWhite,
//          ),
//        ),
        SizedBox(width: 5,),
        Container(
            height: viewPortHeight,
            width: messageWidth ,
            alignment: Alignment.center,
            child: Text(
              '${messages[0]}  ',
              style: textStyle,
              maxLines: 1,
            )
        ),
        SizedBox(width: 20,),
//        WalletUtil.ins.getCoinTagWidget(
//          walletId: '${widget.walletId}',
//          height: 16,
//          bgColor: Color(0xFFFFFFFF).withOpacity(0.1),
//          topLeftRadius: 2,
//          topRightRadius: 2,
//          bottomLeftRadius: 2,
//          bottomRightRadius: 2,
//          textStyle: AiTextStyle(
//            fontFamily: config.skin.fontFimaly.pingFang,
//            fontWeight: config.skin.fontWeight.regular,
//            fontSize: config.skin.fontSize.h6,
//            color: config.skin.colors.fontColorWhite,
//          ),
//        ),
        SizedBox(width: 5,),
        Container(
            height: viewPortHeight,
            width: messageWidth ,
            alignment: Alignment.center,
            child: Text(
              '${messages[0]}  ',
              style: textStyle,
              maxLines: 1,
            )
        ),
        SizedBox(width: 20,),
      ],
    );
  }

  TextStyle defaultStyle(){
    return AiTextStyle(
      fontSize: config.skin.fontSize.h5,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
       color: config.skin.colors.fontColorDark.withOpacity(0.4),
    );
  }

  startTimer() async {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(Duration(milliseconds: widget.speed * 10), (timer) {
      offsetX += 1;
      controller?.jumpTo(offsetX);
    });
  }
}
