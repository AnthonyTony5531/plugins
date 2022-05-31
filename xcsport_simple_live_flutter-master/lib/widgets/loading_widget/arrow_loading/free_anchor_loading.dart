
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

///带箭头加载项
class FreeAnchorLoading extends StatelessWidget {

  final int count;
  const FreeAnchorLoading({
    Key key,
    count,
  })  : count = count ?? 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = (screenWidth - (16.0 * 2 + 14.0) ) / 2.0;
    double itemHeight = itemWidth * 162/166.0;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: screenWidth,
      child: ListView.builder(
          itemCount: count + 1,
          itemBuilder: (BuildContext ctx, int index) {
            if (index == 0) {
              return topItem(width: screenWidth - 16.0* 2, height: 192.0);
            }
            if (index == 1) {
              return Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    anchorRankItem(width: itemWidth, height: itemHeight),
                    sw(12.0),
                    anchorItem(width: itemWidth, height: itemHeight),
                  ],
                ),
              );
            }
            else {
              return Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    anchorItem(width: itemWidth, height: itemHeight),
                    sw(12.0),
                    anchorItem(width: itemWidth, height: itemHeight),
                  ],
                ),
              );
            }
          }
      )
    );
  }

  Widget topItem({double width, double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item(margin: EdgeInsets.only(top: 12.0, left: 12.0)),
                Expanded(child: Container()),
                item(
                  w: 154.0,
                  margin: EdgeInsets.only(bottom: 12.0, left: 12.0)
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item(w: 120.0, margin: EdgeInsets.only(right: 12.0)),
                  item(w: 120.0, margin: EdgeInsets.only(top: 8.0, right: 12.0)),
                  item(w: 120.0, margin: EdgeInsets.only(top: 8.0, right: 12.0)),
                  item(w: 120.0, margin: EdgeInsets.only(top: 8.0, right: 12.0)),
                  item(w: 120.0, margin: EdgeInsets.only(top: 8.0, right: 12.0)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget anchorRankItem({double width, double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white,
      ),
    );
  }


  Widget anchorItem({double width, double height}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      child: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              height: 90.0,
              color: Color(0xFFF5F6FA),
            ),
            item(w: width - 16.0 ,margin: EdgeInsets.only(left: 8.0, top: 8.0,right: 8.0)),
            item(w: width - 16.0 ,margin: EdgeInsets.only(left: 8.0, top: 8.0,right: 8.0)),
            item(w: width - 16.0 ,margin: EdgeInsets.only(left: 8.0, top: 8.0,right: 8.0)),
          ],
        ),
      ),
    );
  }

  Widget item({double w = 68.0, EdgeInsets margin = EdgeInsets.zero}) {
    return Container(
      margin: margin,
      height: 14.0,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Color(0xFFF5F6FA),
      ),
    );
  }
}