import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showKeyboardInputView(context,Widget child){
  PopupShareService.ins.pause('giftChargeInputView');
  showModalBottomSheetRoute(context,
      child: KeyboardInputView(
        child: child,
      ),
      enableDrag: false,
      barrierColor: Colors.transparent
  ).then((value){
    PopupShareService.ins.resume('giftChargeInputView');
  });
}

class KeyboardInputView extends StatefulWidget {

  final Widget child;
  KeyboardInputView({Key key, this.child}) : super(key: key);

  @override
  _KeyboardInputViewState createState() => _KeyboardInputViewState();
}

class _KeyboardInputViewState extends State<KeyboardInputView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          AiRouter.pop(context);
        },
        child: Container(
          color: Colors.transparent,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                height: 50.0,
                child: SizedBox(
                  child:widget?.child ?? SizedBox(),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
