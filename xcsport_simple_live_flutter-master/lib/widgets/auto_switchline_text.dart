import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';


//根据长度自动换行缩小到适合的文字
class AutoSwitchLineText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double  width;

  const AutoSwitchLineText({Key key,@required this.text ,@required this.width,@required  this.textStyle})
      : super(key: key);

  @override
  _AutoSwitchLineTextState createState() => _AutoSwitchLineTextState();
}

class _AutoSwitchLineTextState extends State<AutoSwitchLineText> {

  TextStyle textStyle;
  double width;
  @override
  void initState() {
    super.initState();
    textStyle = widget.textStyle;
    width= widget.width;
    check();
  }


  @override
  void didUpdateWidget(covariant AutoSwitchLineText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.text != widget.text){
      check();
    }
  }

  void check() async {
    _recheck(widget.text, 1,width, textStyle );
  }

  void _recheck(String text, int line, double  width, TextStyle textStyle) {
    bool isNeed = AiMeasure.measureTextLineIsExceed(text, textStyle, width, line);
    if(isNeed){
      _recheck(text, line+1,width,  textStyle .copyWith(fontSize: textStyle.fontSize-2));
    }else{
      setState(() {
        this.textStyle = textStyle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.width == null){
      return LayoutBuilder(builder: (context, cst){
        if(width == null){
          width = cst.constrainWidth();
          check();
        }
        return Text(widget.text, style: textStyle,);
      });
    }
    return Text(widget.text, style: textStyle,);
  }
}
