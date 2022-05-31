

import 'package:fast_ai/utils/ai_json.dart';

class SDPwMoreRsp{
  List<SSItem> ss;
  List<BSItem> bs;
  bool aew;
  String cc;
  String oat;
  String at;
  String rst;

  SDPwMoreRsp.from(Map map){
    if(map == null || map.length == 0) return ;

    this.cc = AiJson(map).getString('cc');
    this.oat = AiJson(map).getString('oat');
    this.at = AiJson(map).getString('at');
    this.rst = AiJson(map).getString('rst');
    this.aew = AiJson(map).getBool('aew');

    List ssList = AiJson(map).getArray('ss');
    this.ss = List.generate(ssList.length, (index){
      return SSItem.from(ssList[index]);
    }).toList();

    List bsList = AiJson(map).getArray('bs');
    this.bs = List.generate(bsList.length, (index){
      return BSItem.from(bsList[index]);
    }).toList();
  }

}

class SSItem{
  String an;
  String as;
  String bn;
  String bot;
  String did;
  String dp;
  String eid;
  String eo;
  String hn;
  String hs;
  String idn;
  String ln;
  String hp;
  String o;
  String pid;
  String s;
  String slid;
  String sln;
  String et;
  String ed;
  F f;

  SSItem.from(Map map){
    if(map == null || map.length == 0) return ;

    this.an = AiJson(map).getString('an');
    this.as = AiJson(map).getString('as');
    this.bn = AiJson(map).getString('bn');
    this.bot = AiJson(map).getString('bot');
    this.did = AiJson(map).getString('did');
    this.dp = AiJson(map).getString('dp');
    this.eid = AiJson(map).getString('eid');
    this.eo = AiJson(map).getString('eo');
    this.hn = AiJson(map).getString('hn');
    this.hs = AiJson(map).getString('hs');
    this.idn = AiJson(map).getString('idn');
    this.ln = AiJson(map).getString('ln');
    this.o = AiJson(map).getString('o');
    this.pid = AiJson(map).getString('pid');
    this.s = AiJson(map).getString('s');
    this.slid = AiJson(map).getString('slid');
    this.sln = AiJson(map).getString('sln');
    this.hp = AiJson(map).getString('hp');
    this.et = AiJson(map).getString('et');
    this.ed = AiJson(map).getString('ed');
    this.f = F.from(AiJson(map).getMap('f'));
  }

}


class F{
  bool ip;
  bool ds;

  F.from(Map map){
    if(map == null || map.length == 0) return ;
    
    this.ip = AiJson(map).getBool('ip');
    this.ds = AiJson(map).getBool('ds');
  }
}


class BSItem{
  String wt;
  String wn;
  String sas;
  String sa;
  String s;
  String o;
  String noc;
  bool ipw;
  String dp;

  SubBs bs;

  BSItem.from(Map map){
    if(map == null || map.length == 0) return ;

    this.wn = AiJson(map).getString('wn');
    this.sas = AiJson(map).getString('sas');
    this.sa = AiJson(map).getString('sa');
    this.s = AiJson(map).getString('s');
    this.o = AiJson(map).getString('o');
    this.noc = AiJson(map).getString('noc');
    this.ipw = AiJson(map).getBool('ipw');
    this.dp = AiJson(map).getString('dp');
    this.wt = AiJson(map).getString('wt');
    this.bs = SubBs.from(AiJson(map).getMap('bs'));
  }
}


class SubBs{
  String maxb;
  String maxp;
  String minb;

  SubBs.from(Map map){
    if(map == null || map.length == 0) return ;

    this.maxb = AiJson(map).getString('maxb');
    this.maxp = AiJson(map).getString('maxp');
    this.minb = AiJson(map).getString('minb');
  }
}