import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';


class GifGiftPlayer extends StatefulWidget {

  final int position;

  GifGiftPlayer({Key key,@required this.position}):super(key: key);

  @override
  _GifGiftPlayerState createState() => _GifGiftPlayerState();
}

class _GifGiftPlayerState extends State<GifGiftPlayer> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _tween;


  GiftPlayChannel gifGiftPlayChannel;

  @override
  void initState() {

    _controller = new AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _tween = new Tween(begin: -1.0, end: 0.0).animate(_controller);
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

    gifGiftPlayChannel = GiftPlayServer.ins.getGifPlayChannel(widget.position);
    GiftPlayServer.ins.bindGifChannelPlayController(channelIndex:widget.position,controller:GiftPlayController(
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
          _controller?.reverse();
        } else if(gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Play){
          gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        }
      },
    ));

    super.initState();
  }

  @override
  void dispose() {
    gifGiftPlayChannel.giftPlayStatus = GiftPlayStatus.Stopped;
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(gifGiftPlayChannel == null || gifGiftPlayChannel.data == null || gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Stopped ||gifGiftPlayChannel.giftPlayStatus == GiftPlayStatus.Play){
      //print("gifGiftPlayChannel.giftPlayStatus:${gifGiftPlayChannel.giftPlayStatus}");
      return Container(height: 0,width: 0,color: Colors.white,);
    }
    return Transform.translate(
      offset: Offset( MediaQuery.of(context).size.width  * _tween.value, 0),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipPath(
                clipper: _GifGiftClipper(),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 3,right: 10),
                      height: 36,
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF1096F4),Color(0xFF98DCFB)],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${gifGiftPlayChannel.data.nickName}',
                                style: AiTextStyle(
                                  color: Color(0xFF5078FF),
                                  fontSize: config.skin.fontSize.h5,
                                  fontWeight: config.skin.fontWeight.regular,
                                ),
                              ),
                              Text('${config.langMap['baseLang']['detail']['chatroom']['giftSend']}  ${gifGiftPlayChannel.data.giftName}',style: AiTextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: config.skin.fontSize.h6,
                                fontWeight: config.skin.fontWeight.regular,
                              ),)
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 50,height: 40,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 50,height: 50,
                        child: AiImage.fromUrlWithXcFadeInImage('${gifGiftPlayChannel?.data?.type == GiftType.gif ? gifGiftPlayChannel?.data?.gif : gifGiftPlayChannel?.data?.image}','',needAnimation: false),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text("x",
                    style: TextStyle(
                      fontFamily: config.skin.fontFimaly.youSheBiaoTiHei,
                      fontSize: 24,
                      color: Color(0xFFFFBC10),
                      shadows: [
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(-1.5,-1.5),blurRadius: 2),
                        Shadow(color:Color(0xFF6B3A16),offset: Offset(1.5,1.5),blurRadius: 2),
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(-1.5,1.5),blurRadius: 2),
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(1.5,-1.5),blurRadius: 2),
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text("${gifGiftPlayChannel?.data?.count ?? ''}",
                    style: TextStyle(
                      fontFamily: config.skin.fontFimaly.youSheBiaoTiHei,
                      fontSize: 32,
                      color: Color(0xFFFFBC10),
                      shadows: [
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(-1.5,-1.5),blurRadius: 2),
                        Shadow(color:Color(0xFF6B3A16),offset: Offset(1.5,1.5),blurRadius: 2),
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(-1.5,1.5),blurRadius: 2),
                        Shadow(color: Color(0xFF6B3A16),offset: Offset(1.5,-1.5),blurRadius: 2),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GifGiftClipper extends CustomClipper<Path> {

  _GifGiftClipper();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..moveTo(0, 0)
      ..lineTo(size.width - 10, 0)
      ..lineTo(size.width, size.height * (25/36))
      ..lineTo(size.width - 10, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

