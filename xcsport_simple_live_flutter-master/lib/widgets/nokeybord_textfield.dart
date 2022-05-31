
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fast_ai/widgets/no_key_board_editable_text.dart';


typedef FocusCallback = void Function (bool isFocus);
///禁用键盘输入的输入框
class NoKeyboardTextField extends NoKeyBoardEditableText {

  NoKeyboardTextField({
    @required NoKeyBoardTextEditingController controller,
    TextStyle style = const TextStyle(color: Colors.black),
    TextAlign textAlign = TextAlign.center,
    Color cursorColor = Colors.blue,
    bool autofocus = false,
    Color selectionColor,
    this.onFocus,
    this.onClear,
    this.data,
    Key key,
    this.needShow=false,
  }):super(
      key:key,
      controller: controller,
      focusNode: NoKeyboardEditableTextFocusNode(),
      style: style,
      textAlign:textAlign,
      cursorColor: cursorColor,
      autofocus: autofocus,
      selectionColor: selectionColor,
      backgroundCursorColor: Colors.black,
      // needShow:needShow,
  );
  final bool needShow;
  final void Function (NoKeyboardTextField self, bool isFocus) onFocus;
  final Function(NoKeyboardTextField self) onClear;
  //临时存储
  final data;


  
  @override
  NoKeyboardEditableTextState createState() => NoKeyboardEditableTextState(onFocus: onFocus, onClear: onClear);

}

class NoKeyboardEditableTextState extends NoKeyBoardEditableTextState {

  final void Function (NoKeyboardTextField self, bool isFocus) onFocus;
  final Function(NoKeyboardTextField self) onClear;
  NoKeyboardEditableTextState({
    this.onFocus,
    this.onClear
  });

  @override
  void initState() {
    super.initState();
    this.widget.focusNode.addListener(_listener);
  }

  void _listener() {
    if(this.onFocus != null && this.mounted)
      this.onFocus(this.widget, this.widget.focusNode.hasFocus);
  }

  @override
  void dispose() {
    //print('dispose ${(this.widget as NoKeyboardTextField).data}');
    this.widget.focusNode.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = super.build(context);
    return Container(
      height: 28.0,
      // padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5
        ),
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: _getWidget(widget)
    );
  }

  Widget _getWidget(Widget widget) {
    var child = Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        widget,
        (this.widget.controller.text != '0' && this.widget.controller.text != '') ? 
        SizedBox(
          width: 30.0,
          child: FlatButton(
            padding: EdgeInsets.zero,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(Icons.cancel, size: 16.0, color: Color(0xffcccccc)),
            onPressed: (){
              if(this.onClear != null) 
                this.onClear(this.widget);
            },
          )
        ): Offstage()
      ],
    );
    return child;
  }


  @override
  void requestKeyboard() {
    super.requestKeyboard();
    //hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    // prevents keyboard from showing on first focus
    return false;
  }

}