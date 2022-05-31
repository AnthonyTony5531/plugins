import 'dart:convert';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:intl/intl.dart';

class AnchorHomeModel extends BaseModel {
  int fans;
  //是否直播中
  bool living = false;
  String gidm = "";
  String gameType = "";
  String anchorId, playerId, name, nickname, mobileCover, gender, introduce, live;
  List<AnchorLeagueModel>leagueList = [];
  List<AnchorDynamicModel>dynamicList = [];
  // 自定义字段
  String flv;
  String m3u8;
  String rtmp;
  String url;
  int total;// dynamic总条数
  AnchorHomeModel();

  Future parse(Map<String, dynamic> map) async {
    super.fromMap(map);
    if(isSuccess) {
      this.fans = AiJson(map).getNum('data.fans');
      this.anchorId = AiJson(map).getString('data.anchorId');
      this.playerId = AiJson(map).getString('data.playerId');
      this.name = AiJson(map).getString('data.name');
      this.nickname = AiJson(map).getString('data.nickname');
      this.mobileCover = AiJson(map).getString('data.mobileCover');
      this.gender = AiJson(map).getString('data.gender');
      this.introduce = AiJson(map).getString('data.introduce');
      this.live = AiJson(map).getString('data.live');
      this.gidm = AiJson(map).getString('data.gidm');
      this.gameType = AiJson(map).getString('data.gameType');
      this.total = AiJson(map).getNum('data.total');
      living = "1" == this.live;
      List list1 = AiJson(map).getArray('data.leagueList');
      List list2 = AiJson(map).getArray('data.dynamicList');

      this.leagueList = List.generate(list1?.length??0, (idx){
        return AnchorLeagueModel.fromMap(list1[idx]);
      });

      dynamicList = List.generate(list2?.length??0, (idx){
        return AnchorDynamicModel.fromMap(list2[idx], name: this.name, headIcon: this.mobileCover, anchorId:this.anchorId);
      });
      print('dynamicList');
    }
  }

//  AnchorHomeModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
//    if(isSuccess) {
//      this.fans = AiJson(map).getNum('data.fans');
//      this.anchorId = AiJson(map).getString('data.anchorId');
//      this.playerId = AiJson(map).getString('data.playerId');
//      this.name = AiJson(map).getString('data.name');
//      this.nickname = AiJson(map).getString('data.nickname');
//      this.mobileCover = AiJson(map).getString('data.mobileCover');
//      this.gender = AiJson(map).getString('data.gender');
//      this.introduce = AiJson(map).getString('data.introduce');
//      this.live = AiJson(map).getString('data.live');
//      this.gidm = AiJson(map).getString('data.gidm');
//      this.gameType = AiJson(map).getString('data.gameType');
//      this.total = AiJson(map).getNum('data.total');
//      living = "1" == this.live;
//      List list1 = AiJson(map).getArray('data.leagueList');
//      List list2 = AiJson(map).getArray('data.dynamicList');
//
//      this.leagueList = List.generate(list1?.length??0, (idx){
//        return AnchorLeagueModel.fromMap(list1[idx]);
//      });
//      dynamicList = List.generate(list2?.length??0, (idx){
//        return AnchorDynamicModel.fromMap(list2[idx], name: this.name, headIcon: this.mobileCover, anchorId:this.anchorId);
//      });
//    }
//  }
}

class AnchorLeagueModel {
  String leagueId, leagueColor, leagueLogo, leagueNameEn, leagueNameCn, leagueNameTw, leagueName, code;
  int count;

  AnchorLeagueModel.fromMap(Map<String, dynamic> map) {
    if(map == null) return;

    this.leagueId = AiJson(map).getString('leagueId');
    this.leagueColor = AiJson(map).getString('leagueColor');
    this.leagueLogo = AiJson(map).getString('leagueLogo');
    this.leagueNameEn = AiJson(map).getString('leagueNameEn');
    this.leagueNameCn = AiJson(map).getString('leagueNameCn');
    this.leagueNameTw = AiJson(map).getString('leagueNameTw');
    this.leagueName = AiJson(map).getString('leagueName');
    this.code = AiJson(map).getString('code');
    this.count = AiJson(map).getNum('count');
  }
}

