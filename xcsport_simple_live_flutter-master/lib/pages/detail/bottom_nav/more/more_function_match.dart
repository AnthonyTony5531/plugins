import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef MatchClick<FunctionType,String> = void Function(FunctionType type,String teamId);

class MoreFunctionMatch extends StatefulWidget {
  final MatchClick<FunctionType, String> onClickItem;
//  final MatchesDetailModel matchesDetailModel;
  final double itemWidth;
  final double itemPadding;
  final bool isFreeAnchor;

  MoreFunctionMatch({
    Key key,
    this.onClickItem,
//    this.matchesDetailModel,
    this.itemWidth,
    this.itemPadding,
    this.isFreeAnchor = false,
  }) : super(key: key);

  @override
  MoreFunctionMatchState createState() => MoreFunctionMatchState();
}

class MoreFunctionMatchState extends State<MoreFunctionMatch> {

  var baseLang = config.langMap['baseLang'];
//  List<String> matchTitles = [];
//  List<String> matchImgs = [];
  List<MatchItemModel> dataSource = [];
  ScrollController scrollController = ScrollController();
  final defaultModel = MatchesDetailModel();
//  MatchesDetailModel get matchesDetailModel => widget?.matchesDetailModel ?? defaultModel;
  bool isAttentionMatch = false;
  bool isAttentionHome = false;
  bool isAttentionAway = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100.0,
      child: ListView.builder(
          controller: scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          cacheExtent: 54.0,
          itemCount: dataSource.length,
          itemBuilder: (BuildContext ctx,int index){
            if(index > dataSource.length) return Container();

            MatchItemModel model = dataSource[index];
            return menuItem(model);
          }
      )
    );
  }

  Widget menuItem(MatchItemModel model){

    String text = model.title;
    String image = model.image;
    String teamId = '';
    bool isHomeTeam;
    if(model.index == '6'){
//      teamId = widget?.matchesDetailModel?.data?.homeId;
      isHomeTeam = true;
    }
    if(model.index == '7'){
//      teamId = widget?.matchesDetailModel?.data?.awayId;
      isHomeTeam = false;
    }
    bool isNetworkImage = false;
    if(image.startsWith('http') || image.startsWith('/') || isEmpty(image)) {
      isNetworkImage = true;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(left: widget.itemPadding, right: widget.itemPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 42.0,
              width: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: Colors.white.withOpacity(0.1),
              ),
              child: isNetworkImage
                  ? Container(
                      padding: EdgeInsets.all(8.0),
                      child: AiImage.teamLogo(image, teamId: teamId, isHomeTeam: isHomeTeam),
                    )
                  : Container(
                      padding: EdgeInsets.all(8.0),
                      child: AiImage.svgLogo(image, size: 20.0),
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              width: widget.itemWidth,
              alignment: Alignment.center,
              child: Text(
                text,
                style: titleStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (widget?.onClickItem != null) {
          FunctionType type = FunctionType.functionNone;
          String teamId = '';
          if (model.index == '1') {
            type = FunctionType.functionRecharge;
          }
          else if (model.index == '2') {
            type = FunctionType.functionWithdraw;
          }
          else if (model.index == '3') {
            type = FunctionType.functionTransferAccount;
          }
//          else if (model.index == '4') {
//            type = FunctionType.functionData;
//          }
//          else if (model.index == '5') {
//            type = FunctionType.functionCollectGame;
//          }
//          else if (model.index == '6') {
//            type = FunctionType.functionAttentionHome;
//            teamId = matchesDetailModel.data.homeId;
//          }
//          else if (model.index == '7') {
//            type = FunctionType.functionAttentionAway;
//            teamId = matchesDetailModel.data.awayId;
//          }
//          else if (model.index == '8') {
//            type = FunctionType.functionUninterested;
//          }
          widget?.onClickItem(type, teamId);
        }
      },
    );
  }

  void loadData(){

//    config.sdkParams.showRecharge = true;
//    config.sdkParams.showCash = true;
//    config.sdkParams.showTransfer = true;
    dataSource.clear();
    var list = getData();
    list.forEach((value){
      MatchItemModel model = MatchItemModel.fromMap(value);
      if(model.index == '1'){
        if(config.sdkParams.showRecharge || config.isApp){
          dataSource.add(model);
        }
      }
      else if(model.index == '2'){
        if(config.sdkParams.showCash || config.isApp){
          dataSource.add(model);
        }
      }
      else if(model.index == '3'){
        if(config.sdkParams.showTransfer || config.isApp){
          dataSource.add(model);
        }
      }
      else{
        if(!widget.isFreeAnchor){
          dataSource.add(model);
        }
      }
    });
    print('');
  }

  void updateMatchUI(){
    loadData();
    if(mounted){
      setState(() {});
    }
  }

  List<Map<String,dynamic>> getData(){
//    isAttentionMatch = config?.userInfo?.followGames?.contains(matchesDetailModel.data.gidm) ?? false;
//    isAttentionHome = config?.userInfo?.followTeams?.contains(matchesDetailModel.data.homeId) ?? false;
//    isAttentionAway = config?.userInfo?.followTeams?.contains(matchesDetailModel.data.awayId) ?? false;
    String recharge = baseLang['detail']['recharge'];
    String withdraw = baseLang['detail']['withdraw'];
    String transferAccount = baseLang['detail']['transferAccount'];
    String collectGame = isAttentionMatch ? baseLang['detail']['alreadyCollectGame'] : baseLang['detail']['collectGame'];
    String attentionHome = isAttentionHome ? baseLang['detail']['alreadyAttentionHome'] : baseLang['detail']['attentionHome'];
    String attentionAway = isAttentionAway ? baseLang['detail']['alreadyAttentionAway'] : baseLang['detail']['attentionAway'];
    String data = baseLang['detail']['moreData'];
    String attentionIcon = isAttentionMatch ? 'icon_detail_more_stared.svg' :'icon_detail_more_star.svg';
//    String homeLogo = matchesDetailModel?.data?.homeLogo ?? '';
//    String awayLogo = matchesDetailModel?.data?.awayLogo ?? '';
    String uninterested = baseLang['detail']['uninterested'];

//    if(!homeLogo.startsWith('http')) {
//      if(homeLogo.startsWith('/')) {
//        homeLogo = Api.baseImgUrl + homeLogo;
//      }
//      else if (isNotEmpty(homeLogo)) {
//        homeLogo = Api.baseImgUrl + '/' + homeLogo;
//      }
//    }
//    if(!awayLogo.startsWith('http')) {
//      if(awayLogo.startsWith('/')) {
//        awayLogo = Api.baseImgUrl + awayLogo;
//      }
//      else if (isNotEmpty(awayLogo)) {
//        awayLogo = Api.baseImgUrl + '/' + awayLogo;
//      }
//    }
    return [
      // 充值
      {
        'title': recharge,
        'image':'assets/images/detail/more/icon_detail_more_cz.svg',
        'index':'1'
      },
      // 提现
      {
        'title': withdraw,
        'image':'assets/images/detail/more/icon_detail_more_tx.svg',
        'index':'2'
      },
      // 转账
      {
        'title': transferAccount,
        'image':'assets/images/detail/more/icon_detail_more_zz.svg',
        'index':'3'
      },
      // 数据 需求更新 ： http://doc.xc.com:8090/pages/viewpage.action?pageId=40567162
//      if (matchesDetailModel.isShowDetail)
//        {
//          'title': data,
//          'image': 'assets/images/detail/more/icon_detail_more_data.svg',
//          'index': '4',
//        },
//      // 收藏比赛
//      {
//        'title': collectGame,
//        'image':'assets/images/detail/more/$attentionIcon',
//        'index':'5'
//      },
//      // 主队
//      {
//        'title': attentionHome,
//        'image':homeLogo,
//        'index':'6'
//      },
//      // 客队
//      {
//        'title': attentionAway,
//        'image':awayLogo,
//        'index':'7'
//      },
//      // 不感兴趣
//      {
//        'title': uninterested,
//        'image':'assets/images/detail/more/icon_detail_more_diss.svg',
//        'index':'8'
//      },
    ];
  }

  TextStyle titleStyle(){
    return AiTextStyle(
      color: Color(0xFF999999),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }
}

class MatchItemModel{
  String title;
  String image;
  String index;
  MatchItemModel.fromMap(Map<String, dynamic> data){
    if(data == null)return;
    title = AiJson(data).getString('title');
    image = AiJson(data).getString('image');
    index = AiJson(data).getString('index');
  }
}
