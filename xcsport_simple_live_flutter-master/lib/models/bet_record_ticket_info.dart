
class TicketInfo{

  String orderId;

  TicketInfo({this.orderId});

  Map toJson(){
    Map map = Map();
    map['orderId'] = this.orderId;
    return map;
  }
}