class AnchorDynamicModel {
  String name, headIcon, showTime, anchorId;
  bool isFirst;
  /// 是否已点赞
  bool praiseFlag=false;
  /// 是否已踩
  bool stepFlag=false;
  int clickPraiseCount=0, clickStepCount=0;
  String dynamicId;
  String id,
  idea, 
  createTime, 
  updateTime, 
  url, 
  titleUl,
  gameType,
  gidm, gameDate,
  showGameDate,
  status,
  homeTeamId, homeTeamCn, homeTeamEn, homeTeamTw, homeIcon, 
  awayTeamId, awayTeamCn, awayTeamEn, awayTeamTw, awayIcon;
  List<String>images = [];
  List<String>imageArr = [];
  AnchorDynamicModel.fromMap(Map<String, dynamic> map, {this.name, this.headIcon, this.isFirst = false, this.anchorId}) {
    if(map == null) return;

    try{
      var aiJson = AiJson(map);
      this.isFirst = isFirst;
      this.name = name;
      this.headIcon = headIcon;
      this.id = aiJson.getString('id');

      this.idea = aiJson.getString('idea');
      this.createTime = aiJson.getTimestampStr('createTime');
      this.updateTime = aiJson.getString('updateTime');
      this.url =aiJson.getString('url');
      this.titleUl = aiJson.getString('titleUl');
      this.gidm       = aiJson.getString('gidm');
      this.gameType  = aiJson.getString('gameType');
      this.gameDate   = aiJson.getTimestampStr('gameDate');
      this.homeTeamId = aiJson.getString('homeTeamId');
      this.homeTeamCn =aiJson.getString('homeTeamCn');
      this.homeTeamEn = aiJson.getString('homeTeamEn');
      this.homeTeamTw = aiJson.getString('homeTeamTw');
      this.homeIcon   = aiJson.getString('homeIcon');
      this.awayTeamId = aiJson.getString('awayTeamId');
      this.awayTeamCn = aiJson.getString('awayTeamCn');
      this.awayTeamEn = aiJson.getString('awayTeamEn');
      this.awayTeamTw = aiJson.getString('awayTeamTw');
      this.awayIcon   = aiJson.getString('awayIcon');
      this.praiseFlag = aiJson.getBool('praiseFlag');
      this.stepFlag   = aiJson.getBool('stepFlag');
      this.clickPraiseCount = aiJson.getNum('clickPraiseCount');
      this.clickStepCount   = aiJson.getNum('clickStepCount');
      this.status   = aiJson.getString('status');
      this.dynamicId   = aiJson.getString('dynamicId');
      this.showTime = this.createTime.substring(5, 16); // 2019-11-06 10:30:52

      // DateTime date = DateTime.parse('2020-02-25 04:00:00');
      this.showGameDate = '';
      if(status == '2'){
        this.showGameDate = "${config.langMap['baseLang']['gameOver']}";
      }
      else if(isNotEmpty(gameDate)){
        DateTime date = DateTime.tryParse(this.gameDate);
        if(date != null){
          this.showGameDate = DateFormat(config.langMap['baseLang']['member']['anchor']['gameDate']).format(date);
        }
      }
      List<dynamic>items1 = aiJson.getArray('images');
      List<dynamic>items2 = aiJson.getArray('imageArr');
      for(int i = 0; i < items1.length ?? 0; i++) {
        List models;
        String json = items1[i];
        try {
          models = jsonDecode(json);
          for(int j = 0; j < models?.length ?? 0; j++) {
            var data =  models[j]??{};
            String imgUrl = data['url']?? '';
            if(imgUrl?.length??0 != 0) {
              this.images.add(imgUrl);
            }
          }
        }
        catch(e){
          print('images json=$json');
        }
      }

      for(int i = 0; i < items2.length ?? 0; i++) {
        List models;
        String json = items2[i];
        try {
          models = jsonDecode(json);
          for(int j = 0; j < models?.length ?? 0; j++) {
            var data =  models[j]??{};
            String imgUrl = data['url']?? '';
            if(imgUrl.trim().isNotEmpty) {
              this.imageArr.add(imgUrl);
            }
          }
        }
        catch(e){
          print('imageArr json=$json');
        }
      }
    }
    catch(e){
      print('主播动态---error:${e.tostrin}');
    }


    // test
    // this.gameDate = "2019/12/20 16:30:00";
    // this.gameDate = this.gameDate.substring(5, 16) + '开赛';
    // this.gidm = "2868962";
    // this.homeTeamCn = "西悉尼流浪者";
    // this.awayTeamCn = "西联";
    // this.homeIcon = "\/images\/base\/teams\/20190219231831160_100x100.png";
    // this.awayIcon = "\/images\/base\/teams\/20190219232246594_316x316.png";
    // this.imageArr = [];
    // this.imageArr.addAll([this.headIcon, this.headIcon, this.headIcon, this.headIcon, this.headIcon, this.headIcon, this.headIcon, this.headIcon, this.headIcon]);
  }
  // static double getTextHeight(String s, {double fontSize, Size maxSize, int maxLines, TextStyle textStyle}) {
  //   final constraints = BoxConstraints(
  //     maxHeight: maxSize.height,
  //     maxWidth: maxSize.width,
  //   );

