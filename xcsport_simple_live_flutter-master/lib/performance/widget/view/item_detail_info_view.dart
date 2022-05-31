import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

class ItemDetailInfoView extends StatelessWidget {
  final Widget child;
  final VoidCallback onCloseTap;

  ItemDetailInfoView({@required this.child, this.onCloseTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 100.0,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              top: 15.0,
              child: Container(color: Colors.white, child: child),
            ),
            Positioned(
              right: 15.0,
              top: 0.0,
              child: GestureDetector(
                onTap: () {
                  PerformanceManager.instance.hideDetail();
                  onCloseTap?.call();
                },
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Icon(Icons.close, size: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
