import 'package:fast_ai/pages/detail/chatroom/message/widget/chat_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';


class OverallGiftPlayer extends StatefulWidget {

  OverallGiftPlayer({Key key}):super(key: key);

  @override
  _OverallGiftPlayerState createState() => _OverallGiftPlayerState();
}

class _OverallGiftPlayerState extends State<OverallGiftPlayer> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _tween;


  GiftPlayChannel gifGiftPlayChannel;
  String giftTitle;
  String giftDes;

  @override
  void initState() {
    giftTitle = config.langMap['baseLang']['detail']['burstTable'];
    giftDes = config.langMap['baseLang']['detail']['giveAway'];
    _controller = new AnimationController(duration: Duration(milliseconds: 7000), vsync: this);
    _tween = new Tween(begin: 1.0, end: -0.8).animate(_controller);
    _tween.addListener(() {
      setState(() {});
    });
    _tween.addStatusListener((status){
      if(status == AnimationStatus.forward){
        gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Playing;
      }
      if(status == AnimationStatus.completed){}
      if(status == AnimationStatus.dismissed){
        gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        if(mounted){setState(() {});}
      }
    });

    gifGiftPlayChannel = GiftPlayServer.ins.getOverallGifPlayChannel();
    GiftPlayServer.ins.bindOverallGifChannelPlayController(controller:GiftPlayController(
      play: (){
        if(!mounted){
          return;
        }
        if(gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Play){
          gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Playing;
          if(mounted){setState(() {});}
          sleep(10,(){
            if(mounted){
              _controller?.reset();
              _controller?.forward();
            }
          });
        }
      },
      stop: (){
        if(!mounted){
          return;
        }
        if(gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Playing){
          gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Stopping;
          _controller?.reset();
          if(mounted){setState(() {});}
        } else if(gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Play){
          gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        }
      },
    ));

    super.initState();
  }

  @override
  void dispose() {
    gifGiftPlayChannel?.giftPlayStatus = GiftPlayStatus.Stopped;
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(gifGiftPlayChannel == null ||
        gifGiftPlayChannel.data == null ||
        gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Stopped ||
        gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Play){
      return Container(height: 0,width: 0,color: Colors.transparent,);
    }

    String anchorName = gifGiftPlayChannel?.data?.anchorName;
    String gifName = gifGiftPlayChannel?.data?.giftName;
    num buyCounts = gifGiftPlayChannel?.data?.count;
    num level = gifGiftPlayChannel?.data?.seasonLevel ?? 0;

    return Container(
      margin: EdgeInsets.only(top: 6.0),
      child: Transform.translate(
        offset: Offset( MediaQuery.of(context).size.width  * _tween.value, 0),
        child: Container(
            height: 24.0,
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFF000000).withOpacity(0.8)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$giftTitle ', style: titleStyle()),
                _levelWidget(),
                Text('$giftDes', style: titleStyle()),
                Container(margin: EdgeInsets.only(left: 3.0, right: 3.0) ,child: Text('$anchorName', style: anchorStyle())),
                Text('$gifName' + 'x' + '$buyCounts', style: levelStyle()),
              ],
            )
        ),
      ),
    );
  }

  Widget _levelWidget(){
    num level = gifGiftPlayChannel?.data?.seasonLevel ?? 0;
    String levelName = gifGiftPlayChannel?.data?.seasonLevelName;
    String headImage = gifGiftPlayChannel?.data?.headImg;
    String nickName = gifGiftPlayChannel?.data?.nickName;
    if(level == 0){
      return Container(
        margin: EdgeInsets.only(left: 3.0, right: 3.0),
        color: Colors.transparent,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Container(
                width: 18.0,
                height: 18.0,
                child: AiImage.fromUrlWithFadeInImage(headImage, ''),
              ),
            ),
            sw(3.0),
            Text(nickName, style: levelStyle(),)
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Row(
        children: [
          ChatImage.levelHeadBuild(level, width: 18, height: 18),
          Text(levelName, style: levelStyle(),)
        ],
      ),
    );
  }

  TextStyle titleStyle(){
    return AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h5,
      color: Colors.white
    );
  }

  TextStyle levelStyle(){
    return AiTextStyle(
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h5,
        color: Color(0xFF5078FF)
    );
  }

  TextStyle anchorStyle(){
    return AiTextStyle(
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h5,
        color: Color(0xFFFD5A83)
    );
  }
}

