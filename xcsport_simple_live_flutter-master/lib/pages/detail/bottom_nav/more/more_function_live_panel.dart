import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreFunctionLivePanel extends StatefulWidget {

  final List<Widget> items;
  MoreFunctionLivePanel({Key key,this.items}): super(key: key);

  @override
  _MoreFunctionLivePanelState createState() => _MoreFunctionLivePanelState();
}

class _MoreFunctionLivePanelState extends State<MoreFunctionLivePanel> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double itemWidth = 60.0;
    double itemHeight = 72.0;

    return Container(
      width: MediaQuery.of(context).size.width - itemWidth * 2,
      height: 220.0,
      child: Align(
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: itemWidth / itemHeight,
            ),
            itemCount: widget.items.length,
            cacheExtent: itemHeight,
            itemBuilder: (BuildContext ctx, int index){
              if(index >= widget.items.length) return Container();
              Widget itemWidget = widget.items[index];
              return itemWidget;
            }
        ),
      ),
    );
  }
}
