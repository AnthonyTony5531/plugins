
import 'package:flutter/cupertino.dart';


//固定大小sliver
class FixSizeSliverDelegate extends SliverPersistentHeaderDelegate{

  final Widget child;
  final double minHeight;
  final double maxHeight;
  FixSizeSliverDelegate({@required this.child,@required this.minHeight,@required  this.maxHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child:child,);
  }

  @override
  double get maxExtent => minHeight;

  @override
  double get minExtent => maxHeight;

  @override
  bool shouldRebuild(FixSizeSliverDelegate oldDelegate) {
    return this.minHeight != oldDelegate.minHeight  || this.maxHeight != oldDelegate.maxHeight || child != oldDelegate.child;
  }

}