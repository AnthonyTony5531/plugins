import 'dart:math';

import 'package:fast_ai/api/protocols/detail/player_gift_limit_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_flux_tips.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/shape_button.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fast_ai/pages/wallet/wallet_util.dart';

class GiftBottomMenu extends StatefulWidget {
  final VoidCallback onSendGift;
  final VoidCallback onRecharge;
  final VoidCallback onSelectGiftNum;
  final int giftNum;
  final double gifMoney;
  final PlayerGiftLimitRsqProtocol giftLimitData;
  GiftBottomMenu({
    Key key,
    this.onSendGift,
    this.onRecharge,
    this.onSelectGiftNum,
    this.giftNum = 1,
    this.gifMoney = 0,
    this.giftLimitData,
  }) : super(key: key);
  @override
  GiftBottomMenuState createState() => GiftBottomMenuState();
}

class GiftBottomMenuState extends State<GiftBottomMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation tween;
  double total = 0;
  num giftLimit = 0;
  String isOpen = 'N';
  String rechargeStr = '';
  String sendStr = '';
  String totalStr = '';
  String giftLimitStr = '';
  String insufficientAmountStr = '';
  bool isInsufficientAmount = false; // 是否限额不足

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    Animation curve =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    tween = Tween(begin: 0, end: 1).animate(animationController);
    total = (widget?.giftNum ?? 1) * (widget?.gifMoney ?? 0);
    giftLimit = widget?.giftLimitData?.giftLimit ?? 0;
    isOpen = widget?.giftLimitData?.isOpen ?? 'N';
    isInsufficientAmount = isOpen == 'Y' && giftLimit <= 0;
    rechargeStr = AiJson(baseLang).getString('detail.chatGift.recharge');
    sendStr = AiJson(baseLang).getString('detail.chatGift.send');
    totalStr = AiJson(baseLang).getString('detail.chatGift.total');
    giftLimitStr = AiJson(baseLang).getString('detail.chatGift.giftLimit');
    insufficientAmountStr =
        AiJson(baseLang).getString('detail.chatGift.insufficientQuota');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var baseLang = config.langMap['baseLang'];
    String balance = string(config.userInfo.myBalance, defaultVal: '--');

    return Container(
      padding: EdgeInsets.only(bottom: 28.0, top: 12.0),
      child: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.white.withOpacity(0.1),
          ),
          h(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
//                  if (config.sdkParams.showRecharge) {
//                    if (widget.onRecharge != null) {
//                      widget.onRecharge();
//                    }
//                  }
                  FastAiSdk.sdkCallback.onRecharge();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Offstage(
                            offstage: false,
                            child: Container(
                              margin: EdgeInsets.only(left: 12.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 4.0),
                                    child: Text(
                                      rechargeStr,
                                      style: rechargeStyle(),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 2.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF5078FF),
                                        size: 18.0,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: isOpen == 'N',
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: !config.sdkParams.showRecharge
                                      ? 12.0
                                      : 0.0),
                              child: Text(
                                '$giftLimitStr$giftLimit',
                                style: giftLimitStyle(),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height: isOpen == 'Y' || config.sdkParams.showRecharge
                              ? 6.0
                              : 0.0),
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
//                            AiImage.asset(
//                                WalletUtil.ins
//                                    .getCoinMinIcon(config.userInfo.walletId),
//                                width: 10,
//                                height: 10),
                            AiImage.asset("assets/images/wallet/icon_detail_gift_cny.png",width: 10,height: 10),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '$balance',
                              style: balanceStyle(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12.0),
                width: 164.0,
                height: 38.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (widget.onSelectGiftNum != null) {
                          widget.onSelectGiftNum();
                        }
                      },
                      child: Container(
                        width: 61.0,
                        height: 38.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget?.giftNum}',
                              style: numStyle(),
                            ),
                            Container(
                                child: AnimatedBuilder(
                              animation: tween,
                              builder: (BuildContext ctx, Widget child) {
                                return Transform.rotate(
                                  angle: pi * animationController.value,
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF5078FF),
                                    size: 18.0,
                                  ),
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (Hooks.ins.isBlocked(HookName.StartSendGif, {}))
                          return;
                        if (isInsufficientAmount) return;
                        if (widget.onSendGift != null) {
                          widget.onSendGift();
                        }
                      },
                      child: shapeButton(
                          width: 102.0,
                          height: 38.0,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isInsufficientAmount
                                    ? insufficientAmountStr
                                    : sendStr,
                                style: sendStyle(),
                              ),
                              Text(
                                '$totalStr: ${total.toStringAsFixed(2)}',
                                style: moneyStyle(),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void executeAnimation(bool isShow) {
    if (isShow) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void updateSelectGiftMoney(int giftNum, num money) {
    total = ((money ?? 0) * (giftNum ?? 1)) * 1.0;
    isInsufficientAmount = total > giftLimit && isOpen == 'Y';
    if (mounted) {
      setState(() {});
    }
  }

  void updateGiftLimit(PlayerGiftLimitRsqProtocol giftLimitData) {
    if (giftLimitData == null) return;
    giftLimit = giftLimitData?.giftLimit ?? 0;
    isOpen = giftLimitData?.isOpen ?? 'N';
    isInsufficientAmount = isOpen == 'Y' && giftLimit <= 0;
    if (mounted) {
      setState(() {});
    }
  }

  TextStyle balanceStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle numStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle sendStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.medium,
    );
  }

  TextStyle moneyStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle rechargeStyle() {
    return AiTextStyle(
      color: Color(0xFF5078FF),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  TextStyle giftLimitStyle() {
    return AiTextStyle(
      color: Colors.white.withOpacity(0.6),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
    );
  }
}
