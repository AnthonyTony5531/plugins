/*
*********************************************************************
 * author:Sam
 * date:2019-12-03
 **********************************************************************
 */

class ScrollerEvent{
  ScrollerEventType type =ScrollerEventType.bottom;
  ScrollerEvent.bottom(){
    type  =ScrollerEventType.bottom;
  }
}

enum ScrollerEventType{
  bottom
}