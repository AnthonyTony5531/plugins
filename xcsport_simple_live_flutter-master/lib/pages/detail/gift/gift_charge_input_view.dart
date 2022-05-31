import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/inputbar/chat_input_with_send.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/keyboard_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class GiftChargeInputView extends StatefulWidget {

  final Function(bool focus) inputFocusStatus;
  final ValueChanged<int> onChargeMoney;
  final int defaultGiftNum;
  GiftChargeInputView({
    Key key,
    this.inputFocusStatus,
    this.onChargeMoney,
    this.defaultGiftNum = 1,
  }):super(key:key);

  @override
  GiftChargeInputViewState createState() => GiftChargeInputViewState();
}

class GiftChargeInputViewState extends State<GiftChargeInputView> {

  var baseLang = config.langMap['baseLang'];
  TextEditingController chargeController;
  FocusNode focusNode = FocusNode();
  var keyboardVisibilityController = KeyboardVisibilityController();
  bool isDisposeFocus = false;

  @override
  void initState() {
    super.initState();
    chargeController = TextEditingController(text: '${widget?.defaultGiftNum}');
    keyboardVisibilityController.onChange.listen((bool visible) {
      if(visible){
        hasFocus(true);
      }
      else{
        isDisposeFocus = true;
        if(mounted)setState(() {});
        hasFocus(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onListener(){
  }

  void requestFocus(){
    focusNode = FocusNode();
    if(mounted)setState(() {});
    Future.delayed(Duration(milliseconds: 50),(){
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isDisposeFocus){
      return SizedBox.shrink();
    }
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 32,
                    margin: EdgeInsets.only(
                        left: 12,
                        right: 0,
                        top: 10,
                        bottom: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFFF6F6F6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                              textAlign: TextAlign.start,
                              enabled: true,
                              focusNode: focusNode,
                              maxLines: 1,
                              controller: chargeController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(3),],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 13.0),
                                hintText: baseLang['detail']['chatGift']['inputMoney'],
                                hintStyle: AiTextStyle(
                                  color: Color(0xFF000000).withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
//                              labelStyle: _labelStyle,
                                border: InputBorder.none,
                              ),
                              onChanged: (s){
                                print('onChanged-----：$s');
                              },
                              onSubmitted: (s){
                                if(widget?.onChargeMoney != null){
                                  isDisposeFocus = true;
                                  int money = int.tryParse(chargeController.text) ??  1;
                                  widget?.onChargeMoney(money);
                                  if(mounted)setState(() {});
                                }
                                print('onSubmitted-----：$s');
                              },
                              onEditingComplete: (){
                                print('onEditingComplete-----');
                              },
                              style: labelStyle()
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    hideKeyBoard(context);
                    if(widget?.onChargeMoney != null){
                      isDisposeFocus = true;
                      int money = int.tryParse(chargeController.text) ??  1;
                      widget?.onChargeMoney(money);
                      if(mounted)setState(() {});
                    }
                  },
                  child: Container(
                    width: 62.0,
                    height: 32.0,
                    margin: EdgeInsets.only(
                        left: 8,
                        right: 12,
                        top: 10,
                        bottom: 10
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Color(0xFF5078FF),
                    ),
                    child: Text(baseLang['detail']['chatGift']['confirm'],style: AiTextStyle(
                      fontFamily: config.skin.fontFimaly.pingFang,
                      fontWeight: config.skin.fontWeight.regular,
                      fontSize: config.skin.fontSize.h4,
                      color: Colors.white,
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle labelStyle(){
    return AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.light,
      fontSize: config.skin.fontSize.h2_1,
      color: config.skin.colors.fontColorDark,
    );
  }
  void hasFocus(bool isShow){
    if(widget?.inputFocusStatus != null){
      widget.inputFocusStatus(isShow);
    }
  }
}
