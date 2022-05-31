//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/utils/ai_json.dart';

const KeyBoardStyle usedKeyBoardStyle = KeyBoardStyle.S_4X4;

typedef PressCallback = void Function (String text, dynamic data);

class Keyboard extends StatefulWidget {

  Keyboard({
    Key key,
    this.visible = true,
    this.enable = true,
    this.onTap,
    this.data
  }):super(key:key);

  final bool visible;
  final bool enable;
  final PressCallback onTap;
  final dynamic data;
  @override
  State<StatefulWidget> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {

  Map<String,String> keyConfig = KeyBoardKeyConfig.defaultKeyConfig;
  @override
  void initState() {
    if(config.userInfo.walletId == '2'){
      keyConfig = KeyBoardKeyConfig.usdtKeyConfig;
    }
//    else if(config.userInfo.walletId == '4'){
//      keyConfig = KeyBoardKeyConfig.vndKeyConfig;
//    }
    else if(config.userInfo.walletId == '3'){
      keyConfig = KeyBoardKeyConfig.thbKeyConfig;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!this.widget.visible)
      return Container();
    return usedKeyBoardStyle == KeyBoardStyle.S_3X6 ? _container3X6() : _container4X4();
  }

  Widget _container3X6(){
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFEAEBF0),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(5.0)),
        ),
        margin: EdgeInsets.only(top: 0.0,left: 10,right: 10),
        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child:Container(
          decoration: BoxDecoration(
          ),
          padding: EdgeInsets.only(left:3.0,right: 3.0,bottom: 5.0),
          child:  _keyBoard3X6(),
        )
    );
  }

  Widget _container4X4(){
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFEAEBF0),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(5.0)),
        ),
        margin: EdgeInsets.only(top: 0.0),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAEBF0)
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left:0.0,right: 0.0,bottom: 5.0),
            //padding: EdgeInsets.only(left:5.0,right: 5.0,bottom: 5.0),
            child: _keyBoard4X4()
        )
    );
  }


  Widget _keyBoard3X6(){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('1'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('2'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('3'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('0')),
            _button(AiJson(keyConfig).getString('+100'), color: Theme.of(context).backgroundColor),
            _button(AiJson(keyConfig).getString('+200'), color: Theme.of(context).backgroundColor),
          ],
        ),
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('4'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('5'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('6'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('00')),
            _button(AiJson(keyConfig).getString('+500'), color: Theme.of(context).backgroundColor),
            _button(AiJson(keyConfig).getString('MAX'), color: Theme.of(context).backgroundColor),
          ],
        ),
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('7'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('8'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('9'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('bk'), icon: Icon(Icons.backspace, size: 20.0, color: Colors.black)),
            _button('${config.langMap['baseLang']['confirm']}', flex: 2, color: Theme.of(context).backgroundColor),
          ],
        ),
      ],
    );
  }

  ///
  Widget _keyBoard4X4(){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('1'), fontSize: 16.0,hasLeftMargin: false),
            _button(AiJson(keyConfig).getString('2'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('3'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('bk'), icon: Icon(Icons.backspace, size: 20.0, color: Colors.black),color: Color(0xFFD1D5DA),hasRightMargin: false),
          ],
        ),
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('4'), fontSize: 16.0,hasLeftMargin: false),
            _button(AiJson(keyConfig).getString('5'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('6'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('+100'), color: Color(0xFFD1D5DA),hasRightMargin: false),
          ],
        ),
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('7'), fontSize: 16.0,hasLeftMargin: false),
            _button(AiJson(keyConfig).getString('8'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('9'), fontSize: 16.0),
            _button(AiJson(keyConfig).getString('+200'), color: Color(0xFFD1D5DA),hasRightMargin: false),
          ],
        ),
        Row(
          children: <Widget>[
            _button(AiJson(keyConfig).getString('00'),hasLeftMargin: false),
            _button(AiJson(keyConfig).getString('0')),
            _button(AiJson(keyConfig).getString('MAX'),),
            _button(AiJson(keyConfig).getString('+500'), color: Color(0xFFD1D5DA),hasRightMargin: false),
          ],
        ),
      ],
    );
  }




  Widget _button(String text, {Icon icon, int flex, Color color, double fontSize,bool hasLeftMargin = true,bool hasRightMargin = true}) {
    return Expanded(
        child: Container(
          height: 42.0,
          margin: EdgeInsets.only(left: hasLeftMargin ? 2.0 : 0.0, right: hasRightMargin ? 2.0 : 0.0, top: 5.0),
          padding: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            border: Border.all(color: Theme.of(context).backgroundColor.withAlpha(50)),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            boxShadow: color == null ? [BoxShadow(offset: Offset(0, 0.3), color: Color(0xffdddddd))] : null
          ),
          child: FlatButton(
            color: color ?? Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            child: icon ?? Text(text, style: AiTextStyle(fontSize: fontSize ?? 14.0, fontFamily: 'Ratio', color: Color(0xff333333))),
            onPressed: widget.enable ? (){
              if(this.widget.onTap != null)
                if(text.contains(',')){
                  text = text.replaceAll(',', '');
                }
                this.widget.onTap(text??'0', this.widget.data);
                String selectText = text ?? '0';
                if(config.userInfo.walletId == '3'){
                  if(selectText == '+500'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder100);
                  }
                  else if(selectText == '+1000'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder200);
                  }
                  else if(selectText == '+2500'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder500);
                  }
                  else if(selectText == 'MAX'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrderMax);
                  }
                }
//                else if(config.userInfo.walletId == '4'){
//                  if(selectText == '+300'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder100);
//                  }
//                  else if(selectText == '+700'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder200);
//                  }
//                  else if(selectText == '+2,000'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder500);
//                  }
//                  else if(selectText == 'MAX'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrderMax);
//                  }
//                }
                else if(config.userInfo.walletId == '2'){
                  if(selectText == '+20'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder100);
                  }
                  else if(selectText == '+700'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder200);
                  }
                  else if(selectText == '+2,000'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder500);
                  }
                  else if(selectText == 'MAX'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrderMax);
                  }
                }
                else{
                  if(selectText == '+100'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder100);
                  }
                  else if(selectText == '+200'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder200);
                  }
                  else if(selectText == '+500'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrder500);
                  }
                  else if(selectText == 'MAX'){
//                    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsBetOrderMax);
                  }
                }
            } : null,
          )
        ),
        flex: flex ?? 1,
    );
  }
  
}

///键盘布局样式
enum KeyBoardStyle{
  S_3X6,S_4X4
}

///
class KeyBoardKeyConfig{

  static var defaultKeyConfig = <String,String>{
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
    '0': '0',
    '+100': '+100',
    '+200': '+200',
    '+500': '+500',
    '00': '00',
    'MAX': 'MAX',
    'bk': 'bk',
  };
  // 越南
  static var vndKeyConfig = <String,String>{
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
    '0': '0',
    '+100': '+300',
    '+200': '+700',
    '+500': '+2,000',
    '00': '000',
    'MAX': 'MAX',
    'bk': 'bk',
  };
  // 泰国
  static var thbKeyConfig = <String,String>{
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
    '0': '0',
    '+100': '+500',
    '+200': '+1000',
    '+500': '+2500',
    '00': '00',
    'MAX': 'MAX',
    'bk': 'bk',
  };

  static var usdtKeyConfig = <String,String>{
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
    '0': '0',
    '+100': '+20',
    '+200': '+50',
    '+500': '+100',
    '00': '00',
    'MAX': 'MAX',
    'bk': 'bk',
  };

}
