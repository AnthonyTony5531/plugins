import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/circular_head.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/image/ai_gif_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/migrate_plugins/flutter_gifimage/flutter_gifimage.dart';
import 'package:fast_ai/utils/util.dart';


///已抢红包ui
class XCOpenedRedBagView extends StatefulWidget {
  final OpenedRedBagData openedData;
  XCOpenedRedBagView({Key key, this.openedData}) : super(key: key);

  @override
  XCOpenedRedBagViewState createState() {
    return XCOpenedRedBagViewState();
  }
}

class XCOpenedRedBagViewState extends State<XCOpenedRedBagView> {
  AiGifImageController _controller;
  bool _showGainGif = false;
  StateSetter _gainSetState;
  var baseLang = config.langMap['baseLang'];

  @override
  void initState() {
    super.initState();

    fetchGif(AiImage.assetImage(
        'assets/images/detail/chatroom/redbag/redbag_detail_gain.gif'));
    _controller = AiGifImageController();
  }

  @override
  Widget build(BuildContext context) {
    String nickName = widget.openedData?.nickName;
    String amount = widget.openedData?.amountFixed;
    String totalAmount = widget.openedData?.totalAmountFixed;
    int status = widget.openedData?.status;
    String walletId = widget.openedData?.walletId;
    List<RedBagRecord> records = widget.openedData?.packetRecordData ?? [];
    String tip = '';
    // if(status == 0){
    //   tip = '没抢到，下次一定';
    // }else if(status == 2){
    //   tip = '手慢了，红包派完了';
    // }else if(status == 3){
    //   tip = '红包过期了';
    // }else if(status == 1){
    //   tip = '$amount';
    // }

    if (status == 1) {
      tip = '$amount';
      _showGainGif = true;
    } else {
      tip = config.langMap['baseLang']['detail']['chatroom']['noRedPackageTips']; // 统一提示
    }
    _showGainGif = true;
    print('XCOpenedRedBagViewState-status=$status');

    // 抢到红包动画
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double multi = (isPortrait ? 0.95 : 0.8);
    double width = 375 * multi;
    double height = 211 * multi;
    double left = (MediaQuery.of(context).size.width - width) / 2;
    print(
        '000-_showGainGif=$_showGainGif, isPortrait=$isPortrait, left=$left, width=$width, height=$height, screen.width=${MediaQuery.of(context).size.width}');

    double redPacketW = isPortrait ? 302 : 230;
    double redPacketH = isPortrait ? 448 : 341;
    print('00-XCNormalRedBagViewState-build');

    ///最多显示30条记录
    if (records.length > 30) {
      records = records.sublist(0, 30);
    }
    return Container(
      width: redPacketW,
      child: Stack(
        clipBehavior: Clip.none, alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            width: redPacketW,
            height: redPacketH,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AiImage.assetImage(
                    'assets/images/detail/chatroom/redbag/bg_detail_redbag_open.png'),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Column(
                  children: <Widget>[
                    h(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          nickName ?? '',
                          style: TextStyle(
                              color: Color(0xFFF23D3D),
                              fontSize: config.skin.fontSize.h4,
                              fontWeight: config.skin.fontWeight.bold),
                        ),
                        Text(
                          nickName != null ? ' ${baseLang['split']['ofRedPacket']}' : '',
                          style: TextStyle(
                              color: Color(0xFF7C4502),
                              fontSize: config.skin.fontSize.h4,
                              fontWeight: config.skin.fontWeight.regular),
                        ),
                      ],
                    ),
                    Container(
                      height: isPortrait ? 10 : 8,
                    ),
                    Container(
                      height: isPortrait ? 10 : 8,
                    ),
                    Container(
                        height: 35,
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: Text(tip,
                            style: isPortrait
                                ? _amountStyle
                                : _amountStyle.copyWith(
                                    fontSize: config.skin.fontSize.h4,
                                  ))),
                    Container(height: isPortrait ? 20 : 0),
                    Container(
                        height: 18,
                        //color: Colors.green,
                        child: status != 1
                            ? Container()
                            : Text(baseLang['detail']['chatroom']['successTip'],
                                style: TextStyle(
                                    color: Color(0xFF7C4502),
                                    fontSize: config.skin.fontSize.h5,
                                    fontWeight:
                                        config.skin.fontWeight.regular))),
                    Container(
                      height: isPortrait ? 66 : 40,
                      //color: Colors.blue
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.purple,
                        width: redPacketW - 30,
                        //height: isPortrait ? 224 : 170,
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${baseLang['split']['total']}${totalAmount.length > 0 ? totalAmount : '0.00'}',
                              style: TextStyle(
                                  color: Color(0xFFFFF2C6),
                                  fontSize: config.skin.fontSize.h6,
                                  fontWeight: config.skin.fontWeight.regular),
                            ),
                            Container(
                              height: 6,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: records.length,
                                itemBuilder: (context, index) {
                                  return RedRecordCell(
                                    record: records[index],
                                    index: index,
                                    isPortrait: isPortrait,
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: 4,
                            ),
                            records.length >= 30
                                ? Text(
                                    baseLang['detail']['chatroom']['maxDisplay'],
                                    style: TextStyle(
                                        color: Color(0xFFFF7F48),
                                        fontSize: config.skin.fontSize.h6,
                                        fontWeight:
                                            config.skin.fontWeight.regular),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: isPortrait || records.length >= 30 ? 10 : 4,
                    ),
                  ],
                )),
                // Positioned(
                //   top: isPortrait ? 25 : 20,
                //   right: 15,
                //   child: InkWell(
                //     onTap: (){
                //       print(111);
                //       Navigator.pop(context, status);
                //     },
                //     child: Container(
                //       width: 38,
                //       height: 38,
                //       color: Colors.transparent,
                //       margin: EdgeInsets.all(6),
                //       child: AiImage.asset('assets/images/detail/chatroom/redbag/icon_detail_redbag_close.png', width: 18, height: 18,)
                //     ),
                //   )
                // ),
              ],
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              _gainSetState = setState;
              return _showGainGif
                  ? SizedBox(
                      width: width,
                      height: height,
                      child: AiGifImage(
                        max: 42,
                        duration: 4000,
                        controller: _controller,
                        fetchCompletedPlay: true,
                        path:
                            'assets/images/detail/chatroom/redbag/redbag_detail_gain.gif',
                        playCompleteCallback: (complected) {
                          _showGainGif = false;
                          print(
                              '000-_showGainGif-抢红包动画播放完毕---- mounted=$mounted, _gainSetState=$_gainSetState');
                          if (mounted && _gainSetState != null)
                            _gainSetState(() {});
                        },
                      ),
                    )
                  : Container();
            },
          ),
          Positioned(
              top: isPortrait ? 25 : 20,
              right: 15,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  print(111);
                  Navigator.pop(context, status);
                },
                child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(6),
                    child: AiImage.asset(
                      'assets/images/detail/chatroom/redbag/icon_detail_redbag_close.png',
                      width: 18,
                      height: 18,
                    )),
              )),
        ],
      ),
    );
  }

  final _amountStyle = TextStyle(
    color: Color(0xFFF23D3D),
    fontSize: config.skin.fontSize.h1,
    fontFamily: config.skin.fontFimaly.dINCondensed,
    fontWeight: config.skin.fontWeight.bold,
    letterSpacing: 1,
  );
}

