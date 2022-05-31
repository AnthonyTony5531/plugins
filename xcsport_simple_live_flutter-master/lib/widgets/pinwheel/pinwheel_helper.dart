import 'package:common_component/util/listeners/value_listener.dart';
import 'package:flutter/material.dart';

///
///
///
OverlayEntry pinwheelOverlayEntry;

class PinwheelHelper {

  static var pinwheelStatusListener = ValueListener();

  static final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();


  /// show
  static void show(BuildContext cxt,{Widget child,double anchorCenterX = 0, double anchorCenterY = 0}) {
    if(pinwheelOverlayEntry!=null)return;
    pinwheelOverlayEntry = OverlayEntry(builder: (context) {
      return _FloatShopCar(
        offset: Offset(anchorCenterX - 112,anchorCenterY - 112),
        child: child,
      );
    });
    overlayKey?.currentState?.insert(pinwheelOverlayEntry);
  }

  /// hide
  static void hide() {
    try {
      pinwheelOverlayEntry?.remove();
      pinwheelOverlayEntry = null;
    } catch (e) {
      print('grey =====> ${e.toString()}');
      pinwheelOverlayEntry = null;
    }
  }
}

class _FloatShopCar extends StatefulWidget {
  final Widget child;
  final Offset offset;

  _FloatShopCar({
    Key key,
    this.child,
    this.offset = const Offset(0,0),
  }) : super(key: key);

  @override
  _FloatShopCarState createState() => _FloatShopCarState();
}

class _FloatShopCarState extends State<_FloatShopCar> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){
          PinwheelHelper.hide();
        },
        onPanUpdate: (_){
          PinwheelHelper.hide();
        },
        child: Container(
          color: Colors.white.withOpacity(0.0001),
          child: Stack(
            children: [
              Positioned(
                left: widget.offset.dx,
                top: widget.offset.dy,
                child: GestureDetector(
                  child: widget.child,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
