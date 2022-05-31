//**********************************************************************
//* author:Sam
//* date:2020-04-14
//**********************************************************************
import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AiPullFresh extends StatefulWidget {
  final Widget child;
  AiPullFresh({this.child});
  @override
  _AiPullFreshState createState() => _AiPullFreshState();
}

class _AiPullFreshState extends State<AiPullFresh> {

  static const HeaderHeight = 60.0;
  static const PullHeight = 108.0;


  double headHeight = 0;

  double dragHeight=-HeaderHeight;




  RefreshIndicatorMode mode=RefreshIndicatorMode.inactive;


  bool get showHeader => RefreshIndicatorMode.drag == mode || RefreshIndicatorMode.armed==mode||RefreshIndicatorMode.refresh==mode;

  @override
  Widget build(BuildContext context) {
    Widget listenChild = NotificationListener<ScrollNotification>(
        child: widget.child,
        onNotification: onNotification,
    );
    return Stack(
      children: <Widget>[
        Transform.translate(offset: Offset(0, dragHeight+HeaderHeight), child: listenChild,),
        showHeader? Transform.translate(offset: Offset(0, dragHeight), child: header(),):Container(),
      ],
    );
  }


  Widget header(){
    Widget child = Container();
    if(RefreshIndicatorMode.inactive != mode){
      child = Text(freshString());
    }
    return Container(
      height: 60,
      color: Colors.red,
      child: Align(child: child,),
    );
  }


  String  freshString(){
    print('$mode');

    switch(mode){
      case RefreshIndicatorMode.inactive:
        return '';
      case RefreshIndicatorMode.drag:
        return '${config.langMap['baseLang']['widgets']['fresh']['activeHint']['dropDownToShow']}';
      case RefreshIndicatorMode.armed:
        return '${config.langMap['baseLang']['widgets']['fresh']['activeHint']['releaseToShow']}';
      case RefreshIndicatorMode.refresh:
        return '${config.langMap['baseLang']['widgets']['fresh']['activeHint']['matchLoading']}';
      case RefreshIndicatorMode.done:
        return '${config.langMap['baseLang']['widgets']['fresh']['activeHint']['loaded']}';
    }
    return 'ttt';
  }


  bool onNotification(ScrollNotification notification){
    print('$notification');




    bool value = false;
    dragHeight =notification.metrics.pixels.abs()-HeaderHeight;



    final double pixels = notification.metrics.pixels.abs();

    if(pixels<=HeaderHeight && RefreshIndicatorMode.armed == mode){
      mode = RefreshIndicatorMode.refresh;
      setState(() {
      });
      return false;
    }
    if(pixels>0){
      if(RefreshIndicatorMode.inactive == mode){
        mode = RefreshIndicatorMode.drag;
        value  = true;
        setState(() {
        });
      }else if(RefreshIndicatorMode.drag == mode){
        value = true;
        if(pixels>=PullHeight){
          mode = RefreshIndicatorMode.armed;
        }
        setState(() {
        });

      }else if(RefreshIndicatorMode.armed == mode){
        value = true;

        setState(() {
        });
      }else{
        dragHeight = HeaderHeight;
      }
    }
//    else{
//      mode  = RefreshIndicatorMode.inactive;
//      setState(() {
//      });
//    }

    return value;
  }


}





/// The current state of the refresh control.
/// users can show different UI in different modes.
enum RefreshIndicatorMode {
  /// Initial state, when not being overscrolled into, or after the overscroll
  /// is canceled or after done and the sliver retracted away.
  inactive,

  /// While being overscrolled but not far enough yet to trigger the refresh.
  drag,

  /// Dragged far enough that the onRefresh callback will run and the dragged
  /// displacement is not yet at the final refresh resting state.
  armed,

  /// While the onRefresh task is running.
  refresh,

  /// While the indicator is animating away after refreshing.
  done,
}
