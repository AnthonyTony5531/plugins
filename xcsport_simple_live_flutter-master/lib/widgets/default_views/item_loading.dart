import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';
import '../ai_skeleton_loading.dart';

class ItemLoading extends StatelessWidget {
  final int count;
  final bool isListView;
  final bool isBlackStyle;
  const ItemLoading({Key key, this.count = 3, this.isListView = false, this.isBlackStyle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rows = List<Widget>();
    Widget row = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          column1(),
          Expanded(flex:1,child: column2()),
          Expanded(flex:1,child: column3()),
          column4(),
        ],
      ),
    );
    rows.add(row);
    for(int i=0;i< count-1;i++ ){
      rows.add(row);
    }


    Widget widget;
    if(!isListView){
      widget = Container(
        color: isBlackStyle ? Color(0xE6000000) : config.skin.list.backgroundColor,
        padding: EdgeInsets.only(left:10,right: 10,top: 10),
        child: Column(
            children: rows
        ),
      );
    }else{
      widget = Container(
        padding: EdgeInsets.only(left:10,right: 10,top: 10),
        color: isBlackStyle ? Color(0xE6000000) : config.skin.list.backgroundColor,
        child: ListView(
            children: rows
        ),
      );
    }

    // return widget;

    return AiSkeletonLoading(
      child: widget,
      isBlackStyle: this.isBlackStyle,
    );
  }

  Widget column1(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(left: 10,right: 12,top: 14,bottom: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        //Expanded(child: SizedBox()),
      ],
    );
  }

  Widget column2(){
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Container(
          height: 13,
          margin: EdgeInsets.only(right: 21,bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          height: 13,
          margin: EdgeInsets.only(right: 21,bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          height: 13,
          margin: EdgeInsets.only(right: 21,bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget column3(){
    return Column(
      children: <Widget>[
        SizedBox(height: 47,),

        Container(
          height: 13,
          margin: EdgeInsets.only(right: 10,bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          height: 13,
          margin: EdgeInsets.only(right: 10,bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget column4(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 36,
          height: 36,
          margin: EdgeInsets.only(left: 24,right: 24,top: 32),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF4F5F8),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ],
    );
  }



}

