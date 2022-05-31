import 'package:fast_ai/module/common/util/xycolors.dart';
//import 'package:fast_ai/module/live188/package/flutter_live188_package.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';

class Live188Loading extends StatelessWidget {
  final double height;

  const Live188Loading({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double _height = height;
        if (_height == null) {
          _height = constraints.constrainHeight();
          if (_height == double.infinity) {
            _height = AiMeasure.screenHeight(context);
          }
        }
        return Container(
          color: ColorsWhite.withOpacity(0.8),
          width: constraints.constrainWidth(),
          height: height,
//          child: Center(child: live188ImageCreator.assetImage('assets188/images/loading/loading_grey.gif', width: 46, height: 46)),
        );
      },
    );
  }
}
