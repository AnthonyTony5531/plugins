import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
 * @eureka
 * 纯净版TextField。
 */
class PureKeyBoardTextField extends EditableText{

  PureKeyBoardTextField( {
    @required dynamic controller,
    Key key,
    TextStyle style = const TextStyle(color: Colors.black),
    TextAlign textAlign = TextAlign.center,
    Color cursorColor = Colors.blue,
    bool autofocus = false,
    Color selectionColor,
    FocusNode focusNode,
    this.needShow=false,
  }):super(
    key:key,
    controller: controller,
    focusNode: focusNode,
    style: style,
    textAlign:textAlign,
    cursorColor: cursorColor,
    autofocus: autofocus,
    selectionColor: selectionColor,
    backgroundCursorColor: Colors.black,
    rendererIgnoresPointer:false,
    // needShow:needShow,
  );
  
  final bool needShow;

  @override
  _PureKeyBoardTextField createState() => _PureKeyBoardTextField();
}


class _PureKeyBoardTextField extends EditableTextState {



  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }


  @override
  void requestKeyboard() {
    super.requestKeyboard();
    //hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

}


class NoKeyboardFocusNode extends FocusNode {


  @override
  bool consumeKeyboardToken() {
    return false;
  }

}