class RedRecordCell extends StatelessWidget {
  final RedBagRecord record;
  final int index;
  final bool isPortrait;
  RedRecordCell({
    Key key,
    @required this.record,
    @required this.index,
    this.isPortrait = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double headerWH = isPortrait ? 22 : 18;
    return Container(
      height: isPortrait ? 30 : 24,
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: isPortrait ? 26 : 16,
                alignment: Alignment.center,
                child: index < 3
                    ? Container(
                        width: headerWH - 2,
                        height: headerWH - 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AiImage.assetImage(
                                  'assets/images/detail/chatroom/redbag/icon_redbag_no3.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: _cellNoStyle,
                        ),
                      )
                    : Text(
                        '${index + 1}',
                        style: _cellNoStyle,
                      ),
              ),
              Container(
                width: 6,
              ),
              XCCircularHeadView(
                width: headerWH,
                netImg: record.headImg,
              ),
            ],
          ),
          Container(
            width: 6,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${record.nickName}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: _cellTextStyle,
              ),
            ),
          ),
          Container(
            width: 6,
          ),
          Container(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              record.amountFixed,
              style: _cellTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  final _cellTextStyle = TextStyle(
      color: Color(0xFFFFF2C6),
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular);

  final _cellNoStyle = TextStyle(
      color: Colors.white,
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.bold);
}
