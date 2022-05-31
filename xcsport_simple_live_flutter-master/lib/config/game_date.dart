
class GameDate{

  var gidmDateMap = <String, int>{};

  void addGameDate(String gidm, dynamic date){
    if(date == null || date == 'null' || date == 0 || date == '0' || date == ''){
      return ;
    }
    if(gidmDateMap.containsKey(gidm)){
      return;
    }
    if(date is String){
      try{
        var d;
        if(date.contains('-')|| date.contains(':')||date.contains('/')){
          d = DateTime.parse(date).millisecondsSinceEpoch;
        } else {
          d = num.parse(date).toInt();
        }
        gidmDateMap[gidm] = d;
      }catch(_){}
    } else if(date is num){
      gidmDateMap[gidm] = date.toInt();
    }
  }

  int getGameDate(String gidm){
    if(!gidmDateMap.containsKey(gidm)){
      return null;
    }
    return gidmDateMap[gidm];
  }
}