//**********************************************************************
//* author:Sam
//* date:2020-04-14
//**********************************************************************


//第几局
import 'package:fast_ai/utils/string_util.dart';


//网球第几盘
int whichSetOfTennis(Map map){
  String sc1stA = map['sc_1st_A'] ?? null;
  String sc1stH = map['sc_1st_H'] ?? null;
  String sc2ndA = map['sc_2nd_A'] ?? null;
  String sc2ndH = map['sc_2nd_H'] ?? null;
  String sc3thA = map['sc_3th_A'] ?? null;
  String sc3thH = map['sc_3th_H'] ?? null;
  String sc4thA = map['sc_4th_A'] ?? null;
  String sc4thH = map['sc_4th_H'] ?? null;
  String sc5thA = map['sc_5th_A'] ?? null;
  String sc5thH = map['sc_5th_H'] ?? null;
  int department = 1;
  if(hasNextPlay(sc1stA, sc1stH)){
    department++;
  }
  if(hasNextPlay(sc2ndA, sc2ndH)){
    department++;
  }
  if(hasNextPlay(sc3thA, sc3thH)){
    department++;
  }
  if(hasNextPlay(sc4thA, sc4thH)){
    department++;
  }
  if(hasNextPlay(sc5thA, sc5thH)){
    department++;
  }
  return department;
}

//网球第几盘
int whichDepartmentOfTennis(Map map){
  int setNum = whichSetOfTennis(map);
  String a = map['sc_${setNum}st_A'];
  String h  = map['sc_${setNum}st_H'];
  return parseInt(a)+parseInt(h)+1;
}

bool hasNextPlay(String scoreAStr, String scoreHStr){
  int scoreA = parseInt(scoreAStr,defaultVal: 0);
  int scoreH = parseInt(scoreHStr,defaultVal: 0);
  //是否本局打完了
  bool isCurrentGameOver = false;
  if (scoreA >= 7 || scoreH >= 7) {
    isCurrentGameOver = true;
  } else if (scoreA == 6 || scoreH == 6) {
    if ((scoreA - scoreH).abs() >= 2) {
      isCurrentGameOver = true;
    }
  }
  return isCurrentGameOver;
}