
import 'dart:async';
import 'dart:ui';

import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/circular_head.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
//import 'package:fast_ai/pages/wallet/wallet_util.dart';


enum RedPacketStatus {
  /// 空按钮，没有倒计时,按钮不能点击
  normal,
  /// 展示倒计时
  countdown,
  /// 展示打开动画
  opening,
  /// 展示打开
  open,
}

///未抢红包ui
class XCNormalRedBagView extends StatefulWidget {
  final VoidCallback openAction;
  final RedBagInfo redBag;
  final String gidm;
  final RedPacketStatus redPacketStatus;
  XCNormalRedBagView({Key key, this.openAction, this.redBag, this.redPacketStatus = RedPacketStatus.normal, this.gidm}) : super(key:key);

  @override
  XCNormalRedBagViewState createState() {
    return XCNormalRedBagViewState();
  }

}

class XCNormalRedBagViewState extends State<XCNormalRedBagView> with SingleTickerProviderStateMixin {

  ///关注按钮动画
  AnimationController aniCtrl;
  Animation<double> followBtnAni;

  ///关注主播
  Future<BaseModel> requestFollow({String playerId, String gidm}) {
//    return Net.setPlayerFollow({
//      'playerId': playerId,
//      'followType': 2,
//      'follow': 1,
//      'gidm': '$gidm',
//      'anchorId': '$playerId'
//    });
    return Future.value();
  }

