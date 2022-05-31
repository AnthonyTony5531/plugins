import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/global_redpacket_helper.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

/// 红包弹幕
class RedpacketBarrageView extends StatefulWidget {
  final AnimationController controller;
  final GlobalRedPacketModel redpacket;
  RedpacketBarrageView({Key key, @required this.controller, this.redpacket}) : super(key: key);

  @override
  _RedpacketBarrageViewState createState() => _RedpacketBarrageViewState();
}

class _RedpacketBarrageViewState extends State<RedpacketBarrageView> with TickerProviderStateMixin {
  // bool _exit = false;
  Animation<Offset> _animation;
  AnimationController get controller => widget?.controller;
  GlobalRedPacketModel get redpacket => widget?.redpacket;

  @override
  void initState() {
    //controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = Tween(begin: Offset(2, 0), end: Offset(-2, 0)).animate(CurvedAnimation(parent: controller, curve: Interval(0, 1, curve: Curves.slowMiddle)));
    // Future.delayed(Duration(seconds: 3), (){
    //   startAnimation();
    // });

    super.initState();
  }

  // void startAnimation() {
  //   if(_exit) return;

  //   controller?.forward();
  //   Future.delayed(Duration(seconds: 3), (){
  //     if(_exit) return;

  //     controller?.reset();
  //     startAnimation();
  //   });
  // }

  
  @override
  void dispose() {
    // _exit = true;
    // controller?.dispose();
    super.dispose();
  }
  
  final mountStyle = AiTextStyle(
    fontSize: config.skin.fontSize.h4,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.attentionColor1 //Color.fromRGBO(34, 34, 34, 0.7)
  );

  final normalStyle = AiTextStyle(
    fontSize: config.skin.fontSize.h4,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorWhite //Color.fromRGBO(34, 34, 34, 0.7)
  );

  @override
  Widget build(BuildContext context) {

    var baseLang = config.langMap['baseLang'];
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A2536),
            Color(0x000A2536).withOpacity(0.0),
          ],
          stops: [0.1,0.4],
        )
      ),
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _animation,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AiImage.asset('assets/images/detail/chatroom/redbag/redbag_detail_push.png', width: 14, height: 16),
            RichText(
              textAlign : TextAlign.center,
              text: TextSpan(
                text: ' ${redpacket?.nickName}',
                style: mountStyle,
                children: [
                  TextSpan(
//                    text: ' 抢到了 ',
                    text: ' ${baseLang['detail']['catchRedPacket']} ',
                    style: normalStyle,
                  ),
                  TextSpan(
//                    text: '${WalletUtil.ins.getCoinName(redpacket?.walletId)} ${redpacket?.content}',
                    text: '${redpacket?.content}',
                    style: mountStyle,
                  ),
                  TextSpan(
//                    text: ' 红包',
                    text: ' ${baseLang['detail']['redPacket']}',
                    style: normalStyle,
                  ),
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}