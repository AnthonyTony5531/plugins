import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/global_redpacket_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_window.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/image/ai_gif_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/migrate_plugins/flutter_gifimage/flutter_gifimage.dart';

class GlobalRedPacketView extends StatefulWidget {
  final GlobalRedPacketModel redPacket;
  final ValueChanged<GlobalRedPacketModel>onForbid;
  final VoidCallback onEntrySubPage;
  GlobalRedPacketView({Key key, this.redPacket,this.onForbid,this.onEntrySubPage}) : super(key: key);

  @override
  _GlobalRedPacketViewState createState() => _GlobalRedPacketViewState();
}

class _GlobalRedPacketViewState extends State<GlobalRedPacketView> {
  GlobalRedPacketModel get redPacket => widget.redPacket;
  bool _redPacketNotifyFlag = true;
  AiGifImageController _controller;
  bool _didRemoved = false;
  Timer _timer;
  @override
  void initState() {
    _redPacketNotifyFlag = AiCache.get().getBool(AiCache.pushMsg_globalRedPacket) ?? true;
    fetchGif(AiImage.assetImage('assets/images/detail/chatroom/redbag/global_redbag.gif'));
    _controller = AiGifImageController();

    _timer = Timer.periodic(Duration(seconds: 6), (timer){
      if(_didRemoved) return;

      timer.cancel();
      GlobalRedPacketHelper.hideGlobalRedPacket();
    });
    super.initState();
  }
  void _cancelTimer(){
    _didRemoved = true;
    if(_timer == null) return;

    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _cancelTimer();
    print('_GlobalRedPacketViewState---dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('--------redPacket.packetId=${redPacket.packetId} anchorId1=${redPacket.anchorId.toString()} anchorId2=${redPacket.anchorId}');
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        _cancelTimer();
        print('_GlobalRedPacketViewState-点击其他地方 进入详情页面-${DateTime.now()}');
        GlobalRedPacketHelper.hideGlobalRedPacket(cancel:false);
        Event.eventBus.fire(CloseVideoEvent(state: 'stop'));
        DetailPage.show(context,
          DetailPage(
            params: DetailParams(
              gidm: redPacket.gidm,
              anchorId: redPacket.anchorId.toString(), 
              anchorName: redPacket.nickName,
              systemId: redPacket.systemId,
              packetId: redPacket.packetId,
              startTime: redPacket.startTime,
              systemTime: redPacket.currentDate,
              liveId: redPacket.liveId,
              type: '1',
            )
          )
        ).then((value){
          print('');
        });
        if(widget?.onEntrySubPage != null){
          widget?.onEntrySubPage();
        }
        // _cancelTimer();
        // print('_GlobalRedPacketViewState-点击其他地方 进入详情页面');
        // GlobalRedPacketHelper.hideGlobalRedPacket();
        // DetailPage.show(
        //   context, 
        //   DetailPage(
        //     params: DetailParams(
        //       gidm: redPacket.gidm,
        //     )
        //   )
        // );
      },
      child: Container(
        width: 360,
        height: 332,
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 32),
        child: Stack(
          clipBehavior: Clip.none, alignment: AlignmentDirectional.center,
          children: <Widget>[
            //AiImage.asset("assets/images/detail/chatroom/redbag/global_redbag_bg.png", width: 360, height: 332),
            Positioned(
              top: 110,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  _cancelTimer();
                  print('--------点击红包');
                  Event.eventBus.fire(CloseVideoEvent(state: 'stop'));
                  GlobalRedPacketHelper.hideGlobalRedPacket(cancel:false);
                  DetailPage.show(
                    context, 
                    DetailPage(
                      params: DetailParams(
                        gidm: redPacket.gidm,
                        anchorId: redPacket.anchorId.toString(), 
                        anchorName: redPacket.nickName,
                        systemId: redPacket.systemId,
                        packetId: redPacket.packetId,
                        startTime: redPacket.startTime,
                        systemTime: redPacket.currentDate,
                        liveId: redPacket.liveId,
                        type: '1',
                      )
                    )
                  ).then((value){
                    print('');
                  });
                  if(widget?.onEntrySubPage != null){
                    widget?.onEntrySubPage();
                  }
                },
                child: SizedBox( // 红包背景gif图
                  width: 360, height: 132,
                  child: AiGifImage(
                    fetchCompletedPlay: true,
                    duration: 2000,
                    max: 48,
                    controller: _controller,
                    path: 'assets/images/detail/chatroom/redbag/global_redbag.gif',
                  ),
                ),
              ),
            ),
            Positioned( // 不再显示
              top: 60,
              right: 4,
              child: GestureDetector(
                onTap: (){
                  _redPacketNotifyFlag = !_redPacketNotifyFlag;
                  AiCache.get().setBool(AiCache.pushMsg_globalRedPacket, _redPacketNotifyFlag);
                  if(mounted) setState(() {});
                  if(widget?.onForbid != null){
                    widget?.onForbid(redPacket);
                  }
                },
                child: AiSvgPicture.asset('assets/images/detail/chatroom/redbag/${_redPacketNotifyFlag ? 'redbag_nomore_normal.svg' : 'redbag_nomore_selected.svg'}', width: 88, height: 26),
              ),
            ),
            Positioned( // 主播头像+主题
              top: 193,
              left: 130+(MediaQuery.of(context).size.width-360)/2,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 134),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      child: AiImage.fromUrlHasSize(redPacket.headImg, "assets/images/default/default_anchor.png", width: 18, height: 18),
                    ),
                    w(4),
                    Expanded(
                      child: Text(
                        '${redPacket.nickName}${config.langMap['baseLang']['split']['sendRedPacket']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: config.skin.colors.fontColorWhite,
                          fontSize: config.skin.fontSize.h6,
                          fontFamily: config.skin.fontFimaly.pingFang,
                          fontWeight: config.skin.fontWeight.medium,
                          letterSpacing: 0.23,
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned( // 删除按钮
              top: 300,
              child: GestureDetector(
                onTap: (){
                  _cancelTimer();
                  print('点击----------xx');
                  GlobalRedPacketHelper.hideGlobalRedPacket();
                },
                child: AiSvgPicture.asset('assets/images/detail/chatroom/redbag/redbag_pop_x.svg', height: 30, width: 30),
              )
            ),
          ],
        ),
      ),
    );
  }
}