  _initFollowAnimation() {
    aniCtrl = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    CurvedAnimation curvedAni = CurvedAnimation(
      parent: aniCtrl,
      curve: Curves.easeIn,
    );
    followBtnAni = Tween(begin: 1.0, end: 0.0).animate(curvedAni)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
          status == AnimationStatus.completed) {
          aniCtrl?.dispose();
        }
      });
  }

  String get redPacketButtonImageName => "assets/images/detail/chatroom/redbag/${['icon_redbag_btn_open_bg.png', 'icon_redbag_btn_open_bg.png', 'redbag_open.gif', 'icon_redbag_btn_open.png'][widget.redPacketStatus.index]}";
  String get headUrl => widget.redBag?.headImg;
  String get nickName => widget.redBag?.nickName;
  String get totalAmount => widget.redBag?.totalAmountFixed;
  String get walletId => widget.redBag?.walletId;

  Timer redPacketTimer;
  int redPacketCountdown = 0;
  StateSetter redPacketCountDownSetState;
  void _redPacketCountDown() {
    if(widget.redBag != null && redPacketTimer == null) {
      //int systemTime = config.session.systemTime > widget.redBag.systemTime ? config.session.systemTime : widget.redBag.systemTime;
      if(widget.redBag.startTime > widget.redBag.systemTime) {
        redPacketCountdown = (widget.redBag.startTime - widget.redBag.systemTime)~/1000;
        //if(redPacketCountdown > 30) redPacketCountdown = 28;
        assert(redPacketCountdown <= 30);
        print('--- XCNormalRedBagView model.startTime=${widget.redBag.startTime}, model.systemTime=${widget.redBag.systemTime}, systemTime=${config.session.systemTime}');
        redPacketTimer = Timer.periodic(Duration(seconds: 1), (timer){
          print('11-XCNormalRedBagViewState-Timer');
          if(redPacketCountdown <= 1) {
            redPacketCountdown = 0;
            if(widget.openAction != null) widget.openAction();
            redPacketTimer?.cancel();
            redPacketCountdown = null;
          }
          else {
            redPacketCountdown--;
          }
          if(mounted) redPacketCountDownSetState(() {});
        });
      }
      else {
        print('22-XCNormalRedBagViewState-Timer');
        if(widget.openAction != null && widget.redPacketStatus == RedPacketStatus.countdown) widget.openAction();
      }
    }
  }


  void _onRedPacketOpen() async {
//    print('isFollow----:${widget.redBag.isFollow}');
//    print('redPacketStatus.index----:${widget.redPacketStatus.index}');
//    print('open.index----:${RedPacketStatus.open.index}');
//    if(widget.redBag.isFollow == null) return;
//    if(widget.redPacketStatus.index < RedPacketStatus.open.index) return;
//
//    if(widget.redBag.isFollow == 'N'){
//      ///未关注则先关注再抢红包
//      BaseModel rsp = await requestFollow(playerId: widget.redBag.anchorId, gidm: widget.redBag.gidm);
//      if(rsp.code == 200){
//        config.userInfo.followAnchor(widget.redBag.anchorId);
//
//        ///启动渐变动画
//        aniCtrl.forward().whenCompleteOrCancel((){
//          widget.redBag.isFollow = 'Y';
//        });
//        Event.eventBus.fire(FollowAnchorEvent(anchorId: widget.redBag.anchorId));
//
//        widget.openAction();
//      }else{
//        showToas(config.langMap['baseLang']['networkError']['networkAbnormal']);
//        return;
//      }
//    }else{
//      widget.openAction();
//    }
    if(widget.redPacketStatus.index < RedPacketStatus.open.index) return;
    widget.openAction();

  }

  @override
  void dispose() {
    if (aniCtrl != null && aniCtrl.isAnimating) {
      aniCtrl?.dispose();
    }

    redPacketTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    print('00-XCNormalRedBagViewState-initState');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try{
      if(widget.redBag?.isFollow == 'N' && aniCtrl == null){
        _initFollowAnimation();
      }
      _redPacketCountDown();
    } catch(_){}

    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double redPacketW  = isPortrait ? 302 : 230;
    double openButtonW = isPortrait ? 90  : 75;
    double redPacketH  = isPortrait ? 448 : 341;
    print('00-XCNormalRedBagViewState-build');
    print('00-XCNormalRedBagViewState-build top=${MediaQueryData.fromWindow(window).padding.top.ceilToDouble()}');
    return Container(
      width: redPacketW,
      height: redPacketH,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AiImage.assetImage('assets/images/detail/chatroom/redbag/bg_detail_redbag_normal.png'),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                h(40),
                Container(
                  height: 70,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: XCCircularHeadView(
                          width: 45,
                          borderWidth: 1.5,
                          netImg: headUrl,
                          borderColor: Color(0xFFFEE791),
                        ),
                      ),
                      (widget.redBag?.isFollow == 'N' && headUrl != null) ? Positioned(
                        top: 38,
                        child: InkWell(
                          onTap: () async {
                            BaseModel rsp = await requestFollow(playerId: widget.redBag?.anchorId);
                            if(rsp.code == 200){
                              config.userInfo.followAnchor(widget.redBag?.anchorId);

                              ///启动渐变动画
                              aniCtrl?.forward()?.whenCompleteOrCancel((){
                                widget.redBag?.isFollow = 'Y';
                              });

                              Event.eventBus.fire(FollowAnchorEvent(anchorId: widget.redBag?.anchorId));
                            }
                          },
                          child: AnimatedBuilder(
                            animation: followBtnAni,
                            builder: (context,child){
                              return Container(
                                child: Opacity(
                                  opacity: followBtnAni?.value ?? 0.0,
                                  child: AiImage.svgLogo('assets/images/detail/chatroom/redbag/icon_detail_redbag_follow.svg', size: 18,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
                Text(nickName != null ? '$nickName${config.langMap['baseLang']['split']['ofRedPacket']}' : '',style: TextStyle(
                  color: Color.fromRGBO(254, 242, 194, 0.7),
                  fontSize: config.skin.fontSize.h5,
                  fontWeight: config.skin.fontWeight.regular
                ),),
                Container(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text((totalAmount != null && totalAmount.length > 0) ? '${config.langMap['baseLang']['split']['total']}$totalAmount' : '',style: TextStyle(
                        color: Color(0xFFFEF2C2),
                        fontSize: config.skin.fontSize.h3,
                        fontWeight: config.skin.fontWeight.bold
                    ),),
                    SizedBox(width: 10,),
//                    WalletUtil.ins.getCoinTagWidget(
//                      walletId: '$walletId',
//                      height: 18,
//                      bgColor: Color(0xFFFEF2C2),
//                      topLeftRadius: 2,
//                      topRightRadius: 2,
//                      bottomLeftRadius: 2,
//                      bottomRightRadius: 2,
//                      textStyle: AiTextStyle(
//                        fontFamily: config.skin.fontFimaly.pingFang,
//                        fontWeight: config.skin.fontWeight.medium,
//                        fontSize: config.skin.fontSize.h5,
//                        color: Color(0xFFD83A31),
//                      ),
//                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: isPortrait ? 15 : 10,
            right: 15,
            child: GestureDetector(// widget.redPacketStatus.index == 2 ? Container() :  开红包时隐藏关闭按钮 15811
              behavior: HitTestBehavior.opaque,
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(6),
                child: AiImage.asset('assets/images/detail/chatroom/redbag/icon_detail_redbag_close.png', width: 18, height: 18,color: Color(0xFFFEE791),)
              ),
            )
          ),
          Positioned(
            bottom: isPortrait ? 86 : 54,
            left: (redPacketW-openButtonW)/2,
            child: InkWell(
              onTap: _onRedPacketOpen,
              child: StatefulBuilder(
                builder: (BuildContext context, setState) {
                  redPacketCountDownSetState = setState;
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      AiImage.asset(redPacketButtonImageName, width: openButtonW, fit: BoxFit.fitWidth),
                      widget.redPacketStatus == RedPacketStatus.countdown ? Container(
                        child: Text('$redPacketCountdown', style: AiTextStyle(
                          fontFamily: config.skin.fontFimaly.pingFang,
                          fontWeight: config.skin.fontWeight.regular,
                          fontSize: isPortrait ? 36 : config.skin.fontSize.h1,
                          color: Color(0xFF623A2D),
                        ),),
                      ) : Container(),
                    ],
                  );
                }
              ),
            ),
          ),
        ],
      )
    );
  }
}