  //   RenderParagraph renderParagraph = RenderParagraph(
  //     TextSpan(
  //       text: s,
  //       style: textStyle,
  //     ),
  //     textDirection: TextDirection.ltr,
  //     maxLines: maxLines,
  //   );
  //   renderParagraph.layout(constraints);
  //   double height = renderParagraph.getMinIntrinsicHeight(fontSize).ceilToDouble();
  //   print('height=$height');
  //   return height;
  // }
}

/*
{
  "code" : 200,
  "data" : {
    "gender" : "1",
    "introduce" : "專業球類賽評。微博-球哥Ray",
    "nickname" : null,
    "live" : "1",
    "leagueList" : [
      {
        "leagueName" : null,
        "leagueNameCn" : "NBA",
        "leagueNameEn" : "NBA",
        "leagueNameTw" : "NBA",
        "leagueNameAbbrEn" : "NBA",
        "leagueNameAbbrTw" : "NBA",
        "count" : 0,
        "leagueLogo" : "images\/base\/league\/20160525\/20160525150633182_280x280.png",
        "code" : "N",
        "leagueColor" : "#647AA2",
        "leagueNameAbbrCn" : "NBA",
        "gradeId" : null,
        "leagueId" : "BK_100828"
      },
      {
        "leagueName" : null,
        "leagueNameCn" : "英格兰足球超级联赛",
        "leagueNameEn" : "Premier League",
        "leagueNameTw" : "英格蘭超級聯賽",
        "leagueNameAbbrEn" : "Premier League",
        "leagueNameAbbrTw" : "英超",
        "count" : 0,
        "leagueLogo" : "images\/base\/league\/20161114\/20161114171008490_280x280.png",
        "code" : "y",
        "leagueColor" : "#FF3333",
        "leagueNameAbbrCn" : "英超",
        "gradeId" : null,
        "leagueId" : "FT_100021"
      },
      {
        "leagueName" : null,
        "leagueNameCn" : "西班牙足球乙级联赛",
        "leagueNameEn" : "LaLiga 2",
        "leagueNameTw" : "西班牙乙組聯賽",
        "leagueNameAbbrEn" : "LaLiga 2",
        "leagueNameAbbrTw" : "西乙",
        "count" : 0,
        "leagueLogo" : "images\/base\/league\/20160525\/20160525151224602_280x280.png",
        "code" : "x",
        "leagueColor" : "#336600",
        "leagueNameAbbrCn" : "西乙",
        "gradeId" : null,
        "leagueId" : "FT_100064"
      },
      {
        "leagueName" : null,
        "leagueNameCn" : "罗马尼亚甲组联赛",
        "leagueNameEn" : "Romania Liga I",
        "leagueNameTw" : "羅馬尼亞甲組聯賽",
        "leagueNameAbbrEn" : "ROM D1",
        "leagueNameAbbrTw" : "羅甲",
        "count" : 0,
        "leagueLogo" : "images\/base\/league\/20190417\/20190417162952076_64x60.png",
        "code" : "l",
        "leagueColor" : "#339966",
        "leagueNameAbbrCn" : "罗甲",
        "gradeId" : null,
        "leagueId" : "FT_100103"
      },
      {
        "leagueName" : null,
        "leagueNameCn" : "欧足联欧洲联赛",
        "leagueNameEn" : "UEFA Europa League",
        "leagueNameTw" : "歐足聯歐洲聯賽",
        "leagueNameAbbrEn" : "UEFA Europa League",
        "leagueNameAbbrTw" : "歐罗巴",
        "count" : 0,
        "leagueLogo" : "images\/base\/league\/20160525\/20160525150848097_280x280.png",
        "code" : "o",
        "leagueColor" : "#6600CC",
        "leagueNameAbbrCn" : "欧罗巴",
        "gradeId" : null,
        "leagueId" : "FT_100824"
      }
    ],
    "dynamicList" : [
      {
        "url" : "www.baidu.com",
        "awayTeamId" : null,
        "updateTime" : "2019-11-06 10:30:52",
        "awayTeamCn" : null,
        "titleUl" : "啊啊啊啊啊啊啊啊啊啊啊啊啊",
        "awayTeamEn" : null,
        "images" : "[{\"name\":\"111.png\",\"url\":\"\/images\/base\/video\/e52534d464d3487aba9c30d060b61587.png\",\"uid\":1573006574401,\"status\":\"success\"},{\"name\":\"222.png\",\"url\":\"\/images\/base\/video\/615d0079fa8b451389fd9853c920a838.png\",\"uid\":1573006580809,\"status\":\"success\"},{\"name\":\"333.png\",\"url\":\"\/images\/base\/video\/a6ff4d9798be4ed28c5808e07517266c.png\",\"uid\":1573006584658,\"status\":\"success\"}]",
        "homeTeamId" : null,
        "homeTeamCn" : null,
        "homeTeamEn" : null,
        "idea" : "哦哦哦哦哦哦哦",
        "homeTeamTw" : null,
        "awayTeamTw" : null,
        "awayIcon" : null,
        "id" : "d5980b8b-56a0-4248-96bd-6c64a92d",
        "homeIcon" : null,
        "createTime" : "2019-11-06 10:15:43",
        "imageArr" : [
          "[{\"name\":\"111.png\",\"url\":\"\/images\/base\/video\/e52534d464d3487aba9c30d060b61587.png\",\"uid\":1573006574401,\"status\":\"success\"},{\"name\":\"222.png\",\"url\":\"\/images\/base\/video\/615d0079fa8b451389fd9853c920a838.png\",\"uid\":1573006580809,\"status\":\"success\"},{\"name\":\"333.png\",\"url\":\"\/images\/base\/video\/a6ff4d9798be4ed28c5808e07517266c.png\",\"uid\":1573006584658,\"status\":\"success\"}]"
        ],
        "gameDate" : null,
        "gidm" : null
      },
      {
        "url" : "http:\/\/www.baidu.com",
        "awayTeamId" : null,
        "updateTime" : "2019-11-06 10:06:52",
        "awayTeamCn" : null,
        "titleUl" : "冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲",
        "awayTeamEn" : null,
        "images" : "[{\"name\":\"timg (4).jpg\",\"url\":\"\/images\/base\/video\/faaedc1461de43d79bac53f5badc6eae.jpg\",\"uid\":1573006049042,\"status\":\"success\"},{\"name\":\"timg (5).jpg\",\"url\":\"\/images\/base\/video\/c6955081848a4c57bf1b5d12ba011a52.jpg\",\"uid\":1573006052285,\"status\":\"success\"},{\"name\":\"timg (6).jpg\",\"url\":\"\/images\/base\/video\/e7d4ae1bae2d42a89e1d726c7e6d2822.jpg\",\"uid\":1573006054286,\"status\":\"success\"},{\"name\":\"timg (3).jpg\",\"url\":\"\/images\/base\/video\/6cac80e8a3314030aa4ef863d01ddf54.jpg\",\"uid\":1573006056510,\"status\":\"success\"},{\"name\":\"QQ浏览器截图20191029182821.png\",\"url\":\"\/images\/base\/video\/cb9852701cb54728916d0449a0c63efe.png\",\"uid\":1573006059671,\"status\":\"success\"},{\"name\":\"737d16a4689791bcb7a8fa9bad59bccc.jpg\",\"url\":\"\/images\/base\/video\/53ee43109d864456ad1df8ae47b64249.jpg\",\"uid\":1573006061907,\"status\":\"success\"},{\"name\":\"u=437131806,1024481633&fm=214&gp=0.jpg\",\"url\":\"\/images\/base\/video\/3da81631ab1d40babeeb6f0a46b6b086.jpg\",\"uid\":1573006064577,\"status\":\"success\"},{\"name\":\"d937d2c5f84a4a9d8afb66654bf653b8.jpeg\",\"url\":\"\/images\/base\/video\/95d4f8fdd7ef4f50852fe606ae50640d.jpeg\",\"uid\":1573006068359,\"status\":\"success\"},{\"name\":\"150150.png\",\"url\":\"\/images\/base\/video\/8217eb556c7f4c11b244c5d6799eebe6.png\",\"uid\":1573006071271,\"status\":\"success\"}]",
        "homeTeamId" : null,
        "homeTeamCn" : null,
        "homeTeamEn" : null,
        "idea" : "冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲冲",
        "homeTeamTw" : null,
        "awayTeamTw" : null,
        "awayIcon" : null,
        "id" : "d5980b8b-56a0-4248-96bd-6c64a92d",
        "homeIcon" : null,
        "createTime" : "2019-11-06 10:06:52",
        "imageArr" : [
          "[{\"name\":\"timg (4).jpg\",\"url\":\"\/images\/base\/video\/faaedc1461de43d79bac53f5badc6eae.jpg\",\"uid\":1573006049042,\"status\":\"success\"},{\"name\":\"timg (5).jpg\",\"url\":\"\/images\/base\/video\/c6955081848a4c57bf1b5d12ba011a52.jpg\",\"uid\":1573006052285,\"status\":\"success\"},{\"name\":\"timg (6).jpg\",\"url\":\"\/images\/base\/video\/e7d4ae1bae2d42a89e1d726c7e6d2822.jpg\",\"uid\":1573006054286,\"status\":\"success\"},{\"name\":\"timg (3).jpg\",\"url\":\"\/images\/base\/video\/6cac80e8a3314030aa4ef863d01ddf54.jpg\",\"uid\":1573006056510,\"status\":\"success\"},{\"name\":\"QQ浏览器截图20191029182821.png\",\"url\":\"\/images\/base\/video\/cb9852701cb54728916d0449a0c63efe.png\",\"uid\":1573006059671,\"status\":\"success\"},{\"name\":\"737d16a4689791bcb7a8fa9bad59bccc.jpg\",\"url\":\"\/images\/base\/video\/53ee43109d864456ad1df8ae47b64249.jpg\",\"uid\":1573006061907,\"status\":\"success\"},{\"name\":\"u=437131806,1024481633&fm=214&gp=0.jpg\",\"url\":\"\/images\/base\/video\/3da81631ab1d40babeeb6f0a46b6b086.jpg\",\"uid\":1573006064577,\"status\":\"success\"},{\"name\":\"d937d2c5f84a4a9d8afb66654bf653b8.jpeg\",\"url\":\"\/images\/base\/video\/95d4f8fdd7ef4f50852fe606ae50640d.jpeg\",\"uid\":1573006068359,\"status\":\"success\"},{\"name\":\"150150.png\",\"url\":\"\/images\/base\/video\/8217eb556c7f4c11b244c5d6799eebe6.png\",\"uid\":1573006071271,\"status\":\"success\"}]"
        ],
        "gameDate" : null,
        "gidm" : null
      }
    ],
    "anchorId" : "d5980b8b-56a0-4248-96bd-6c64a92d",
    "mobileCover" : "\/images\/base\/anchor\/64a79ab88450e91e6a28293600d2321c.png",
    "name" : "球哥"
  },
  "systemTime" : 1576643121099,
  "msg" : "SUCCESS"
}




*/



