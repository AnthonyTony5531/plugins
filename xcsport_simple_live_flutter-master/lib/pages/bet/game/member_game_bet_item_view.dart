import 'package:fast_ai/pages/bet/bet_filter_controller.dart';
import 'package:fast_ai/pages/bet/bet_record_time_line_view.dart';
import 'package:fast_ai/pages/bet/bet_statics_by_data.dart';
//import 'package:fast_ai/pages/member/betting/bet_filter_controller.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/order_game_bet_record_model.dart';
import 'package:fast_ai/utils/ai_common.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/view_helper.dart';
//import 'package:fast_ai/pages/member/betting/bet_statics_by_data.dart';
//import 'package:fast_ai/pages/member/betting/bet_record_time_line_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


///
///
///
class MemberGameBetItemView extends StatelessWidget {

  final GameOrder item;
  final bool itemIsCard;
  final bool showTimeLine;
  final Color bgColor;
  final VoidCallback timeLineOnTap;
  final VoidCallback onTapGo2Detail;
  final BetStaticsByData staticsByData;
  final BetFilterController betFilterController;

  var baseLang = config.langMap['baseLang'];

  MemberGameBetItemView({
    this.item,
    this.itemIsCard,
    this.showTimeLine,
    this.bgColor,
    this.timeLineOnTap,
    this.onTapGo2Detail,
    this.staticsByData,
    this.betFilterController,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: itemIsCard ? 10 : 0),
      child: Column(
        children: <Widget>[
          showTimeLine ? _timeLineTag(context,staticsByData?.betNum ?? 0,staticsByData?.winLoss ?? 0.0) : SizedBox(),
          ClipRRect(
            borderRadius: BorderRadius.circular(itemIsCard ? 8.0: 0.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _betType(item),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 9,right: 12),
                            child: Column(
                              children: <Widget>[
                                _betGameTitle(item),
                                Divider(height: 1,color: config.skin.colors.deviderColor,),
                                _betGold(context,item)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(height: 1,color: config.skin.colors.deviderColor,),
                    _betStatus(context,item),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }



  ///
  Widget _timeLineTag(BuildContext context,int betNum,double winLoss){
    if(!showTimeLine){
      return SizedBox();
    } else {
      String ymd = AiDate.format('y-M-d', item.betTime);
      if(item.showTimeLine){
        return BetRecordTimeLineView(
          bgColor: bgColor,
          horizontalPadding: 0.0,
          onTap: timeLineOnTap,
          betNum: betNum,
          winLoss: winLoss,
          ymd: ymd,
        );
      }
      return SizedBox();
    }
  }


  ///
  Widget _betType(GameOrder item){
    return Container(
      width: 60,
      padding: EdgeInsets.fromLTRB(12, 18, 12, 12),
      alignment: Alignment.topCenter,
      child: Text(config.langMap['baseLang']['games']['name'],style: supplierNameStyle,),
    );
  }

  ///
  Widget _betGameTitle(GameOrder item){
    String gameType = betFilterController?.gameType ?? '';
    Widget winPic;
    //0确认中 1成功 2赢 3输 4和 5已取消 6已撤单 7失败
    String betRst;
    if(item.ticketStatus == '2'){
      betRst = 'W';
    } else if(item.ticketStatus == '3'){
      betRst = 'L';
    } else if(item.ticketStatus == '4'){
      betRst = 'P';
    } else if(item.ticketStatus == '5' && gameType == 'combo') {
      betRst = 'C';
    }
    if (AiCommon.resultDetail[betRst] != null) {
      winPic = AiSvgPicture.asset(AiCommon.resultDetail[betRst]['img']);
    }

    bool isFree = false;

    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: onTapGo2Detail,
            child: Row(
              children: <Widget>[
                Text('${item.gameName}',style: gameNameStyle,),
                InterValHelper.w(0),
                Icon(Icons.chevron_right, color: Color(0xFF979797),size: 22,),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          isFree ? AiSvgPicture.asset('assets/images/icon_free_game.svg') : SizedBox(),
          winPic == null ? SizedBox() : Container(
            margin: EdgeInsets.only(left: 24),
            child: winPic,
          )
        ],
      ),
    );
  }

  ///
  Widget _betStatus(BuildContext context,GameOrder item){
    return Container(
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          _tag(context,item?.ticketStatus == '0' ? '${baseLang['order']['accepting']}' : '${baseLang['order']['accepteSuccess']}'),//0确认中 1成功 2赢 3输 4和 5已取消 6已撤单 7失败
          InterValHelper.w(12),
          Expanded(
              child: Row(children: <Widget>[ Expanded(
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Text('${item.id}', //BUG:23709 游戏订单号要修改为“id”值展示
                              overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 6.0),
                          child: AiSvgPicture.asset(
                            'assets/images/icon_copy.svg',
                            height: 12,
                            width: 12,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: '${item.id}')).then((s) {
                        showToas(config.langMap['baseLang']['member']['bet']['copied']);
                      });
                    },
                  )),
              ])),
          Container(
            padding: EdgeInsets.only(left: 4.0),
            alignment: Alignment.centerRight,
            child: Text('${AiDate.format('MM-dd HH:mm', item.betTime)}', style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }


  ///
  Widget _betGold(BuildContext context, GameOrder item){
    String paymentStr = '--';
    String winOrLoseStr = '--';
    TextStyle winOrLoseTextStyle = defaultStyle;
    //0确认中 1成功 2赢 3输 4和 5已取消 6已撤单 7失败
    //0未结算1已结算2已取消
    if(item?.ticketStatus == '0'){

    } else if(item?.ticketStatus == '1' || item?.ticketStatus == '2' || item?.ticketStatus == '3' || item?.ticketStatus == '4'){
      if(item.creditStatus == '1' && item.payment != null && item.betAmount != null){
        paymentStr = numString(item.payment);
        double winOrLose = item.payment - item.betAmount;
        if(winOrLose > 0){
          winOrLoseTextStyle = winStyle;
        } else if(winOrLose == 0){
          winOrLoseTextStyle = defaultStyle;
        } else {
          winOrLoseTextStyle = loseStyle;
        }
        winOrLoseStr = numString(winOrLose,needPlus: true);
      }
    } else {
      paymentStr = numString(item?.payment);
    }

    return Container(
      height: 58,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(baseLang['order']['gold'],style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400),),
                Text(numString(item?.betAmount),style: defaultStyle,),
              ],
            ),
          ),
          LineHelper.buildVLine(height: 36),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(baseLang['order']['returnMoney1'],style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400)),
                Text('$paymentStr',style: defaultStyle,),
              ],
            ),
          ),
          LineHelper.buildVLine(height: 36),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(baseLang['order']['profitLoss'],style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400)),
                Text('$winOrLoseStr',style: winOrLoseTextStyle,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(BuildContext context,String text) {
    if(!isNotEmpty(text))
      return Container();
    return Container(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 8.0, right: 8.0),
      margin: EdgeInsets.only(right: 3.0),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Text(text, style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.w400).copyWith(color: Colors.black, fontSize: 10.0)),
    );
  }

  TextStyle gameNameStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.medium,
    fontSize: config.skin.fontSize.h4,
  );
  TextStyle gameSubNameStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark40,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h5,
  );
  TextStyle supplierNameStyle = AiTextStyle(
      color: Color(0xFF19263B).withOpacity(0.6),
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.medium,
      fontSize: config.skin.fontSize.h4,
      letterSpacing: 0.27
  );

  TextStyle defaultStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontFamily: config.skin.fontFimaly.money,
    fontWeight: config.skin.game.oddsDownStyle20.fontWeight,
    fontSize: config.skin.game.oddsDownStyle20.fontSize,
  );
  TextStyle winStyle = AiTextStyle(
    color: Color(0xFFFF4000),
    fontFamily: config.skin.game.oddsDownStyle20.fontFamily,
    fontWeight: config.skin.game.oddsDownStyle20.fontWeight,
    fontSize: config.skin.game.oddsDownStyle20.fontSize,
  );
  TextStyle loseStyle = AiTextStyle(
    color: Color(0xFF3273D9),
    fontFamily: config.skin.game.oddsDownStyle20.fontFamily,
    fontWeight: config.skin.game.oddsDownStyle20.fontWeight,
    fontSize: config.skin.game.oddsDownStyle20.fontSize,
  );
}
