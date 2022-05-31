
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AiCheckBox extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;

  AiCheckBox({@required this.value, @required this.onChanged,this.size = 16});

  @override
  _AiCheckBoxState createState() => _AiCheckBoxState();
}

class _AiCheckBoxState extends State<AiCheckBox> {

  final String normal  = "assets/images/attention/form_radio_normal.svg";
  final String select  = "assets/images/default/form_radio_selected.svg";

  bool _status;

  @override
  void initState() {
    _status = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(mounted){
          setState(() {
            _status = !_status;
            widget.onChanged(_status);
          });
        }
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        child: AiSvgPicture.asset(
          _status ? select : normal,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
