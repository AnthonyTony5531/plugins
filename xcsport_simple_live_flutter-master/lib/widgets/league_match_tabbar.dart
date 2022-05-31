//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/15
//--------------------------------------------------------------------------

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


typedef OnTabItemClickListener = void Function(int position);


//联赛比赛分类tabbar,
// ignore: must_be_immutable
class LeagueMatchTabBar extends StatelessWidget {
  List<String> tabNames=[];
  OnTabItemClickListener onTabItemClickListener;
  int initPosition;
  LeagueMatchTabBar({Key key,this.onTabItemClickListener , this.tabNames, this.initPosition = 0 }):super(key:key);

  @override
  Widget build(BuildContext context) {
    if(null == tabNames || tabNames.isEmpty)
      return Container();
    List<Widget> tabs = [];
    final int len = tabNames.length;
    for(int i = 0;i <len;i++){
      tabs.add(GestureDetector(
        onTap: () {
          initPosition = i;
          onTabItemClickListener(initPosition);
        },
        child: Container(
          child: LeagueMatchTab(name: tabNames[i], isSelected: i == initPosition),
        ),
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs,
      ),
    );
  }

}


// ignore: must_be_immutable
class LeagueMatchTab extends StatelessWidget {
  String name;
  bool isSelected;

  LeagueMatchTab({this.name, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 60
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        margin: EdgeInsets.only(right: 15, top: 11),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: TextHelper.buildNormal(name,
            textColor: isSelected ? Colors.black.value :Colors.black .withOpacity(0.4).value,
            isBold: true,
            textAlign: TextAlign.center ),
      ),
    );
  }
}
