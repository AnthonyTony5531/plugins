
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///
///
///
class BottomNavigationBarExtentConfig{
  static BottomNavigationBarExtent ins;
  static BottomNavigationBarExtent getIns(){
    if(ins == null){
      ins = BottomNavigationBarExtent();
    }
    return ins;
  }
}


///
///
///
class BottomNavigationBarExtent{

  List<Widget> rightBtnGroup(BuildContext context, List<DefaultBtnConfigInfo> defaultInfo){
    return [];
  }

  List<Widget> leftBtnGroup(BuildContext context, List<DefaultBtnConfigInfo> defaultInfo){
    return [];
  }

  bool hasRightExtent(){
    return false;
  }

  bool hasLeftExtent(){
    return false;
  }
}


//Color bgColor,String bgIcon,String icon,VoidCallback onTap,int count,bool showNum,bool onRight
class DefaultBtnConfigInfo{
  int index;
  BtnStatus showHide;
  VoidCallback callback;
  Color bgColor;
  Widget bgIcon;
  Widget icon;
  BtnLayout btnLayout;
  int count;
  bool showNum;

  DefaultBtnConfigInfo({this.index,this.showHide,this.callback,this.bgColor,this.bgIcon,this.btnLayout,this.count,this.showNum,this.icon});
}

///
///
enum BtnStatus{
  show,hide,
}

///
///
enum BtnLayout{
  right,left,
}